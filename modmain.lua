_G = GLOBAL
_G.setfenv(1, _G)

-- For quicker compiler testing only
--[[ local steamapps = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\"
local dst_mods = steamapps.."Don't Starve Together\\mods\\"
package.path = dst_mods.."dst-015_ShellBellsRework\\scripts\\?.lua" ]]

local MOD_PRETTYNAME = "[Shell Bell Music]: %s"
local stringf = string.format
local function printf(fmt, ...)
    local msg = stringf(fmt, ...)
    print(stringf(MOD_PRETTYNAME, msg))
end

-- Avoid running everything, don't want to compile all songs at the start menu
if TheNet and not TheNet:GetIsServerAdmin() then
    printf("You do not have admin permissions on this server. Returning.")
    return
end 

-- Index this new global tables to access your songs
MYSONGS = {} 
local TimeVal = require("functions/to_timeval")
local songlist = require("songlist")

for i, data in pairs(songlist) do
    MYSONGS[data.title] = TimeVal(data.title, data.notes, data.transpose) 
    --[[ immediately create a key the global table MYSONGS 
    index your newly converted song from there ]]
end 

-- Startpos Stuff
STARTPOS = {}
STARTPOS.PLAYER = function(num) 
    local player = AllPlayers[num] or ThePlayer
    local coords = {}
    coords.x, coords.y, coords.z = player.Transform:GetWorldPosition()
    return coords
end

-- Quickly create a table of coordinates with x y z as the keys!
STARTPOS.COORDS = function(x, y, z) 
    local coords = {}
    y = y or 0
    if x == nil or z == nil then 
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
local directional_fns = {
    N = MakeDirFn(-mult, mult),
    NE = MakeDirFn(nil, -mult),
    E = MakeDirFn(-mult, -mult),
    SE = MakeDirFn(mult, nil),
    S = MakeDirFn(mult, -mult),
    SW = MakeDirFn(nil, mult),
    W = MakeDirFn(mult, mult),
    NW = MakeDirFn(-mult, nil),
}

directional_fns.__index = directional_fns

local dir_list = {
    NORTH = "N",        NORTHEAST = "NE",
    EAST = "E",         SOUTHEAST = "SE",
    SOUTH = "S",        SOUTHWEST = "SW",
    WEST = "W",         NORTHWEST = "NW",
}

for k, v in pairs(dir_list) do
    directional_fns[k] = directional_fns[v]
end

PLACEMENT_FN = {}
setmetatable(PLACEMENT_FN, directional_fns)

-- Ease of use Fns

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

local shell = "singingshell_octave"
local function GetShellCount(ents, remove)
    local count = 0
    for _, entity in pairs(ents) do
        if entity.prefab == shell.."3" or entity.prefab == shell.."4" 
        or entity.prefab == shell.."5" then
            if remove then entity:Remove() end
            count = count + 1
        end
    end
    return count
end

-- Given integer `radius`, returns 2 values: `ents` table and `range` string
local invalid = "Radius input '%s'"
local function GetEnts(radius)
    local range
    if radius == nil then
        -- Return the Global Ents table with a nil range value
        return Ents, nil
    end

    if type(radius) ~= "number" then
        radius = tostring(radius)
        printf(invalid.." is not a number value!", radius)
        -- Invalid radius input, so return both nil to return the error 
        return nil, nil
    end
    
    local x,y,z = ThePlayer.Transform:GetWorldPosition()

    local ents = TheSim:FindEntities(x,y,z, radius)
    range = stringf("in a '%d' unit radius", radius)
    --[[ Radius is valid, so get entities in the given radius around the player
    Return local entities table and range number ]]
    return ents, range
end

local success = "%s - We found '%d' shell bells"
local function GetShells(radius, remove)
    local ents, range = GetEnts(radius)
    if ents == nil then
        return 
    end

    local shard = GetShard()
    local count = GetShellCount(ents, remove)

    local msg
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

-- this command is very robust. be careful with how you use it!        
function ShellsRemove(radius)
    -- 2nd argument must be a boolean, see GetShells declaration above. 
    GetShells(radius, true)
end

function ShellsCount(radius)
    GetShells(radius)
end

-- Garbage
MakeDirFn = nil
mult = nil
directional_fns = nil
dir_list = nil

-- Set up for garbage collection, you can't poke at these upvalues anyway
TimeVal = nil
songlist = nil

