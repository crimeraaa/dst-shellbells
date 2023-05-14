local SectionsHelper = require("functions/sections_fns")
local data = {}
data.title = "whiplash_bass"
data.transpose = 0

--[[ "Whiplash" by Hank Levy/Don Ellis (1973).
Key of C minor, but like many blues and jazz tunes it uses at lot of chromaticism and non diatonic tones.
7/4 time, Bass part. ]]

local INTRO = {}
INTRO.BAND = {
-- 1ST MEASURE
    --[[1]] { 0,    t = "7/4" },    -- Horns

-- 2ND MEASURE 
    --[[1]] { "C4", t = 0 },    { "C5", t = "1/4" }, 
    --[[&]] 

    --[[2]] { "Bb3",t = 0 },    { "Bb4",t = "1/8" },  
    --[[&]] { "Ab3",t = 0 },    { "Ab4",t = "1/8" },  

    --[[3]] { "G3", t = 0 },    { "G4", t = "1/4" },  
    --[[&]] 

    --[[4]] { "C3", t = 0 },    { "C4", t = "1/8" },  
    --[[&]] { "Gb3",t = 0 },    { "Gb4",t = "1/8" },  

    --[[5]] { 0,    t = "1/8" }, 
    --[[&]] { "F3", t = 0 },    { "F4", t = "1/8" },  

    --[[6]] { 0,    t = "1/8" }, 
    --[[&]] { "C3", t = 0 },    { "C4", t = "1/8" },  

    --[[7]] { "Eb3",t = 0 },    { "Eb4",t = "1/4" },  
    --[[&]] 

-- 3RD MEASURE
    --[[1]] { "C3", t = 0 },    { "C4", t = "7/4" },    -- Horns

-- 4TH MEASURE
    --[[1]] { "C3", t = 0 },    { "C4", t = "1/4" },  
    --[[&]] 

    --[[2]] { "C3", t = 0 },    { "C4", t = "1/8" },  
    --[[&]] { "D3", t = 0 },    { "D4", t = "1/8" },  

    --[[3]] { "Eb3",t = 0 },    { "Eb4",t = "1/4" },  
    --[[&]] 

    --[[4]] { "F3", t = 0 },    { "F4", t = "1/8" },  
    --[[&]] { "Gb3",t = 0 },    { "Gb4",t = "1/8" },  

    --[[5]] { 0,    t = "1/8" }, 
    --[[&]] { "F3", t = 0 },    { "F4", t = "1/8" },  

    --[[6]] { 0,    t = "1/8" }, 
    --[[&]] { "Eb3",t = 0 },    { "Eb4",t = "1/8" },  

    --[[7]] { "C3", t = 0 },    { "C4", t = "1/4" },  
    --[[&]] 

-- 5TH MEASURE
    --[[1]] { 0,    t = "7/4" },    -- Horns

-- 6TH MEASURE
    --[[1]] { "C4", t = 0 },    { "C5", t = "1/4" }, 
    --[[&]] 

    --[[2]] { "Bb3",t = 0 },    { "Bb4",t = "1/8" },  
    --[[&]] { "Ab3",t = 0 },    { "Ab4",t = "1/8" },  

    --[[3]] { "G3", t = 0 },    { "G4", t = "1/4" },  
    --[[&]] 

    --[[4]] { "C3", t = 0 },    { "C4", t = "1/8" },  
    --[[&]] { "Gb3",t = 0 },    { "Gb4",t = "1/8" },  

    --[[5]] { 0,    t = "1/8" }, 
    --[[&]] { "F3", t = 0 },    { "F4", t = "1/8" },  

    --[[6]] { 0,    t = "1/8" }, 
    --[[&]] { "C3", t = 0 },    { "C4", t = "1/8" },  

    --[[7]] { "Eb3",t = 0 },    { "Eb4",t = "1/4" },  
    --[[&]] 

-- 7TH MEASURE
    --[[1]] { "C3", t = 0 },    { "C4", t = "4/4" },    -- Horns
    --[[2]] 
    --[[3]] 
    --[[4]] 

    --[[5]] { 0,    t = "2/4" }, 
    --[[6]] 

    --[[7]] { "C4", t = 0 },    { "C5", t = "1/8" },  
    --[[&]] { "Bb3",t = 0 },    { "Bb4",t = "1/8" },  

-- 8TH MEASURE
    --[[1]] { "G3", t = 0 },    { "G4", t = "7/4" },  
}

