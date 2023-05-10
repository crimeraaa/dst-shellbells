local PITCHES = require("functions/pitches")
local RHYTHMS = require("functions/rhythms")

local MOD_ERROR = "[Shell Bell Music]: "
local ERROR_MSG = "For song file '%s', we failed to convert %s \"%s\"!"..
"\nIt has %s \"%s\" located at data.notes index %d."

local function printf(fmt, ...)
    print(MOD_ERROR.. string.format(fmt, ...))
end

local function FailWarning(title, typeof1, val1, typeof2, val2, index)
    if type(val1) ~= "string" then
        val1 = tostring(val1)
    end
    -- Evaluate separately in case both aren't strings
    if type(val2) ~= "string" then
        val2 = tostring(val2)
    end

    typeof1 = typeof1.." value"
    typeof2 = typeof2.." value"

    printf(ERROR_MSG, title, typeof1, val1, typeof2, val2, index)
end

local function InvalidTime(title, time_v, pitch_v, index)
    FailWarning(title, "time", time_v, "pitch", pitch_v, index)
end

local function InvalidPitch(title, pitch_v, time_v, index)
    FailWarning(title, "pitch", pitch_v, "time", time_v, index)
end

local function EvaluateTimeVal(time_v)
    if type(time_v) == "string" then
        time_v = RHYTHMS[time_v]
        -- Same with EvaluatePitchVal, return nil if invalid
        if not time_v then
            return nil
        end
    elseif type(pitch_v) ~= "number" then
        return nil
    end
    -- Will also pass if time_v was a number to begin with
    return time_v
end

local function EvaluatePitchVal(pitch_v)
    if type(pitch_v) == "string" then
        pitch_v = PITCHES[pitch_v]
        -- If pitches[pitch_v] returned nil, it was invalid
        if not pitch_v then
            return nil
        end
    elseif type(pitch_v) ~= "number" then
        return nil
    end
    return pitch_v
end

-- Modify mainfn.song table directly.
local function ConvertVals(mainfn, song, beat_num, note_tbl, error_count)
    local prev_beat = beat_num - 1
    
    -- note_tbl[1] and note_tbl.t *should* be constant keys, so don't loop
    local pitch_v = EvaluatePitchVal(note_tbl[1])
    local time_v = EvaluateTimeVal(note_tbl.t)

    if not pitch_v then
        InvalidPitch(mainfn.title, pitch_v, time_v, beat_num)
        --[[ Force return so we don't mess up anything else,
        But keep going for the rest of the songfile.
        This is so we can document all possible errors. ]]
        error_count = error_count + 1
        return 
    end

    if not time_v then
        InvalidTime(mainfn.title, time_v, pitch_v, beat_num)
        error_count = error_count + 1
        return 
    end
    
    song[i][1] = pitch_v + mainfn.transpose
    song[beat_num].t = mainfn.offset
    --[[ Update mainfn.offset AFTER we set the song[index].t value
    This is so we effectively get the offset of the PREVIOUS note.
    THEN we update the offset. This is weird, but it works. ]]
    mainfn.offset = mainfn.offset + time_v
end

local got_error = "Warning! We got %d errors while compiling song file '%s'."
function TimeVal(title, song, transpose)
    local mainfn = {
        -- Constant Values
        title = title,
        transpose = transpose or 0,
        -- offset starts at 0 game distance units, modify it as we go.
        offset = 0,
    }

    local error_count = 0
    for i, note_tbl in ipairs(song) do
        ConvertVals(mainfn, song, i, note_tbl, error_count)
    end

    if error_count > 0 then
        -- Don't insert an invalid song table
        printf(got_error, error_count, title)
        return nil
    end

    return song
end

return TimeVal