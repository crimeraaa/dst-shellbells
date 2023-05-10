-- This is where you'll define your folders.
local directory = {} 
-- Use directory["My Folder's Path"] when declaring new subtables.

directory["My Songs"] = {
    "template",
    "jazzlick",
}

-- EXAMPLE SONGS (from the "#-# Examples" folders)

directory["3-4 Examples"] = { 
    "malaguena", 
    "minuetg_bass",
    "minuetg_treble",
}

directory["4-4 Examples"] = {
    "blackbird_guitarchords",
    "blackbird_guitardrone",
    "blackbird_vox",
    "bourree_bass",
    "bourree_treble",
    "goodday_piano",
    "goodday_vox",
}

directory["5-4 Examples"] = {
    "take5_comp",
    "take5_melody",
}

directory["6-8 Examples"] = {
    "hotrs_guitar", -- short for "House of the Rising Sun".
    "hotrs_vox",    -- you wouldn't want to type out all that would you?
}

directory["7-4 Examples"] = {
    "whiplash_bass",
    "whiplash_comp",
    "whiplash_melody",
}

local songlist = {}

for name, contents in pairs(directory) do
    for _, file in pairs(contents) do
        -- error proofing just so folks get less headaches
        file = string.gsub(file, ".lua", "") 

        local path
        if string.find(name, "/", -1) or string.find(name, "\\", -1) then   
            -- accomodate if user appended a slash at end of folder path
            path = name..file 
        else
            path = name.."/"..file
        end

        table.insert(songlist, path)
    end
end

for i, path in ipairs(songlist) do
    local address = "songs/"..path 
    local invalid = address.." is missing a valid"
    local songfile = require(address) 
    if songfile.title == nil or not (type(songfile.title) == "string") then
        -- prevent valid songfiles with invalid values from flat out crashing us.
        print(invalid.." data.title value!") 
    elseif songfile.notes == nil or not (type(songfile.notes) == "table") then
        -- but keep compiling the rest of the songfiles.
        print(invalid.." data.notes table!") 
    else
        -- overwrite this index so we can return table songlist directly
        songlist[i] = songfile  
    end
end

return songlist