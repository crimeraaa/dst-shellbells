# dst-shellbells
A way to somewhat make writing shell bell songs in Don't Starve Together a little bit more bearable.

How the hell does this all even work?

This mod is intended to be used as a way for you to make your own LUA files that contain the song information you want to be turned into a long line of shell bells. 

I'd recommend the following:

1. Having a basic grasp of LUA syntax.
2. A Code Editor.
3. A basic understing of ome basic Western Music Theory concepts. (rhythms, rhythmic syllable counting, scientific pitch notation, time signatures)
 
For the entirety of this mod I will be using the scientific pitch notation system. It uses Letter Names combined with the respective octave of the note, e.g. C4, B3, F#5 and so on. I will also be using the American way of naming note durations such as "whole note", "half note", "quarter note" and so on as that's what I know best. Lastly, I'd encourage



# THE BASICS 

Let's start from the very top. What is this mod even going to be used in? How does the shell bell song file even originally work? There's a console command (defined under, well, the base game's `scripts/consolecommands.lua`) which lets you spawn in shell bell songs. The command goes as follows:

`c_shellsfromtable(song, startpos, placementfn, spacing_multiplier, out_of_range_mode)`

Parameter `song` should be a LUA `table ` of subtables. By default, if you don't input anything for this parameter, it will default to `notetable_dsmaintheme`. That's because of this line for the definition of `c_shellsfromtable`:

    song = song or require("notetable_dsmaintheme")
    
This works thanks to how the `or` evaluation works. Basically, it checks 2 arguments. If the 1st one is `true` (that is, there *is* an input at all that is *not* `nil`) then it will return that one. In this case if you input literally any existing global variable, string, number or whatever under the `song` parameter, then the the 2nd variable `song` (the one being declared *inside of the command, which is technically different from the one you input*) will be set to that value.

However, if the 1st argument is `nil` (either by inputting nothing or flat out typing `nil`), then the evalution to move to the next argument. The second argument is `require("notetable_dsmaintheme"`. This is referring to the file of the same name, `notetable_dsmaintheme.lua` which returns its notes table upon being called with `require`. Because it's an existing input, this argument will always return anything *but* `nil` and thus will pass should this condition be reached, making the dsmaintheme the default song which is called.

The next block of code is important. 

    if song == nil or type(song) ~= "table" then
		print("Error: Invalid 'notes' table")
		return false, "INVALID_NOTES_TABLE"
	end

Basically if variable `song` is set to something, if `song` is set to a nonexistent global variable OR it's a valid global variable that isn't a table, then the command will print the error and stop there. This is important because it establishes two things: 1) Our song file MUST be a LUA table, and 2) Our song file must be accessible within the global environment. DST Mods by default have their own separate environment, so mod global variables in a DST mod can't actually be accessed with the ingame console. This can be averted by explicitly declaring a variable to be GLOBAL within your mod, or setting the mod's environment to GLOBAL.

To explain how my mod works and why I made it, let's see what `notetable_dsmaintheme` is all about!

    local notes =   -- create a table called notes.
    {
        { 44, t=0.048 },    -- subtable. the first value is ALWAYS a number which represents a pitch.
        { 56, t=0.08 },     -- valid pitch values go from number 37-72, which represent pitches C3-B5. just 1 semitone under 3 octaves.
        { 39, t=5.848 },    -- the second value is a "t" value, which represents distance away from the starting position.
        { 63, t=5.808 },    -- treat the "t" value as being in reference to the game's distance units, every multiple of 1 is a wall unit,
        { 44, t=11.528 },   -- and every multiple of 4 is a tile.
        { 56, t=11.592 },
        { 63, t=15.416 },
        { 64, t=16.32 },
        { 63, t=17.256 },
        { 39, t=17.312 },
        { 56, t=23.12 },
        { 44, t=23.152 },
        { 59, t=28.832 },
        { 39, t=28.96 },
        { 56, t=30.768 },
        { 53, t=32.64 },
        { 51, t=34.488 },
        { 55, t=34.544 },
        { 46, t=40.408 },
        { 52, t=42.312 },
        { 51, t=44.24 },
        { 56, t=46.168 },
        { 44, t=46.304 },
        { 59, t=49.992 },
        { 46, t=50.976 },
        { 63, t=51.792 },
        { 47, t=51.8 },
        { 59, t=55.76 },
        { 40, t=57.736 },
        { 64, t=57.744 },
        { 61, t=61.52 },
        { 58, t=63.512 },
        { 37, t=63.536 },
        { 59, t=69.104 },
        { 39, t=69.272 },
        { 58, t=74.928 },
        { 46, t=74.928 },
        { 43, t=78.656 },
        { 59, t=78.688 },
        { 44, t=80.536 },
        { 56, t=80.624 },
    }
    return notes    -- at the very end return the notes table. this is later called with `require("notetable_dsmaintheme)` for the default song parameter.

