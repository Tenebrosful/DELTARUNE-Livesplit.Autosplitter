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
    // @TODO Need update later, for now only check rooms
    // object array structure
	vars.done = 0;		// bool		have we triggered this split already?
    vars.oldroom = 1;		// int 		required old (last frame) room, -1 if none
	vars.curroom = 2; 		// int 		required current room, -1 if none

    vars.splits = new Dictionary<string, object[]>() {
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