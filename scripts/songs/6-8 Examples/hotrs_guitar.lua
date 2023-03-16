local data = {}
data.title = "hotrs_guitar"
data.transpose = 0
data.notes =
{
-- "House Of The Rising Sun" Traditional American/English folk song, versio by The Animals (1964)
-- Key of A minor, 6/8 time.

-- GUITAR INTRO 
-- ( Im - III - IV - VI,  Im - V - Im - V )
-- open G string on most "a"s of 2 for most chords.
-- 1ST MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 2ND MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 3RD MEASURE, Dmaj
    --[[1]] { "D4", t = "1/8" },  
    --[[&]] { "D4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "D5", t = "1/8" }, 

    --[[2]] { "F#5",t = "1/8" }, 
    --[[&]] { "D5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 4TH MEASURE, Fmaj
    --[[1]] { "F4", t = "1/8" },  
    --[[&]] { "F4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "F5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 5TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 6TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- 7TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 8TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- VERSE 1 
-- ( Im - III - IV - VI,  Im - III - V - V,  Im - III - IV - VI, Im - V)

-- 9TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 10TH MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 11TH MEASURE, Dmaj
    --[[1]] { "D4", t = "1/8" },  
    --[[&]] { "D4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "D5", t = "1/8" }, 

    --[[2]] { "F#5",t = "1/8" }, 
    --[[&]] { "D5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 12TH MEASURE, Fmaj
    --[[1]] { "F4", t = "1/8" },  
    --[[&]] { "F4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "F5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 13TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 14TH MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 15TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- 16TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- 17TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 18TH MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 19TH MEASURE, Dmaj
    --[[1]] { "D4", t = "1/8" },  
    --[[&]] { "D4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "D5", t = "1/8" }, 

    --[[2]] { "F#5",t = "1/8" }, 
    --[[&]] { "D5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 20TH MEASURE, Fmaj
    --[[1]] { "F4", t = "1/8" },  
    --[[&]] { "F4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "F5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 21ST MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 22ND MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- BREAK 1 (REPEAT GUITAR INTRO CHORDS) 
-- ( Im - III - IV - VI,  Im - V - Im - V )

-- 1ST MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 2ND MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 3RD MEASURE, Dmaj
    --[[1]] { "D4", t = "1/8" },  
    --[[&]] { "D4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "D5", t = "1/8" }, 

    --[[2]] { "F#5",t = "1/8" }, 
    --[[&]] { "D5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 4TH MEASURE, Fmaj
    --[[1]] { "F4", t = "1/8" },  
    --[[&]] { "F4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "F5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 5TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 6TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- 7TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 8TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- VERSE 2 (REPEAT VERSE CHORDS)
--( Im - III - IV - VI,  Im - III - V - V,  Im - III - IV - VI, Im - V)

-- 9TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 10TH MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 11TH MEASURE, Dmaj
    --[[1]] { "D4", t = "1/8" },  
    --[[&]] { "D4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "D5", t = "1/8" }, 

    --[[2]] { "F#5",t = "1/8" }, 
    --[[&]] { "D5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 12TH MEASURE, Fmaj
    --[[1]] { "F4", t = "1/8" },  
    --[[&]] { "F4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "F5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 13TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 14TH MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 15TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- 16TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- 17TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 18TH MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 19TH MEASURE, Dmaj
    --[[1]] { "D4", t = "1/8" },  
    --[[&]] { "D4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "D5", t = "1/8" }, 

    --[[2]] { "F#5",t = "1/8" }, 
    --[[&]] { "D5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 20TH MEASURE, Fmaj
    --[[1]] { "F4", t = "1/8" },  
    --[[&]] { "F4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "F5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 21ST MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 22ND MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- BREAK 2/ENDING (REPEAT GUITAR INTRO CHORDS) 
-- ( Im - III - IV - VI,  Im - V - Im - V )

-- 1ST MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 2ND MEASURE, Cmaj
    --[[1]] { "C4", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "G4", t = "1/8" }, 

-- 3RD MEASURE, Dmaj
    --[[1]] { "D4", t = "1/8" },  
    --[[&]] { "D4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "D5", t = "1/8" }, 

    --[[2]] { "F#5",t = "1/8" }, 
    --[[&]] { "D5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 4TH MEASURE, Fmaj
    --[[1]] { "F4", t = "1/8" },  
    --[[&]] { "F4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "F5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 5TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 6TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- 7TH MEASURE, Amin
    --[[1]] { "A3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "A4", t = "1/16"}, -- offbeat of &
    --[[a]] { "C5", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "C5", t = "1/8" }, 
    --[[a]] { "A4", t = "1/8" }, 

-- 8TH MEASURE, Emaj
    --[[1]] { "E3", t = "1/8" },  
    --[[&]] { "E4", t = "1/16"}, 
    --[[e]] { "G#4",t = "1/16"}, -- offbeat of &
    --[[a]] { "B4", t = "1/8" }, 

    --[[2]] { "E5", t = "1/8" }, 
    --[[&]] { "B4", t = "1/8" }, 
    --[[a]] { "G#4",t = "1/8" }, 

-- FINAL CHORD
    --[[1]] { "A3", t = 0 },    { "E4", t = 0 },    { "A4", t = 0 },    { "C5", t = 0 },    { "E5", t = "3/4" }, 
}

return data