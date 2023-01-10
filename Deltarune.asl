// DELTARUNE autosplitter by Tenebrosful
// Inspired by Narry's Autosplitter based on Glacia's Undertale autosplitter (But I don't understand everything so I made my own) (https://drive.google.com/file/d/1SCpuUpDgIYHmbc6xKK3ZrNk1zaIeDUMq/view?usp=sharing)
// filechoice on demo is used for ending chapter 1 and pausing the timer in all chapters (by NERS)
state("Deltarune", "v1.15") {
  uint room : "Deltarune.exe", 0x6F0B70;

  double filechoice : "Deltarune.exe", 0x4E17F0, 0x34, 0x154, 0x10, 0x24, 0x10, 0x54, 0x110;
  double filechoice2 : "Deltarune.exe", 0x6FE864, 0x828, 0x78, 0x24, 0x10, 0x858, 0x2F0; // for SOME reason if you start chapter 2 first and then go into chapter 1 the first pointer doesn't work so i had to find a separate one
}

state("Deltarune", "v1.08 - v1.10") {
  uint room : "Deltarune.exe", 0x6EF248;

  // gotta find filechoice pointers for the 1.09 enthusiasts too someday
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

startup {

  #region Global Functions declaration

  vars.DebugPrint =(Action<string>)((text) => { print("[DELTARUNE]  " + text); });

  vars.DebugPrint("Autosplitter is starting up");

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
    int doneIndex = vars.findSplitVarIndex("done");
    foreach (string split in vars.splits.Keys)
      vars.splits[split][doneIndex] = false;

    print("[DELTARUNE] All splits have been reset to initial state");
    return true;
  });

  vars.findSplitVarIndex = (Func<string, int>)((variableName) => { return Array.IndexOf(vars.splitsVarIndex, variableName); });

  #endregion

  #region Global Variables declaration

  vars.prevUpdateTime = -1; // Previous time that the autosplitter updated to detect lags
  vars.isGameClose = true;

  vars.startRooms = new object[] {};
  vars.resetRooms = new object[] {};

  vars.splits = new Dictionary<string, object[]>() {};
  vars.splitsVarIndex = new object[] {};

  vars.currentCategoryPrefix = null;

  #endregion

  #region Settings

  #region All Chapters Settings
  settings.Add("AC", false, "All Chapters");

  #region All Chapters All Bosses Settings
  settings.Add("AC_AB", false, "All Bosses", "AC");
    // settings.Add("AC_AB$Ch1", true, "Chapter 1", "AC_AB");
    // settings.CurrentDefaultParent = "AC_AB$Ch1";
    //   settings.Add("AC_AB$Ch1_CastleTown", true, "Castle Town");
    // settings.CurrentDefaultParent = "AC_AB$Ch1_CastleTown";
    //   settings.Add("AC_AB$Ch1_CastleTown_Intro", false, "Introduction");
    //   settings.Add("AC_AB$Ch1_CastleTown_EnterBed", false, "Enter Bed");
    //   settings.Add("AC_AB$Ch1_CastleTown_WristProtector", false, "Wrist Protector");
    //   settings.Add("AC_AB$Ch1_CastleTown_SavePointRoom", false, "Save Point Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_WindyMovement", false, "Windy Movement");
    //   settings.Add("AC_AB$Ch1_CastleTown_FirstSlidesRoom", false, "First Slides Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_Pre-EyesPuzzleRoom", false, "Pre-Eyes Puzzle Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_EyesPuzzle", false, "Eyes Puzzle");
    //   settings.Add("AC_AB$Ch1_CastleTown_SecondSlidesRoom", false, "Second Slides Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_Chase1Room", false, "Chase 1 Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_Chase2Room", false, "Chase 2 Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_Post-ChaseRoom", false, "Post-Chase Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_EmptyTown#1", false, "Empty Town #1");
    //   settings.Add("AC_AB$Ch1_CastleTown_Pre-Lancer", false, "Pre-Lancer (SURVEY ONLY)");
    //   settings.Add("AC_AB$Ch1_CastleTown_Lancer", false, "Lancer (SURVEY ONLY)");
    //   settings.Add("AC_AB$Ch1_CastleTown_Post-Lancer", false, "Post-Lancer");
    //   settings.Add("AC_AB$Ch1_CastleTown_EmptyTown#2", false, "Empty Town #2");
    //   settings.Add("AC_AB$Ch1_CastleTown_DummyRoom", false, "Dummy Room");
    //   settings.Add("AC_AB$Ch1_CastleTown_GreatDoor", true, "Great Door");
    // settings.CurrentDefaultParent = null;
    // settings.Add("AC_AB$Ch1ToCh2", true, "Switching Chapter 1 -> 2", "AC_AB");
    // settings.Add("AC_AB$Ch2", true, "Chapter 2", "AC_AB");
    // settings.CurrentDefaultParent = "AC_AB$Ch2";
  #endregion

  #region All Chapters Main Route / All Recruits Settings
  settings.Add("AC_MR", false, "Main Route / All Recruits", "AC");
    settings.Add("AC_MR$Ch1", true, "Chapter 1", "AC_MR");
    settings.CurrentDefaultParent = "AC_MR$Ch1";
    settings.CurrentDefaultParent = null;
    settings.Add("AC_MR$Ch1ToCh2", true, "Switching Chapter 1 -> 2", "AC_MR");
    settings.Add("AC_MR$Ch2", true, "Chapter 2", "AC_MR");
    settings.CurrentDefaultParent = "AC_MR$Ch2";
  #endregion

  #region All Chapters Snowgrave Settings
  settings.Add("AC_SG", false, "Snowgrave", "AC");
    settings.Add("AC_SG$Ch1", true, "Chapter 1", "AC_SG");
    settings.CurrentDefaultParent = "AC_SG$Ch1";
    settings.CurrentDefaultParent = null;
    settings.Add("AC_SG$Ch1ToCh2", true, "Switching Chapter 1 -> 2", "AC_SG");
    settings.Add("AC_SG$Ch2", true, "Chapter 2", "AC_SG");
    settings.CurrentDefaultParent = "AC_SG$Ch2";
  #endregion

  settings.CurrentDefaultParent = null;
  #endregion

  #region Chapter 1 Settings
  settings.Add("Ch1", false, "Chapter 1");

  #region Any% / True Pacifist Settings
  settings.Add("Ch1_Any", false, "Any% / True Pacifist", "Ch1");
    settings.Add("Ch1_Any$Ch1_CastleTown", true, "Castle Town", "Ch1_Any");
    settings.CurrentDefaultParent = "Ch1_Any$Ch1_CastleTown";
      settings.Add("Ch1_Any$Ch1_CastleTown_Intro", false, "Introduction");
      settings.Add("Ch1_Any$Ch1_CastleTown_EnterBed", false, "Enter Bed");
      settings.Add("Ch1_Any$Ch1_CastleTown_WristProtector", false, "Wrist Protector");
      settings.Add("Ch1_Any$Ch1_CastleTown_SavePointRoom", false, "Save Point Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_WindyMovement", false, "Windy Movement");
      settings.Add("Ch1_Any$Ch1_CastleTown_FirstSlidesRoom", false, "First Slides Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_Pre-EyesPuzzleRoom", false, "Pre-Eyes Puzzle Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_EyesPuzzle", false, "Eyes Puzzle");
      settings.Add("Ch1_Any$Ch1_CastleTown_SecondSlidesRoom", false, "Second Slides Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_Chase1Room", false, "Chase 1 Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_Chase2Room", false, "Chase 2 Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_Post-ChaseRoom", false, "Post-Chase Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_EmptyTown#1", false, "Empty Town #1");
      settings.Add("Ch1_Any$Ch1_CastleTown_Pre-Lancer", false, "Pre-Lancer (SURVEY ONLY)");
      settings.Add("Ch1_Any$Ch1_CastleTown_Lancer", false, "Lancer (SURVEY ONLY)");
      settings.Add("Ch1_Any$Ch1_CastleTown_Post-Lancer", false, "Post-Lancer");
      settings.Add("Ch1_Any$Ch1_CastleTown_EmptyTown#2", false, "Empty Town #2");
      settings.Add("Ch1_Any$Ch1_CastleTown_DummyRoom", false, "Dummy Room");
      settings.Add("Ch1_Any$Ch1_CastleTown_GreatDoor", true, "Great Door");
    settings.CurrentDefaultParent = null;
    settings.Add("Ch1_Any$Ch1_Fields", true, "Fields", "Ch1_Any");
    settings.CurrentDefaultParent = "Ch1_Any$Ch1_Fields";
      settings.Add("Ch1_Any$Ch1_Fields_RudinnSkip#1", false, "Rudinn Skip 1");
      settings.Add("Ch1_Any$Ch1_Fields_RudinnSkip#2", false, "Rudinn Skip 2");
      settings.Add("Ch1_Any$Ch1_Fields_RudinnSkip#3", false, "Rudinn Skip 3");
      settings.Add("Ch1_Any$Ch1_VandalizedPuzzle", false, "Vandalized Puzzle");
      settings.Add("Ch1_Any$Ch1_Fields_RudinnSkip#4", true, "Rudinn Skip 4 / Exiting Fields");
    settings.CurrentDefaultParent = null;
    settings.Add("Ch1_Any$Ch1_Checkerboard", true, "Checkerboard", "Ch1_Any");
    settings.CurrentDefaultParent = "Ch1_Any$Ch1_Checkerboard";
      settings.Add("Ch1_Any$Ch1_PawnSkip#1", false, "Pawn Skip 1");
      settings.Add("Ch1_Any$Ch1_PawnSkip#2", false, "Pawn Skip 2");
      settings.Add("Ch1_Any$Ch1_ExitCheckerboard", true, "Exiting Checkerboard");
    settings.CurrentDefaultParent = null;
    settings.Add("Ch1_Any$Ch1_Forest", true, "Forest", "Ch1_Any");
    settings.CurrentDefaultParent = "Ch1_Any$Ch1_Forest";
      settings.Add("Ch1_Any$Ch1_BloxerSkip#1", false, "Bloxer Skip 1");
      settings.Add("Ch1_Any$Ch1_BloxerSkip#2", false, "Bloxer Skip 2");
      settings.Add("Ch1_Any$Ch1_ExitForest", true, "Exiting Forest");
    settings.CurrentDefaultParent = null;
    settings.Add("Ch1_Any$Ch1_prison", true, "Prison", "Ch1_Any");
    settings.CurrentDefaultParent = "Ch1_Any$Ch1_prison";
      settings.Add("Ch1_Any$Ch1_Captured", false, "Captured");
      settings.Add("Ch1_Any$Ch1_ExitPrison", true, "Exiting Prison");
    settings.CurrentDefaultParent = null;
    // settings.Add("ch1cardcastle", true, "Card Castle", "ch1");
    //   settings.Add("ch1rudinnrangerskip", false, "Rudinn Ranger Skip", "ch1cardcastle");
    //   settings.Add("ch1headhathyskip", false, "Head Hathy Skip", "ch1cardcastle");
    //   settings.Add("ch1shopping", false, "After the shop, before K Round", "ch1cardcastle");
    //   settings.Add("ch1exitthrone", true, "Exiting Card Castle's Throne room", "ch1cardcastle");
    //   settings.Add("ch1king", true, "After King Battle", "ch1cardcastle");
    // settings.Add("ch1ending", true, "Light World (End)", "ch1");
    //   settings.Add("ch1theend", true, "The End (Final Text Dismissed)", "ch1ending");
  #endregion

  #region
  settings.Add("Ch1_AB", false, "All Bosses", "Ch1");
  settings.CurrentDefaultParent = "Ch1_AB";
  #endregion

  settings.CurrentDefaultParent = null;
  #endregion

  #region Chapter 2 Settings
  settings.Add("Ch2", false, "Chapter 2");

  #region Chapter 2 Main Route / All Recruits Settings
  settings.Add("Ch2_MR", false, "Main Route / All Recruits", "Ch2");
  settings.CurrentDefaultParent = "Ch2_MR";
  #endregion

  #region Chapter 2 Snowgrave Settings
  settings.Add("Ch2_SG", false, "Snowgrave", "Ch2");
  settings.CurrentDefaultParent = "Ch2_SG";
  #endregion

  #region Chapter 2 All Bosses Settings
  settings.Add("Ch2_AB", false, "All Bosses", "Ch2");
  settings.CurrentDefaultParent = "Ch2_AB";
  #endregion

  settings.CurrentDefaultParent = null;
  #endregion

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
        {"Ch1_CastleTown_EnterBed", new object[] {false, 283, 315, -1}}
      };
      break;
    case "SURVEY_PROGRAM":
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
        {"Ch1_CastleTown_GreatDoor", new object[] {false, -1, -1, 48, 49, -1, -1, -1}},

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

        //Ends on the textwriter being discarded
        // {"theend", new object[] {false, -1, 251, -1, 2, -1, -1, 2}},
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

  if (current.room != old.room) vars.DebugPrint("ROOM " + old.room + " -> " + current.room);
  if (((IDictionary<String, object>)current).ContainsKey("plot") && current.plot != old.plot) vars.DebugPrint("PLOT " + old.plot + " -> " + current.plot);
  if (((IDictionary<String, object>)current).ContainsKey("fight") && current.fight != old.fight) vars.DebugPrint("FIGHT " + (current.fight == 1 ? "STARTED" : "ENDED"));
}

