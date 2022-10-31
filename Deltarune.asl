// DELTARUNE autosplitter by Tenebrosful
// Inspired by Narry's Autosplitter based on Glacia's Undertale autosplitter (But I don't understand everything so I made my own) (https://drive.google.com/file/d/1SCpuUpDgIYHmbc6xKK3ZrNk1zaIeDUMq/view?usp=sharing)

state("Deltarune", "v1.15") {
  uint room : "Deltarune.exe", 0x6F0B70;
}

state("Deltarune", "v1.10/v1.09/v1.08") {
  uint room : "Deltarune.exe", 0x6EF248;
}

state("Deltarune", "v1.07/v1.06/v1.05/v1.00") {
  uint room : "Deltarune.exe", 0x6EBF08;
}

state("Deltarune", "SURVEY_PROGRAM") {
  //static
  uint room :   "Deltarune.exe", 0x6AC9F0;
  
  //globals
  double money :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x470;
  double fight :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x490;
  double plot :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x500;
  double filechoice :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x4D0;
  double interact :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x28, 0x20;
  double choicer :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x28, 0x40;

  //selfs - Finding reliable pointers to these values is really weird so here's a few paths that appear to cover all the test cases I found so we don't need to use a sigscan
  double jevilDance :   "Deltarune.exe", 0x48BDEC, 0x78, 0x60, 0x10, 0x10, 0x0;
  double jevilDance2 :   "Deltarune.exe", 0x48BDEC, 0x7C, 0x60, 0x10, 0x10, 0x0;
  
  double finalTextboxHalt :   "Deltarune.exe", 0x48BDEC, 0x98, 0x60, 0x10, 0x274, 0x0;
  double finalTextboxHalt2 :   "Deltarune.exe", 0x48BDEC, 0x9C, 0x60, 0x10, 0x274, 0x0;
  
}

