# dst-shellbells
A way to somewhat make writing shell bell songs in Don't Starve Together (DST) a little bit more bearable.

## tl;dr, just get to the point you nerd

To install this mod, simply subscribe to it on the Steam Workshop (https://steamcommunity.com/sharedfiles/filedetails/?id=2949592573) or download it from here by clicking the green "Code" button and clicking "Download ZIP". If you download it from here, place and extract the ZIP file within your DST mods folder. For Windows 10, which is what I use, locally saved mods should be placed in `C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\mods\`.

Under `scripts/songs/My Songs/` (or any folder/subfolders of your choosing really, just make sure they begin at `scripts/songs/`) create a new Lua file with something along these lines:

```Lua
local data = {}
data.title = "examplesong"
data.transpose = 0 -- may be omitted
data.notes = {
-- 1ST MEASURE
	--[[1]] { "D3", t = "1/8" },
	--[[&]] { "E3", t = "1/8" },

	--[[2]] { "F3", t = "1/8" },
	--[[&]] { "G3", t = "1/8" }, 

	--[[3]] { "E3", t = "1/4" }, 
	--[[&]] 

	--[[4]] { "C3", t = "1/8" }, 
	--[[&]] { "D3", t = "1/8" }, 
}
return data
```
> `data.title` is the variable name you want to call on later. 
> 
> `data.transpose` is how many semitones you want to tranpose all notes by. You can set it to 0 or omit it.
> 
> `data.notes` is a table containing many subtables, each of these subtables contains your pitch information and rhythm duration information.

That's the basic formula for making a songfile. As long as you understand that you're creating Lua tables, and you have an idea of how your song goes, everything (in theory) will be fine. Rinse and repeat this process for however long your song is, or for however many parts/voices you want to include.

Not shown in the above example are the capabilities to make rests, ties, simultaneous voices/chords and placement functions. Please see the this respository's respective Wiki pages.

### Pitch Information

The left value of each individual note table is a string, written as the Letter Name + Octave Number. For example:
```Lua
data.notes = {
	{ "C4", t = "1/4"},
}
```
In general Shell Bells are limited to the range of pitches `"C3"` up to `"B5"`. Accidentals are supported.

Sharps can be writen like `"F#3"`. Flats can be written like `"Bb4"`. 

`"E#"`, `"Fb"`, `"B#"` and `"Cb"` are also allowed. `Bbb4`, `F##5` and such are all valid as well.

### Rhythmic Durations

The right value of each individual note table is a string attached to key `t`, written as the fraction representation of the note.

`t = "4/4"` represents a whole note. 

`t = "1/4"` represents a quarter note. 

`t = "1/8"` represents an eighth note, and so on. 

This system goes from `t = "4/4"` down to `t = "1/64"`.

You can add an asterisk `*` to create dotted notes, like `t = "1/4*"`. 

You can also add 2 asterisks `**`, like `t = "4/4"**`.

Tuplets can be wrriten by prefixing the tuplet number in square brackets at the start of the string. 

`t = "[3]1/4"` is a triplet quarter note, 

`t = "[5]1/8"` is a septuplet eighth note. 

`t = "[6]1/16"` is a sextuplet sixteenth note.

This system goes from Triplets `"[3]"` up to Nonuplets `"[9]"`.

### Declaring Your Song File

When you're done with making your song, go to `scripts/songlist.Lua` and declare your filename under the correct `directory` key. 

```Lua
local directory = {}

directory["My Songs"] = {
	"mysongfilename",
}
```
> In general I'd recommend you to store your own songfiles under the `scripts/songs/My Songs` folder. However, if you choose to use a different folder or use a subfolder within another folder, then be sure to declare the correct folder path first.
>
> DST's code typically uses forward `/` slashes for filepaths because the back `\` slash is an escape character in Lua. 
> 
> If you have a new folder like `scripts/songs/My Songs/Rock/` for example, then create a new table `dir["My Songs/Rock"]`. The ending slash is optional as my code can adapt to if it's present or not.
> 
> My code assumes your folder's path begins at `songs/`, so please put all your folders and files there!
> 
> `scripts/` is not specified in the folder's path as I loop through the declared folder paths and call the `require` function. In DST, `require` always begins its search in the `scripts` folder. 

After declaring your song, assuming everything went well, you can now call your songs by indexing the global table `MYSONGS` using the `data.title` string as the key. For example, `MYSONGS.examplesong`. 

I would recommend against using spaces and special characters for your song's title, but as long as `data.title`  returns a literal string it should be fine. For example if i set `data.title = "Example Song!!!"` then I would have to index this file by using square brackets `[]` instead of the period `.`, like `MYSONGS["Example Song!!!"]`.

## Actually spawning your song ingame

Use the `c_shellsfromtable(song, startpos, placementfn, spacing_mult)` command.

> `startpos` can be set to one of the functions within the Global `STARTPOS` table. Try `STARTPOS.PLAYER(num)` or `STARTPOS.COORDS(x,y,z)` or a custom function you can write in the console. It can also just be omitted/explicitly set to `nil` and will default to your cursor's position.
> 
> `placementfn` can be set to compass directions. I've included a Global tabled called `PLACEMENT_FN`. You can index it like `PLACEMENT_FN.N`, `PLACEMENT_FN.NE`, `PLACEMENT_FN.SOUTH`, `PLACEMENT_FN.NORTHWEST` and so on, to spawn your song in these specific directions. It can also be omitted/explicitly set to `nil` and will default to North West.
> 
> `spacing_mult` can be set to a number, or omitted. It's likely your song's notes will be very close in distance to each other. You can set this parameter like `c_shellsfromtable(MYSONGS.goodday_piano, nil, nil, 4)`. It will increase the distance for all your song's notes. 

Especially for spawning multiple song files at the same time, I recommend setting a local variable for each parameter that isn't `song`. Like:

```Lua
local here = STARTPOS.COORDS(90, 0, -300)
local dir = PLACEMENT_FN.NORTHWEST
local mult = 6
c_shellsfromtable(MYSONGS.whiplash_melody, here, dir, mult)
local old = here.z
here.z = old - 1
c_shellsfromtable(MYSONGS.whiplash_bass, here, dir, mult)
here.z = old + 1
c_shellsfromtable(MYSONGS.whiplash_comp, here, dir ,mult)
```

# Quick Reference

The following are tables you can index ingame, provided the mod is enabled.

## `MYSONGS`

```Lua
MYSONGS - { template, jazzlick, ... }
```

This table contains all your compiled song files. The keys are the values stored in each `data.title` field.

## `STARTPOS`

```Lua
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
```

This table contains functions that return a table of `x, y, z` coordinates. To use these functions, *invoke* or *call* them directly.

You can call `STARTPOS.PLAYER()` as is, without an input, and it will default to you. Input `num` must refer to a valid player number at the time the command is called. If the player number is invalid (that is, `nil`), then it will return your position instead. This is because of the `or` operator.

`STARTPOS.COORDS(x, y, z)` requires those 3 inputs that represent their respective coordinates. In general, you can simply set `y` to 0 or `nil` as DST does not make much use of evelvation.

## `PLACEMENT_FN`

```Lua
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
PLACEMENT_FN = {
    N = MakeDirFn(-mult, mult),     NE = MakeDirFn(nil, -mult),
    E = MakeDirFn(-mult, -mult),    SE = MakeDirFn(mult, nil),
    S = MakeDirFn(mult, -mult),     SW = MakeDirFn(nil, mult),
    W = MakeDirFn(mult, mult),      NW = MakeDirFn(-mult, nil),
}

-- Extra keys in case you'd like

PLACEMENT_FN.NORTH = PLACEMENT_FN.N
PLACEMENT_FN.EAST = PLACEMENT_FN.E
PLACEMENT_FN.SOUTH = PLACEMENT_FN.S
PLACEMENT_FN.WEST = PLACEMENT_FN.W

PLACEMENT_FN.NORTHEAST = PLACEMENT_FN.NE
PLACEMENT_FN.SOUTHEAST = PLACEMENT_FN.SE
PLACEMENT_FN.SOUTHWEST = PLACEMENT_FN.SW
PLACEMENT_FN.NORTHWEST = PLACEMENT_FN.NW
```

This table contains functions that set the direction in which your song is spawned. The default is North West (`PLACEMENT_FN.NW` or `PLACEMENT_FN.NORTHWEST`)

Unlike the `STARTPOS` functions, you should not invoke or call them directly. Rather, pass the function as a variable.

That should be everything in a nutshell. If you didn't fully understand something, please read this repository's Wiki.
