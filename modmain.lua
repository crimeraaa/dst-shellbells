local MOD_ENV = env
local _G = GLOBAL
_G.setfenv(1, _G) 

local prettyname = "[009] Shell Bell Music:"
print(prettyname.." Begin compiling all songs!")

mysongs = {}
local TimeVal = MOD_ENV.require("functions/to_timeval")
local songlist = MOD_ENV.require("songlist")
for i, data in pairs(songlist) do
    local transpose = data.transpose or 0 
    _G.mysongs[data.title] = TimeVal(data.title, data.notes, transpose) 
    -- immediately create a key the global table mysongs for your newly converted song 
end 

print(prettyname.." Done compiling all songs.")

--[[

TO SPAWN IN YOUR SONG:
    c_shellsfromtable(mysongs.yoursongname, startpos, placementfn, spacing_mult)
        -- when calling your song variable, always start with "mysongs." (including the dot!)
        -- "yoursongname" is the data.title you declared in the songfile itself.
        -- startpos and placementfn can be set to nil, it will spawn the song at your cursor.
        -- spacing mult will multiply all the shells' distances. 

    For example:  
    c_shellsfromtable(mysongs.goodday_vox, nil, nil, 4.0)
        -- simply typing c_shellsfromtable(goodday_vox) will only use the distances defined there, which is *very* short.

    Using the functions I've included below, you can have something like the below code.
    (use Console++ or similar mods to allow multiple lines!):

    local here = Coords(90, 0, -326)
    c_shellsfromtable(mysongs.whiplash_bass, here, NW, 4)
    here.z = -325
    c_shellsfromtable(mysongs.whiplash_melody, here, NW, 4)
    here.z = -327
    c_shellsfromtable(mysongs.whiplash_comp, here, NW, 4)

    Or how about this?

    local here = PlayerPos()
    c_shellsfromtable(mysongs.blackbird_gtr1, here, SE, 6)
    c_shellsfromtable(mysongs.blackbird_gtr2, here, SE, 6)
    here.z = here.z - 2
    c_shellsfromtable(mysongs.blackbird_vox, here, SE, 6)

]]

-- EASE OF USE FUNCTIONS FROM HERE ON (ADMIN PERMISSIONS ONLY)

if TheNet and ((TheNet:GetIsServer() and TheNet:GetServerIsDedicated()) or
(TheNet:GetIsClient() and not TheNet:GetIsServerAdmin())) then
    print(prettyname.."You do not have admin permissions on this server. Returning.")
    return
end

-- STARTPOS FUNCTIONS
-- You can call the below functions for the startpos paramater.
function PlayerPos(player_num) -- if no input for player_num, it will default to you.
    local player = AllPlayers[player_num] or ThePlayer
    local coords = {}
    coords.x, coords.y, coords.z = player.Transform:GetWorldPosition()
    return coords
end

function Coords(x,y,z) -- quickly create a table of coordinates with x y z as the keys!
    local coords = {}
    y = y or 0
    if (x == nil or z == nil) then -- if no input for x or z, 
        return nil  -- startpos will default to the coordinates under your cursor.
    else
        coords.x, coords.y, coords.z = x,y,z 
        return coords
    end
end

-- PLACEMENTFN DIRECTION FUNCTIONS

--[[
You can call the below functions as variables for the placementfn parameter.
    by default, you spawn a straight line of shells in the specified compass direction.
        for example:  c_shellsfromtable(goodday, PlayerPosition(), NE, 4.0)
]]

N = function(pos, mult)
    return Vector3(pos.x - 1 * mult, 0, pos.z + 1 * mult)
end

NE = function(pos, mult) 
    return Vector3(pos.x, 0, pos.z - 1 * mult)
end

W = function(pos, mult)
    return Vector3(pos.x + 1 * mult, 0, pos.z + 1 * mult)
end
NW = function(pos, mult) 
    return Vector3(pos.x - 1 * mult, 0, pos.z)
end

E = function(pos, mult)
    return Vector3(pos.x - 1 * mult, 0, pos.z - 1 * mult )
end

SW = function(pos, mult) 
    return Vector3(pos.x, 0, pos.z + 1 * mult)
end

S = function(pos, mult)
    return Vector3(pos.x + 1 * mult, 0, pos.z - 1 * mult)
end

SE = function(pos, mult) 
    return Vector3(pos.x + 1 * mult, 0, pos.z)
end

-- EASE OF USE FUNCTIONS

function ShellsCount(radius)
    local ents = {}
    if radius ~= nil then
        local x,y,z = ThePlayer.Transform:GetWorldPosition()
        ents = TheSim:FindEntities(x,y,z, radius)
    else
        ents = Ents
    end
    local count = 0

    for k,v in pairs(ents) do
        if (v.prefab == "singingshell_octave3") or 
        (v.prefab == "singingshell_octave4") or 
        (v.prefab == "singingshell_octave5") then
            count = count + 1
        end
    end

    if radius ~= nil then
        print(string.format("We have [%d] shell bells in a %d unit radius.", count, radius))
    else
        print(string.format("We have [%d] shell bells from this Shard.", count))
    end
end

function ShellsRemove(radius)     -- this command is very robust. be careful with how you use it!
    local ents = {}
    if radius ~= nil then
        local x,y,z = ThePlayer.Transform:GetWorldPosition()
        ents = TheSim:FindEntities(x,y,z, radius)
    else
        ents = Ents
    end

    local count = 0
    for k,v in pairs(ents) do
        if (v.prefab == "singingshell_octave3") or 
        (v.prefab == "singingshell_octave4") or 
        (v.prefab == "singingshell_octave5") then
            v:Remove()
            count = count + 1
        end
    end

    if radius ~= nil then
        print(string.format("We successfully removed [%d] shell bells in a %d unit radius.", count, radius))
    else
        print(string.format("We successfully removed [%d] shell bells from this Shard.", count))
    end
end

-- FOR MY TESTING WORLD ONLY, COMMENT OUT ON PUBLICATION
HomeTime = function()
    c_gonext("sewing_mannequin")
    return
end

PlayFootstep = function()
end