init {
  print("[DELTARUNE] INIT");

  switch(modules.First().ModuleMemorySize) {
    case 7503872:
        version = "v1.15";
        break;
    case 7495680:
        version = "v1.10/v1.09/v1.08";
        break;
    case 7491584:
        version = "v1.07/v1.06/v1.05/v1.00";
        break;
    case 7954432:
        version = "SURVEY_PROGRAM";
        break;
  }

  switch(version) {
    case "v1.15":
    case "v1.10/v1.09/v1.08":
        // @TODO Need update later, for now only check rooms
        // object array structure
        vars.done = 0; // bool have we triggered this split already?
        vars.oldroom = 1; // int required old (last frame) room, -1 if none
        vars.curroom = 2;  // int required current room, -1 if none
        vars.splits = new Dictionary<string, object[]>() {
            /*
            *   All Chapters
            */
            {"startch2", new object[] {false, -1, 28}},
            /*
            *   Chapter 1
            */
            {"ch1survey", new object[] {false, 282, 283}},
            {"ch1lightworld", new object[] {false, -1, 315}},
            {"ch1pre-castletown", new object[] {false, -1, 325}},
            {"ch1castletown", new object[] {false, -1, 330}},
            {"ch1rudinnskip1", new object[] {false, -1, 333}},
            {"ch1rudinnskip2", new object[] {false, -1, 335}},
            {"ch1rudinnskip3", new object[] {false, -1, 337}},
            {"ch1vandalizedpuzzle", new object[] {false, -1, 344}},
            {"ch1exitfields", new object[] {false, -1, 346}},
            {"ch1pawnskip1", new object[] {false, -1, 348}},
            {"ch1pawnskip2", new object[] {false, -1, 352}},
            {"ch1exitcheckerboard", new object[] {false, -1, 354}},
            {"ch1bloxerskip1", new object[] {false, -1, 366}},
            {"ch1bloxerskip2", new object[] {false, -1, 377}},
            {"ch1exitforest", new object[] {false, -1, 379}},
            {"ch1captured", new object[] {false, -1, 386}},
            {"ch1exitprison", new object[] {false, -1, 390}},
            {"ch1rudinnrangerskip", new object[] {false, -1, 397}},
            {"ch1headhathyskip", new object[] {false, -1, 401}},
            {"ch1shopping", new object[] {false, -1, 406}},
            {"ch1exitthrone", new object[] {false, -1, 408}},
            {"ch1king", new object[] {false, -1, 410}},
            /*
            *   Chapter 2
            */
            {"ch2lightworld", new object[] {false, -1, 85}},
            {"ch2pre-cyberfield", new object[] {false, -1, 88}},
            {"ch2tasque", new object[] {false, -1, 93}},
            {"ch2mecabattlegame", new object[] {false, -1, 94}},
            {"ch2virovirokun1", new object[] {false, 95, 96}},
            {"ch2agree2all", new object[] {false, 96, 95}},
            {"ch2djfight", new object[] {false, 98, 106}},
            {"ch2djshop", new object[] {false, 237, 99}},
            {"ch2werewire1", new object[] {false, -1, 105}},
            {"ch2virovirokunpuzzle&cup", new object[] {false, -1, 101}},
            {"ch2exitcyberfield", new object[] {false, -1, 120}},
            {"ch2poppup", new object[] {false, -1, 125}},
            {"ch2virovirokun2ambuy-lance1", new object[] {false, -1, 128}},
            {"ch2buttonforcefield", new object[] {false, -1, 130}},
            {"ch2werewire2", new object[] {false, -1, 133}},
            {"ch2micepuzzle2", new object[] {false, -1, 135}},
            {"ch2cheezemaze", new object[] {false, -1, 136}},
            {"ch2micepuzzle3", new object[] {false, -1, 137}},
            {"ch2berdly", new object[] {false, 138, 139}},
            {"ch2berdlysnowgrave", new object[] {false, 138, 137}},
            {"ch2spamton", new object[] {false, 140, 139}},
            {"ch2fullparty", new object[] {false, -1, 143}},
            {"ch2ambuy-lance2", new object[] {false, -1, 144}},
            {"ch2maus", new object[] {false, -1, 145}},
            {"ch2exitcybercity", new object[] {false, -1, 160}},
            {"ch2exitcybercitysnowgrave", new object[] {false, 146, 0}},
            {"ch2escapecell", new object[] {false, -1, 163}},
            {"ch2lightpuzzle1", new object[] {false, -1, 164}},
            {"ch2lightpuzzle2", new object[] {false, -1, 165}},
            {"ch2lightpuzzle3", new object[] {false, -1, 166}},
            {"ch2swatchling1", new object[] {false, -1, 170}},
            {"ch2swatchling2", new object[] {false, -1, 171}},
            {"ch2tasquemanager", new object[] {false, -1, 172}},
            {"ch2mauswheel", new object[] {false, 193, 191}},
            {"ch2dogpipis", new object[] {false, -1, 194}},
            {"ch2swatchling3", new object[] {false, -1, 196}},
            {"ch2tasquemanagersnowgrave", new object[] {false, -1, 176}},
            {"ch2enteracidlake", new object[] {false, -1, 200}},
            {"ch2blocked", new object[] {false, -1, 212}},
            {"ch2unblocked", new object[] {false, -1, 202}},
            {"ch2exitacidlake", new object[] {false, -1, 203}},
            {"ch2werewerewire", new object[] {false, -1, 205}},
            {"ch2queen", new object[] {false, -1, 207}},
            {"ch2mecaqueen", new object[] {false, 207, 208}},

            {"ch2sealfountain", new object[] {false, -1, 1}}
        };

        vars.resetsRoom = new object[] {
            279, // Select Chapter
            413, // Ch1 Intro
            234 // Ch2 Intro
        };
    
        vars.menusRoom = new object[] {
            420, // Ch1 Menu
            244 // Ch2 Menu
        };

        vars.startsRoom = new object[] {
            282 // Ch1
            // Ch2 runs don't start with a room changing
        };
        break;
    case "v1.07/v1.06/v1.05/v1.00":
        // @TODO Need update later, for now only check rooms
        // object array structure
        vars.done = 0; // bool have we triggered this split already?
        vars.oldroom = 1; // int required old (last frame) room, -1 if none
        vars.curroom = 2;  // int required current room, -1 if none
        vars.splits = new Dictionary<string, object[]>() {
            /*
            *   All Chapters
            */
            {"startch2", new object[] {false, -1, 27}},
            /*
            *   Chapter 1
            */
            {"ch1survey", new object[] {false, 281, 282}},
            {"ch1lightworld", new object[] {false, -1, 314}},
            {"ch1pre-castletown", new object[] {false, -1, 324}},
            {"ch1castletown", new object[] {false, -1, 329}},
            {"ch1rudinnskip1", new object[] {false, -1, 332}},
            {"ch1rudinnskip2", new object[] {false, -1, 334}},
            {"ch1rudinnskip3", new object[] {false, -1, 336}},
            {"ch1vandalizedpuzzle", new object[] {false, -1, 343}},
            {"ch1exitfields", new object[] {false, -1, 345}},
            {"ch1pawnskip1", new object[] {false, -1, 347}},
            {"ch1pawnskip2", new object[] {false, -1, 351}},
            {"ch1exitcheckerboard", new object[] {false, -1, 353}},
            {"ch1bloxerskip1", new object[] {false, -1, 365}},
            {"ch1bloxerskip2", new object[] {false, -1, 376}},
            {"ch1exitforest", new object[] {false, -1, 378}},
            {"ch1captured", new object[] {false, -1, 385}},
            {"ch1exitprison", new object[] {false, -1, 389}},
            {"ch1rudinnrangerskip", new object[] {false, -1, 396}},
            {"ch1headhathyskip", new object[] {false, -1, 400}},
            {"ch1shopping", new object[] {false, -1, 405}},
            {"ch1exitthrone", new object[] {false, -1, 407}},
            {"ch1king", new object[] {false, -1, 409}},
            /*
            *   Chapter 2
            */
            {"ch2lightworld", new object[] {false, -1, 84}},
            {"ch2pre-cyberfield", new object[] {false, -1, 87}},
            {"ch2tasque", new object[] {false, -1, 92}},
            {"ch2mecabattlegame", new object[] {false, -1, 93}},
            {"ch2virovirokun1", new object[] {false, 94, 95}},
            {"ch2agree2all", new object[] {false, 95, 94}},
            {"ch2djfight", new object[] {false, 97, 105}},
            {"ch2djshop", new object[] {false, 236, 98}},
            {"ch2werewire1", new object[] {false, -1, 104}},
            {"ch2virovirokunpuzzle&cup", new object[] {false, -1, 100}},
            {"ch2exitcyberfield", new object[] {false, -1, 119}},
            {"ch2poppup", new object[] {false, -1, 124}},
            {"ch2virovirokun2ambuy-lance1", new object[] {false, -1, 127}},
            {"ch2buttonforcefield", new object[] {false, -1, 129}},
            {"ch2werewire2", new object[] {false, -1, 132}},
            {"ch2micepuzzle2", new object[] {false, -1, 134}},
            {"ch2cheezemaze", new object[] {false, -1, 135}},
            {"ch2micepuzzle3", new object[] {false, -1, 136}},
            {"ch2berdly", new object[] {false, 137, 138}},
            {"ch2berdlysnowgrave", new object[] {false, 137, 136}},
            {"ch2spamton", new object[] {false, 139, 138}},
            {"ch2fullparty", new object[] {false, -1, 142}},
            {"ch2ambuy-lance2", new object[] {false, -1, 143}},
            {"ch2maus", new object[] {false, -1, 144}},
            {"ch2exitcybercity", new object[] {false, -1, 159}},
            {"ch2exitcybercitysnowgrave", new object[] {false, 145, 0}},
            {"ch2escapecell", new object[] {false, -1, 162}},
            {"ch2lightpuzzle1", new object[] {false, -1, 163}},
            {"ch2lightpuzzle2", new object[] {false, -1, 164}},
            {"ch2lightpuzzle3", new object[] {false, -1, 165}},
            {"ch2swatchling1", new object[] {false, -1, 169}},
            {"ch2swatchling2", new object[] {false, -1, 170}},
            {"ch2tasquemanager", new object[] {false, -1, 171}},
            {"ch2mauswheel", new object[] {false, 192, 190}},
            {"ch2dogpipis", new object[] {false, -1, 193}},
            {"ch2swatchling3", new object[] {false, -1, 195}},
            {"ch2tasquemanagersnowgrave", new object[] {false, -1, 175}},
            {"ch2enteracidlake", new object[] {false, -1, 199}},
            {"ch2blocked", new object[] {false, -1, 211}},
            {"ch2unblocked", new object[] {false, -1, 201}},
            {"ch2exitacidlake", new object[] {false, -1, 202}},
            {"ch2werewerewire", new object[] {false, -1, 204}},
            {"ch2queen", new object[] {false, -1, 206}},
            {"ch2mecaqueen", new object[] {false, 207, 208}},

            {"ch2sealfountain", new object[] {false, -1, 0}}
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
        break;
    case "SURVEY_PROGRAM":
        // object array structure
        vars.done = 0;  // bool  have we triggered this split already?
        vars.maxplot = 1;  // double  maximum allowed plot, -1 if none
        vars.reqplot = 2;  // double  required exact plot, -1 if none
        vars.oldroom = 3;  // int   required old (last frame) room, -1 if none
        vars.curroom = 4;   // int   required current room, -1 if none
        vars.oldfight = 5;  //int  required old fight state, -1 if none
        vars.curfight = 6;  //int  required current fight state, -1 if none
        vars.special = 7;   // int   required special logic function, -1 if none
        vars.splits = new Dictionary<string, object[]>() {
            // Ruins
            {"school", new object[] {false, -1, -1, 32, 34, -1, -1, -1  }},
            {"castletown", new object[] {false, -1, -1, -1, 49, -1, -1, -1  }},
            {"fields", new object[] {false, -1, -1, -1, 65, -1, -1, -1  }},
            {"checkers", new object[] {false, -1, -1, -1, 73, -1, -1, -1  }},
            {"forest", new object[] {false, -1, -1, -1, 98, -1, -1, -1  }},
            {"captured", new object[] {false, -1, -1, -1, 105, -1, -1, -1  }},
            {"jailcell", new object[] {false, -1, 156, -1, 106, -1, -1, -1  }},
            {"jail", new object[] {false, -1, -1, -1, 109, -1, -1, -1  }},
            {"jailelevator", new object[] {false, -1, -1, -1, 114, -1, -1, -1  }},
            {"throne", new object[] {false, -1, -1, -1, 127, -1, -1, -1  }},
            {"castle", new object[] {false, -1, -1, -1, 128, -1, -1, -1  }},
            {"kingroom", new object[] {false, -1, -1, -1, 129, -1, -1, -1  }},
            {"kingroomRalsei", new object[] {false, -1, 244, -1, 129, -1, -1, -1  }},
            {"roof", new object[] {false, -1, -1, -1, 130, -1, -1, -1  }},
            {"dark", new object[] {false, -1, -1, -1, 33, -1, -1, -1  }},
            
            //Ends on the textwriter being discarded
            {"theend", new object[] {false, -1, 251, -1, 2, -1, -1, 2  }},
            //Ends on the textbox closing
            //{"theendalt", new object[] {false, -1, 251, -1, 2, -1, -1, 1  }},
            
            
            {"p-lancerJoin", new object[] {false, -1, 130, -1, 97, -1, -1, -1  }},

            //Only battle in this room so this works
            {"b-kRoundCheckersStart", new object[] {false, -1, -1, -1, 72, 0, 1, -1  }},
            {"b-kRoundCheckersEnd", new object[] {false, -1, -1, -1, 72, 1, 0, -1  }},
            
            //Only battle in this room so this works
            {"b-kRoundCastleStart", new object[] {false, -1, -1, -1, 125, 0, 1, -1  }},
            {"b-kRoundCastleEnd", new object[] {false, -1, -1, -1, 125, 1, 0, -1  }},

            //Only battle in this room so this works
            {"b-kingStart", new object[] {false, -1, -1, -1, 128, 0, 1, -1  }},
            {"b-kingEnd", new object[] {false, -1, -1, -1, 128, 1, 0, -1  }},

            //Only battle in this room so this works
            {"b-jevilStart", new object[] {false, -1, -1, -1, 112, 0, 1, -1  }},
            //Uses a custom endstate detection because we want to end on pacify not on battle exit
            {"b-jevilEnd", new object[] {false, -1, -1, -1, 112, -1, 1, 7  }},
            
            {"i-key", new object[] {false, -1, -1, -1, 83, -1, -1, 3  }},
            {"i-keya", new object[] {false, -1, -1, -1, 133, -1, -1, 4  }},
            {"i-keyb", new object[] {false, -1, -1, -1, 85, -1, -1, 5  }},
            {"i-keyc", new object[] {false, -1, -1, -1, 64, -1, -1, 6  }},
        };
    break;
  }

  print("[DELTARUNE] Detected version : " + version + "(" + modules.First().ModuleMemorySize + ")");

  vars.firstRun = true;
  vars.reactivate =  (Func<bool>)(() => {
        foreach (string split in vars.splits.Keys)
            vars.splits[split][vars.done] = false;

        print("[DELTARUNE] All splits have been reset to initial state");
        return true;
    });
}

startup {
  print("[DELTARUNE] STARTUP");

  /*************************
  **  SURVEY PROGRAM  **
  *************************/
  
  settings.Add("survey_program", true, "Survey Program");
  settings.SetToolTip("survey_program", "Only concern if you play on Survey Program version");

  settings.CurrentDefaultParent = "survey_program";

  settings.Add("intro", true, "Light World (Intro)");
  settings.Add("darkworld", true, "Dark World");
  settings.Add("ending", true, "Light World (End)");
  settings.Add("jevil", true, "Jevil");
  settings.Add("jevilkey", true, "Key", "jevil");
  settings.Add("jevilfight", true, "Jevil Fight", "jevil");

  settings.Add("school", true, "Exit The School", "intro");

  settings.Add("castletown", true, "Exit Castle Town", "darkworld");
  settings.Add("fields", true, "Exit the Fields", "darkworld");

  settings.Add("kroundcheckers", true, "K-Round Checkers", "darkworld");
  settings.Add("b-kRoundCheckersStart", true, "K-Round Start", "kroundcheckers");
  settings.Add("b-kRoundCheckersEnd", true, "K-Round End", "kroundcheckers");
  settings.Add("checkers", true, "Exit the Checkerboard", "darkworld");

  settings.Add("p-lancerJoin", true, "Lancer Joins the Team", "darkworld");
  settings.Add("forest", true, "Exit the Forest Maze", "darkworld");
  settings.Add("captured", true, "Captured by Lancer", "darkworld");
  settings.Add("jailcell", true, "Exit the Jail Cell", "darkworld");
  settings.Add("jail", true, "Exit the Jail", "darkworld");
  settings.Add("jailelevator", true, "Exit the Jail Elevator", "darkworld");

  settings.Add("kroundcastle", true, "K-Round Castle", "darkworld");
  settings.Add("b-kRoundCastleStart", true, "K-Round Start", "kroundcastle");
  settings.Add("b-kRoundCastleEnd", true, "K-Round End", "kroundcastle");
  
  settings.Add("throne", true, "Exit the Throne Room", "darkworld");
  settings.Add("castle", true, "Exit the Castle", "darkworld");
  settings.Add("king", true, "King Boss", "darkworld");
  settings.Add("b-kingStart", true, "King Fight Start", "king");
  settings.Add("b-kingEnd", true, "King Fight End", "king");
  settings.Add("kingroom", true, "Exit the King Fight Room", "darkworld");
  settings.Add("kingroomRalsei", true, "Exit the King Fight Room (After Ralsei Reveal)", "darkworld");
  settings.Add("roof", true, "Exit the Roof", "darkworld");

  settings.Add("dark", true, "Exit the Dark World", "darkworld");

  settings.Add("theend", true, "The End (Final Text Dismissed)", "ending");
  //settings.Add("theendalt", true, "The End Alternate (Final Textbox Dismissed, 5 frames slower)", "ending");
  
  settings.Add("i-keya", true, "Key A", "jevilkey");
  settings.Add("i-keyb", true, "Key B", "jevilkey");
  settings.Add("i-keyc", true, "Key C", "jevilkey");
  settings.Add("i-key", true, "Key Repaired", "jevilkey");

  settings.Add("b-jevilStart", true, "Jevil Fight Start", "jevilfight");
  settings.Add("b-jevilEnd", true, "Jevil Fight End", "jevilfight");

  settings.CurrentDefaultParent = null;

  /*************************
  **  Recent Versions   **
  *************************/

  settings.Add("demo", true, "Current Demo");
  settings.SetToolTip("survey_program", "Only concern if you play on current demo");

  settings.CurrentDefaultParent = "demo";

  /*
  *   Chapters
  */
  settings.Add("allch", false, "All Chapters");
  settings.Add("ch1", true, "Chapter 1");
  settings.Add("ch2", true, "Chapter 2");

  settings.CurrentDefaultParent = null;

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
    settings.Add("ch1bloxerskip1", false, "Bloxer Skip 1", "ch1forest");
    settings.Add("ch1bloxerskip2", false, "Bloxer Skip 2", "ch1forest");
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
    settings.Add("ch2mecaqueen", true, "Meca Queen", "ch2mansion");
    settings.Add("ch2sealfountain", false, "Fountain sealed", "ch2mansion");
  settings.Add("ch2acidlake", true, "Acid Lake", "ch2");
    settings.Add("ch2enteracidlake", true, "Entering Acid Lake", "ch2acidlake");
    settings.Add("ch2blocked", false, "Blocked by Hand", "ch2acidlake");
    settings.Add("ch2unblocked", false, "Unblocked by Hand", "ch2acidlake");
    settings.Add("ch2exitacidlake", true, "Exit Acid Lake", "ch2acidlake");
}

start {
  if (old.room == current.room) return false;

  print("[DELTARUNE] New room " + old.room + " -> " + current.room);

  switch(version) {
    case "SURVEY_PROGRAM":
      if (current.room == 1) return true;
      break;
    default:
    case "v1.10/v1.09/v1.08":
    case "v1.07/v1.06/v1.05/v1.00":
      foreach(int startingRoom in vars.startsRoom) {
        if(current.room == startingRoom){
          print("[DELTARUNE] START" + " Room: " + current.room);
          return true;
        }
      }
      break;
  }

  return false;  
}

reset {
  if (old.room == current.room) return false;
  if (settings["allch"]) return false;

  switch(version) {
    case "SURVEY_PROGRAM":
        if (current.room == 1) { print("[DELTARUNE] RESET"); return true; }
        break;
    default:
    case "v1.15":
    case "v1.10/v1.09/v1.08":
    case "v1.07/v1.06/v1.05/v1.00":
        foreach(int resetingRoom in vars.resetsRoom) {
            if (current.room == resetingRoom) {
                print("[DELTARUNE] RESET");
                return true;
            }
        }
        break;
  }

  return false;
}

update {
  current.phase = timer.CurrentPhase;

  if (vars.firstRun) 
    vars.firstRun = false;
  else
    if ((current.phase == TimerPhase.Running) && (old.phase == TimerPhase.NotRunning))
        vars.reactivate();
}

split {
  if(current.room != old.room) print("[DELTARUNE] ROOM CHANGED " + old.room + "->" + current.room);

  switch(version) {
    default:
    case "v1.15":
    case "v1.10/v1.09/v1.08":
    case "v1.07/v1.06/v1.05/v1.00":
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
        break;
    case "SURVEY_PROGRAM":
    if(current.plot != old.plot) print("[DELTARUNE] PLOT CHANGED " + old.plot + "->" + current.plot);
    if(current.fight != old.fight) print("[DELTARUNE] FIGHT CHANGED " + old.fight + "->" + current.fight);

        foreach (string goal in vars.splits.Keys) {
            // is this an enabled split that is armed?
            if ((settings[goal]) && (!vars.splits[goal][vars.done])) {
                // is there a current room requirement?
                if ((vars.splits[goal][vars.curroom] != -1) && (current.room != vars.splits[goal][vars.curroom]))
                    continue;

                // is there an old room requirement?
                if ((vars.splits[goal][vars.oldroom] != -1) && (old.room != vars.splits[goal][vars.oldroom]))
                    continue;

                // is there an exact plot requirement?
                if ((vars.splits[goal][vars.reqplot] != -1) && (current.plot != vars.splits[goal][vars.reqplot]))
                    continue;

                // is there a maximum plot requirement?
                if ((vars.splits[goal][vars.maxplot] != -1) && (current.plot > vars.splits[goal][vars.maxplot]))
                    continue;

                // is there a current fight requirement ?
                if ((vars.splits[goal][vars.curfight] != -1) && (current.fight != vars.splits[goal][vars.curfight]))
                    continue;

                // is there an old fight requirement ?
                if ((vars.splits[goal][vars.oldfight] != -1) && (old.fight != vars.splits[goal][vars.oldfight]))
                    continue;
                
                // is there a special flag requirement?
                if (vars.splits[goal][vars.special] != -1) {
                    bool pass = false;

                    switch((int)vars.splits[goal][vars.special]) {
                        case 1:  // theendboxclosed
                            /*
                            When the final textbox is closed, the game stores global.filechoice in a temp var
                            it then sets global.filechoice + 3, saves the game, and then sets it back
                            we can use this to get the frame after the textbox was closed by looking for filechoice > 2
                            as this will only be valid in this one case
                            */
                            pass = (current.filechoice > 2);
                            break;
                        case 2:  // theendselfdestroyed
                            /*
                            We dig out the haltstate of the final textbox. When it's in state 2, it's done writing.
                            Once the box is dismised, the pointer becomes invalid and as such, the value is no longer 2
                            We also check to make sure they took choice 0 and not choice 1 to ensure they chose yes and not no.
                            */
                            pass = (((old.finalTextboxHalt == 2 && current.finalTextboxHalt != 2) || (old.finalTextboxHalt2 == 2 && current.finalTextboxHalt2 != 2))  && current.choicer == 0);
                            break;
                        case 3:  // i-key
                            pass = vars.checkKeyItems(5);
                            break;
                        case 4:  // i-keyA
                            pass = vars.checkKeyItems(4);
                            break;
                        case 5:  // i-keyB
                            pass = vars.checkKeyItems(6);
                            break;
                        case 6:  // i-keyC
                            pass = vars.checkKeyItems(7);
                            break;
                        case 7: //b-jevilEnd 
                            /*
                            Jevil has a variable named dancelv which sets the sprite/animation he's using
                            0 - Default, 1 - Bounce, 2 - Sad, 3 - Teleports, 4 - Dead
                            We use this to determine when he's been pacified
                            */
                            pass = (current.jevilDance == 4 || current.jevilDance2 == 4);
                            break;
                    }

                    if (!pass) continue;
                }

                // if we get to this point, all requirements are met
                vars.splits[goal][vars.done] = true;

                print("[DELTARUNE] SPLIT " + goal);

                return true;
            }
        }
        break;
  }

  return false;
}