start {
  if (!settings.StartEnabled) return;

  foreach(int startRoom in vars.startRooms)
    if (current.room == startRoom) { vars.DebugPrint("START (Start Room " + startRoom + " detected)"); return true; }

}

onStart {
  vars.DebugPrint("START !");
  if (settings["AC_MR"]) { vars.currentCategoryPrefix = "AC_MR$"; vars.DebugPrint("Selected category: All Chapters Main Route"); }
  else if (settings["AC_SG"]) { vars.currentCategoryPrefix = "AC_SG$"; vars.DebugPrint("Selected category: All Chapters Snowgrave"); }
  else if (settings["AC_AB"]) { vars.currentCategoryPrefix = "AC_AB$"; vars.DebugPrint("Selected category: All Chapters All Bosses"); }

  else if (settings["Ch1_Any"]) { vars.currentCategoryPrefix = "Ch1_Any$"; vars.DebugPrint("Selected category: Chapter 1 Any% / True Pacifist"); }
  else if (settings["Ch1_AB"]) { vars.currentCategoryPrefix = "Ch1_AB$"; vars.DebugPrint("Selected category: Chapter 1 All Bosses"); }

  else if (settings["Ch2_MR"]) { vars.currentCategoryPrefix = "Ch2_MR$"; vars.DebugPrint("Selected category: Chapter 2 Main Route / All Recruits"); }
  else if (settings["Ch2_SG"]) { vars.currentCategoryPrefix = "Ch2_SG$"; vars.DebugPrint("Selected category: Chapter 2 Snowgrave"); }
  else if (settings["Ch2_AB"]) { vars.currentCategoryPrefix = "Ch2_AB$"; vars.DebugPrint("Selected category: Chapter 2 All Bosses"); }
}

