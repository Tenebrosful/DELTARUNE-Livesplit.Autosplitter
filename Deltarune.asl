// DELTARUNE autosplitter by Tenebrosful
// Inspired by Narry's Autosplitter based on Glacia's Undertale autosplitter (But I don't understand everything so I made my own) (https://drive.google.com/file/d/1SCpuUpDgIYHmbc6xKK3ZrNk1zaIeDUMq/view?usp=sharing)

state("Deltarune")
{
    uint room : "Deltarune.exe", 0x6EBF08;
}

init {
    print("[DELTARUNE] INIT");
}

startup {
    print("[DELTARUNE] STARTUP");
    
    /*
    *   Chapters
    */
    settings.Add("ch1", true, "Chapter 1");

    /*
    *   Chapter 1
    */
    settings.Add("intro", true, "Intro", "ch1");
        settings.Add("survey", true, "Survey finished", "intro"); // Split when warp to Kris room
        settings.Add("lightworld", true, "Exit Light World / Entering in Dark World", "intro"); // Split when warp to Dark World when Kris is on the ground
    settings.Add("pre-castletown", true, "Entering Castle Town", "ch1");
    settings.Add("castletown", true, "Exit Castle Town", "ch1");
    settings.Add("fields", true, "Fields", "ch1");
        settings.Add("rudinnskip1", true, "Rudinn Skip 1", "fields");
        settings.Add("rudinnskip2", true, "Rudinn Skip 2", "fields");
        settings.Add("rudinnskip3", true, "Rudinn Skip 3", "fields");
        settings.Add("vandalizedpuzzle", true, "Vandalized Puzzle", "fields");
        settings.Add("exitfields", true, "Rudinn Skip 4 / Exiting Fields", "fields");
    settings.Add("checkerboard", true, "Checkerboard", "ch1");
        settings.Add("pawnskip1", true, "Pawn Skip 1", "checkerboard");
        settings.Add("pawnskip2", true, "Pawn Skip 2", "checkerboard");
        settings.Add("exitcheckerboard", true, "Exiting Checkerboard", "checkerboard");
    settings.Add("forest", true, "Forest", "ch1");
        settings.Add("bloxerskip1", true, "Pawn Skip 1", "forest");
        settings.Add("bloxerskip2", true, "Pawn Skip 2", "forest");
        settings.Add("exitforest", true, "Exiting Checkerboard", "forest");
    settings.Add("prison", true, "Prison", "ch1");
        settings.Add("captured", true, "Captured", "prison");
        settings.Add("exitprison", true, "Exiting Prison", "prison");
    settings.Add("cardcastle", true, "Card Castle", "ch1");
        settings.Add("rudinnrangerskip", true, "Rudinn Ranger Skip", "cardcastle");
        settings.Add("headhathyskip", true, "Head Hathy Skip", "cardcastle");
        settings.Add("shopping", true, "After the shop, before K Round", "cardcastle");
        settings.Add("exitthrone", true, "Exit Card Castle's Throne room", "cardcastle");
        settings.Add("king", true, "After King Battle", "cardcastle");
    
    // @TODO Need update later, for now only check rooms
    // object array structure
	vars.done = 0;		// bool		have we triggered this split already?
    vars.oldroom = 1;		// int 		required old (last frame) room, -1 if none
	vars.curroom = 2; 		// int 		required current room, -1 if none

    vars.splits = new Dictionary<string, object[]>() {
        /*
        *   Chapter 1
        */
        {"survey",  new object[] {false, -1, 282}},
        {"lightworld",  new object[] {false, -1, 314}},
        {"pre-castletown",  new object[] {false, -1, 324}},
        {"castletown",  new object[] {false, -1, 329}},
        {"rudinnskip1",  new object[] {false, -1, 332}},
        {"rudinnskip2",  new object[] {false, -1, 334}},
        {"rudinnskip3",  new object[] {false, -1, 336}},
        {"vandalizedpuzzle",  new object[] {false, -1, 343}},
        {"exitfields",  new object[] {false, -1, 345}},
        {"pawnskip1",  new object[] {false, -1, 347}},
        {"pawnskip2",  new object[] {false, -1, 351}},
        {"exitcheckerboard",  new object[] {false, -1, 353}},
        {"bloxerskip1",  new object[] {false, -1, 365}},
        {"bloxerskip2",  new object[] {false, -1, 376}},
        {"exitforest",  new object[] {false, -1, 378}},
        {"captured",  new object[] {false, -1, 385}},
        {"exitprison",  new object[] {false, -1, 389}},
        {"rudinnrangerskip",  new object[] {false, -1, 396}},
        {"headhathyskip",  new object[] {false, -1, 400}},
        {"shopping",  new object[] {false, -1, 405}},
        {"exitthrone",  new object[] {false, -1, 407}},
        {"king",  new object[] {false, -1, 409}}
    };

    vars.resetsRoom = new object[] {
        278, // Select Chapter
        412, // Ch1 Intro
        233 // Ch2 Intro
    };
    
    vars.menusRoom = new object[] {
        419, // Ch1 Menu
        243 // Ch2 Menu
    };

    vars.startsRoom = new object[] {
        281 // Ch1
        // Ch2 runs don't start with a room changing
    };

}

start {
    if (old.room == current.room) return false;

    foreach(int startingRoom in vars.startsRoom) {
        if(current.room == startingRoom){
            print("[DELTARUNE] START" + " Room: " + current.room);
            return true;
        }
    }

    return false;    
}

reset {
    if (old.room == current.room) return false;

    foreach(int resetingRoom in vars.resetsRoom) {
        if (current.room == resetingRoom) {
            print("[DELTARUNE] RESET");
            return true;
        }
    }

    return false;
}

split {
    if(current.room != old.room){
        print("[DELTARUNE] ROOM CHANGED " + old.room + "->" + current.room);
    }

    foreach(string splitKey in vars.splits.Keys){
        if ((settings[splitKey]) && !vars.splits[splitKey][vars.done]) {

            // is there a current room requirement?
			if ((vars.splits[splitKey][vars.curroom] != -1) && (current.room != vars.splits[splitKey][vars.curroom]))
				continue;

			// is there an old room requirement?
			if ((vars.splits[splitKey][vars.oldroom] != -1) && (old.room != vars.splits[splitKey][vars.oldroom]))
				continue;

            vars.splits[splitKey][vars.done] = true;

            print("[DELTARUNE] SPLIT " + splitKey);

            return true;
        }
    }

    return false;
}