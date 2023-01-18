// DELTARUNE autosplitter by Tenebrosful and NERS
// Inspired by Narry's Autosplitter based on Glacia's Undertale autosplitter (But I don't understand everything so I made my own) (https://drive.google.com/file/d/1SCpuUpDgIYHmbc6xKK3ZrNk1zaIeDUMq/view?usp=sharing)

state("Deltarune", "v1.15") {
  // static
  uint room : "Deltarune.exe", 0x6F0B70;

  // globals
  double filechoice : "Deltarune.exe", 0x4E17F0, 0x34, 0x154, 0x10, 0x24, 0x10, 0x54, 0x110;
  double filechoice2 : "Deltarune.exe", 0x6FE864, 0x828, 0x78, 0x24, 0x10, 0x858, 0x2F0;
  
  double chapter : "Deltarune.exe", 0x4E17F0, 0x34, 0x154, 0x10, 0x24, 0x10, 0x54, 0x120; // used for chapter end checks because they could accidentally get triggered in the other chapter
  double chapter2 : "Deltarune.exe", 0x4E06B8, 0x24, 0x10, 0xA08, 0x340;
  
  double textboxesLeft : "Deltarune.exe", 0x4E06B8, 0x24, 0x10, 0x3C0, 0x30, 0x0, 0x330;

  double fight : "Deltarune.exe", 0x4E17F0, 0x34, 0x154, 0x10, 0x24, 0x10, 0x54, 0x10;
  double fight2 : "Deltarune.exe", 0x4E06B8, 0x24, 0x10, 0x858, 0x290;
  
  // selfs
  double namerEvent : "Deltarune.exe", 0x43FE48, 0x630, 0xC, 0x140, 0x24, 0x10, 0xFC, 0x0;
  double doorCloseCon : "Deltarune.exe", 0x6F0BD0, 0x524, 0x84, 0x24, 0x10, 0x18, 0x0;

  double jevilDance : "Deltarune.exe", 0x6F0B48, 0x128, 0x24, 0x60, 0x24, 0x10, 0x4EC, 0x0;
  double jevilDance2 : "Deltarune.exe", 0x43FE48, 0x538, 0xC, 0x140, 0x24, 0x10, 0x4EC, 0x0;
}

state("Deltarune", "v1.08 - v1.10") {
  // static
  uint room : "Deltarune.exe", 0x6EF248;

  // globals
  double filechoice : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x1BC, 0x890;
  double filechoice2 : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x2DC, 0x310;
 
  double chapter : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x4C8, 0x5F0;
  double chapter2 : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x2DC, 0x480;
 
  double textboxesLeft : "Deltarune.exe", 0x6FCF3C, 0xCB8, 0x78, 0x24, 0x10, 0x624, 0x1F0;
  
  // selfs
  double namerEvent : "Deltarune.exe", 0x6EF220, 0xD4, 0x5C, 0x20, 0x24, 0x10, 0x9C, 0x0;
  double doorCloseCon : "Deltarune.exe", 0x6F1394, 0x4, 0x160, 0x1E0, 0x24, 0x10, 0x18, 0x0;
}

state("Deltarune", "SURVEY_PROGRAM") {
  // static
  uint room : "Deltarune.exe", 0x6AC9F0;
  
  // globals
  double money : "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x470;
  double fight : "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x490;
  double plot : "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x500;
  double filechoice : "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x4D0;
  double interact : "Deltarune.exe", 0x48E5DC, 0x27C, 0x28, 0x20;
  double choicer : "Deltarune.exe", 0x48E5DC, 0x27C, 0x28, 0x40;

  // selfs
  double doorCloseCon : "Deltarune.exe", 0x6ACA80, 0xC0, 0x4, 0x84, 0x60, 0x10, 0x10, 0x0;
  
  // Finding reliable pointers to these values is really weird so here's a few paths that appear to cover all the test cases Narry found so we don't need to use a sigscan
  double jevilDance : "Deltarune.exe", 0x48BDEC, 0x78, 0x60, 0x10, 0x10, 0x0;
  double jevilDance2 : "Deltarune.exe", 0x48BDEC, 0x7C, 0x60, 0x10, 0x10, 0x0;
  
  double finalTextboxHalt : "Deltarune.exe", 0x48BDEC, 0x98, 0x60, 0x10, 0x274, 0x0;
  double finalTextboxHalt2 : "Deltarune.exe", 0x48BDEC, 0x9C, 0x60, 0x10, 0x274, 0x0;
}

