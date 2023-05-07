local MOD_ENV = env
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

local prettyname = "Shell Bell Music:"
print(prettyname.." Begin compiling all songs!")

mysongs = {}    -- Instead of a million individual global variables, index this new global table instead
---@type TimeVal function
local TimeVal = MOD_ENV.require("functions/to_timeval")
---@type songlist table
local songlist = MOD_ENV.require("songlist")

---@param i integer
---@param data table
for i, data in pairs(songlist) do
    _G.mysongs[data.title] = TimeVal(data.title, data.notes, data.transpose) 
    -- immediately create a key the global table mysongs for your newly converted song 
end 

print(prettyname.." Done compiling all songs.")

--[[
FORMAT:
    c_shellsfromtable(mysongs.yoursongname, startpos, placementfn, spacing_mult)
EXAMPLE:
    local here = Coords(90, 0, -300)
    local dir = DIRECTION_FN.NW
    local mult = 5
    c_shellsfromtable(mysongs.whiplash_melody, here, dir, mult)
]]

if TheNet and not TheNet:GetIsServerAdmin() then
    print(prettyname.." You do not have admin permissions on this server. Returning.")
    return
end

-- STARTPOS FUNCTIONS

---@param num integer
---@return table coords
function PlayerPos(num) 
    local player = AllPlayers[num] or ThePlayer
    local coords = {}
    coords.x, coords.y, coords.z = player.Transform:GetWorldPosition()
    return coords
end

---@param x integer
---@param y integer
---@param z integer
---@return table|nil coords
function Coords(x,y,z) -- quickly create a table of coordinates with x y z as the keys!
    local coords = {}
    y = y or 0
    if (x == nil or z == nil) then 
        return nil 
    else
        coords.x, coords.y, coords.z = x,y,z 
        return coords
    end
end

-- Placement Fns
DIRECTION_FN = 
{
    N = function(pos, mult)
        return Vector3(pos.x - 1 * mult, 0, pos.z + 1 * mult)
    end,

    NE = function(pos, mult) 
        return Vector3(pos.x, 0, pos.z - 1 * mult)
    end,

    W = function(pos, mult)
        return Vector3(pos.x + 1 * mult, 0, pos.z + 1 * mult)
    end,

    NW = function(pos, mult) 
        return Vector3(pos.x - 1 * mult, 0, pos.z)
    end,

    E = function(pos, mult)
        return Vector3(pos.x - 1 * mult, 0, pos.z - 1 * mult )
    end,

    SW = function(pos, mult) 
        return Vector3(pos.x, 0, pos.z + 1 * mult)
    end,

    S = function(pos, mult)
        return Vector3(pos.x + 1 * mult, 0, pos.z - 1 * mult)
    end,

    SE = function(pos, mult) 
        return Vector3(pos.x + 1 * mult, 0, pos.z)
    end,

    -- Extra Keys, juuuust in case you want to use em

    NORTH = N,
    NORTHEAST = NE,

    WEST = W,
    NORTHWEST = NW,

    EAST = E,
    SOUTHWEST = SW,

    SOUTH = S,
    SOUTHEAST = SE,
}

-- EASE OF USE FUNCTIONS 

---@return string shard
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

local invalid = prettyname.." Radius input '%s'"
local success = prettyname.." %s - We found '%d' shell bells"
---@param entity table
---@param count integer
---@param remove boolean|nil
---@return integer count
local function IndivShellCount(entity, count, remove)
    if remove then -- if remove == nil or remove == false, then ignore
        entity:Remove()
    end
    return count + 1
end

local shell = "singingshell_octave"
---@param entity table
---@param count integer
---@param remove boolean|nil
---@return integer
local function CheckIsShell(entity, count, remove)
    if (entity.prefab == shell.."3") or (entity.prefab == shell.."4") or (entity.prefab == shell.."5") then
        return IndivShellCount(entity, count, remove)
    end
    -- If not a shell, then just return the original count
    return count
end

---@param ents table
---@param remove boolean|nil
---@return integer
local function GetShellCount(ents, remove)
    local count = 0
    for _, v in pairs(ents) do
        count = CheckIsShell(v, count, remove)
    end
    return count
end

-- Returns 2 values: entities table and range number in radius units
---@param radius integer|nil
---@return table|nil, integer|nil
local function GetEnts(radius)
    local range
    if radius == nil then
        -- Return the Global Ents table with a nil range value
        return Ents, nil
    end

    if not (type(radius) == "number") then
        radius = tostring(radius)
        print(string.format(invalid.." is not a number value!", radius))
        -- Invalid radius input, so return both nil to return the error 
        return nil, nil
    end
    
    local x,y,z = ThePlayer.Transform:GetWorldPosition()

    local ents = TheSim:FindEntities(x,y,z, radius)
    range = string.format("in a '%d' unit radius", radius)
    -- Radius is valid, so get the entities in the given radius around the player
    -- Return local entities table and range number
    return ents, range
end

---@param radius integer|nil
---@param remove boolean|nil
local function GetShells(radius, remove)
    local ents, range = GetEnts(radius)
    if ents == nil then
        return 
    end

    local shard = GetShard()
    local count = GetShellCount(ents, remove)

    local msg = ""
    if range == nil then
        msg = string.format(success..".", shard, count)
    else
        msg = string.format(success.." %s.", shard, count, range)
    end

    if remove then
        msg = string.gsub(msg, "found", "removed")
    end

    print(msg)
end

---@param radius integer|nil
function ShellsRemove(radius)     -- this command is very robust. be careful with how you use it!        
    GetShells(radius, true)     -- 2nd argument must be a boolean, see GetShells declaration above.
end

---@param radius integer|nil
function ShellsCount(radius)
    GetShells(radius)
end