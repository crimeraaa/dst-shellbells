-- CREATION OF STRING TIME DURATIONS TO TIME VALUES TABLE

local base = 1/32

local BASIC_VALS = {
-- BASIC TIME VALUES
    ["4/4"]   = 64,    -- whole
    ["2/4"]   = 32,    -- half
    ["1/4"]   = 16,    -- quarter
    ["1/8"]   = 8,    -- eighth
    ["1/16"]  = 4,    -- sixteenth
    ["1/32"]  = 2,    -- thirty second
    ["1/64"]  = 1,    -- sixty fourth
}

-- Time Signature Bar Values

local TIMESIGS = {
    -- NON 4/4 SIMPLE TIME SIGS
    ["6/4"]  = 96,
    ["3/2"]  = 96,
    ["2/2"]  = 64,
    ["3/4"]  = 48, 
    -- COMPOUND TIME SIGS
    ["12/8"] = 96,
    ["9/8"]  = 72, 
    ["6/8"]  = 48,
    ["4/8"]  = 36, 
    ["3/8"]  = 24, 
    --IRREGULAR TIME SIGS
    ["10/4"] = 160,
    ["9/4"]  = 144,
    ["7/4"]  = 112, 
    ["6/4"]  = 96, 
    ["5/4"]  = 80, 
    ["7/8"]  = 56, 
    ["5/8"]  = 40, 
}

-- Function Calls

local function Basic(rhythms)
    for k,v in pairs(BASIC_VALS) do
        rhythms[k] = v * base
    end
end

local function Dotteds(rhythms) 
    for k,v in pairs(BASIC_VALS) do
        rhythms[k.."*"] = v * base * 3/2  --create a new key with a new value?
        rhythms[k.."**"]= v * base * 3/2 * 3/2  -- double dotteds, juuuust in case.
        -- if you want triple dotteds you're wrong and you should feel bad
    end
end


local function Tuplets(rhythms)
    for k,v in pairs(BASIC_VALS) do
        for i=3, 9 do    -- all kinds of semi-reasonable tuplets for all kinds of rhythmic feels.
            rhythms["["..i.."]"..k] = v * base * 2/i
        end
    end
end

local function TimeSignatures(rhythms)
    for k,v in pairs(TIMESIGS) do
        rhythms[k] = v * base
    end
end

local function Converted()
    local rhythms = {}  -- final table of strings with their respective converted time values
    Basic(rhythms)
    Dotteds(rhythms)
    Tuplets(rhythms)
    TimeSignatures(rhythms)
    return rhythms
end

return Converted()