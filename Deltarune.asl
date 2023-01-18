// DELTARUNE autosplitter by Tenebrosful and NERS
// Inspired by Narry's Autosplitter based on Glacia's Undertale autosplitter (But I don't understand everything so I made my own) (https://drive.google.com/file/d/1SCpuUpDgIYHmbc6xKK3ZrNk1zaIeDUMq/view?usp=sharing)

state("Deltarune", "v1.15") {
  // static
  uint room : "Deltarune.exe", 0x6F0B70;

  // globals
  double chapter : "Deltarune.exe", 0x4E17F0, 0x34, 0x154, 0x10, 0x24, 0x10, 0x54, 0x120;
  double chapter2 : "Deltarune.exe", 0x4E06B8, 0x24, 0x10, 0xA08, 0x340;

  double fight : "Deltarune.exe", 0x4E17F0, 0x34, 0x154, 0x10, 0x24, 0x10, 0x54, 0x10;
  double fight2 : "Deltarune.exe", 0x4E06B8, 0x24, 0x10, 0x858, 0x290;
  
  double choicer : "Deltarune.exe", 0x6F0BD0, 0x618, 0x80, 0x140, 0x24, 0x10, 0x15C, 0x0;

  // selfs
  double namerEvent : "Deltarune.exe", 0x43FE48, 0x630, 0xC, 0x140, 0x24, 0x10, 0xFC, 0x0;
  double doorCloseCon : "Deltarune.exe", 0x6F0BD0, 0x524, 0x84, 0x24, 0x10, 0x18, 0x0;

  double jevilDance : "Deltarune.exe", 0x6F0B48, 0x128, 0x24, 0x60, 0x24, 0x10, 0x4EC, 0x0;
  double jevilDance2 : "Deltarune.exe", 0x43FE48, 0x538, 0xC, 0x140, 0x24, 0x10, 0x4EC, 0x0;

  double finalTextboxHalt_ch1 : "Deltarune.exe", 0x6F2CBC, 0x4, 0x140, 0x24, 0x10, 0x4F8, 0x0;
  double finalTextboxHalt_ch2 : "Deltarune.exe", 0x6F2CBC, 0x3C, 0x140, 0x140, 0x24, 0x10, 0xAF8, 0x0;

  double freezeRingTimer : "Deltarune.exe", 0x43FE48, 0xC20, 0xC, 0x144, 0x24, 0x10, 0x120, 0x0;
  double loadedDiskGreyBG : "Deltarune.exe", 0x6F0B48, 0x10C, 0x504, 0x20, 0x24, 0x10, 0x0, 0x0;
}