startup {

  #region Global Functions declaration

  vars.DebugPrint = (Action<string>)((text) => { print("[DELTARUNE]  " + text); });

  vars.DebugPrint("Autosplitter is starting up");

  vars.ch2EndFrameDelay = 0;

  // Based on: https://github.com/NoTeefy/LiveSnips/blob/master/src/snippets/checksum(hashing)/checksum.asl, used to calculate the hash of the game to detect the version
  vars.CalcModuleHash = (Func<ProcessModuleWow64Safe, string>)((module) => {
        vars.DebugPrint("Calculating hash of "+module.FileName);
        byte[] exeHashBytes = new byte[0];
        using (var sha = System.Security.Cryptography.MD5.Create())
        {
            using (var s = File.Open(module.FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                exeHashBytes = sha.ComputeHash(s);
            }
        }
        var hash = exeHashBytes.Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
        return hash;
    });

  vars.reactivate = (Func<bool>)(() => {
    vars.ch2EndFrameDelay = 0;
    int doneIndex = vars.findSplitVarIndex("done");
    foreach (string split in vars.splits.Keys)
      vars.splits[split][doneIndex] = false;

    vars.DebugPrint("[DELTARUNE] All splits have been reset to initial state");
    return true;
  });

  vars.findSplitVarIndex = (Func<string, int>)((variableName) => { return Array.IndexOf(vars.splitsVarIndex, variableName); });

  #endregion

  #region Global Variables declaration

  vars.prevUpdateTime = -1; // Previous time that the autosplitter updated to detect lags

  vars.startRooms = new object[] {};
  vars.resetRooms = new object[] {};

  vars.splits = new Dictionary<string, object[]>() {};
  vars.splitsVarIndex = new object[] {};

  #endregion

  #region Settings

  settings.Add("AC", false, "All Chapters");
      settings.SetToolTip("AC", "Enabling this will remove auto-reset function");
  settings.CurrentDefaultParent = "AC";
    settings.Add("Ch1_Ch2_PauseTimer", true, "Pause timer between Chapter 1 and 2");
      settings.SetToolTip("Ch1_Ch2_PauseTimer", "This setting pauses the timer when you end Chapter 1, and resumes it when you continue from a previous save in Chapter 2.\n\nNOTE: For this to work, Game Time must be enabled\n(you will be asked if you want to enable it by turning on this setting and opening the game if the timer isn't already running, or you can just do it yourself :keuchrCat:)");
  settings.CurrentDefaultParent = null;

  settings.Add("Ch1", false, "Chapter 1");
  settings.CurrentDefaultParent = "Ch1";
    settings.Add("Ch1_Intro", false, "Introduction");
      settings.Add("Ch1_Survey", true, "Survey", "Ch1_Intro");
      settings.Add("Ch1_School", true, "School / Bed Skip", "Ch1_Intro");
    settings.Add("Ch1_CastleTown", true, "Castle Town section");
      settings.Add("Ch1_Pre-CastleTown", false, "Pre-Castle Town (after chase slide)", "Ch1_CastleTown");
      settings.Add("Ch1_LancerFight", false, "Lancer Fight (SURVEY)", "Ch1_CastleTown");
      settings.Add("Ch1_CastleTown_DoorClose", true, "Castle Town (door close)", "Ch1_CastleTown");
      settings.Add("Ch1_CastleTown_RoomChange", false, "Castle Town (room change)", "Ch1_CastleTown");
    settings.Add("Ch1_Fields", true, "Fields section");
      settings.Add("Ch1_RudinnSkip#1", false, "Rudinn Skip 1", "Ch1_Fields");
      settings.Add("Ch1_RudinnSkip#2", false, "Rudinn Skip 2", "Ch1_Fields");
      settings.Add("Ch1_RudinnSkip#3", false, "Rudinn Skip 3", "Ch1_Fields");
      settings.Add("Ch1_VandalizedPuzzle", false, "Vandalized Puzzle", "Ch1_Fields");
      settings.Add("Ch1_KeyA", false, "Key A (Survey)", "Ch1_Fields");
      settings.Add("Ch1_Fields_Exit", true, "Rudinn Skip 4 / Exiting Fields", "Ch1_Fields");
    settings.Add("Ch1_Checkerboard", true, "Checkerboard");
      settings.Add("Ch1_PawnSkip#1", false, "Pawn Skip 1", "Ch1_Checkerboard");
      settings.Add("Ch1_PawnSkip#2", false, "Pawn Skip 2", "Ch1_Checkerboard");
      settings.Add("Ch1_Checkerboard_Exit", true, "Exiting Checkerboard", "Ch1_Checkerboard");
    settings.Add("Ch1_Forest", true, "Forest section");
      settings.Add("Ch1_KeyB", false, "Key B (Survey)", "Ch1_Forest");
      settings.Add("Ch1_BloxerSkip#1", false, "Bloxer Skip 1", "Ch1_Forest");
      settings.Add("Ch1_BakeSale", false, "Bake Sale", "Ch1_Forest");
      settings.Add("Ch1_BloxerSkip#2", false, "Bloxer Skip 2", "Ch1_Forest");
      settings.Add("Ch1_Maze_End", false, "Maze end", "Ch1_Forest");
      settings.Add("Ch1_Sussie&Lancer", false, "Sussie & Lancer fight (SURVEY)", "Ch1_Forest");
      settings.Add("Ch1_Sussie&Lancer_Exit", true, "Sussie & Lancer exit room", "Ch1_Forest");
      settings.Add("Ch1_Captured", false, "Captured", "Ch1_Forest");
    settings.Add("Ch1_Prison", true, "Prison section");
      settings.Add("Ch1_Escape_Cell", false, "Exiting Cell", "Ch1_Prison");
      settings.Add("Ch1_Escape_Elevator", true, "Entering Escape Elevator", "Ch1_Prison");
    settings.Add("Ch1_Jevil", false, "Jevil section");
      settings.Add("Ch1_KeyC", false, "Key C (Survey)", "Ch1_Jevil");
      settings.Add("Ch1_KeyFixed", false, "Key Fixed (Survey)", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_EnterRoom", false, "Enter Jevil room", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_StartBattle", false, "Start Jevil Battle (Survey)", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_ExitRoom", false, "Enter Jevil room", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_EndBattle", false, "End Jevil Battle (Survey)", "Ch1_Jevil");
    settings.Add("Ch1_CardCastle", true, "Card Castle section");
      settings.Add("Ch1_RudinnRangerSkip", false, "Rudinn Ranger Skip", "Ch1_CardCastle");
      settings.Add("Ch1_HeadHathySkip", false, "Head Hathy Skip", "Ch1_CardCastle");
      settings.Add("Ch1_Shopping", false, "After the shop, before K Round", "Ch1_CardCastle");
      settings.Add("Ch1_Throne_Enter", false, "Entering Card Castle's Throne room", "Ch1_CardCastle");
      settings.Add("Ch1_Throne_Exit", true, "Exiting Card Castle's Throne room", "Ch1_CardCastle");
      settings.Add("Ch1_King_EndBattle", false, "End King Battle (Survey)", "Ch1_CardCastle");
      settings.Add("Ch1_King_ExitBattleRoom", true, "Exit King Battle Room", "Ch1_CardCastle");
    settings.Add("Ch1_Ending", true, "Ending (inaccurate by a couple frames)");
  settings.CurrentDefaultParent = null;

  #endregion
}

exit {
  vars.DebugPrint("The game just exited");
}

init {
  vars.DebugPrint("Autosplitter is initializing");

  #region Version Detection

  var module = modules.Single(x => String.Equals(x.ModuleName, "Deltarune.exe", StringComparison.OrdinalIgnoreCase));
  string hash = vars.CalcModuleHash(module);

  vars.DebugPrint("Module Size = " + module.ModuleMemorySize + " Hash = " + hash);

  switch(hash) {
    case "A9DB8B7FB6333B5E267F574F46076B3F":
      version = "v1.15";
      break;
    case "4D09627E1FA123D12DDF1A496C489F73":
      version = "SURVEY_PROGRAM";
      break;
    default:
      switch(module.ModuleMemorySize) {
        case 7495680:
          version = "v1.08 - v1.10";
          break;
        case 7491584:
          version = "v1.00 - v1.07";
          break;
        default:
          vars.DebugPrint("Unable to recognize the game version");
          return;
      }
    break;
  }

  vars.DebugPrint("Detected version: " + version);

  #endregion

  #region Version variables (Splits, Start Rooms, Reset Rooms, ...)
  switch(version) {
    case "v1.15":
    case "v1.08 - v1.10":
      vars.startRooms = new object[] { 282 };
      vars.resetRooms = new object[] { 234, 279, 413 };
      vars.splitsVarIndex = new object[] { "done", "oldRoom", "currentRoom", "specialCondition" };
      vars.splits = new Dictionary<string, object[]>() {
        {"Ch1_CastleTown_Intro", new object[] {false, 282, 283, -1}},
        {"Ch1_CastleTown_EnterBed", new object[] {false, 283, 315, -1}},
        {"Ch1_CastleTown_GreatDoor", new object[] {false, -1, 329, 424}}
      };

      if(timer.CurrentPhase == TimerPhase.NotRunning && timer.CurrentTimingMethod == TimingMethod.RealTime && settings["pausetimer"]) {
        var message = MessageBox.Show(
            "LiveSplit uses Game Time for this game. Would you like to change the current timing method to Game Time instead of Real Time?",
            "LiveSplit | DELTARUNE All Chapters", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
      
        if (message == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
      }
      break;
    case "SURVEY_PROGRAM":
      vars.checkKeyItems = (Func<int, bool>)((id) => {
        for (int i = 0; i < 12; i++){
          if (new DeepPointer("Deltarune.exe", 0x49D598, 0x264, (0x1A00 + (i*0x10))).Deref<double>(game) == id) return true;
        }
        return false;
      });
      vars.startRooms = new object[] { 1 };
      vars.resetRooms = new object[] { 132, 139 };
      vars.splitsVarIndex = new object[] { "done", "maxPlot", "exactPlot", "oldRoom", "currentRoom", "oldFight", "currentFight", "specialCondition" };
      vars.splits = new Dictionary<string, object[]>() {
        // Castle Town
        {"Ch1_CastleTown_Intro", new object[] {false, -1, -1, 1, 2, -1, -1, -1}},
        {"Ch1_CastleTown_EnterBed", new object[] {false, -1, -1, 2, 34, -1, -1, -1}},
        {"Ch1_CastleTown_WristProtector", new object[] {false, -1, -1, 34, 35, -1, -1, -1}},
        {"Ch1_CastleTown_SavePointRoom", new object[] {false, -1, -1, 35, 36, -1, -1, -1}},
        {"Ch1_CastleTown_WindyMovement", new object[] {false, -1, -1, 36, 37, -1, -1, -1}},
        {"Ch1_CastleTown_FirstSlidesRoom", new object[] {false, -1, -1, 37, 39, -1, -1, -1}},
        {"Ch1_CastleTown_Pre-EyesPuzzleRoom", new object[] {false, -1, -1, 39, 40, -1, -1, -1}},
        {"Ch1_CastleTown_EyesPuzzle", new object[] {false, -1, -1, 40, 41, -1, -1, -1}},
        {"Ch1_CastleTown_SecondSlidesRoom", new object[] {false, -1, -1, 41, 42, -1, -1, -1}},
        {"Ch1_CastleTown_Chase1Room", new object[] {false, -1, -1, 42, 43, -1, -1, -1}},
        {"Ch1_CastleTown_Chase2Room", new object[] {false, -1, -1, 43, 44, -1, -1, -1}},
        {"Ch1_CastleTown_Post-ChaseRoom", new object[] {false, -1, -1, 44, 45, -1, -1, -1}},
        {"Ch1_CastleTown_EmptyTown#1", new object[] {false, -1, -1, 45, 46, -1, -1, -1}},
        {"Ch1_CastleTown_Pre-Lancer", new object[] {false, -1, -1, -1, 46, 0, 1, -1}},
        {"Ch1_CastleTown_Lancer", new object[] {false, -1, -1, -1, 46, 1, 0, -1}},
        {"Ch1_CastleTown_Post-Lancer", new object[] {false, -1, -1, 46, 45, -1, -1, -1}},
        {"Ch1_CastleTown_EmptyTown#2", new object[] {false, -1, -1, 45, 47, -1, -1, -1}},
        {"Ch1_CastleTown_DummyRoom", new object[] {false, -1, -1, 47, 48, -1, -1, -1}},
        {"Ch1_CastleTown_GreatDoor", new object[] {false, -1, -1, -1, 48, -1, -1, 424}},

        // Fields
        // {"savepointroomF", new object[] {false, -1, -1, 49, 50, -1, -1, -1}},
        // {"fields2ndroom", new object[] {false, -1, -1, 50, 51, -1, -1, -1}},
        // {"rudinn1skip", new object[] {false, -1, -1, 51, 52, -1, -1, -1}},
        // {"rudinn2skip", new object[] {false, -1, -1, 52, 54, -1, -1, -1}},
        // {"brokencakeroom", new object[] {false, -1, -1, 54, 55, -1, -1, -1}},
        // {"rudinn3skip", new object[] {false, -1, -1, 55, 56, -1, -1, -1}},
        // {"pre-hathy", new object[] {false, -1, -1, -1, 56, 0, 1, -1}},
        // {"hathyfight", new object[] {false, -1, -1, -1, 56, 1, 0, -1}},
        // {"post-hathy", new object[] {false, -1, -1, 56, 57, -1, -1, -1}},
        // {"puzzleroom#1", new object[] {false, -1, -1, 57, 58, -1, -1, -1}},
        // {"susiejoinedtheparty", new object[] {false, -1, -1, 58, 57, -1, -1, -1}},
        // {"puzzleroom#2", new object[] {false, -1, -1, 57, 58, -1, -1, 8}},
        // {"pre-cround", new object[] {false, -1, -1, -1, 58, 0, 1, -1}},
        // {"cround", new object[] {false, -1, -1, -1, 58, 1, 0, -1}},
        // {"post-cround", new object[] {false, -1, -1, 58, 59, -1, -1, -1}},
        // {"savepointroomSF", new object[] {false, -1, -1, 59, 61, -1, -1, -1}},
        // {"pre-jigsawry", new object[] {false, -1, -1, -1, 61, 0, 1, -1}},
        // {"jigsawry", new object[] {false, -1, -1, -1, 61, 1, 0, -1}},
        // {"post-jigsawry", new object[] {false, -1, -1, 61, 62, -1, -1, -1}},
        // {"boxpushingpuzzle", new object[] {false, -1, -1, 62, 63, -1, -1, -1}},
        // {"rudinn4skip", new object[] {false, -1, -1, 63, 65, -1, -1, -1}},

        // //Checkboard
        // {"whitetiles#1", new object[] {false, -1, -1, 65, 66, -1, -1, -1}},
        // {"ponman1skip", new object[] {false, -1, -1, 66, 67, -1, -1, -1}},
        // {"whitetiles#2", new object[] {false, -1, -1, 67, 68, -1, -1, -1}},
        // {"lancercutsceneroom", new object[] {false, -1, -1, 68, 69, -1, -1, -1}},
        // {"whitetiles#3", new object[] {false, -1, -1, 69, 70, -1, -1, -1}},
        // {"ponman2skip", new object[] {false, -1, -1, 70, 71, -1, -1, -1}},
        // {"savepointroomCB", new object[] {false, -1, -1, 71, 72, -1, -1, -1}},
        // {"pre-kround", new object[] {false, -1, -1, -1, 72, 0, 1, -1}},
        // {"kround", new object[] {false, -1, -1, -1, 72, 1, 0, -1}},
        // {"post-kround", new object[] {false, -1, -1, 72, 73, -1, -1, -1}},

        // //Forest
        // {"savepointroomFo#1", new object[] {false, -1, -1, 73, 74, -1, -1, -1}},
        // {"rabbickskip#1", new object[] {false, -1, -1, 74, 75, -1, -1, -1}},
        // {"rabbickskip#2", new object[] {false, -1, -1, 75, 76, -1, -1, -1}},
        // {"spinningdiamondsroom", new object[] {false, -1, -1, 76, 78, -1, -1, -1}},
        // {"suitpuzzle#1", new object[] {false, -1, -1, 78, 79, -1, -1, -1}},
        // {"bloxer1skip", new object[] {false, -1, -1, 79, 81, -1, -1, -1}},
        // {"pre-clover", new object[] {false, -1, -1, -1, 81, 0, 1, -1}},
        // {"clover", new object[] {false, -1, -1, -1, 81, 1, 0, -1}},
        // {"post-clover", new object[] {false, -1, -1, 81, 82, -1, -1, -1}},
        // {"bakesale", new object[] {false, -1, -1, 82, 84, -1, -1, -1}},
        // {"bloxer2skip", new object[] {false, -1, -1, 84, 85, -1, -1, -1}},
        // {"scissorsdancersroom", new object[] {false, -1, -1, 85, 87, -1, -1, -1}},
        // {"trashmachine", new object[] {false, -1, -1, 87, 88, -1, -1, -1}},
        // {"starwalkerroom", new object[] {false, -1, -1, 88, 89, -1, -1, -1}},
        // {"hiddenswitchroom", new object[] {false, -1, -1, 89, 90, -1, -1, -1}},
        // {"savepointroomFo#2", new object[] {false, -1, -1, 90, 91, -1, -1, -1}},
        // {"mazeroomfirstpart", new object[] {false, -1, -1, 91, 93, -1, -1, -1}},
        // {"mazeroommSusie", new object[] {false, -1, -1, 93, 94, -1, -1, -1}},
        // {"mazeroomsecondpart", new object[] {false, -1, -1, 94, 96, -1, -1, -1}},
        // {"savepointroomFo#3", new object[] {false, -1, -1, 96, 97, -1, -1, -1}},
        // {"pre-susielancer", new object[] {false, -1, -1, -1, 97, 0, 1, -1}},
        // {"susielancer", new object[] {false, -1, -1, -1, 97, 1, 0, -1}},
        // {"post-susielancer", new object[] {false, -1, -1, 97, 98, -1, -1, -1}},

        // //Escape
        // {"autoscroller#1", new object[] {false, -1, -1, 98, 99, -1, -1, -1}},
        // {"autoscroller#2", new object[] {false, -1, -1, 99, 100, -1, -1, -1}},
        // {"autoscroller#3", new object[] {false, -1, -1, 100, 101, -1, -1, -1}},
        // {"autoscroller#4", new object[] {false, -1, -1, 101, 102, -1, -1, -1}},
        // {"chase1roomFo", new object[] {false, -1, -1, 102, 103, -1, -1, -1}},
        // {"chase2roomFo", new object[] {false, -1, -1, 103, 104, -1, -1, -1}},
        // {"capturedcutscene", new object[] {false, -1, -1, 104, 105, -1, -1, -1}},
        // {"prizonpuzzle", new object[] {false, -1, -1, 105, 106, -1, -1, -1}},
        // {"pre-susiefight", new object[] {false, -1, -1, -1, 106, 0, 1, -1}},
        // {"susiefight", new object[] {false, -1, -1, -1, 106, 1, 0, -1}},
        // {"post-susiefight", new object[] {false, -1, -1, 106, 105, -1, -1, -1}},
        // {"escapeprisoncutscene", new object[] {false, -1, -1, 105, 106, -1, -1, 9}},
        // {"enterelevator#1", new object[] {false, -1, -1, 106, 107, -1, -1, -1}},
        // {"enterelevator#2", new object[] {false, -1, -1, 107, 109, -1, -1, -1}},
        // {"elevator", new object[] {false, -1, -1, 109, 114, -1, -1, -1}},
        // {"rudinnrangerskip", new object[] {false, -1, -1, 114, 116, -1, -1, -1}},
        // {"spinningdiamondsroom#1Castle", new object[] {false, -1, -1, 116, 117, -1, -1, -1}},
        // {"rouxlspuzzle#1", new object[] {false, -1, -1, 117, 116, -1, -1, -1}},
        // {"spinningdiamondsroom#2Castle", new object[] {false, -1, -1, 116, 118, -1, -1, -1}},
        // {"headhathyskip", new object[] {false, -1, -1, 118, 120, -1, -1, -1}},
        // {"scissordancersroom#1", new object[] {false, -1, -1, 120, 121, -1, -1, -1}},
        // {"rouxlspuzzle#2", new object[] {false, -1, -1, 121, 120, -1, -1, -1}},
        // {"scissordancersroom#2", new object[] {false, -1, -1, 120, 123, -1, -1, -1}},
        // {"cardcastle5f#1", new object[] {false, -1, -1, 123, 134, -1, -1, -1}},
        // {"hipshop", new object[] {false, -1, -1, 134, 123, -1, -1, -1}},
        // {"cardcastle5f#2", new object[] {false, -1, -1, 123, 125, -1, -1, -1}},
        // {"pre-kroundcastle", new object[] {false, -1, -1, -1, 125, 0, 1, -1}},
        // {"kroundcastle", new object[] {false, -1, -1, -1, 125, 1, 0, -1}},
        // {"post-kroundcastle", new object[] {false, -1, -1, 125, 126, -1, -1, -1}},

        // //Chaos King
        // {"cardcastlethrone", new object[] {false, -1, -1, 126, 127, -1, -1, -1}},
        // {"pre-kingroom", new object[] {false, -1, -1, 127, 128, -1, -1, -1}},
        // {"pre-king", new object[] {false, -1, -1, -1, 128, 0, 1, -1}},
        // {"king", new object[] {false, -1, -1, -1, 128, 1, 0, -1}},
        // {"post-king", new object[] {false, -1, -1, 128, 129, -1, -1, -1}},

        // //Sleep
        // {"post-kingroom", new object[] {false, -1, -1, 129, 130, -1, -1, -1}},
        // {"fountaincutscene", new object[] {false, -1, -1, 130, 33, -1, -1, -1}},
        // {"unusedclassroom", new object[] {false, -1, -1, 33, 31, -1, -1, -1}},
        // {"school1", new object[] {false, -1, -1, 31, 29, -1, -1, -1}},
        // {"school2", new object[] {false, -1, -1, 29, 14, -1, -1, -1}},
        // {"hometownschool", new object[] {false, -1, -1, 14, 13, -1, -1, -1}},
        // {"hometownlibrary", new object[] {false, -1, -1, 13, 11, -1, -1, -1}},
        // {"hometownsans", new object[] {false, -1, -1, 11, 9, -1, -1, -1}},
        // {"hometownscatty", new object[] {false, -1, -1, 9, 7, -1, -1, -1}},
        // {"hometowntorielhouse", new object[] {false, -1, -1, 7, 5, -1, -1, -1}},
        // {"torielhouse#1", new object[] {false, -1, -1, 5, 3, -1, -1, -1}},
        // {"torielhouse#2", new object[] {false, -1, -1, 3, 2, -1, -1, -1}},
      };
      break;
  }
  #endregion
}

update {
  // Debug output
    var timeSinceLastUpdate = Environment.TickCount - vars.prevUpdateTime;
    if (timeSinceLastUpdate > 500 && vars.prevUpdateTime != -1)
    {
        vars.DebugPrint("Last update was "+timeSinceLastUpdate+"ms ago !");
    }
    vars.prevUpdateTime = Environment.TickCount;

  if (version == "") return false; // Disable the autosplitter when game version is unknown
  if (version == "v1.00 - v1.07") { vars.DebugPrint("Version v1.00 - v1.07 is not longer supported"); return false; }

  if (current.room != old.room) {
    vars.DebugPrint("ROOM " + old.room + " -> " + current.room);
    if(version != "SURVEY_PROGRAM" && timer.IsGameTimePaused == true && settings["pausetimer"] && current.room == 28)
    {
      vars.DebugPrint("ALL CHAPTERS: Chapter 2 started, timer resumed");
      timer.IsGameTimePaused = false;
    }
  }
  if (((IDictionary<String, object>)current).ContainsKey("plot") && current.plot != old.plot) vars.DebugPrint("PLOT " + old.plot + " -> " + current.plot);
  if (((IDictionary<String, object>)current).ContainsKey("fight") && current.fight != old.fight) vars.DebugPrint("FIGHT " + (current.fight == 1 ? "STARTED" : "ENDED"));
}

start {
  if (!settings.StartEnabled) return;

  if(current.namerEvent == 75 && old.namerEvent == 74) { vars.DebugPrint("START (Start Event for Chapter 2 detected)"); return true; }

  foreach(int startRoom in vars.startRooms)
    if (current.room == startRoom) { vars.DebugPrint("START (Start Room " + startRoom + " detected)"); return true; }

}

onStart {
  vars.DebugPrint("START !");
}

reset {
  if (!settings.ResetEnabled) return;
  if (settings["AC"]) return;

  foreach(int resetRoom in vars.resetRooms)
    if (current.room == resetRoom) { vars.DebugPrint("RESET (Reset Room " + resetRoom + " detected)"); return true; }

}

onReset {
  vars.DebugPrint("RESET !");
  vars.reactivate();
}

split {
  if (!settings.SplitEnabled) return;

  switch(version) {
    case "v1.15":
    case "v1.08 - v1.10":
      // Chapter 1 end
      if((current.chapter == 1 || current.chapter2 == 1) && (current.filechoice == old.filechoice + 3 || current.filechoice2 == old.filechoice2 + 3)) {
        /*
        When the final textbox is closed, the game stores global.filechoice in a temp var
        it then sets global.filechoice + 3, saves the game, and then sets it back
        we can use this to get the frame after the textbox was closed by looking for filechoice > 2
        as this will only be valid in this one case
        */
        if(settings["pausetimer"]) {
          vars.DebugPrint("ALL CHAPTERS: Chapter 1 ended, timer paused");
          timer.IsGameTimePaused = true;
        }
        return settings["Ch1_Ending"];
      }

      // Chapter 2 end (needs to split 2 frames later)
      if(vars.ch2EndFrameDelay == 1 || (current.chapter == 2 || current.chapter2 == 2) && current.room == 31 && ((current.textboxesLeft == 0 && old.textboxesLeft == 5))) {
        vars.ch2EndFrameDelay += 1;
        return (vars.ch2EndFrameDelay == 2);
      }

      foreach(string splitKey in vars.splits.Keys){
        if (!settings[splitKey] || vars.splits[splitKey][vars.findSplitVarIndex("done")]) // Checking if the split isn't already done or not enabled
          continue;

        // is there a current room requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("currentRoom")] != -1) && (current.room != vars.splits[splitKey][vars.findSplitVarIndex("currentRoom")]))
          continue;

        // is there an old room requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("oldRoom")] != -1) && (old.room != vars.splits[splitKey][vars.findSplitVarIndex("oldRoom")]))
          continue;

        // is there a current fight requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("currentFight")] != -1) && (current.fight != vars.splits[splitKey][vars.findSplitVarIndex("currentFight")]))
            continue;

        // is there an old fight requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("oldFight")] != -1) && (old.fight != vars.splits[splitKey][vars.findSplitVarIndex("oldFight")]))
            continue;

        // is there a special flag requirement?
        if (vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")] != -1) {
          bool pass = false;
          switch((int)vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")]) {
            case 7: // Ch1_Jevil_EndBattle 
                /*
                Jevil has a variable named dancelv which sets the sprite/animation he's using
                0 - Default, 1 - Bounce, 2 - Sad, 3 - Teleports, 4 - Dead
                We use this to determine when he's been pacified
                */
                pass = (current.jevilDance == 4 || current.jevilDance2 == 4);
                break;
            case 424: // Ch1_CastleTown_GreatDoor
              pass = (current.doorCloseCon == 21 && old.doorCloseCon == 7);
              break;
          }

          if (!pass) continue;
        }

        vars.splits[splitKey][vars.findSplitVarIndex("done")] = true;

        vars.DebugPrint("SPLIT (" + splitKey + ")");

        return true;
      }
      break;
    case "SURVEY_PROGRAM":
      foreach (string splitKey in vars.splits.Keys) {

        if (!settings[splitKey] || vars.splits[splitKey][vars.findSplitVarIndex("done")]) // Checking if the split isn't already done or not enabled
          continue;

        // is there a current room requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("currentRoom")] != -1) && (current.room != vars.splits[splitKey][vars.findSplitVarIndex("currentRoom")]))
            continue;

        // is there an old room requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("oldRoom")] != -1) && (old.room != vars.splits[splitKey][vars.findSplitVarIndex("oldRoom")]))
            continue;

        // is there an exact plot requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("exactPlot")] != -1) && (current.plot != vars.splits[splitKey][vars.findSplitVarIndex("exactPlot")]))
            continue;

        // is there a maximum plot requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("maxPlot")] != -1) && (current.plot > vars.splits[splitKey][vars.findSplitVarIndex("maxPlot")]))
            continue;

        // is there a current fight requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("currentFight")] != -1) && (current.fight != vars.splits[splitKey][vars.findSplitVarIndex("currentFight")]))
            continue;

        // is there an old fight requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("oldFight")] != -1) && (old.fight != vars.splits[splitKey][vars.findSplitVarIndex("oldFight")]))
            continue;
        
        // is there a special flag requirement?
        if (vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")] != -1) {
            bool pass = false;

            switch((int)vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")]) {
                case 1:  // Ch1_end (Survey)
                    pass = (current.filechoice > 2);
                    break;
                case 2:  // Ch1_end (Survey)
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
                case 7: // Ch1_Jevil_EndBattle
                    pass = (current.jevilDance == 4 || current.jevilDance2 == 4);
                    break;
                case 424: // Ch1_CastleTown_GreatDoor
                    pass = (current.doorCloseCon == 21 && old.doorCloseCon == 7);
                    break;
            }

            if (!pass) continue;
        }

        // if we get to this point, all requirements are met
        vars.splits[splitKey][vars.findSplitVarIndex("done")] = true;

        vars.DebugPrint("SPLIT (" + splitKey + ")");

        return true;
      }
    break;
  }
}

onSplit {
  vars.DebugPrint("SPLIT !");
}
