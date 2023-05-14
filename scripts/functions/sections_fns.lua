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

local PITCHES = require("functions/pitches")
local RHYTHMS = require("functions/rhythms")

local stringf = string.format
local function printf(fmt, ...)
    print(stringf(fmt, ...))
end

SectionsHelper = {}

SectionsHelper.MakeSections = function(...)
    local rets = {}
    local final_song_tbl = {...}
    for _, section_tbl in pairs(final_song_tbl) do
        for i, note_tbl in ipairs(section_tbl) do
            table.insert(rets, note_tbl)
        end
    end
    return rets
end

-- Use this to check all of a section's key-value pairs
local details = "Song: '%s',\tTransposition: %d semitones."
SectionsHelper.DumpSong = function(data)
    printf(details, data.title, data.transpose or 0)
    for i, tbl in ipairs(data.notes) do
        print("\ti: ", i, "Pitch:", tbl[1], "Time:", tbl.t)
    end
    print("")
end

local function ValueCheck(val, ref_tbl)
    if type(val) == "string" then
        val = ref_tbl[val]
        if not val then
            return nil
        end
    elseif type(val) ~= "number" then
        return nil
    end
    -- If ref_tbl[val] is valid or val was a number already, return it
    return val
end

-- Check a single input section if any of its values are invalid
local err_msg = "\tIndex %d: Invalid %s value '%s'!"
SectionsHelper.EvaluateSection = function(section)
    print("================ EVALUATING SECTION ================")
    local error_count = 0
    for i, note_tbl in ipairs(section) do
        local pitch = ValueCheck(note_tbl[1], PITCHES)
        if not pitch then
            pitch = tostring(note_tbl[1])
            printf(err_msg, i, "pitch", pitch)
            error_count = error_count + 1
        end

        local time = ValueCheck(note_tbl.t, RHYTHMS)
        if not time then
            time = tostring(note_tbl.t)
            printf(err_msg, i, "time", time)
            error_count = error_count + 1
        end
    end
    if error_count == 0 then
        print("\tAll values in this section are valid!")
    end
    print("================ DONE EVALUATING ================\n")
end

-- Check multiple input sections any of their values are invalid
SectionsHelper.EvaluateSong = function(...)
    local sections_tbl = {...}
    for _, indiv_section in ipairs(sections_tbl) do
        SectionsHelper.EvaluateSection(indiv_section)
    end
end

return SectionsHelper