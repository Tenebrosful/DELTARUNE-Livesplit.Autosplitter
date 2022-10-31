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

  #region All Chapters All Bosses Settings
  settings.Add("AC_AB", false, "All Bosses", "AC");
    settings.Add("AC_AB$Ch1", true, "Chapter 1", "AC_AB");
    settings.CurrentDefaultParent = "AC_AB$Ch1";
      settings.Add("AC_AB$Ch1_CastleTown", true, "Castle Town");
    settings.CurrentDefaultParent = "AC_AB$Ch1_CastleTown";
      settings.Add("AC_AB$Ch1_CastleTown_Intro", false, "Introduction");
      settings.Add("AC_AB$Ch1_CastleTown_EnterBed", false, "Enter Bed");
      settings.Add("AC_AB$Ch1_CastleTown_WristProtector", false, "Wrist Protector");
    settings.CurrentDefaultParent = null;
    settings.Add("AC_AB$Ch1ToCh2", true, "Switching Chapter 1 -> 2", "AC_AB");
    settings.Add("AC_AB$Ch2", true, "Chapter 2", "AC_AB");
    settings.CurrentDefaultParent = "AC_AB$Ch2";
  #endregion

  settings.CurrentDefaultParent = null;
  #endregion

  #region Chapter 1 Settings
  settings.Add("Ch1", false, "Chapter 1");

  #region Any% / True Pacifist Settings
  settings.Add("Ch1_Any", false, "Any% / True Pacifist", "Ch1");
  settings.CurrentDefaultParent = "Ch1_Any";
    settings.Add("Ch1_Any$Ch1_CastleTown", true, "Castle Town");
    settings.CurrentDefaultParent = "Ch1_Any$Ch1_CastleTown";
      settings.Add("Ch1_Any$Ch1_CastleTown_Intro", false, "Introduction");
      settings.Add("Ch1_Any$Ch1_CastleTown_EnterBed", false, "Enter Bed");
      settings.Add("Ch1_Any$Ch1_CastleTown_WristProtector", false, "Wrist Protector");
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
          version = "v1.10/v1.09/v1.08";
          break;
        case 7491584:
          version = "v1.07/v1.06/v1.05/v1.00";
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
    case "v1.10/v1.09/v1.08":
      vars.startRooms = new object[] { 282 };
      vars.resetRooms = new object[] { 234, 279, 413 };
      vars.splitsVarIndex = new object[] { "done", "oldRoom", "currentRoom", "specialCondition" };
      vars.splits = new Dictionary<string, object[]>() {
        {"Ch1_CastleTown_Intro", new object[] {false, 282, 283, -1}},
        {"Ch1_CastleTown_EnterBed", new object[] {false, 283, 315, -1}}
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

  else if (settings["Ch2_MR"]) { vars.currentCategoryPrefix = "Ch2_MR$"; vars.DebugPrint("Selected category: Chapter 2 Main Route"); }
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
    case "v1.10/v1.09/v1.08":
    case "v1.07/v1.06/v1.05/v1.00":
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
          switch((int)vars.splits[splitKey][vars.findSplitVarIndex("specialCondition")]) {
            case 0:
              vars.DebugPrint("Special !");
              continue;
          }
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