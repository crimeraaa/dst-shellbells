-- CREATION OF STRING PITCHES TO PITCH VALUES TABLE

local letternames = {}
-- PRIMARY NOTE NAMES           -- ENHARMONICS
letternames["C"]    =   1       letternames["B#"]   =   1
letternames["C#"]   =   2       letternames["Db"]   =   2
letternames["D"]    =   3
letternames["D#"]   =   4       letternames["Eb"]   =   4
letternames["E"]    =   5       letternames["Fb"]   =   5
letternames["F"]    =   6       letternames["E#"]   =   6
letternames["F#"]   =   7       letternames["Gb"]   =   7
letternames["G"]    =   8
letternames["G#"]   =   9       letternames["Ab"]   =   9
letternames["A"]    =   10      
letternames["A#"]   =   11      letternames["Bb"]   =   11
letternames["B"]    =   12      letternames["Cb"]   =   12
-- i'll allow E#/Fb and B#/Cb, but double flats and sharps are just... no.

local pitches = {}

local function ToOctave()
    for letter,pitchnum in pairs(letternames) do
        for octave=1, 6 do
            pitches[letter..octave] = pitchnum + (octave * 12)
        end
    end
    return pitches
end

pitches = ToOctave()

-- CREATION OF STRING TIME DURATIONS TO TIME VALUES TABLE

local base = 1/32

local basic_vals = {}
-- BASIC TIME VALUES
basic_vals["4/4"]   = 64    -- whole
basic_vals["2/4"]   = 32    -- half
basic_vals["1/4"]   = 16    -- quarter
basic_vals["1/8"]   = 8     -- eighth
basic_vals["1/16"]  = 4     -- sixteenth
basic_vals["1/32"]  = 2     -- thirty second
basic_vals["1/64"]  = 1     -- sixty fourth

-- TIME SIGNATURE BAR VALUES FOR EASE OF USE
local timesigs = {} -- separate table so that we don't get the dotteds and tuplets of say, 5/4 cause that's stupid

-- NON 4/4 SIMPLE TIME SIGS
timesigs["6/4"]  = 96
timesigs["3/2"]  = 96
timesigs["2/2"]  = 64    -- i mean, just in case? i have seen some music like this
timesigs["3/4"]  = 48 

-- COMPOUND TIME SIGS
timesigs["12/8"] = 96
timesigs["9/8"]  = 72 
timesigs["6/8"]  = 48
timesigs["4/8"]  = 36 
timesigs["3/8"]  = 24 

--IRREGULAR TIME SIGS
timesigs["10/4"] = 160
timesigs["9/4"]  = 144
timesigs["7/4"]  = 112 
timesigs["6/4"]  = 96 
timesigs["5/4"]  = 80 
timesigs["7/8"]  = 56 
timesigs["5/8"]  = 40 

local rhythms = {}  -- final table of strings with their respective converted time values

local function Basic()
    for k,v in pairs(basic_vals) do
        rhythms[k] = v * base
    end
end

local function Dotteds() 
    for k,v in pairs(basic_vals) do
        rhythms[k.."*"] = v * base * 3/2  --create a new key with a new value?
        rhythms[k.."**"]= v * base * 3/2 * 3/2  -- double dotteds, juuuust in case.
        -- if you want triple dotteds you're wrong and you should feel bad
    end
end


local function Tuplets()
    for k,v in pairs(basic_vals) do
        for i=3, 9 do    -- all kinds of semi-reasonable tuplets for all kinds of rhythmic feels.
            rhythms["["..i.."]"..k] = v * base * 2/i
        end
    end
end

local function TimeSigs()
    for k,v in pairs(timesigs) do
        rhythms[k] = v * base
    end
end
local function Converted()
    Basic()
    Dotteds()
    Tuplets()
    TimeSigs()
    return rhythms
end

rhythms = Converted() 

-- FUNCTIONS TO CONVERT USER SONGFILE TO SHELL BELL NOTE TABLE

local function OutputPitch(value, transpose)
    if type(value) == "number" then
        value = value + transpose
        return value
    elseif type(value) == "string" then
        for pitchname, pitchnum in pairs(pitches) do
            if pitchname == value then
                value = pitchnum + transpose
                return value
            end
        end    
    end
    return nil -- for when your pitch string is invalid
end


local function OutputTime(song, note_table, value, prev_beat, distance)
    if type(value) == "number" then
        if prev_beat == 0 then
            return 0
        elseif prev_beat > 0 then
            local prev = song[prev_beat].t
            distance = distance + prev
            return distance
        end
    elseif type(value) == "string" then
        for rhythm_name, duration in pairs(rhythms) do -- convert all our time values to their respective number.
            if rhythm_name == value then
                note_table.t = duration     -- NEEDED for the "prev" variable in the next block.
            end
        end
        if type(note_table.t) == "string" then
            return nil -- for when your rhythm string is invalid
        elseif prev_beat == 0 then
            return 0
        elseif prev_beat > 0 then
            local prev = song[prev_beat].t
            distance = distance + prev
            return distance
        end
    end
end


function TimeVal(title, song, transpose)   -- upon modimport this will be the only function that can be called per song file.
    --print("Compiling "..title..".")
    local song_error = "Error compiling "..title.."!"

    local notes = {} -- this is the final table of {pitch#, t = ##} subtables we'll return
    local distance = 0

    for beat_num, note_table in pairs(song) do
        local prev_beat = beat_num - 1
        local _note_table = {}  -- duplicate table to avoid modifying the original note_table directly.
        local pitch = 0
        local index = 0
        for key, value in pairs(note_table) do
            if key ~= "t" and (value == 0 or value == "0") then
                index = key
                _note_table[index] = 0
            elseif key ~= "t" then
                index = key
                local pitch = OutputPitch(value, transpose)
                if pitch == nil then -- error proofing and to avoid the game just flat out crashing on you
                    print(song_error)
                    print(string.format("Failed to convert pitch \"%s\".\nIt has t-value \"%s\", located at note table #%d.", value, note_table.t, beat_num))
                    return
                end
                _note_table[index] = pitch  -- needed as we'll use the whole table later
            elseif key == "t" then
                distance = OutputTime(song, note_table, value, prev_beat, distance)
                if distance == nil then -- error proofing and to avoid the game just flat out crashing on you
                    print(song_error)
                    print(string.format("Failed to convert rhythm \"%s\".\nIt has pitch-value \"%s\", located at note table #%d.", value, note_table[index], beat_num))
                    return
                elseif _note_table[index] == 0 then
                    -- for rests, don't do anything. it's as shrimple as that!
                    -- the distance value will still update normally. it's just that the-
                    -- _note_table table, isn't, well, inserted.
                else
                    _note_table.t = distance
                    table.insert(notes, _note_table)
                end
            end
        end
    end
    --print("Successfully compiled "..title.."!") 
    return notes
end

return TimeVal