state("Deltarune", "v1.08 - v1.10") {
  // static
  uint room : "Deltarune.exe", 0x6EF248;

  // globals
  double filechoice : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x1BC, 0x890;
  double filechoice2 : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x2DC, 0x310;
 
  double chapter : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x4C8, 0x5F0;
  double chapter2 : "Deltarune.exe", 0x4DEDE4, 0x24, 0x10, 0x2DC, 0x480;
  
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

  vars.ch2EndCount = 0; // the pointer is used for multiple textboxes so we just count up by 1 every time it changes lmao

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
    vars.ch2EndCount = 0;
    int doneIndex = vars.findSplitVarIndex("done");
    foreach (string split in vars.splits.Keys)
      vars.splits[split][doneIndex] = false;

    vars.DebugPrint("All splits have been reset to initial state");
    return true;
  });

  vars.findSplitVarIndex = (Func<string, int>)((variableName) => { return Array.IndexOf(vars.splitsVarIndex, variableName); });

  #endregion

  #region Global Variables declaration

  vars.prevUpdateTime = -1; // Previous time that the autosplitter updated to detect lags
  vars.splits = new Dictionary<string, object[]>() {};
  vars.splitsVarIndex = new object[] {};

  #endregion

  #region Settings

  settings.Add("AC", true, "All Chapters");
  settings.CurrentDefaultParent = "AC";
    settings.Add("Ch1_Ch2_PauseTimer", true, "Pause timer between Chapter 1 and 2");
      settings.SetToolTip("Ch1_Ch2_PauseTimer", "This setting pauses the timer when you end Chapter 1, and resumes it when you continue from a previous save in Chapter 2.\n\nNOTE: For this to work, Game Time must be enabled\n(you will be asked if you want to enable it by turning on this setting and opening the game if the timer isn't already running, or you can just do it yourself :keuchrCat:)");
    settings.Add("Ch1-Ch2", false, "Split on starting Chapter 2 from a Chapter 1 savefile");
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
      settings.Add("Ch1_KeyA", false, "Key A (SURVEY)", "Ch1_Fields");
      settings.Add("Ch1_Fields_Exit", true, "Rudinn Skip 4 / Exiting Fields", "Ch1_Fields");
    settings.Add("Ch1_Checkerboard", true, "Checkerboard");
      settings.Add("Ch1_PawnSkip#1", false, "Pawn Skip 1", "Ch1_Checkerboard");
      settings.Add("Ch1_PawnSkip#2", false, "Pawn Skip 2", "Ch1_Checkerboard");
      settings.Add("Ch1_Checkerboard_Exit", true, "Exiting Checkerboard", "Ch1_Checkerboard");
    settings.Add("Ch1_Forest", true, "Forest section");
      settings.Add("Ch1_KeyB", false, "Key B (SURVEY)", "Ch1_Forest");
      settings.Add("Ch1_BloxerSkip#1", false, "Bloxer Skip 1", "Ch1_Forest");
      settings.Add("Ch1_BakeSale", false, "Bake Sale", "Ch1_Forest");
      settings.Add("Ch1_BloxerSkip#2", false, "Bloxer Skip 2", "Ch1_Forest");
      settings.Add("Ch1_Maze_End", false, "Maze end", "Ch1_Forest");
      settings.Add("Ch1_Susie&Lancer", false, "Susie & Lancer fight (SURVEY)", "Ch1_Forest");
      settings.Add("Ch1_Susie&Lancer_Exit", true, "Susie & Lancer exit room", "Ch1_Forest");
      settings.Add("Ch1_Captured", false, "Captured", "Ch1_Forest");
    settings.Add("Ch1_Prison", true, "Prison section");
      settings.Add("Ch1_Escape_Cell", false, "Exiting Cell", "Ch1_Prison");
      settings.Add("Ch1_Escape_Elevator", true, "Entering Escape Elevator", "Ch1_Prison");
    settings.Add("Ch1_Jevil", false, "Jevil section");
      settings.Add("Ch1_KeyC", false, "Key C (SURVEY)", "Ch1_Jevil");
      settings.Add("Ch1_KeyFixed", false, "Key Fixed (SURVEY)", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_EnterRoom", false, "Enter Jevil room", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_StartBattle", false, "Start Jevil Battle (SURVEY)", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_ExitRoom", false, "Enter Jevil room", "Ch1_Jevil");
      settings.Add("Ch1_Jevil_EndBattle", false, "End Jevil Battle (SURVEY)", "Ch1_Jevil");
    settings.Add("Ch1_CardCastle", true, "Card Castle section");
      settings.Add("Ch1_RudinnRangerSkip", false, "Rudinn Ranger Skip", "Ch1_CardCastle");
      settings.Add("Ch1_HeadHathySkip", false, "Head Hathy Skip", "Ch1_CardCastle");
      settings.Add("Ch1_Shopping", false, "After the shop, before K Round", "Ch1_CardCastle");
      settings.Add("Ch1_Throne_Enter", false, "Entering Card Castle's Throne room", "Ch1_CardCastle");
      settings.Add("Ch1_Throne_Exit", true, "Exiting Card Castle's Throne room", "Ch1_CardCastle");
      settings.Add("Ch1_King_EndBattle", false, "End King Battle (SURVEY)", "Ch1_CardCastle");
      settings.Add("Ch1_King_ExitBattleRoom", true, "Exit King Battle Room", "Ch1_CardCastle");
    settings.Add("Ch1_Ending", false, "Ending");
  settings.CurrentDefaultParent = null;

  settings.Add("Ch2", false, "Chapter 2");
  settings.CurrentDefaultParent = "Ch2";
    settings.Add("Ch2_Intro", false, "Introduction / Bed Skip");
    settings.Add("Ch2_CyberFields", true, "Cyber Fields");
      settings.Add("Ch2_Pre-CyberFields", false, "Pre-Cyber Fields (after slide)", "Ch2_CyberFields");
      settings.Add("Ch2_Tasque", false, "Tasque Fight / Skip", "Ch2_CyberFields");
      settings.Add("Ch2_ArcadeGame", true, "Arcade Game", "Ch2_CyberFields");
      settings.Add("Ch2_Virovirokun#1", false, "Virovirokun #1 Fight / Skip", "Ch2_CyberFields");
      settings.Add("Ch2_Agree2All", false, "Agree 2 All puzzle", "Ch2_CyberFields");
      settings.Add("Ch2_DJFight", true, "DJ Fight", "Ch2_CyberFields");
      settings.Add("Ch2_DJShop", false, "DJ Shop", "Ch2_CyberFields");
      settings.Add("Ch2_Werewire#1", false, "Werewire #1 Fight / Skip", "Ch2_CyberFields");
      settings.Add("Ch2_VirovirokunPuzzle", false, "Virovirokun Puzzle", "Ch2_CyberFields");
      settings.Add("Ch2_Cups", false, "Cups", "Ch2_CyberFields");
      settings.Add("Ch2_CyberFields_Exit", true, "Exit Cyber Fields", "Ch2_CyberFields");
      settings.Add("Ch2_MansionWarp", false, "Mansion Warp", "Ch2_CyberFields");
      settings.Add("Ch2_TrashWarp", false, "Trash Warp", "Ch2_CyberFields");
    settings.Add("Ch2_CyberCity", true, "Cyber City");
      settings.Add("Ch2_Poppup", false, "Poppup Fight / Skip", "Ch2_CyberCity");
      settings.Add("Ch2_MicePuzzle#1", false, "Mice Puzzle #1", "Ch2_CyberCity");
      settings.Add("Ch2_Virovirokun#2", false, "Virovirokun #2 & Ambyu-Lance Fight / Skip", "Ch2_CyberCity");
      settings.Add("Ch2_FreezeRing", false, "Obtain FreezeRing", "Ch2_CyberCity");
      settings.Add("Ch2_Forcefield", false, "Forcefield", "Ch2_CyberCity");
      settings.Add("Ch2_Werewire#2", false, "Werewire #2 Fight / Skip", "Ch2_CyberCity");
      settings.Add("Ch2_MicePuzzle#2", false, "Mice Puzzle #2", "Ch2_CyberCity");
      settings.Add("Ch2_CheeseMaze", false, "Cheese Maze", "Ch2_CyberCity");
      settings.Add("Ch2_MicePuzzle#3", false, "Mice Puzzle #3", "Ch2_CyberCity");
      settings.Add("Ch2_Berdly", true, "Berdly 2", "Ch2_CyberCity");
      settings.Add("Ch2_BerdlySnowgrave", true, "Berdly 2 (Snowgrave)", "Ch2_CyberCity");
      settings.Add("Ch2_Spamton", true, "Spamton", "Ch2_CyberCity");
      settings.Add("Ch2_FullParty", false, "Full party", "Ch2_CyberCity");
      settings.Add("Ch2_Ambyu-lance#2", false, "Ambyu_Lance #2 fight", "Ch2_CyberCity");
      settings.Add("Ch2_Mice", false, "Mice fight", "Ch2_CyberCity");
      settings.Add("Ch2_CyberCity_Exit", true, "Exit Cyber City (Captured)", "Ch2_CyberCity");
      settings.Add("Ch2_CyberCity_Exit_Snowgrave", false, "Exit Cyber City (Snowgrave)", "Ch2_CyberCity");
    settings.Add("Ch2_Mansion", true, "Queen Mansion");
      settings.Add("Ch2_EscapeCell", false, "Escape Cell", "Ch2_Mansion");
      settings.Add("Ch2_LightPuzzle#1", false, "Light Puzzle #1", "Ch2_Mansion");
      settings.Add("Ch2_LightPuzzle#2", false, "Light Puzzle #2", "Ch2_Mansion");
      settings.Add("Ch2_LightPuzzle#3", false, "Light Puzzle #3", "Ch2_Mansion");
      settings.Add("Ch2_Swatchling#1", false, "Swatchling 1", "Ch2_Mansion");
      settings.Add("Ch2_Swatchling#2", false, "Swatchling 2 (Pot Race)", "Ch2_Mansion");
      settings.Add("Ch2_TasqueManager", false, "Tasque Manager", "Ch2_Mansion");
      settings.Add("Ch2_Disk_Loaded", false, "Loaded Disk (All Bosses)", "Ch2_Mansion");
      settings.Add("Ch2_SpamtonNEO_Start", false, "Start Spamton NEO (All Bosses)", "Ch2_Mansion");
      settings.Add("Ch2_SpamtonNEO_End", false, "End Spamton NEO (All Bosses)", "Ch2_Mansion");
      settings.Add("Ch2_Mauswheel", false, "Mauswheel", "Ch2_Mansion");
      settings.Add("Ch2_DogPipis", false, "After Dog / Pipis Room", "Ch2_Mansion");
      settings.Add("Ch2_Swatchling#3", false, "Swatchling #3", "Ch2_Mansion");
      settings.Add("Ch2_TasqueManager_Snowgrave", false, "Tasque Manager (Snowgrave)", "Ch2_Mansion");
      settings.Add("Ch2_AcidLake", true, "Acid Lake", "Ch2_Mansion");
        settings.Add("Ch2_AcidLake_Enter", true, "Entering Acid Lake", "Ch2_AcidLake");
        settings.Add("Ch2_AcidLake_Blocked", false, "Blocked by Hand", "Ch2_AcidLake");
        settings.Add("Ch2_AcidLake_Unblocked", false, "Unblocked by Hand", "Ch2_AcidLake");
        settings.Add("Ch2_AcidLake_Exit", true, "Exit Acid Lake", "Ch2_AcidLake");
      settings.Add("Ch2_Werewerewire", false, "Werewerewire", "Ch2_Mansion");
      settings.Add("Ch2_Queen", true, "Queen", "Ch2_Mansion");
      settings.Add("Ch2_GigaQueen", true, "Giga Queen", "Ch2_Mansion");
      settings.Add("Ch2_Fountain_Enter", false, "Enter Fountain Room (Snowgrave Spamton NEO)", "Ch2_Mansion");
      settings.Add("Ch2_Fountain_Exit", false, "Exit Fountain Room (Snowgrave Spamton NEO)", "Ch2_Mansion");
    settings.Add("Ch2_Ending", true, "Ending");
  #endregion
}

