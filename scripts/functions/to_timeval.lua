local pitches = require("functions/pitches")
local rhythms = require("functions/rhythms")

local mod_err = "[Shell Bell Music] Error: %s"
local err_msg = string.format(
    mod_err, 
    [[For song file '%s', we failed to convert %s "%s"!
    It has %s "%s" located at data.notes index %d."]]
)

---@param title string
---@param typeof1 string
---@param val1 string|integer
---@param typeof2 string
---@param val2 string|integer
---@param tbl_index integer
local function FailWarning(title, typeof1, val1, typeof2, val2, tbl_index)
    local err = string.format(
        err_msg, 
        title, 
        typeof1, val1, 
        typeof2, val2, 
        tbl_index
    )
    print(err)
end

-- Output FNs

---@param value string|integer
---@param transpose integer
---@return integer|nil
local function OutputPitch(value, transpose)
    if type(value) == "number" then
        return value + transpose
    end
    
    if pitches[value] then
        return pitches[value] + transpose
    end
    -- if pitches[value] didn't pass, that means value was invalid
    return nil
end

---@param mainfn table
---@param subfn table
---@param pitch_k integer
---@param pitch_v string|integer
local function EvaluatePitchValue(mainfn, subfn, pitch_k, pitch_v)
    subfn.index = pitch_k
    if pitch_v == 0 or pitch_v == "0" then
        subfn.dummy_tbl[subfn.index] = 0    
        return
    end

    local pitch = OutputPitch(pitch_v, mainfn.transpose)
    -- will tell you what went wrong, but won't force a crash (such as in assert)
    if pitch == nil then
        FailWarning(
            mainfn.title, 
            "pitch value", 
            pitch_v,  
            "t-value", 
            subfn.current_tbl.t, 
            subfn.beat_num
        )
        return
    end

    subfn.dummy_tbl[subfn.index] = pitch  -- needed as we'll use the whole table later
end

---@param mainfn table
---@param subfn table
---@return integer
local function NumberTimeVal(mainfn, subfn)
    if subfn.prev_beat == 0 then
        return 0
    else -- implied nonzero t value, this will mess up if you do use negative numbers
        local prev = mainfn.song[subfn.prev_beat].t
        return mainfn.distance + prev
    end
end

---@param mainfn table
---@param subfn table
---@param time_v string
---@return integer|nil
local function StringTimeVal(mainfn, subfn, time_v)
    if rhythms[time_v] then
        -- Needed for the prev value in NumberTimeVal
        subfn.current_tbl.t = rhythms[time_v]
    end
    
    -- If rhythms[time_v] didn't pass and subfn.current_tbl.t wasn't changed, 
    -- that means it was invalid so return nil
    if type(subfn.current_tbl.t) == "string" then
        return nil
    end
    
    return NumberTimeVal(mainfn, subfn)
end

---@param mainfn table
---@param subfn table
---@param time_v string|integer
---@return integer|nil
local function OutputTime(mainfn, subfn, time_v)
    -- mainfn.song, subfn.current_tbl, time_v, subfn.prev_beat, mainfn.distance
    if type(time_v) == "number" then
        return NumberTimeVal(mainfn, subfn)
    elseif type(time_v) == "string" then
        return StringTimeVal(mainfn, subfn, time_v)
    end
end

---@param mainfn table
---@param subfn table
---@param time_v string|integer
local function EvaluateTimeValue(mainfn, subfn, time_v)
    mainfn.distance = OutputTime(mainfn, subfn, time_v)
    if mainfn.distance == nil then
        FailWarning(
            mainfn.title,
            "rhythm", 
            time_v, 
            "pitch-value", 
            subfn.current_tbl[subfn.index], 
            subfn.beat_num
        )
        return
    end
    
    if subfn.dummy_tbl[subfn.index] == 0 then
        --[[ for rests, don't do anything. it's as shrimple as that!
            the distance value will still update normally. it's just that the-
            subfn.dummy_tbl table, isn't, well, inserted. ]]
    else
        subfn.dummy_tbl.t = mainfn.distance
        table.insert(mainfn.notes, subfn.dummy_tbl)
    end
end

---@param mainfn table
---@param subfn table
---@param key string|integer
---@param value string|integer
local function NoteTableKey(mainfn, subfn, key, value)
    if key == 1 then
        EvaluatePitchValue(mainfn, subfn, key, value)
    elseif key == "t" then
        EvaluateTimeValue(mainfn, subfn, value)
    end
end

---@param mainfn table
---@param subfn table
local function EvaluateNoteTable(mainfn, subfn)
    ---@param key string|integer
    ---@param value string|integer
    for key, value in pairs(subfn.current_tbl) do
        NoteTableKey(mainfn, subfn, key, value)
    end
end

---@param title string
---@param song table
---@param transpose integer
---@return table mainfn.notes
function TimeVal(title, song, transpose)
    -- print("Compiling "..title..".")

    local mainfn = 
    {
        title = title,
        song = song,
        transpose = transpose or 0,
        notes = {}, -- This is the final table we'll return
        distance = 0,
    }

    ---@param i integer
    ---@param tbl table
    for i, tbl in pairs(mainfn.song) do
        local subfn = 
        {
            beat_num = i,
            prev_beat = i - 1,
            current_tbl = tbl,
            dummy_tbl = {},  -- duplicate table to avoid modifying the original note_table directly.
            pitch = 0,
            index = 0,
        }

        EvaluateNoteTable(mainfn, subfn)
    end
    -- print("Successfully compiled "..title.."!") 
    return mainfn.notes
end

return TimeVal