--[[ You can define individual sections and such of your song.
SectionsHelper.MakeSections allows you to put together all your sections,
most importantly allowing you to repeat them without copy pasting yourself.

For example:

local SectionsHelper = require("functions/sections_fns")
local data = {}
data.title = "Yellow Submarine"
data.transpose = 0

local INTRO = {
    ... -- pretend there's notes here
}

local VERSE = {
    ...
}

local CHORUS = {
    ...
}

local BRIDGE = {

}

data.notes = SectionsHelper.MakeSections(
    INTRO, VERSE, CHORUS,
    VERSE, CHORUS, BRIDGE,
    CHORUS
)

return data

If you're unsure about your data.notes, try using:

SectionsHelper.CheckSections(data)

and check your client_log.txt to see the printout. 
Make sure it's before the `return data` line though!

]]

SectionsHelper = {}

SectionsHelper.MakeSections = function(...)
    local rets = {}
    local all_sections = {...}
    for _, section_tbl in pairs(all_sections) do
        for i, note_tbl in ipairs(section_tbl) do
            table.insert(rets, note_tbl)
        end
    end
    return rets
end

SectionsHelper.CheckSections = function(data)
    print("Song:", data.title)
    print("Transposition:", data.transpose or 0, "semitones")
    for i, tbl in ipairs(data.notes) do
        print("\ti: ", i, "Pitch:", tbl[1], "Time:", tbl.t)
    end
end

return SectionsHelper