exit {
  vars.DebugPrint("The game just exited");
}

init {
  vars.DebugPrint("Autosplitter is initializing");

  #region Version Detection

  vars.VersionOutputWarning = false;
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
      vars.splitsVarIndex = new object[] { "done", "oldRoom", "currentRoom", "oldFight", "currentFight", "specialCondition" };
      vars.splits = new Dictionary<string, object[]>() {
        #region Chapter 1
        // Castle Town
        {"Ch1_Survey", new object[] {false, 282, 283, -1, -1, -1}},
        {"Ch1_School", new object[] {false, -1, 315, -1, -1, -1}},
        {"Ch1_Pre-CastleTown", new object[] {false, -1, 325, -1, -1, -1}},
        {"Ch1_LancerFight", new object[] {false, -1, 327, 1, 0, -1}},
        {"Ch1_CastleTown_DoorClose", new object[] {false, -1, 329, -1, -1, 424}},
        {"Ch1_CastleTown_RoomChange", new object[] {false, 329, 330, -1, -1, -1}},
        // Fields
        {"Ch1_RudinnSkip#1", new object[] {false, -1, 333, -1, -1, -1}},
        {"Ch1_RudinnSkip#2", new object[] {false, -1, 335, -1, -1, -1}},
        {"Ch1_RudinnSkip#3", new object[] {false, -1, 337, -1, -1, -1}},
        {"Ch1_VandalizedPuzzle", new object[] {false, -1, 344, -1, -1, -1}},
        {"Ch1_Fields_Exit", new object[] {false, -1, 346, -1, -1, -1}},
        //Checkboard
        {"Ch1_PawnSkip#1", new object[] {false, -1, 348, -1, -1, -1}},
        {"Ch1_PawnSkip#2", new object[] {false, -1, 352, -1, -1, -1}},
        {"Ch1_Checkerboard_Exit", new object[] {false, -1, 354, -1, -1, -1}},
        //Forest
        {"Ch1_BloxerSkip#1", new object[] {false, -1, 362, -1, -1, -1}},
        {"Ch1_BakeSale", new object[] {false, 362, 363, -1, -1, -1}},
        {"Ch1_BloxerSkip#2", new object[] {false, 365, 366, -1, -1, -1}},
        {"Ch1_Maze_End", new object[] {false, -1, 377, -1, -1, -1}},
        {"Ch1_Susie&Lancer", new object[] {false, -1, -1, 1, 0, -1}},
        {"Ch1_Susie&Lancer_Exit", new object[] {false, -1, 379, -1, -1, -1}},
        {"Ch1_Captured", new object[] {false, 385, 386, -1, -1, -1}},

        //Escape
        {"Ch1_Escape_Cell", new object[] {false, 386, 387, -1, -1, -1}},
        {"Ch1_Escape_Elevator", new object[] {false, 388, 390, -1, -1, -1}},

        //Jevil
        {"Ch1_KeyC", new object[] {false, -1, 64, -1, -1, 6}},
        {"Ch1_KeyFixed", new object[] {false, -1, 83, -1, -1, 3}},
        {"Ch1_Jevil_EnterRoom", new object[] {false, 392, 393, -1, -1, -1}},
        {"Ch1_Jevil_StartBattle", new object[] {false, -1, 393, 0, 1, -1}},
        {"Ch1_Jevil_ExitRoom", new object[] {false, 393, 392, -1, -1, -1}},
        {"Ch1_Jevil_EndBattle", new object[] {false, -1, 393, -1, -1, 7}},
        
        // Card Castle
        {"Ch1_RudinnRangerSkip", new object[] {false, -1, 397, -1, -1, -1}},
        {"Ch1_HeadHathySkip", new object[] {false, -1, 401, -1, -1, -1}},
        {"Ch1_Shopping", new object[] {false, -1, 406, -1, -1, -1}},
        {"Ch1_Throne_Enter", new object[] {false, -1, 407, -1, -1, -1}},
        {"Ch1_Throne_Exit", new object[] {false, 407, 408, -1, -1, -1}},
        {"Ch1_King_EndBattle", new object[] {false, -1, 409, 1, 0, -1}},
        {"Ch1_King_ExitBattleRoom", new object[] {false, 409, 410, -1, -1, -1}},

        // Ch1_Ending is handled manually
        #endregion

        {"Ch1-Ch2", new object[] {false, -1, 28, -1, -1, -1}},

        #region Chapter 2
        {"Ch2_Intro", new object[] {false, -1, 85, -1, -1, -1}},

        // Cyber Fields
        {"Ch2_Pre-CyberFields", new object[] {false, -1, 88, -1, -1, -1}},
        {"Ch2_Tasque", new object[] {false, -1, 93, -1, -1, -1}},
        {"Ch2_ArcadeGame", new object[] {false, -1, 94, -1, -1, -1}},
        {"Ch2_Virovirokun#1", new object[] {false, 95, 96, -1, -1, -1}},
        {"Ch2_Agree2All", new object[] {false, 96, 95, -1, -1, -1}},
        {"Ch2_DJFight", new object[] {false, 98, 106, -1, -1, -1}},
        {"Ch2_DJShop", new object[] {false, 237, 99, -1, -1, -1}},
        {"Ch2_Werewire#1", new object[] {false, -1, 105, -1, -1, -1}},
        {"Ch2_VirovirokunPuzzle", new object[] {false, -1, 100, -1, -1, -1}},
        {"Ch2_Cups", new object[] {false, -1, 101, -1, -1, -1}},
        {"Ch2_CyberFields_Exit", new object[] {false, -1, 120, -1, -1, -1}},
        {"Ch2_MansionWarp", new object[] {false, 94, 167, -1, -1, -1}},
        {"Ch2_TrashWarp", new object[] {false, 94, 120, -1, -1, -1}},

        // Cyber City
        {"Ch2_Poppup", new object[] {false, -1, 125, -1, -1, -1}},
        {"Ch2_MicePuzzle#1", new object[] {false, -1, 127, -1, -1, -1}},
        {"Ch2_Virovirokun#2", new object[] {false, -1, 128, -1, -1, -1}},
        {"Ch2_FreezeRing", new object[] {false, -1, 129, -1, -1, 999}},
        {"Ch2_Forcefield", new object[] {false, -1, 130, -1, -1, -1}},
        {"Ch2_Werewire#2", new object[] {false, -1, 133, -1, -1, -1}},
        {"Ch2_MicePuzzle#2", new object[] {false, -1, 135, -1, -1, -1}},
        {"Ch2_CheeseMaze", new object[] {false, -1, 136, -1, -1, -1}},
        {"Ch2_MicePuzzle#3", new object[] {false, 136, 137, -1, -1, -1}},
        {"Ch2_Berdly", new object[] {false, 138, 139, -1, -1, -1}},
        {"Ch2_BerdlySnowgrave", new object[] {false, 138, 137, -1, -1, -1}},
        {"Ch2_Spamton", new object[] {false, 140, 139, -1, -1, -1}},
        {"Ch2_FullParty", new object[] {false, -1, 143, -1, -1, -1}},
        {"Ch2_Ambyu-lance#2", new object[] {false, -1, 144, -1, -1, -1}},
        {"Ch2_Mice", new object[] {false, -1, 145, -1, -1, -1}},
        {"Ch2_CyberCity_Exit", new object[] {false, -1, 160, -1, -1, -1}},
        {"Ch2_CyberCity_Exit_Snowgrave", new object[] {false, 146, 167, -1, -1, -1}},

        // Mansion
        {"Ch2_EscapeCell", new object[] {false, -1, 163, -1, -1, -1}},
        {"Ch2_LightPuzzle#1", new object[] {false, -1, 164, -1, -1, -1}},
        {"Ch2_LightPuzzle#2", new object[] {false, -1, 165, -1, -1, -1}},
        {"Ch2_LightPuzzle#3", new object[] {false, -1, 166, -1, -1, -1}},
        {"Ch2_Swatchling#1", new object[] {false, -1, 170, -1, -1, -1}},
        {"Ch2_Swatchling#2", new object[] {false, -1, 171, -1, -1, -1}},
        {"Ch2_TasqueManager", new object[] {false, -1, 172, -1, -1, -1}},
        {"Ch2_Disk_Loaded", new object[] {false, -1, 239, -1, -1, 69}}, // to do later
        {"Ch2_SpamtonNEO_Start", new object[] {false, -1, 186, 0, 1, -1}},
        {"Ch2_SpamtonNEO_End", new object[] {false, -1, 187, 1, 0, -1}},
        {"Ch2_Mauswheel", new object[] {false, 193, 191, -1, -1, -1}},
        {"Ch2_DogPipis", new object[] {false, -1, 194, -1, -1, -1}},
        {"Ch2_Swatchling#3", new object[] {false, -1, 196, -1, -1, -1}},
        {"Ch2_TasqueManager_Snowgrave", new object[] {false, -1, 176, -1, -1, -1}},
          // Acid Lake
          {"Ch2_AcidLake_Enter", new object[] {false, -1, 200, -1, -1, -1}},
          {"Ch2_AcidLake_Blocked", new object[] {false, -1, 212, -1, -1, -1}},
          {"Ch2_AcidLake_Unblocked", new object[] {false, -1, 202, -1, -1, -1}},
          {"Ch2_AcidLake_Exit", new object[] {false, -1, 203, -1, -1, -1}},
        {"Ch2_Werewerewire", new object[] {false, -1, 205, -1, -1, -1}},
        {"Ch2_Queen", new object[] {false, -1, 207, -1, -1, -1}},
        {"Ch2_GigaQueen", new object[] {false, 207, 208, -1, -1, -1}},
        {"Ch2_Fountain_Enter", new object[] {false, 4, 3, -1, -1, -1}},
        {"Ch2_Fountain_Exit", new object[] {false, 3, 54, -1, -1, -1}},

        // Ch2_Ending is handled manually
        #endregion
      };

      if(timer.CurrentPhase == TimerPhase.NotRunning && timer.CurrentTimingMethod == TimingMethod.RealTime && settings["Ch1_Ch2_PauseTimer"]) {
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
      vars.splitsVarIndex = new object[] { "done", "maxPlot", "exactPlot", "oldRoom", "currentRoom", "oldFight", "currentFight", "specialCondition" };
      vars.splits = new Dictionary<string, object[]>() {
        #region Chapter 1
        // Castle Town
        {"Ch1_Survey", new object[] {false, -1, -1, 1, 2, -1, -1, -1}},
        {"Ch1_School", new object[] {false, -1, -1, -1, 34, -1, -1, -1}},
        {"Ch1_Pre-CastleTown", new object[] {false, -1, -1, 44, 45, -1, -1, -1}},
        {"Ch1_LancerFight", new object[] {false, -1, -1, -1, 46, 1, 0, -1}},
        {"Ch1_CastleTown_DoorClose", new object[] {false, -1, -1, -1, 48, -1, -1, 424}},
        {"Ch1_CastleTown_RoomChange", new object[] {false, -1, -1, 48, 49, -1, -1, -1}},
        // Fields
        {"Ch1_RudinnSkip#1", new object[] {false, -1, -1, 51, 52, -1, -1, -1}},
        {"Ch1_RudinnSkip#2", new object[] {false, -1, -1, 52, 54, -1, -1, -1}},
        {"Ch1_RudinnSkip#3", new object[] {false, -1, -1, 55, 56, -1, -1, -1}},
        {"Ch1_VandalizedPuzzle", new object[] {false, -1, -1, 62, 63, -1, -1, -1}},
        {"Ch1_KeyA", new object[] {false, -1, -1, -1, 133, -1, -1, 4}},
        {"Ch1_Fields_Exit", new object[] {false, -1, -1, 63, 65, -1, -1, -1}},
        //Checkboard
        {"Ch1_PawnSkip#1", new object[] {false, -1, -1, 66, 67, -1, -1, -1}},
        {"Ch1_PawnSkip#2", new object[] {false, -1, -1, 70, 71, -1, -1, -1}},
        {"Ch1_Checkerboard_Exit", new object[] {false, -1, -1, 72, 73, -1, -1, -1}},
        //Forest
        {"Ch1_KeyB", new object[] {false, -1, -1, -1, 85, -1, -1, 5}},
        {"Ch1_BloxerSkip#1", new object[] {false, -1, -1, 79, 81, -1, -1, -1}},
        {"Ch1_BakeSale", new object[] {false, -1, -1, 82, 84, -1, -1, -1}},
        {"Ch1_BloxerSkip#2", new object[] {false, -1, -1, 84, 85, -1, -1, -1}},
        {"Ch1_Maze_End", new object[] {false, -1, -1, 96, 97, -1, -1, -1}},
        {"Ch1_Susie&Lancer", new object[] {false, -1, -1, -1, 97, 1, 0, -1}},
        {"Ch1_Susie&Lancer_Exit", new object[] {false, -1, -1, 97, 98, -1, -1, -1}},
        {"Ch1_Captured", new object[] {false, -1, -1, 104, 105, -1, -1, -1}},

        //Escape
        {"Ch1_Escape_Cell", new object[] {false, -1, -1, 105, 106, -1, -1, -1}},
        {"Ch1_Escape_Elevator", new object[] {false, -1, -1, 107, 109, -1, -1, -1}},

        //Jevil
        {"Ch1_KeyC", new object[] {false, -1, -1, -1, 64, -1, -1, 6 }},
        {"Ch1_KeyFixed", new object[] {false, -1, -1, -1, 83, -1, -1, 3 }},
        {"Ch1_Jevil_EnterRoom", new object[] {false, -1, -1, -1, -1, -1, -1, -1}},
        {"Ch1_Jevil_StartBattle", new object[] {false, -1, -1, -1, 112, 0, 1, -1}},
        {"Ch1_Jevil_ExitRoom", new object[] {false, -1, -1, -1, -1, -1, -1, -1}},
        {"Ch1_Jevil_EndBattle", new object[] {false, -1, -1, -1, 112, -1, 1, 7}},
        
        // Card Castle
        {"Ch1_RudinnRangerSkip", new object[] {false, -1, -1, 114, 116, -1, -1, -1}},
        {"Ch1_HeadHathySkip", new object[] {false, -1, -1, 118, 120, -1, -1, -1}},
        {"Ch1_Shopping", new object[] {false, -1, -1, 123, 125, -1, -1, -1}},
        {"Ch1_Throne_Enter", new object[] {false, -1, -1, 125, 126, -1, -1, -1}},
        {"Ch1_Throne_Exit", new object[] {false, -1, -1, 126, 127, -1, -1, -1}},
        {"Ch1_King_EndBattle", new object[] {false, -1, -1, -1, 128, 1, 0, -1}},
        {"Ch1_King_ExitBattleRoom", new object[] {false, -1, -1, 128, 129, -1, -1, -1}},

        {"Ch1_Ending", new object[] {false, -1, 251, -1, 2, -1, -1, 2  }},
        #endregion
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

  if (version == "") { // Disable the autosplitter when game version is unknown
    if (!vars.VersionOutputWarning){
      vars.DebugPrint("Unknown version");
      MessageBox.Show("This Autosplitter didn't recognized your game version",
        "Deltarune unkown version");
      vars.VersionOutputWarning = true;
    }
    return false;
  }
  if (version == "v1.00 - v1.07") {
    if (!vars.VersionOutputWarning){
      vars.DebugPrint("Version v1.00 - v1.07 no longer handled");
      MessageBox.Show("This Autosplitter doesn't handle anymore Deltarune versions v1.00 to v1.07",
        "Deltarune Version not handled");
      vars.VersionOutputWarning = true;
    }
    return false;
  }

  if (current.room != old.room) {
    vars.DebugPrint("ROOM " + old.room + " -> " + current.room);
    if(version != "SURVEY_PROGRAM" && timer.IsGameTimePaused == true && settings["Ch1_Ch2_PauseTimer"] && current.room == 28)
    {
      vars.DebugPrint("ALL CHAPTERS: Chapter 2 started, timer resumed");
      timer.IsGameTimePaused = false;
    }
  }
  if (((IDictionary<String, object>)current).ContainsKey("plot") && current.plot != old.plot) vars.DebugPrint("PLOT " + old.plot + " -> " + current.plot);
  if (((IDictionary<String, object>)current).ContainsKey("fight") && current.fight != old.fight) vars.DebugPrint("FIGHT " + old.fight + " -> " + current.fight);
  if (((IDictionary<String, object>)current).ContainsKey("fight2") && current.fight2 != old.fight2) vars.DebugPrint("FIGHT 2 " + old.fight2 + " -> " + current.fight2);
}

start {
  if (!settings.StartEnabled) return;
  
  if(current.room != old.room) {
    if(version == "SURVEY_PROGRAM") {
      if (current.room == 1) { vars.DebugPrint("START (Start Room detected)"); return true; }
    }
    else if((current.chapter == 1 || current.chapter2 == 1) && current.room == 282) {
      vars.DebugPrint("START (Start Room for Chapter 1 detected)");
      return true;
    }
  } else if(version != "SURVEY_PROGRAM") {
    if(current.namerEvent == 75 && old.namerEvent == 74) { vars.DebugPrint("START (Start Event for Chapter 2 detected)"); return true; }
  }
}

onStart {
  vars.DebugPrint("START !");
  timer.IsGameTimePaused = true;
  timer.IsGameTimePaused = false;
}

reset {
  if (!settings.ResetEnabled) return;

  if(current.room != old.room) {
    if(version == "SURVEY_PROGRAM") {
      if (current.room == 1) { vars.DebugPrint("RESET (Start Room detected)"); return true; }
    }
    else if((current.chapter == 1 || current.chapter2 == 1) && current.room == 282) {
      vars.DebugPrint("RESET (Start Room for Chapter 1 detected)");
      return true;
    }
  } else if(version != "SURVEY_PROGRAM") {
    if(current.namerEvent == 75 && old.namerEvent == 74) { vars.DebugPrint("RESET (Start Event for Chapter 2 detected)"); return true; }
  }
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
      if((settings["Ch1_Ending"] || settings["Ch1_Ch2_PauseTimer"]) && ((current.chapter == 1 || current.chapter2 == 1) && current.room == 283 && old.finalTextboxHalt_ch1 == 2 && current.finalTextboxHalt_ch1 != 2 && current.choicer == 0)) {
        /*
        We dig out the haltstate of the final textbox. When it's in state 2, it's done writing.
        Once the box is dismised, the pointer becomes invalid and as such, the value is no longer 2
        We also check to make sure they took choice 0 and not choice 1 to ensure they chose yes and not no.
        */
        if(settings["Ch1_Ch2_PauseTimer"]) {
          vars.DebugPrint("ALL CHAPTERS: Chapter 1 ended, timer paused");
          timer.IsGameTimePaused = true;
        }

        return settings["Ch1_Ending"];
      }

      // Chapter 2 end
      if(current.room == 31 && settings["Ch2_Ending"] && (current.chapter == 2 || current.chapter2 == 2) && old.finalTextboxHalt_ch2 == 2 && current.finalTextboxHalt_ch2 != 2) {
        vars.ch2EndCount ++;
        return (vars.ch2EndCount == 31); // what a coincidence the room number is also 31 lol
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
        if ((vars.splits[splitKey][vars.findSplitVarIndex("currentFight")] != -1) && (current.fight != vars.splits[splitKey][vars.findSplitVarIndex("currentFight")] || current.fight2 != vars.splits[splitKey][vars.findSplitVarIndex("currentFight")]))
            continue;

        // is there an old fight requirement?
        if ((vars.splits[splitKey][vars.findSplitVarIndex("oldFight")] != -1) && (old.fight != vars.splits[splitKey][vars.findSplitVarIndex("oldFight")] || old.fight2 != vars.splits[splitKey][vars.findSplitVarIndex("currentFight")]))
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
            case 69: // Ch2_Disk_Loaded
              pass = (current.loadedDiskGreyBG == 121 && old.loadedDiskGreyBG == 119);
              break;
            case 424: // Ch1_CastleTown_GreatDoor
              pass = (current.doorCloseCon == 21 && old.doorCloseCon == 7);
              break;
            case 999: // Ch2_FreezeRing
              pass = (current.freezeRingTimer == 85 && old.freezeRingTimer == 84);
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
            case 1:  // Ch1_Ending (SURVEY)
              /*
              When the final textbox is closed, the game stores global.filechoice in a temp var
              it then sets global.filechoice + 3, saves the game, and then sets it back
              we can use this to get the frame after the textbox was closed by looking for filechoice > 2
              as this will only be valid in this one case
              */
              pass = (current.filechoice > 2);
              break;
            case 2:  // Ch1_Ending (SURVEY)
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
