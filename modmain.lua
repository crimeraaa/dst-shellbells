_G = GLOBAL
_G.setfenv(1, _G)

-- For quicker compiler testing only
--[[ local function SetPackagePath(path)
    local steamapps = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\"
    local dst_mods = steamapps.."Don't Starve Together\\mods\\"
    package.path = dst_mods..path
    return dst_mods..path
end
SetPackagePath("dst-009_ShellBells\\scripts\\?.lua") ]]

local MOD_PRETTYNAME = "[Shell Bell Music]: "
local stringf = string.format
local function printf(fmt, ...)
    print(MOD_PRETTYNAME.. stringf(fmt, ...))
end

printf("Begin compiling all songs!")

-- Index this new global tables to access your songs
MYSONGS = {} 
local TimeVal = require("functions/to_timeval")
local songlist = require("songlist")

for i, data in pairs(songlist) do
    MYSONGS[data.title] = TimeVal(data.title, data.notes, data.transpose) 
    --[[ immediately create a key the global table MYSONGS 
    index your newly converted song from there ]]
end 

printf("Done compiling all songs.")

--[[
FORMAT:
    c_shellsfromtable(MYSONGS.songname, startpos, placementfn, spacing_mult)
EXAMPLE:
    local here = Coords(90, 0, -300)
    local dir = DIRECTION_FN.NW
    local mult = 5
    c_shellsfromtable(MYSONGS.whiplash_melody, here, dir, mult)
]]

--[[ if TheNet and not TheNet:GetIsServerAdmin() then
    printf("You do not have admin permissions on this server. Returning.")
    return
end ]]

-- STARTPOS FUNCTIONS

function PlayerPos(num) 
    local player = AllPlayers[num] or ThePlayer
    local coords = {}
    coords.x, coords.y, coords.z = player.Transform:GetWorldPosition()
    return coords
end

-- Quickly create a table of coordinates with x y z as the keys!
function Coords(x,y,z) 
    local coords = {}
    y = y or 0
    if (x == nil or z == nil) then 
        return nil 
    else
        coords.x, coords.y, coords.z = x, y, z 
        return coords
    end
end

-- Placement Fns

local function MakeDirFn(x_mult, z_mult)
    local ret_fn = function(pos, mult)
        return Vector3(
            pos.x + (mult * (x_mult or 0)), 
            0,
            pos.z + (mult * (z_mult or 0))
        )
    end
    return ret_fn
end

local mult = 1

local N = MakeDirFn(-mult, mult)
local NE = MakeDirFn(nil, -mult)
local E = MakeDirFn(-mult, -mult)
local SE = MakeDirFn(mult, nil)

local S = MakeDirFn(mult, -mult)
local SW = MakeDirFn(nil, mult)
local W = MakeDirFn(mult, mult)
local NW = MakeDirFn(-mult, nil)

DIRECTION_FN = 
{
    N = N,          NE = NE, 
    E = E,          SE = SE,
    S = S,          SW = SW, 
    W = W,          NW = NW,

    -- Extra Keys, juuuust in case you want to use em

    NORTH = N,      NORTHEAST = NE, 
    EAST = E,       SOUTHEAST = SE, 
    SOUTH = S,      SOUTHWEST = SW, 
    WEST = W,       NORTHWEST = NW,
}

-- EASE OF USE FUNCTIONS 

local function GetShard()
    local shard = "this shard"
    if TheWorld:HasTag("forest") then
        shard = "Surface"
    elseif TheWorld:HasTag("cave") then
        shard = "Caves"
    elseif TheWorld:HasTag("island") then
        shard = "Shipwrecked"
    elseif TheWorld:HasTag("volcano") then
        shard = "Volcano"
    end
    return string.upper(shard)
end

local invalid = "Radius input '%s'"
local success = "%s - We found '%d' shell bells"
local function IndivShellCount(entity, count, remove)
    if remove then -- if remove == nil or remove == false, then ignore
        entity:Remove()
    end
    return count + 1
end

local shell = "singingshell_octave"
local function CheckIsShell(entity, count, remove)
    if entity.prefab == shell.."3" 
    or entity.prefab == shell.."4" 
    or entity.prefab == shell.."5" then
        return IndivShellCount(entity, count, remove)
    end
    -- If not a shell, then just return the original count
    return count
end

local function GetShellCount(ents, remove)
    local count = 0
    for _, v in pairs(ents) do
        count = CheckIsShell(v, count, remove)
    end
    return count
end

-- Returns 2 values: entities table and range number in radius units
local function GetEnts(radius)
    local range
    if radius == nil then
        -- Return the Global Ents table with a nil range value
        return Ents, nil
    end

    if type(radius) ~= "number" then
        radius = tostring(radius)
        printf(stringf(invalid.." is not a number value!", radius))
        -- Invalid radius input, so return both nil to return the error 
        return nil, nil
    end
    
    local x,y,z = ThePlayer.Transform:GetWorldPosition()

    local ents = TheSim:FindEntities(x,y,z, radius)
    range = stringf("in a '%d' unit radius", radius)
    -- Radius is valid, so get entities in the given radius around the player
    -- Return local entities table and range number
    return ents, range
end

local function GetShells(radius, remove)
    -- GetEnts returns 2 values: a table (ents) and a string (range)
    local ents, range = GetEnts(radius)
    if ents == nil then
        return 
    end

    local shard = GetShard()
    local count = GetShellCount(ents, remove)

    local msg = ""
    if range == nil then
        msg = stringf(success..".", shard, count)
    else
        msg = stringf(success.." %s.", shard, count, range)
    end

    if remove then
        msg = string.gsub(msg, "found", "removed")
    end

    printf(msg)
end

function ShellsRemove(radius)     -- this command is very robust. be careful with how you use it!        
    GetShells(radius, true)     -- 2nd argument must be a boolean, see GetShells declaration above.
end

function ShellsCount(radius)
    GetShells(radius)
end