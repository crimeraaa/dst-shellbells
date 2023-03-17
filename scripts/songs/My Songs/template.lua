local data = {}
data.title = "template" -- a variable name that you can call later ingame, once your song is fully compiled.
data.transpose = 0  -- number of semitones you want to tranpose the whole song. can be positive or negative
data.notes =        -- where your actual music goes!
{

-- The following sample measures are only in 4/4. I'd encourage you to make your own templates.
-- There's many different time signatures (3/4, 6/8, 5/4, etc.) and time feels (straight, swung, shuffle, etc.).

-- ALL QUARTER NOTES (4/4) 
    --[[1]] { "C4", t = "1/4" }, 
    --[[2]] { "C4", t = "1/4" }, 
    --[[3]] { "C4", t = "1/4" }, 
    --[[4]] { "C4", t = "1/4" }, 

-- ALL EIGHTH NOTES (4/4) 
    --[[1]] { "C4", t = "1/8" }, 
    --[[&]] { "C4", t = "1/8" }, 

    --[[2]] { "C4", t = "1/8" }, 
    --[[&]] { "C4", t = "1/8" }, 

    --[[3]] { "C4", t = "1/8" }, 
    --[[&]] { "C4", t = "1/8" }, 

    --[[4]] { "C4", t = "1/8" }, 
    --[[&]] { "C4", t = "1/8" }, 

-- ALL SIXTEENTH NOTES (4/4) 
    --[[1]] { "C4", t = "1/16" }, 
    --[[e]] { "C4", t = "1/16" }, 
    --[[&]] { "C4", t = "1/16" }, 
    --[[a]] { "C4", t = "1/16" }, 

    --[[2]] { "C4", t = "1/16" },
    --[[a]] { "C4", t = "1/16" },
    --[[&]] { "C4", t = "1/16" },
    --[[a]] { "C4", t = "1/16" },

    --[[3]] { "C4", t = "1/16" },
    --[[a]] { "C4", t = "1/16" },
    --[[&]] { "C4", t = "1/16" },
    --[[a]] { "C4", t = "1/16" },

    --[[4]] { "C4", t = "1/16" },
    --[[a]] { "C4", t = "1/16" },
    --[[&]] { "C4", t = "1/16" },
    --[[a]] { "C4", t = "1/16" },

}

return data