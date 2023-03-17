local MOD_ENV = env
local _G = GLOBAL
_G.setfenv(1, _G) 

local prettyname = "[009] Shell Bell Music:"
print(prettyname.." Begin compiling all songs!")

mysongs = {}    -- instead of a million insividual global variables, index this new global table instead
local TimeVal = MOD_ENV.require("functions/to_timeval")
local songlist = MOD_ENV.require("songlist")
for i, data in pairs(songlist) do
    local transpose = data.transpose or 0 -- data.transpose can actually just be omitted if you don't need it.
    _G.mysongs[data.title] = TimeVal(data.title, data.notes, transpose) 
    -- immediately create a key the global table mysongs for your newly converted song 
end 

print(prettyname.." Done compiling all songs.")

--[[

FORMAT:
    c_shellsfromtable(mysongs.yoursongname, startpos, placementfn, spacing_mult)

EXAMPLE:
    local here = Coords(90, 0, -300)
    local dir = NW
    local mult = 5
    c_shellsfromtable(mysongs.whiplash_melody, here, dir, mult)
]]

if TheNet and ((TheNet:GetIsServer() and TheNet:GetServerIsDedicated()) or
(TheNet:GetIsClient() and not TheNet:GetIsServerAdmin())) then
    print(prettyname.." You do not have admin permissions on this server. Returning.")
    return
end

-- STARTPOS FUNCTIONS

function PlayerPos(num) 
    local player = AllPlayers[num] or ThePlayer
    local coords = {}
    coords.x, coords.y, coords.z = player.Transform:GetWorldPosition()
    return coords
end

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

-- PLACEMENTFN DIRECTION FUNCTIONS

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

local function GetShard()
    local shard = "this shard"
    if TheWorld:HasTag("forest") then
        shard = "Surface"
    elseif TheWorld:HasTag("caves") then
        shard = "Caves"
    elseif TheWorld:HasTag("island") then
        shard = "Shipwrecked"
    elseif TheWorld:HasTag("volcano") then
        shard = "Volcano"
    end
    return shard
end

local function GetShells(radius, remove)
    local ents = {}
    local range = ""

    if radius == nil then
        range = GetShard()
        ents = Ents
    else
        assert(type(radius) == "number", "Please input a NUMBER value!")
        range = "a "..radius.." unit radius"

        local x,y,z = ThePlayer.Transform:GetWorldPosition()
        ents = TheSim:FindEntities(x,y,z, radius)
    end

    local count = 0
    local shell = "singingshell_octave"
    for k,v in pairs(ents) do
        if (v.prefab == shell.."3") or (v.prefab == shell.."4") or (v.prefab == shell.."5") then
            if remove == true then
                v:Remove()
            end
            count = count + 1
        end
    end

    local msg = string.format("We have [%d] shell bells in %s.", count, range)

    if remove == true then
        msg = string.gsub(msg, "have", "removed")
    end

    print(msg)
    return
end

function ShellsRemove(radius)     -- this command is very robust. be careful with how you use it!        
    GetShells(radius, true)     -- 2nd argument must be a boolean, see GetShells declaration above.
end

function ShellsCount(radius)
    GetShells(radius)
end


-- FOR MY TESTING WORLD ONLY, COMMENT OUT ON PUBLICATION

HomeTime = function()
    c_gonext("sewing_mannequin")
    return
end

PlayFootstep = function()
end
