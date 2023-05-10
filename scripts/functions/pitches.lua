-- CREATION OF STRING PITCHES TO PITCH VALUES TABLE

local letternames = {
    -- PRIMARY NOTE NAMES       -- ENHARMONICS
    ["C"]    =   1,             ["B#"]   =   1,
    ["C#"]   =   2,             ["Db"]   =   2,
    ["D"]    =   3,
    ["D#"]   =   4,             ["Eb"]   =   4,
    ["E"]    =   5,             ["Fb"]   =   5,
    ["F"]    =   6,             ["E#"]   =   6,
    ["F#"]   =   7,             ["Gb"]   =   7,
    ["G"]    =   8,
    ["G#"]   =   9,             ["Ab"]   =   9,
    ["A"]    =   10, 
    ["A#"]   =   11,            ["Bb"]   =   11,
    ["B"]    =   12,            ["Cb"]   =   12,
}
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

return ToOctave()