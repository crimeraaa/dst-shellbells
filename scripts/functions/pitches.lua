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

local function ToOctave()
    local pitches = {}
    for letter,pitchnum in pairs(letternames) do
        for octave=1, 6 do
            pitches[letter..octave] = pitchnum + (octave * 12)
        end
    end
    return pitches
end

pitches = ToOctave()

return pitches

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

-- Function Calls

local function Basic(rhythms)
    for k,v in pairs(basic_vals) do
        rhythms[k] = v * base
    end
end

local function Dotteds(rhythms) 
    for k,v in pairs(basic_vals) do
        rhythms[k.."*"] = v * base * 3/2  --create a new key with a new value?
        rhythms[k.."**"]= v * base * 3/2 * 3/2  -- double dotteds, juuuust in case.
        -- if you want triple dotteds you're wrong and you should feel bad
    end
end


local function Tuplets(rhythms)
    for k,v in pairs(basic_vals) do
        for i=3, 9 do    -- all kinds of semi-reasonable tuplets for all kinds of rhythmic feels.
            rhythms["["..i.."]"..k] = v * base * 2/i
        end
    end
end

local function TimeSigs(rhythms)
    for k,v in pairs(timesigs) do
        rhythms[k] = v * base
    end
end

local function Converted()
    local rhythms = {}  -- final table of strings with their respective converted time values
    Basic(rhythms)
    Dotteds(rhythms)
    Tuplets(rhythms)
    TimeSigs(rhythms)
    return rhythms
end

rhythms = Converted() 

return rhythms