-- 2 + 2 + 2 + 2 + 3 + 3 feel
INTRO.BASS_ONLY = {
-- 9TH MEASURE
    --[[1]] { "C3", t = "1/4*" }, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "B3", t = "1/8" }, 

-- 10TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "C3", t = "1/8" }, 
    --[[&]] { "D3", t = "1/8" }, 

    --[[1]] { "Eb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "Bb3",t = "1/8" },

    --[[2]] { "Db3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "Ab3",t = "1/8" }, 

-- 11TH MEASURE
    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 

    --[[2]] { "C3", t = "1/4" }, 
    --[[&]] 

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "G3", t = "1/8" }, 
    --[[&]] { "Bb3",t = "1/8" }, 

    --[[1]] { "C4", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "B3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "B3", t = "1/8" }, 

-- 12TH MEASURE
    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 

    --[[2]] { "C3", t = "1/4" },
    --[[&]]  

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "C3", t = "1/8" }, 
    --[[&]] { "D3", t = "1/8" }, 

    --[[1]] { "Eb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "Bb3",t = "1/8" },

    --[[2]] { "Db3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "Ab3",t = "1/8" }, 

-- HORNS AND STRINGS ENTER

-- 13TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "G3", t = "1/4" }, 
    --[[&]]                         -- C/G

    --[[1]] { "C3", t = "1/4" },    -- Bb
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 

-- 14TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "G3", t = "1/4" }, 
    --[[&]]                         -- C/G

    --[[1]] { "C3", t = "1/4" },    -- Bb
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 

-- 15TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "G3", t = "1/4" }, 
    --[[&]]                         -- C/G

    --[[1]] { "C3", t = "1/4" },    -- Bb
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 

-- 16TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4" }, 
    --[[&]] 

    --[[4]] { "G3", t = "1/4" }, 
    --[[&]]                         -- C/G

    --[[1]] { "C3", t = "1/4" },    -- Bb
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 
}

local A_SECTION = {
-- 17TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4*"}, 
    --[[&]] 

    --[[4]] 
    --[[&]] { "G3", t = "1/8" }, 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 

-- 18TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4*"}, 
    --[[&]] 

    --[[4]] 
    --[[&]] { "G3", t = "1/8" }, 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Eb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "Bb3",t = "1/8" }, 

-- 19TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4*"}, 
    --[[&]] 

    --[[4]] 
    --[[&]] { "G3", t = "1/8" }, 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 

-- 20TH MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4*"}, 
    --[[&]] 

    --[[4]] 
    --[[&]] { "G3", t = "1/8" }, 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Eb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "Bb3",t = "1/8" }, 

-- 21ST MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4*"}, 
    --[[&]] 

    --[[4]] 
    --[[&]] { "G3", t = "1/8" }, 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 

-- 22ND MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C3", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4*"}, 
    --[[&]] 

    --[[4]] 
    --[[&]] { "G3", t = "1/8" }, 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Eb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "Bb3",t = "1/8" }, 

-- 23RD MEASURE
    --[[1]] { "C3", t = "1/4*"}, 
    --[[&]] 

    --[[2]] 
    --[[&]] { "C4", t = "1/8" }, 

    --[[3]] { "G3", t = "1/4*"}, 
    --[[&]] 

    --[[4]] 
    --[[&]] { "G3", t = "1/8" }, 

    --[[1]] { "C3", t = "1/4" }, 
    --[[&]] 
    --[[a]] { "G3", t = "1/8" },

    --[[2]] { "Bb3",t = "1/4" }, 
    --[[&]] 
    --[[a]] { "F3", t = "1/8" }, 

-- 24TH MEASURE
-- feel in 2's
    --[[1]] { "G3", t = "7/4" }, 
    --[[&]] --{ "A3", t = "1/4*"}, 
    
    --[[2]] 
    --[[&]] 

    --[[3]] --{ "D3", t = "1/4*"},
    --[[&]] 

    --[[4]] 
    --[[&]] --{ "Ab3",t = "1/4*"},

    --[[5]] 
    --[[&]] 

    --[[6]] --{ "G3", t = "1/4" }, 
    --[[&]] 

    --[[7]] --{ "C3", t = "1/4" }, 
    --[[8]] 
}