I added comments to try to explain what's going on, but let me explain it again here if it's note clear. The file starts out by creating a table called `notes`. Under the `notes` table, we have many more tables within its scope. Each of these tables, or as I prefer to call them "note tables", contain two things. 



# Number to Pitch Values

Baritone    =   36-48, or C3-B3
Alto        =   49-60, or C4-B4
Soprano     =   61-72, or C5-B5

The first value each note table has is always a number value, which represents a particular pitch. Technically, pitch C1 is number 1 and pitch B2 is number 36, pitch C6 is number 73. But because no shell bells are ever mapped to these sounds, they should not be used. 



# The "t" values

The second value each note table has a `t = (number)` value. This actually represents distance away from the starting point, which is by default your cursor's position. It's a way to loosely map "time" for lack of better word. There is no standardization here and this file is actually quite confusing to me because I can't see a pattern in the values immediately. But I can tell you this tune is in 3/4 time, in the key of G Minor. If we simply used

To spawn `notetable_dsmaintheme`, simply type `c_shellsfromtable()` as is, in the console.

That's literally it! It will automatically spawn the song at your cursor's position in a straight line going in the North West compass direction.



# My Thoughts

Here is the most basic way I could think of to create your own song files.

1. Create a simple mod, preferably client-only, with a barebones `modinfo.lua`. 
2. Create a `scripts` folder under it. 
3. Create your song file under the `scripts` folder. Let's say your song file is called `mysong.lua`
4. Format your notes table for your song in a similar to `notetable_dsmaintheme.lua`
5. This will involve manually remembering/referencing which pitch numbers represent which pitch values, and a bit of math to determine the distance from the starting point. 
6. When you're finished with your song you can spawn in your song by calling `c_shellsfromtable(require("mysong"))`

Another option is to directly create your song table within the game's console, but unless you have client console mods that allow you to create multiple lines, this will be very tough!

Not only that, but the system of numbers representing pitches and t values as absolute distances made it very difficult to keep track of everything. I cannot stress enough how annoying it is to constantly translate which numbers are which pitches. And although the t values aren't too bad, it requires a bit of mental work to keep track of the absolute distance as well as its place relative to the other notes. Here is an example tune, let's say it's under a mod's `scripts` folder and the file is named `tune.lua`.

    local notes =
    {
        -- D3 E3 F3 G3
        { 39, t = 0.0},
        { 41, t = 0.5}, -- values of 1 are my quarter notes, and values half of that are my eighth notes.
        { 42, t = 1.0},
        { 44, t = 1.5},
        
        -- E3   C3 D3
        { 41, t = 2.0},
        { 37, t = 3.0},
        { 39, t = 3.5},
    }
    return notes
    
This took quite a bit of work for me to write, and it was only 7 notes! At least we have a song now. But for larger projects/songs, using this barebones system (in my opinion at least) would be a nightmare. So I created a whole bunch of stuff to not only help the song files makes musical sense to us, but also to make them easier to write and edit.



# CUSTOM SONG FILES

Finally, this nerd is done explaining some dumb nerd stuff! Let's get to the actual good part! /s

But really I wanted to explain how the original note table was created so we can have an idea of why I'm doing things the way I do. It's also because what my mod is doing is really just taking your song file input and translating that to another table in the previous format which the game can spawn in! This mod is just a way for us to make more immediately readable music that doesn't require us to constantly translate numbers to pitches or the keep track of absolute time ourselves.