reset {
  if (!settings.ResetEnabled) return;
  if (vars.currentCategoryPrefix == null) { vars.DebugPrint("RESET (Category Prefix undefined)"); return true; }
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
      foreach(string splitKey in vars.splits.Keys){
        if (!settings[vars.currentCategoryPrefix + splitKey] || vars.splits[splitKey][vars.findSplitVarIndex("done")]) // Checking if the split isn't already done or not enabled
          continue;

        // is there a current room requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("currentRoom")] != -1) && (current.room != vars.splits[splitKey][vars.findSplitVarIndex("currentRoom")]))
          continue;

        // is there an old room requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("oldRoom")] != -1) && (old.room != vars.splits[splitKey][vars.findSplitVarIndex("oldRoom")]))
          continue;

        // is there a special flag requirement?
        if (vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")] != -1) {
          bool pass = false;
          switch((int)vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")]) {
            case 1:
              // Chapter 1 end
              pass = ((current.filechoice === old.filechoice + 3) || (current.filechoice2 === old.filechoice2 + 3));
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

        if (!settings[vars.currentCategoryPrefix + splitKey] || vars.splits[splitKey][vars.findSplitVarIndex("done")]) // Checking if the split isn't already done or not enabled
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

        // is there a current fight requirement ?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("currentFight")] != -1) && (current.fight != vars.splits[splitKey][vars.findSplitVarIndex("currentFight")]))
            continue;

        // is there an old fight requirement ?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("oldFight")] != -1) && (old.fight != vars.splits[splitKey][vars.findSplitVarIndex("oldFight")]))
            continue;
        
        // is there a special flag requirement?
        if (vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")] != -1) {
            bool pass = false;

            switch((int)vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")]) {
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