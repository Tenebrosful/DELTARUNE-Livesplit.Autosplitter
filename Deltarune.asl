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
    settings.Add("allch", false, "All Chapters");
    settings.Add("ch1", true, "Chapter 1");
    settings.Add("ch2", true, "Chapter 2");

    /**
    *   All Chapters
    */
    settings.Add("startch2", true, "Start Chapter 2", "allch");

    /*
    *   Chapter 1
    */
    settings.Add("ch1intro", true, "Intro", "ch1");
        settings.Add("ch1survey", false, "Survey finished", "ch1intro"); // Split when warp to Kris room
        settings.Add("ch1lightworld", false, "Exit Light World / Entering in Dark World", "ch1intro"); // Split when warp to Dark World when Kris is on the ground
    settings.Add("ch1pre-castletown", false, "Entering Castle Town", "ch1");
    settings.Add("ch1castletown", true, "Exit Castle Town", "ch1");
    settings.Add("ch1fields", true, "Fields", "ch1");
        settings.Add("ch1rudinnskip1", false, "Rudinn Skip 1", "ch1fields");
        settings.Add("ch1rudinnskip2", false, "Rudinn Skip 2", "ch1fields");
        settings.Add("ch1rudinnskip3", false, "Rudinn Skip 3", "ch1fields");
        settings.Add("ch1vandalizedpuzzle", false, "Vandalized Puzzle", "ch1fields");
        settings.Add("ch1exitfields", true, "Rudinn Skip 4 / Exiting Fields", "ch1fields");
    settings.Add("ch1checkerboard", true, "Checkerboard", "ch1");
        settings.Add("ch1pawnskip1", false, "Pawn Skip 1", "ch1checkerboard");
        settings.Add("ch1pawnskip2", false, "Pawn Skip 2", "ch1checkerboard");
        settings.Add("ch1exitcheckerboard", true, "Exiting Checkerboard", "ch1checkerboard");
    settings.Add("ch1forest", true, "Forest", "ch1");
        settings.Add("ch1bloxerskip1", false, "Pawn Skip 1", "ch1forest");
        settings.Add("ch1bloxerskip2", false, "Pawn Skip 2", "ch1forest");
        settings.Add("ch1exitforest", true, "Exiting Checkerboard", "ch1forest");
    settings.Add("ch1prison", true, "Prison", "ch1");
        settings.Add("ch1captured", false, "Captured", "ch1prison");
        settings.Add("ch1exitprison", true, "Exiting Prison", "ch1prison");
    settings.Add("ch1cardcastle", true, "Card Castle", "ch1");
        settings.Add("ch1rudinnrangerskip", false, "Rudinn Ranger Skip", "ch1cardcastle");
        settings.Add("ch1headhathyskip", false, "Head Hathy Skip", "ch1cardcastle");
        settings.Add("ch1shopping", false, "After the shop, before K Round", "ch1cardcastle");
        settings.Add("ch1exitthrone", true, "Exiting Card Castle's Throne room", "ch1cardcastle");
        settings.Add("ch1king", true, "After King Battle", "ch1cardcastle");

    /*
    *   Chapter 2
    */
    settings.Add("ch2intro", true, "Intro", "ch2");
        settings.Add("ch2lightworld", true, "Entering in Dark World (split the room after)", "ch2intro");
    settings.Add("ch2pre-cyberfield", false, "Entering Cyber Field", "ch2");
    settings.Add("ch2cyberfield", true, "Cyber World", "ch2");
        settings.Add("ch2tasque", false, "Tasque Fight / Skip", "ch2cyberfield");
        settings.Add("ch2mecabattlegame", true, "Mecha Battle Game", "ch2cyberfield");
        settings.Add("ch2virovirokun1", false, "Virovirokun Fight / Skip", "ch2cyberfield");
        settings.Add("ch2agree2all", false, "Agree 2 All puzzle", "ch2cyberfield");
        settings.Add("ch2djfight", true, "DJ Fight", "ch2cyberfield");
        settings.Add("ch2djshop", false, "DJ Shop", "ch2cyberfield");
        settings.Add("ch2werewire1", false, "Werewire Fight / Skip", "ch2cyberfield");
        settings.Add("ch2virovirokunpuzzle&cup", false, "After Virovirokun & Cup", "ch2cyberfield");
        settings.Add("ch2exitcyberfield", true, "Exit Cyber World", "ch2cyberfield");
    settings.Add("ch2cybercity", true, "Cyber City", "ch2");
        settings.Add("ch2poppup", false, "Poppup Fight / Skip", "ch2cybercity");
        settings.Add("ch2virovirokun2ambuy-lance1", false, "Virovirokun & Ambuy-Lance Fight / Skip", "ch2cybercity");
        settings.Add("ch2buttonforcefield", false, "Button Forcefield", "ch2cybercity");
        settings.Add("ch2werewire2", false, "Werewire Fight / Skip", "ch2cybercity");
        settings.Add("ch2micepuzzle2", false, "Mice Puzzle 2", "ch2cybercity");
        settings.Add("ch2cheezemaze", false, "Cheeze Maze", "ch2cybercity");
        settings.Add("ch2micepuzzle3", false, "Mice Puzzle 3", "ch2cybercity");
        settings.Add("ch2berdly", true, "Berdly", "ch2cybercity");
        settings.Add("ch2berdlysnowgrave", true, "Berdly (Snowgrave)", "ch2cybercity");
        settings.Add("ch2spamton", true, "Spamton", "ch2cybercity");
        settings.Add("ch2fullparty", false, "Full party", "ch2cybercity");
        settings.Add("ch2ambuy-lance2", false, "Ambuy-lance fight", "ch2cybercity");
        settings.Add("ch2maus", false, "Mice fight", "ch2cybercity");
        settings.Add("ch2exitcybercity", true, "Exit Cyber City (Captured)", "ch2cybercity");
        settings.Add("ch2exitcybercitysnowgrave", false, "Exit Cyber City (Snowgrave)", "ch2cybercity");
    settings.Add("ch2mansion", true, "Queen Mansion", "ch2");
        settings.Add("ch2escapecell", false, "Escape Cell", "ch2mansion");
        settings.Add("ch2lightpuzzle1", false, "Light Puzzle 1", "ch2mansion");
        settings.Add("ch2lightpuzzle2", false, "Light Puzzle 2", "ch2mansion");
        settings.Add("ch2lightpuzzle3", false, "Light Puzzle 3", "ch2mansion");
        settings.Add("ch2swatchling1", false, "Swatchling 1", "ch2mansion");
        settings.Add("ch2swatchling2", false, "Swatchling 2 (Pot Race)", "ch2mansion");
        settings.Add("ch2tasquemanager", false, "Tasque Manager", "ch2mansion");
        settings.Add("ch2mauswheel", false, "Mauswheel", "ch2mansion");
        settings.Add("ch2dogpipis", false, "After Dog / Pipis Room", "ch2mansion");
        settings.Add("ch2swatchling3", false, "Swatchling 3", "ch2mansion");
        settings.Add("ch2tasquemanagersnowgrave", false, "Tasque Manager (Snowgrave)", "ch2mansion");
        settings.Add("ch2werewerewire", false, "Werewerewire", "ch2mansion");
        settings.Add("ch2queen", true, "Queen", "ch2mansion");
        settings.Add("ch2sealfountain", false, "Fountain sealed", "ch2mansion");
    settings.Add("ch2acidlake", true, "Acid Lake", "ch2");
        settings.Add("ch2enteracidlake", true, "Entering Acid Lake", "ch2acidlake");
        settings.Add("ch2blocked", false, "Blocked by Hand", "ch2acidlake");
        settings.Add("ch2unblocked", false, "Unblocked by Hand", "ch2acidlake");
        settings.Add("ch2exitacidlake", true, "Exit Acid Lake", "ch2acidlake");

    // @TODO Need update later, for now only check rooms
    // object array structure
	vars.done = 0;		// bool		have we triggered this split already?
    vars.oldroom = 1;		// int 		required old (last frame) room, -1 if none
	vars.curroom = 2; 		// int 		required current room, -1 if none

    vars.splits = new Dictionary<string, object[]>() {
        /*
        *   All Chapters
        */
        {"startch2",  new object[] {false, -1, 27}},
        /*
        *   Chapter 1
        */
        {"ch1survey",  new object[] {false, 281, 282}},
        {"ch1lightworld",  new object[] {false, -1, 314}},
        {"ch1pre-castletown",  new object[] {false, -1, 324}},
        {"ch1castletown",  new object[] {false, -1, 329}},
        {"ch1rudinnskip1",  new object[] {false, -1, 332}},
        {"ch1rudinnskip2",  new object[] {false, -1, 334}},
        {"ch1rudinnskip3",  new object[] {false, -1, 336}},
        {"ch1vandalizedpuzzle",  new object[] {false, -1, 343}},
        {"ch1exitfields",  new object[] {false, -1, 345}},
        {"ch1pawnskip1",  new object[] {false, -1, 347}},
        {"ch1pawnskip2",  new object[] {false, -1, 351}},
        {"ch1exitcheckerboard",  new object[] {false, -1, 353}},
        {"ch1bloxerskip1",  new object[] {false, -1, 365}},
        {"ch1bloxerskip2",  new object[] {false, -1, 376}},
        {"ch1exitforest",  new object[] {false, -1, 378}},
        {"ch1captured",  new object[] {false, -1, 385}},
        {"ch1exitprison",  new object[] {false, -1, 389}},
        {"ch1rudinnrangerskip",  new object[] {false, -1, 396}},
        {"ch1headhathyskip",  new object[] {false, -1, 400}},
        {"ch1shopping",  new object[] {false, -1, 405}},
        {"ch1exitthrone",  new object[] {false, -1, 407}},
        {"ch1king",  new object[] {false, -1, 409}},
        /*
        *   Chapter 2
        */
        {"ch2lightworld",  new object[] {false, -1, 84}},
        {"ch2pre-cyberfield",  new object[] {false, -1, 87}},
        {"ch2tasque",  new object[] {false, -1, 92}},
        {"ch2mecabattlegame",  new object[] {false, -1, 93}},
        {"ch2virovirokun1",  new object[] {false, 94, 95}},
        {"ch2agree2all",  new object[] {false, 95, 94}},
        {"ch2djfight",  new object[] {false, 97, 105}},
        {"ch2djshop",  new object[] {false, 236, 98}},
        {"ch2werewire1",  new object[] {false, -1, 104}},
        {"ch2virovirokunpuzzle&cup",  new object[] {false, -1, 100}},
        {"ch2exitcyberfield",  new object[] {false, -1, 119}},
        {"ch2poppup",  new object[] {false, -1, 124}},
        {"ch2virovirokun2ambuy-lance1",  new object[] {false, -1, 127}},
        {"ch2buttonforcefield",  new object[] {false, -1, 129}},
        {"ch2werewire2",  new object[] {false, -1, 132}},
        {"ch2micepuzzle2",  new object[] {false, -1, 134}},
        {"ch2cheezemaze",  new object[] {false, -1, 135}},
        {"ch2micepuzzle3",  new object[] {false, -1, 136}},
        {"ch2berdly",  new object[] {false, 137, 138}},
        {"ch2berdlysnowgrave",  new object[] {false, 137, 136}},
        {"ch2spamton",  new object[] {false, 139, 138}},
        {"ch2fullparty",  new object[] {false, -1, 142}},
        {"ch2ambuy-lance2",  new object[] {false, -1, 143}},
        {"ch2maus",  new object[] {false, -1, 144}},
        {"ch2exitcybercity",  new object[] {false, -1, 159}},
        {"ch2exitcybercitysnowgrave",  new object[] {false, 145, 0}},
        {"ch2escapecell",  new object[] {false, -1, 162}},
        {"ch2lightpuzzle1",  new object[] {false, -1, 163}},
        {"ch2lightpuzzle2",  new object[] {false, -1, 164}},
        {"ch2lightpuzzle3",  new object[] {false, -1, 165}},
        {"ch2swatchling1",  new object[] {false, -1, 169}},
        {"ch2swatchling2",  new object[] {false, -1, 170}},
        {"ch2tasquemanager",  new object[] {false, -1, 171}},
        {"ch2mauswheel",  new object[] {false, 192, 190}},
        {"ch2dogpipis",  new object[] {false, -1, 193}},
        {"ch2swatchling3",  new object[] {false, -1, 195}},
        {"ch2tasquemanagersnowgrave",  new object[] {false, -1, 175}},
        {"ch2enteracidlake",  new object[] {false, -1, 199}},
        {"ch2blocked",  new object[] {false, -1, 211}},
        {"ch2unblocked",  new object[] {false, -1, 201}},
        {"ch2exitacidlake",  new object[] {false, -1, 202}},
        {"ch2werewerewire",  new object[] {false, -1, 204}},
        {"ch2queen",  new object[] {false, -1, 206}},

        {"ch2sealfountain",  new object[] {false, -1, 0}}
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