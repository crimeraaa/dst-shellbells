local data = {}
data.title = "jazzlick"
data.transpose = 0
data.notes =
{
-- "The Lick" as played by countless jazz musicians throughout the world.
-- 1ST (and only!) MEASURE 
    -- distance = 0
    --[[1]] { "C4", t = "1/8" }, -- dist = 0,   prev = nil, dist = dist + 0.5 
    --[[&]] { "D4", t = "1/8" }, -- dist = dist, prev = 0.5, dist = dist + 0.5

    --[[2]] { "Eb4",t = "1/8" }, -- dist = 1.0, prev = 0.5
    --[[&]] { "F4", t = "1/8" }, -- dist = 1.5, prev = 0.5

    --[[3]] { "D4", t = "1/4" }, -- dist = 2.0, prev = 0.5
    --[[&]] 

    --[[4]] { "Bb3",t = "1/8" }, -- dist = 3.0, prev = 1.0
    --[[&]] { "C4", t = "1/8" }, -- dist = 3.5, prev = 1.5
}

return data