Let's start by creating a song file. I've already included a `template.lua` file under the `scripts/songs/My Songs/` folder. You can create a copy of that file. I'd recommend keep the original template around for future use and reference. For your copy, feel free to rename and edit it to whatever you like.



# Creating your song file

Let's say I'm creating a file under the `scripts/songs/My Songs/` folder called `thelick.lua`.

We'll start by declaring a local variable `data` and assigning an empty table to it. Then we'll create "keys" (which are similar to indexes) to represent different information of our song. These should be the first few lines in your songfile:

    local data = {}
    data.title = "thelick"
    data.transpose = 0
    data.notes =
    {
     
    }

What we did here is create an empty table called `data`, and assigned several keys to it. `data.title` should be assigned to a string value which represents, well, the title of your song. This is actually meant to be a *variable* which you can call later on in the ingame console. So for your ease I'd recommend the following:

1. Do not use any special characters like dots (`.`) and hastags (`#`).
2. Use underscores (`_`) instead of spaces.

The reason for the above is because later on, your song file is actually inserted into a global table called `mysongs` with the `data.title` value as the key for your song. You can index that table to reach your song, assuming it compiled properly.

For example, later on I can call this song through `c_shellsfromtable(mysongs.thelick)`. 

If your `data.title` is, say `data.title = "#The Lick!"` then you can't call it through `c_shellsfromtable(mysongs.#The Lick!)` because LUA can't index a string with spaces/special characters like that, it'll result in an error if you do. If you do uses spaces and/or special characters, do this: `c_shellsfromtable(mysongs["#The Lick!])`. 

Both using the dot (`.`) and the square brackets (`[]`) to index the table `mysongs` are valid, but it may be a bit tricky knowing that the dot already assumes the key following it is a string. With the square brackets you have to explicitly put quotation marks (`""`) to tell the code that you're trying to index a key that's a string.



# How do note tables in the custom song files work?
  
In general, under your `data.notes` table, you will be creating note tables within this scope to represent your notes with their associated duration. These are the "note tables". For example here are possible contents of `scripts/songs/My Songs/thelick.lua`

	local data = {}
	data.title = "thelick"
	data.transpose = 0
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

The comments `-- 1ST MEASURE` and all the rhythmic syllables like `--[[1]]` and `--[[&]]` are not needed, but I recommend you put them so you can keep track of your song in terms of measures (or however you like to call them). It helps to divide the workload and if you have an error or something you'd like to change, you can first determine which measure it came from then see which note under that measure you want to access.



# Pitch Values

The left value in each note table is the "PITCH" value. Instead of using good old numbers 37-72, we can use strings! In general all pitches from C3-B5 are accepted. You can actually use numbers and I'm (fiarly) certain it will work fine. But I greatly prefer to strings as they communicate the relevant musical information to me much quicker and I haven't tested it enough, I also recommend *against* using it just because of how unreadable it can be.

Should you use a string, make sure it contains the note's letter name along wwith its respective octave. This is the Scientific Pitch Notation system! I encourage you to read about it so this makes more sense. 

String "C4" will represent middle C, for example. "B3" will represent the B natural right below Middle C.
The octave number change for every new C. 

In general the useable pitch values for shell bells are: 
        
    C3, D3, E3, F3, G3, A3, B3, -- this octave is Low C, an octave below Middle C on the piano.
    C4, D4, E4, F4, G4, A4, B4, -- this octave is Middle C on the piano.
    C5, D5, E5, F5, G5, A5, B5, -- this octave is High C, an octave above Middle C on the piano.
   
You can actually go outside this range, provided that your entire song file **does have a total range of 3 octaves or more**. That's where the `data.transpose` value comes in. It can accept a positive or negative number of semitones which well then be added to each pitch string's associated pitch number value, effectively transposing the whole song file.



# Rhytmic Values

The right value in your note table is still the "t" value, but you can using a string to represent various durations! It contains the note's intended duration in terms of a fraction of a whole note.