local B_SECTION = {
-- this is the pizzicato strings part, cause i like it
-- 25TH MEASURE
    --[[1]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "2/4" },    -- Bb
    --[[2]]  
    --[[3]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "1/4" }, 
    --[[4]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 

    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

    --[[2]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

-- 26TH MEASURE
    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "2/4" },  
    --[[2]]  
    --[[3]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "1/4" }, 
    --[[4]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 

    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "6/8" }, 
    --[[&]] 
    --[[a]] 

    --[[2]] 
    --[[&]] 
    --[[a]] 

-- 27TH MEASURE
    --[[1]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "2/4" }, 
    --[[2]]  
    --[[3]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "1/4" }, 
    --[[4]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 

    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

    --[[2]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

-- 28TH MEASURE
    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "2/4" },  
    --[[2]]  
    --[[3]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "1/4" }, 
    --[[4]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 

    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "6/8" }, 
    --[[&]] 
    --[[a]] 

    --[[2]] 
    --[[&]] 
    --[[a]] 

-- 29TH MEASURE
    --[[1]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "2/4" }, 
    --[[2]] 
    --[[3]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "1/4" }, 
    --[[4]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 

    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

    --[[2]] --[[{ "F4", t = 0 },]]    { "F5", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

-- 30TH MEASURE
    --[[1]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "2/4" }, 
    --[[2]] 
    --[[3]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 
    --[[4]] --[[{ "D4", t = 0 },]]    { "D5", t = "1/4" }, 

    --[[1]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "6/8" }, 
    --[[&]] 
    --[[a]] 

    --[[2]] 
    --[[&]] 
    --[[a]] 

-- 31ST MEASURE
    --[[1]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "2/4" }, 
    --[[2]] 
    --[[3]] --[[{ "Bb3",t = 0 },]]    { "Bb4",t = "1/4" }, 
    --[[4]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 

    --[[1]] --[[{ "D4", t = 0 },]]    { "D5", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

    --[[2]] --[[{ "F4", t = 0 },]]    { "F5", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

-- 32ND MEASURE
    --[[1]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "2/4" }, 
    --[[2]] 
    --[[3]] --[[{ "C4", t = 0 },]]    { "C5", t = "1/4" }, 
    --[[4]] --[[{ "D4", t = 0 },]]    { "D5", t = "1/4" }, 

    --[[1]] --[[{ "Eb4",t = 0 },]]    { "Eb5",t = "6/8" }, 
    --[[&]] 
    --[[a]] 

    --[[2]] 
    --[[&]] 
    --[[a]] 

-- BASS
-- 33RD MEASURE
    --[[1]] { "G3", t = 0 },    { "G4", t = "4/4" }, 
    --[[2]] 
    --[[3]] 
    --[[4]] 

    --[[1]] { 0, t = "1/4*"},
    --[[&]] 
    --[[a]] 

    --[[2]] { "G3", t = 0 },    { "G4", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

-- 34TH MEASURE
    --[[1]] { "F3", t = 0 },    { "F4", t = "4/4" }, 
    --[[2]] 
    --[[3]] 
    --[[4]] 

    --[[1]] { 0, t = "1/4*"},
    --[[&]] 
    --[[a]] 

    --[[2]] { "F3", t = 0 },    { "F4", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

-- 35TH MEASURE
    --[[1]] { "Eb3",t = 0 },    { "Eb4",t = "4/4" }, 
    --[[2]] 
    --[[3]] 
    --[[4]] 

    --[[1]] { 0, t = "1/4*"},
    --[[&]] 
    --[[a]] 

    --[[2]] { "Eb3",t = 0 },    { "Eb4",t = "1/4*"}, 
    --[[&]] 
    --[[a]] 

-- 36TH MEASURE
    --[[1]] { "D3", t = 0 },    { "D4", t = "4/4" }, 
    --[[2]] 
    --[[3]] 
    --[[4]] 

    --[[1]] { 0, t = "1/4*"},
    --[[&]] 
    --[[a]] 

    --[[2]] { "D3", t = 0 },    { "D4", t = "1/4*"}, 
    --[[&]] 
    --[[a]] 
}

local END_CHORD = {
    --[[1]] { "C3", t = 0 },    { "C4", t = "7/4" }, 
}

data.notes = SectionsHelper.MakeSections(
    INTRO.BAND, INTRO.BASS_ONLY, 
    A_SECTION, B_SECTION, A_SECTION, 
    INTRO.BAND, END_CHORD
)

return data