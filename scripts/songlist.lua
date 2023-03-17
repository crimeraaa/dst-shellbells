local songlist = {}
local directory = {} -- this is where you'll define your folders.
local dir = directory -- use dir["My Folder's Path"] when declaring new subtables.

dir["My Songs"] = 
{
    "template",
    "jazzlick",
}

-- EXAMPLE SONGS (from the "#-# Examples" folders)

dir["3-4 Examples"] = 
{ 
    "malaguena", 
    "minuetg_bass",
    "minuetg_treble",
}

dir["4-4 Examples"] =
{
    "blackbird_guitarchords",
    "blackbird_guitardrone",
    "blackbird_vox",
    "bourree_bass",
    "bourree_treble",
    "goodday_piano",
    "goodday_vox",
}

dir["5-4 Examples"] = 
{
    "take5_comp",
    "take5_melody",
}

dir["6-8 Examples"] =
{
    "hotrs_guitar", -- short for "House of the Rising Sun".
    "hotrs_vox",    -- you wouldn't want to type out all that would you?
}

dir["7-4 Examples"] = 
{
    "whiplash_bass",
    "whiplash_comp",
    "whiplash_melody",
}

--

for name, contents in pairs(directory) do
    for _, file in pairs(contents) do

        file = string.gsub(file, ".lua", "") -- error proofing just so folks get less headaches

        path = name.."/"..file

        if string.find(name, "/", -1) or string.find(name, "\\", -1) then   
            path = name..file -- accomodate if user appended any kind of slash at end of folder path
        end

        table.insert(songlist, path)
    end
end


for i,path in pairs(songlist) do
    local address = "songs/"..path 
    local invalid = address.." is missing a valid"
    --print("Checking "..address..".") 
    local songfile = require(address) 
    if songfile.title == nil or not (type(songfile.title) == "string") then
        print(invalid.." data.title value!") -- prevent valid songfiles with invalid values from flat out crashing us.
    elseif songfile.notes == nil or not (type(songfile.notes) == "table") then
        print(invalid.." data.notes table!") -- but keep compiling the rest of the songfiles.
    else
        --print(songfile.title.." is valid!")
        songlist[i] = songfile  -- overwrite this index so we can return table songlist directly
    end
end

return songlist