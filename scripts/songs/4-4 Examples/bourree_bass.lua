local SectionsHelper = require("functions/sections_fns")
local data = {}
data.title = "bourree_bass"
data.transpose = 0

--[[ "Bouree in E Minor" by Johann Sebastian Bach. 4/4.
Lower Voice part. ]]

local FIRST_HALF = {}
FIRST_HALF.MAIN = {
-- PICKUP MEASURE
    --[[4]]     { "G3",     t = "1/8" }, 
    --[[&]]     { "F#3",    t = "1/8" }, 

-- 1ST MEASURE
    --[[1]]     { "E3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "A3",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "B3",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "A3",     t = "1/4" }, 
    --[[&]] 

-- 2ND MEASURE
    --[[1]]     { "G3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "F#3",    t = "1/4" },  
    --[[&]] 

    --[[3]]     { "E3",     t = "1/4" }, 
    --[[&]] 

    --[[4]]     { "F#3",    t = "1/4" }, 
    --[[&]] 

-- 3RD MEASURE
    --[[1]]     { "G3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "A3",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "B3",     t = "1/4" }, 
    --[[&]] 

    --[[4]]     { "A3",     t = "1/4" }, 
    --[[&]] 

-- 4TH MEASURE
    --[[1]]     { "G3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "B3",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "E3",     t = "1/8" },  
    --[[&]]     { "F#3",    t = "1/8" }, 

    --[[4]]     { "G3",     t = "1/8" }, 
    --[[&]]     { "F#3",    t = "1/8" }, 

-- 5TH MEASURE 
    --[[1]]     { "E3",     t = "1/4" },      
    --[[&]] 

    --[[2]]     { "A3",     t = "1/4" }, 
    --[[&]]  

    --[[3]]     { "B3",     t = "1/4" }, 
    --[[&]] 

    --[[4]]     { "A3",     t = "1/4" }, 
    --[[&]]                              

-- 6TH MEASURE
    --[[1]]     { "G3",     t = "1/4" },      
    --[[&]] 

    --[[2]]     { "F#3",    t = "1/4" }, 
    --[[&]] 
     
    --[[3]]     { "E3",     t = "1/4" }, 
    --[[&]] 

    --[[4]]     { "F#3",    t = "1/4" }, 
    --[[&]]        

-- 7TH MEASURE
    --[[1]]     { "G3",     t = "1/4" },      
    --[[&]]

    --[[2]]     { "C4",     t = "1/4" },      
    --[[&]]                               

    --[[3]]     { "D4",     t = "1/4" }, 
    --[[&]]                                                   

    --[[4]]     { "D4",     t = "1/4" },    
    --[[&]]                               
}

FIRST_HALF.VOLTA_1 = {
-- 8TH MEASURE
    --[[1]]     { "G3",     t = "2/4*" }, 
    --[[&]]
    
    --[[2]]   
    --[[&]]   

    --[[3]]   
    --[[&]]

    --[[4]]     { "G3",     t = "1/8" }, 
    --[[&]]     { "F#3",    t = "1/8" }, 
}

FIRST_HALF.VOLTA_2 = {
-- 9TH MEASURE
    --[[1]]     { "G3",     t = "2/4*" }, 
    --[[&]] 

    --[[2]] 
    --[[&]]   

    --[[3]]   
    --[[&]] 

    --[[4]]     { "G3",     t = "1/4" }, 
    --[[&]] 
}

local SECOND_HALF = {}
SECOND_HALF.MAIN = {
-- 10TH MEASURE
    --[[1]]     { "F#3",    t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "D4",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "G3",     t = "1/4" }, 
    --[[&]] 

    --[[4]]     { "B3",     t = "1/4" }, 
    --[[&]] 

-- 11TH MEASURE
    --[[1]]     { "C4",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "G#3",    t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "A3",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "D4",     t = "1/4" }, 
    --[[&]] 

-- 12TH MEASURE
    --[[1]]     { "E4",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "A3",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "E4",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "E3",     t = "1/4" }, 
    --[[&]]  

-- 13TH MEASURE
    --[[1]]     { "A3",     t = "1/8" }, 
    --[[&]]     { "B3",     t = "1/8" }, 

    --[[2]]     { "A3",     t = "1/8" }, 
    --[[&]]     { "G3",     t = "1/8" },

    --[[3]]     { "F#3",    t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "F#3",    t = "1/4" }, 
    --[[&]] 

-- 14TH MEASURE
    --[[1]]     { "G3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "B3",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "C4",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "G#3",    t = "1/4" }, 
    --[[&]] 

-- 15TH MEASURE
    --[[1]]     { "A3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "C#4",    t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "D4",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "A#3",    t = "1/4" }, 
    --[[&]] 

-- 16TH MEASURE
    --[[1]]     { "B3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "E4",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "F#4",    t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "F#3",    t = "1/4" },
    --[[&]] 

-- 17TH MEASURE
    --[[1]]     { "B3",     t = "1/8" }, 
    --[[&]]     { "A#3",    t = "1/8" }, 

    --[[2]]     { "B3",     t = "1/8" }, 
    --[[&]]     { "C#4",    t = "1/8" }, 

    --[[3]]     { "D#4",    t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "B3",     t = "1/4" }, 
    --[[&]]   

-- 18TH MEASURE
    --[[1]]     { "E4",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "D4",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "C#4",    t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "A3",     t = "1/4" }, 
    --[[&]] 

-- 19TH MEASURE
    --[[1]]     { "D4",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "C4",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "B3",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "G3",     t = "1/4" }, 
    --[[&]] 

-- 20TH MEASURE
    --[[1]]     { "C4",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "B3",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "A3",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "F#3",    t = "1/4" }, 
    --[[&]]  

-- 21ST MEASURE
    --[[1]]     { "B3",     t = "1/4*" }, 
    --[[&]] 

    --[[2]] 
    --[[&]]     { "C4",     t = "1/8" }, 

    --[[3]]     { "B3",     t = "1/8" }, 
    --[[&]]     { "A3",     t = "1/8" }, 
    
    --[[4]]     { "G#3",    t = "1/4" }, 
    --[[&]]   

-- 22ND MEASURE
    --[[1]]     { "A3",     t = "1/8" }, 
    --[[&]]     { "E4",     t = "1/8" }, 

    --[[2]]     { "F#4",    t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "G3",     t = "1/8" }, 
    --[[&]]     { "D#4",    t = "1/8" }, 
    
    --[[4]]     { "E4",     t = "1/4" }, 
    --[[&]] 

-- 23RD MEASURE
    --[[1]]     { "F#4",    t = "1/8" }, 
    --[[&]]     { "C#4",    t = "1/8" }, 

    --[[2]]     { "D#4",    t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "E3",     t = "1/4" }, 
    --[[&]] 
    
    --[[4]]     { "A3",     t = "1/4" }, 
    --[[&]] 

-- 24TH MEASURE
    --[[1]]     { "B3",     t = "1/4" }, 
    --[[&]] 

    --[[2]]     { "A3",     t = "1/4" }, 
    --[[&]] 

    --[[3]]     { "B3",     t = "2/4" }, 
    --[[&]] 
    
    --[[4]] 
    --[[&]] 
}

SECOND_HALF.VOLTA_1 = {
-- 25TH MEASURE
    --[[1]]     { "E3",     t = "2/4*" },  
    --[[&]] 

    --[[2]] 
    --[[&]] 

    --[[3]] 
    --[[&]] 
    
    --[[4]]     { "G3",     t = "1/4" }, 
    --[[&]] 
}

SECOND_HALF.VOLTA_2 = {
-- 26TH MEASURE
    --[[1]]     { "E3",     t = "4/4" }, 
}

data.notes = SectionsHelper.MakeSections(
    FIRST_HALF.MAIN, FIRST_HALF.VOLTA_1,
    FIRST_HALF.MAIN, FIRST_HALF.VOLTA_2,
    SECOND_HALF.MAIN, SECOND_HALF.VOLTA_1,
    SECOND_HALF.MAIN, SECOND_HALF.VOLTA_2
)

return data