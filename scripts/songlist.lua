local songlist = {} -- primary table we'll return

local directory = {} -- this is where you'll define your folders.
local dir = directory -- i want the table variable "directory" to be clear and concise, but use "dir" when creating subtables.

--[[

Put your song's address (without .lua) inside the dir["My Songs"] table! 
    Make sure you're INSIDE THE SCOPE OF THE BRACKETS {}. Follow the examples below for help.
    Always enclose your song's address in quotation marks, and after each entry end it with a comma (",").

]]

dir["My Songs"] = 
{
    "template",
    "jazzlick",
}

--[[

If you have another folder within "scripts/songs", define it as:

dir["My Folder"] =
{
    "song1",
    "song2",
}

If your folder is INSIDE of a folder within "scripts/songs", like inside of "scripts/songs/My Songs", 
then define it like this:

dir["My Songs/My Subfolder"] =

{
    "song1",
    "song2",
}

If you have any number of subfolders, as long as they're located under "scripts/songs" it will work.

]]

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
        local path = name.."/"..file
        table.insert(songlist, path)
    end
end


for i,path in pairs(songlist) do
    local address = "songs/"..path -- if your address is wrong or it's outside the My Songs folder,
    local invalid = address.." is missing a valid"

    --print("Checking "..address..".") 
    local songfile = require(address) -- you WILL crash.
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