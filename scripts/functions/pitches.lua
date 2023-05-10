-- Creation of String-Value pairs Pitches table

local letternames = {
    -- PRIMARY NOTE NAMES 
    ["C"]    =   1,
    ["D"]    =   3,
    ["E"]    =   5,    
    ["F"]    =   6,
    ["G"]    =   8,
    ["A"]    =   10,
    ["B"]    =   12,
}

local function MakeAccidentals(rets, letter, octave, pitch_val)
    local flats = ""
    for num_flats = 1, 2 do
        -- Single flat on 1st iter, Two flats on 2nd
        flats = flats.."b"
        rets[letter..flats..octave] = pitch_val - num_flats
    end

    local sharps = ""
    for num_sharps = 1, 2 do
        -- Single sharp on 1st iter, Two sharps on 2nd
        sharps = sharps.."#"
        rets[letter..sharps..octave] = pitch_val + num_sharps
    end
end

local function MakeNote(rets, letter, pitch_num)
    for octave = 1, 6 do
        local pitch_val = pitch_num + (pitch_num * 12)
        rets[letter..pitch_num] = pitch_val
        MakeAccidentals(rets, letter, octave, pitch_val)
    end
end

local function MakeOctaves()
    local rets = {}
    for letter, pitch_num in pairs(letternames) do
        MakeNote(rets, letter, pitch_num)
    end
    return rets
end

return MakeOctaves()