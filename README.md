# dst-shellbells
A way to somewhat make writing shell bell songs in Don't Starve Together (DST) a little bit more bearable.

## tl;dr, just get to the point you nerd

To install this mod, simply subscribe to it on the Steam Workshop (not yet uploaded) or download it from here by clicking the green "Code" button and clicking "Download ZIP". If you download it from here, place and extract the ZIP file within your DST mods folder. For Windows 10, which is what I use, locally saved mods should be placed in `C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Together\mods`.

Under `scripts/songs/My Songs/` (or any folder/subfolders of your choosing really, just make sure they begin at `scripts/songs/`) create a new LUA file with something along these lines:

```LUA
local data = {}
data.title = "examplesong"
data.transpose = 0 -- may be omitted
data.notes =
{
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
> `data.transpose` is how many semitones you want to tranpose all notes by. 
> 
> `data.notes` is a table containing many subtables, each of these subtables contains your pitch information and rhythm duration information.

That's the basic formula for making a songfile. As long as you understand that you're creating LUA tables, and you have an idea of how your song goes, everything (in theory) will be fine. Rinse and repeat this process for however long your song is, or for however many parts/voices you want to include.

Not shown in the above example are the capabilities to make rests, ties, simultaneous voices/chords and placement functions. Please see the respective sections for these parts. (Ctrl + F will be your best friend!)

When you're done with making your song, go to `scripts/songlist.lua` and declare your filename under the correct `dir` key. 

```LUA
local songlist = {}
local directory = {}
local dir = directory

dir["My Songs"] =
{
	"mysongfilename",
}
```
> In general I'd recommend you to store your own songfiles under the `scripts/songs/My Songs` folder. However, if you choose to use a different folder or use a subfolder within another folder, then be sure to declare the correct folder path first.
>
> DST's code typically uses forward `/` slashes for filepaths because the back `\` slash is an escape character in LUA. 
> 
> If you have a new folder like `scripts/songs/My Songs/Rock/` for example, then create a new table `dir["My Songs/Rock"]`. The ending slash is optional as my code can adapt to if it's present or not.
> 
> My code assumes your folder's path begins at `songs/`, so please put all your folders and files there!
> 
> `scripts/` is not specified in the folder's path as I loop through the declared folder paths and call the `require` function. In DST, `require` always begins its search in the `scripts` folder. 

After declaring your song, assuming everything went well, you can now call your songs by indexing the global table `mysongs` using the `data.title` string as the key. For example, `mysongs.examplesong`. 

I would recommend against using spaces and special characters for your song's title, but as long as `data.title`  returns a literal string it should be fine. For example if i set `data.title = "Example Song!!!"` then I would have to index this file by using square brackets `[]` instead of the period `.`, like `mysongs["Example Song!!!"]`.

## Actually spawning your song ingame

Use the `c_shellsfromtable(song, startpos, placementfn, spacing_mult)` command.

> `startpos` can be set to either `PlayerPos(num)` or `Coords(x,y,z)`. It can also just be omitted/set to `nil`
> 
> `placementfn` can be set to compass directions, such as N, NE, S, SW, and so on. It can also be omitted/set to `nil`.
> 
> `spacing_mult` can be set to a number, or omitted. It's likely your song's notes will be very close in distance to each other. You can set this parameter like `c_shellsfromtable(mysongs.goodday_piano, nil, nil, 4)`. It will increase the distance for all your song's notes. 

Especially for spawning multiple song files at the same time, I recommend setting a local variable for each parameter that isn't `song`. Like:

```LUA
local here = Coords(90, 0, -300)
local dir = NW
local mult = 6
c_shellsfromtable(mysongs.whiplash_melody, here, dir, mult)
here.z = -299
c_shellsfromtable(mysongs.whiplash_bass, here, dir, mult)
here.z = -301
c_shellsfromtable(mysongs.whiplash_comp, here, dir ,mult)
```
That should be everything in a nutshell. If you didn't fully understand something, please read this repository's Wiki.
