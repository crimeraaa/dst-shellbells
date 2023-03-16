-- CREATE A COPY OF THIS FILE! DO NOT MODIFY IT DIRECTLY! 

--[[

How the hell does this all even work?

SONG/MEASURE TEMPLATES

    I highly encourage you to create a copy of this file in the same folder, and rename it to whatever song you like.
        The following measures are meant to be copy pasted or modified to the time signature of the song you're making. 
    
    In general, under your song table, you will be creating tables to represent your notes with their associated duration. 
    This is your "Note Table" as I will call it from now own.

    { "PITCH", t = "TIME" }, 
    
PITCH VALUES

    The "PITCH" value is a string attached to key 1 (a number, not a string!) in your Note Table.
    It contains the note's letter name along wwith its respective octave. 
    This is the Scientific Pitch Notation system! I encourage you to read about it so this makes more sense.

        String "C4" will represent middle C, for example. "B3" will represent the B natural right below Middle C.
        The octave number change for every new C. 

        In general the useable pitch values for shell bells are: 
        
        C3, D3, E3, F3, G3, A3, B3, -- this octave is Low C, an octave below Middle C on the piano.
        C4, D4, E4, F4, G4, A4, B4, -- this octave is Middle C on the piano.
        C5, D5, E5, F5, G5, A5, B5, -- this octave is High C, an octave above Middle C on the piano.

RHYTHMIC VALUES

    The "TIME" value is a string attached to key "t" in your Note Table.
    It contains the note's intended duration in terms of a fraction of a whole note.
    
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

    How do these even work?
        Your song starts with an assumed distance of 0. (in terms of DST distance units) 
        Every duration string I accounted for represents a specific value which is then added on top of the assumed distance.
        The assumed distance updates with each and every Note Table.
        The first Note Table is always set to distance 0. Every other Note Table is (distance) + (Previous Note Table's duration)

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

    You can also add an asterisk ("*") after the last character in each duration string to represent dotted rhythms. 
        For example:
        t = "1/4*" is a dotted quarter, 
        t = "1/8*" is a dotted eighth.
        and so on.
        
        You can do the same for double dotted notes, just use 2 asterisks instead of 1. Triple dotteds and above are not supported.
    
    What about triplets and other tuplets? To do so, first enclose the number of the tuplet you'd like in brackets ([ ]) like so:
        t = "[3]1/4" is a triplet quarter note. 
        This is especially useful in approximating music with a swing eighths feel.

        Swung eighths would look like this:
        t = "[3]1/4", this is the downbeat which will last for 2/3 of the triplet.
        t = "[3]1/8", this is the upbeat which will last for 1/3 of the triplet.

        Triplets, or "[3]", up to Nonuplets "[9]" are supported for the Basic Rhythms.

These next sections involve writing LUA tables. Please follow the examples' formatting carefully.

RESTS AND TIES
    
    The Basic Rhythms, even with all the Tuplets and Dotteds, still don't cover a lot of rhytmic possibilites!
    So to remedy that here's a way you can effectively create rests or tie a note's duration to be longer.

    For Rests:
        { 0,    t = "1/8" }, 
        { "C4", t = "1/8" },

        What did we just do? 
            For the first Note Table, set its PITCH value to number 0 or string "0".
            This tells the code to ignore the pitch and not do anything with it.

        Pitch 0 is at distance 0 effectively.

        Pitch "C4" is 0.125.
            So we got distance of 0 + previous duration 1/8 (or 0.125)
            "C4" is a 1/8th duration away from the start.
            
    For Ties:
        It's a similar idea to Rests, but instead of putting the dummy note table BEFORE the note you want it to apply to,
        Simply put the dummy note table AFTER!

        { "C4", t = "1/4" }, 
        { 0,    t = "1/8" }, 
        { "D4", t = "1/8" }, 

        What's going on here?
            
        Pitch "C4" is at distance 0 as it is the very first note table.

        Pitch 0 is at distance 0.25.
            Our current distance before this note was 0.
            The previous Note Table's ("C4") duration was "1/4".
            Our new distance for this note is: current distance + previous duration
            = 0 + 0.25
            Meaning Pitch 0 is a 1/4th duration away from the start.

        Pitch "D4" is at distance 0.375.
            Our current distance before this note was 0.25.
            The previous Note Table's (0) duration was "1/8".
            Our new distance for this note is: current distance + previous duration
            = 0.25 + 0.125
            Meaning Pitch "D4" is a 1/4th + 1/8th duration away from the start,
                or equivalent to a dootted 1/4th! ("1/4*")
                Of course in *this* case you could just use a "1/4*" duration,
                But this helps you achieve super specific durations! Like...
                "1/4" + "1/16"

CHORDS/SIMULTANEOUS VOICES

    More often than not you'll encounter music where multiple notes play at the same time. How do we achive this?
        To put it simply, for all the note tables EXCEPT THE LAST in the chord, set their t value to 0.
        Then for the last note, set its t value to whatever your need it.

    For example:
        { "E3", t = "1/8" },
        { "G#4",t = 0 },    { "B4", t = 0 },    { "E5", t = "1/8" }, 
        { "G#3",t = "1/8" },
        { "G#4",t = 0 },    { "B4", t = 0 },    { "E5", t = "1/8" }, 
        { "B3", t = "1/8" },
        { "G#4",t = 0 },    { "B4", t = 0 },    { "E5", t = "1/8" }, 

    The E major chord consisting "of G#4", "B4" and "E5" all play at the same time
        because the all the notes in the chord, except the E5 as it is the last in the chord,
        have their t values set to 0.


]]

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