The Basic Rhythms are:
    
    t = "4/4" is a whole note, 
    t = "2/4" is a half, 
    t = "1/4" is a quarter, 
    t = "1/8" is an eighth, 
    t = "1/16" is a sixteenth,
    t = "1/32" is a thirty second,
    t = "1/64" is a sixty fourth,

No values shorter that a "1/64" are supported, although I assigned some custom values representing various Time Signatures.
Of note are:
    
    t = "7/4" represents a whole bar in 7/4 time.
    t = "5/4" represents a whole bar in 5/4 time.
    t = "3/4" represents a whole bar in 3/4 time.

    t = "12/8" represents a whole bar in 12/8 time.
    t = "9/8" represents a whole bar in 9/8 time.
    t = "6/8" represents a whole bar in 6/8 time.
    t = "3/8" represents a whole bar in 3/8 time.



# Simplified breakdown of how t values are converted

Your song starts with an assumed distance of 0. (in terms of DST distance units). Every duration string I accounted for represents a specific value which is then added on top of the assumed distance. The assumed distance updates with each and every Note Table.

The very first Note Table is always set to distance 0. Every other Note Table's distance value is determined by this formaula:

(current distance) + (Previous Note Table's duration)


For example:

    { "C4", t = "1/4" }, 
    { "D4", t = "1/8" }, 
    { "E4", t = "1/8" },

Pitch "C4" is at distance 0. 
    There is no Note Table before it, so it is set to 0 to be the start of the song's first measure.

Pitch "D4" is at distance 0.25.
    The previous Note Table (C4) has duration 1/4 or 0.25, and distance right now is 0.
    So our new distance = previous duration 0.25 + distance of 0
    Our new distance for this note is 0.25, meaning:
    Pitch "D4" is a 1/4th duration away from the start.

Pitch "E4" is at distance 0.375.
The previous Note Table ("D4") has duration 1/8 or 0.125, and distance right now is 0.25.
    So our new distance = previous duration 0.125 + distance of 0.25.
    Our new distance for this note is 0.375, meaning:
    Pitch "E4" is a 1/4th + 1/8th duration away from the start.

Technically you don't need to set the t value for the very last note to anything as it's never used,
    but I think it's good practice to keep track of all your notes' rhythms.

You can also add an asterisk (`*`) after the last character in each duration string to represent dotted rhythms. 

For example:

    t = "1/4*" is a dotted quarter, 
    t = "1/8*" is a dotted eighth.
    
and so on.

You can do the same for double dotted notes, just use 2 asterisks instead of 1. Triple dotted notes and above are not supported.

What about triplets and other tuplets? To do so, first enclose the number of the tuplet you'd like in brackets (`[]`) like so:

    t = "[3]1/4" is a triplet quarter note. 
    This is especially useful in approximating music with a swing eighths feel.

Swung 8ths would look like this:

    t = "[3]1/4", this is the downbeat which will last for 2/3 of the triplet.
    t = "[3]1/8", this is the upbeat which will last for 1/3 of the triplet.

Triplets, or (`[3]`), up to Nonuplets (`[9]`) are supported for all the Basic Rhythms.

These next sections involve writing LUA tables. Please follow the examples' formatting carefully.



# Rests and Ties
    
The Basic Rhythms, even with all the Tuplets and Dotteds, still don't cover a lot of rhytmic possibilites! So to remedy that here's a way you can effectively create rests or tie a note's duration to be longer.

For Rests:

    { 0,    t = "1/8" }, 
    { "C4", t = "1/8" },

What did we just do? 
    For the first Note Table, set its PITCH value to number `0`or string `"0"`.
    This tells the code to ignore the pitch and not do anything with it.

Pitch 0 is at distance 0 effectively.

Pitch `"C4"` is 0.125. So we got distance of 0 + previous duration 1/8 (or 0.125). `"C4"` is a 1/8th duration away from the start.

For Ties:

It's a similar idea to Rests, but instead of putting the dummy note table BEFORE the note you want it to apply to, simply put the dummy note table AFTER!

    { "C4", t = "1/4" }, 
    { 0,    t = "1/8" }, 
    { "D4", t = "1/8" }, 

What's going on here?

Pitch `"C4"` is at distance 0 as it is the very first note table.

Pitch `0` is at distance `0.25`.
    Our current distance before this note was `0`.
    The previous Note Table's ("C4") duration was `"1/4"`.
    Our new distance for this note is: current distance + previous duration
    = 0 + 0.25
    Meaning Pitch `0` is a 1/4th duration away from the start.

Pitch `"D4"` is at distance `0.375`.
    Our current distance before this note was `0.25`.
    The previous Note Table's (which was pitch `0`) duration was `"1/8"`.
    Our new distance for this note is: current distance + previous duration
    = 0.25 + 0.125
    
Meaning Pitch `"D4"` is a 1/4th + 1/8th duration away from the start, or equivalent to a dotted 1/4th! (`"1/4*"`) Of course in *this* case you could just use a `"1/4*"` duration. But this helps you achieve super specific durations! Like...

    { "C4", t = "1/4" }, 
    { 0,    t = "1/16"}, 
    { "D4", t = "1/8*"}, 

We effectively turned pitch `"C4"` into a "1/4" + "1/16" duration, meaning the next nonzero pitch will be that duration away from pitch `"C4"`. In this case the next nonzero pitch is pitch `"D4"`, so it will be "1/4" + "1/16" duration away from pitch `"C4"`, or distance (0.25 + 0.0625, or 0.3125) away from the start. Why use this? Because no sane duration in Western Music Theory is in itself equivalent to 1/4 + 1/16th, thus we have to combine 2 basic durations to get that value. You could probably do something dumb like a very obscure quarter tuplet for this, but at that point why *don't* you jut tie the note?



# Chords and/or Simultaneous Voices

More often than not you'll encounter music where multiple notes play at the same time. How do we achive this? To put it simply, for all the note tables EXCEPT THE LAST in the chord, set their t value to 0.Then for the last note, set its t value to whatever your need it.

For example:

    { "E3", t = "1/8" },
    { "G#4",t = 0 },    { "B4", t = 0 },    { "E5", t = "1/8" }, 
    { "G#3",t = "1/8" },
    { "G#4",t = 0 },    { "B4", t = 0 },    { "E5", t = "1/8" }, 
    { "B3", t = "1/8" },
    { "G#4",t = 0 },    { "B4", t = 0 },    { "E5", t = "1/8" }, 

The E major chord consisting of `"G#4"`, `"B4"` and `"E5"` all play at the same time because the all the notes in the chord, except the `"E5"` as it is the last in the chord, have their t values set to 0. The `"E5"` itself has t value of `"1/8"`, making the next nonzero pitch value that distance away from this chord. It's rather confusing but I hope you get the hang of it! This is a quirk of how my code determines time values by indexing the *previous* note table's duration. Oh the things I do for readability...

# DECLARING YOUR SONG FILE

So you finally finished making your song files! Now what? There's one last step we need to take. Go to `scripts/songlist.lua` and open it. The first blocks of code will look like this (comments are not included in this sample, but there are in the original file):

	local songlist = {} 
	local directory = {}
	local dir = directory 

	dir["My Songs"] = 
	{
	    "template",
	    "jazzlick",
	}

Assuming your song is located under the folder `scripts/songs/My Songs/`, simply declare your **filename** as a string. I have to stress again, you should use the **filename, not the `data.title` value inside of your file.** This is because if your `data.title` value is a different name than your filename, then you'll have to be careful which one to declare. In my example file `thelick.lua`, the `data.title` value is also set to `thelick` so no need to worry there. I can declare my file this way:

	local songlist = {} 
	local directory = {}
	local dir = directory 

	dir["My Songs"] = 
	{
	    "template",
	    "jazzlick",
	    "thelick",	-- look mom! i did it!
	}
	
No need for the `.lua` extension. After all this, assuming everything went well with no errors, you should be able to call yoursong ingame! If this file `scripts/songs/My Songs/thelick.lua` did exist, then I could call it with `c_shellsfromtable(mysongs.thelick)`!
