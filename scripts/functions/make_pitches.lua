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

local function MakeNote(letter, pitch_num)
    local rets = {}
    for octave = 1, 6 do
        local pitch_val = pitch_num + (octave * 12)
        rets[letter..octave] = pitch_val
        MakeAccidentals(rets, letter, octave, pitch_val)
    end
    return rets
end


--[[ This is not meant for you to use! 
This is for me, the mod maker, to generate the pitches.lua file.
I'd rather have the hardcoded table readily available,
rather than constantly recreating it everytime the mod runs. 

Lua 5.1 or later must be installed. To run, open your terminal.
Make sure the working directory is the one where this file is found.

Run this command: lua .\make_pitches.lua

It should output to the same directory this file is located in. ]]

local file = io.open("pitches.lua", "w")
file:write("--[[ Generated by make_pitches.lua ]]\n\n")
file:write("local pitches = {\n")

file:write("\n\t--[[ 0 PITCH VALUE/REST ]]\n\n")
file:write("\t[\"0\"] = 0,\n")

for letter, pitch_num in pairs(letternames) do
    file:write("\n\t--[[ ", letter, " ]]\n\n")
    local notes = MakeNote(letter, pitch_num)
    for k, v in pairs(notes) do
        file:write("\t[\"", k, "\"] = ", v, ",\n")
    end
end

file:write("}\n\nreturn pitches")
file:close()
