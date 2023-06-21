// DELTARUNE autosplitter by Tenebrosful
// Inspired by Narry's Autosplitter based on Glacia's Undertale autosplitter (But I don't understand everything so I made my own) (https://drive.google.com/file/d/1SCpuUpDgIYHmbc6xKK3ZrNk1zaIeDUMq/view?usp=sharing)


state("Deltarune", "SURVEY_PROGRAM") {
  //static
  uint room :   "Deltarune.exe", 0x6AC9F0;
  
  //globals
  double money :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x470;
  double fight :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x490;
  double plot :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x500;
  double fileChoice :   "Deltarune.exe", 0x48E5DC, 0x27C, 0x488, 0x4D0;
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
    case 7954432:
        version = "SURVEY_PROGRAM";
        break;
  }

  switch(version) {
    case "SURVEY_PROGRAM":
        // object array structure
        vars.done = 0;  // bool  have we triggered this split already?
        vars.maxPlot = 1;  // double  maximum allowed plot, -1 if none
        vars.reqPlot = 2;  // double  required exact plot, -1 if none
        vars.oldRoom = 3;  // int   required old (last frame) room, -1 if none
        vars.curRoom = 4;   // int   required current room, -1 if none
        vars.oldFight = 5;  //int  required old fight state, -1 if none
        vars.curFight = 6;  //int  required current fight state, -1 if none
        vars.special = 7;   // int   required special logic function, -1 if none
        vars.splits = new Dictionary<string, object[]>() {
            // Castle Town
            {"intro", new object[] {false, -1, -1, 1, 2, -1, -1, -1  }},
            {"enterBed", new object[] {false, -1, -1, 2, 34, -1, -1, -1  }},
            {"wristProtector", new object[] {false, -1, -1, 34, 35, -1, -1, -1  }},
            {"savePointRoomC", new object[] {false, -1, -1, 35, 36, -1, -1, -1  }},
            {"windyMovement", new object[] {false, -1, -1, 36, 37, -1, -1, -1  }},
            {"firstSlidesRoom", new object[] {false, -1, -1, 37, 39, -1, -1, -1  }},
            {"pre-eyesPuzzleRoom", new object[] {false, -1, -1, 39, 40, -1, -1, -1  }},
            {"eyesPuzzle", new object[] {false, -1, -1, 40, 41, -1, -1, -1  }},
            {"secondSlidesRoom", new object[] {false, -1, -1, 41, 42, -1, -1, -1  }},
            {"chase1Room", new object[] {false, -1, -1, 42, 43, -1, -1, -1  }},
            {"chase2Room", new object[] {false, -1, -1, 43, 44, -1, -1, -1  }},
            {"post-chaseRoom", new object[] {false, -1, -1, 44, 45, -1, -1, -1  }},
            {"emptyTown#1", new object[] {false, -1, -1, 45, 46, -1, -1, -1  }},
            {"pre-lancer", new object[] {false, -1, -1, -1, 46, 0, 1, -1  }},
            {"lancer", new object[] {false, -1, -1, -1, 46, 1, 0, -1  }},
            {"post-lancer", new object[] {false, -1, -1, 46, 45, -1, -1, -1  }},
            {"emptyTown#2", new object[] {false, -1, -1, 45, 47, -1, -1, -1  }},
            {"dummyRoom", new object[] {false, -1, -1, 47, 48, -1, -1, -1  }},
            {"greatDoor", new object[] {false, -1, -1, 48, 49, -1, -1, -1  }},

            // Fields
            {"savePointRoomF", new object[] {false, -1, -1, 49, 50, -1, -1, -1  }},
            {"fields2ndRoom", new object[] {false, -1, -1, 50, 51, -1, -1, -1  }},
            {"rudinn1Skip", new object[] {false, -1, -1, 51, 52, -1, -1, -1  }},
            {"rudinn2Skip", new object[] {false, -1, -1, 52, 54, -1, -1, -1  }},
            {"brokenCakeRoom", new object[] {false, -1, -1, 54, 55, -1, -1, -1  }},
            {"rudinn3skip", new object[] {false, -1, -1, 55, 56, -1, -1, -1  }},
            {"pre-hathy", new object[] {false, -1, -1, -1, 56, 0, 1, -1  }},
            {"hathyFight", new object[] {false, -1, -1, -1, 56, 1, 0, -1  }},
            {"post-hathy", new object[] {false, -1, -1, 56, 57, -1, -1, -1  }},
            {"puzzleRoom#1", new object[] {false, -1, -1, 57, 58, -1, -1, -1  }},
            {"susieJoinedTheParty", new object[] {false, -1, -1, 58, 57, -1, -1, -1  }},
            {"puzzleRoom#2", new object[] {false, -1, -1, 57, 58, -1, -1, 8  }},
            {"pre-cround", new object[] {false, -1, -1, -1, 58, 0, 1, -1  }},
            {"cround", new object[] {false, -1, -1, -1, 58, 1, 0, -1  }},
            {"post-cround", new object[] {false, -1, -1, 58, 59, -1, -1, -1  }},
            {"savePointRoomSF", new object[] {false, -1, -1, 59, 61, -1, -1, -1  }},
            {"pre-jigsawry", new object[] {false, -1, -1, -1, 61, 0, 1, -1  }},
            {"jigsawry", new object[] {false, -1, -1, -1, 61, 1, 0, -1  }},
            {"post-jigsawry", new object[] {false, -1, -1, 61, 62, -1, -1, -1  }},
            {"boxPushingPuzzle", new object[] {false, -1, -1, 62, 63, -1, -1, -1  }},
            {"rudinn4skip", new object[] {false, -1, -1, 63, 65, -1, -1, -1  }},

            //Checkboard
            {"whiteTiles#1", new object[] {false, -1, -1, 65, 66, -1, -1, -1  }},
            {"ponman1skip", new object[] {false, -1, -1, 66, 67, -1, -1, -1  }},
            {"whiteTiles#2", new object[] {false, -1, -1, 67, 68, -1, -1, -1  }},
            {"lancerCutsceneRoom", new object[] {false, -1, -1, 68, 69, -1, -1, -1  }},
            {"whiteTiles#3", new object[] {false, -1, -1, 69, 70, -1, -1, -1  }},
            {"ponman2skip", new object[] {false, -1, -1, 70, 71, -1, -1, -1  }},
            {"savePointRoomCB", new object[] {false, -1, -1, 71, 72, -1, -1, -1  }},
            {"pre-kround", new object[] {false, -1, -1, -1, 72, 0, 1, -1  }},
            {"kround", new object[] {false, -1, -1, -1, 72, 1, 0, -1  }},
            {"post-kround", new object[] {false, -1, -1, 72, 73, -1, -1, -1  }},

            //Forest
            {"savePointRoomFo#1", new object[] {false, -1, -1, 73, 74, -1, -1, -1  }},
            {"rabbickSkip#1", new object[] {false, -1, -1, 74, 75, -1, -1, -1  }},
            {"rabbickSkip#2", new object[] {false, -1, -1, 75, 76, -1, -1, -1  }},
            {"spinningDiamondsRoom", new object[] {false, -1, -1, 76, 78, -1, -1, -1  }},
            {"suitPuzzle#1", new object[] {false, -1, -1, 78, 79, -1, -1, -1  }},
            {"bloxer1skip", new object[] {false, -1, -1, 79, 81, -1, -1, -1  }},
            {"pre-clover", new object[] {false, -1, -1, -1, 81, 0, 1, -1  }},
            {"clover", new object[] {false, -1, -1, -1, 81, 1, 0, -1  }},
            {"post-clover", new object[] {false, -1, -1, 81, 82, -1, -1, -1  }},
            {"bakeSale", new object[] {false, -1, -1, 82, 84, -1, -1, -1  }},
            {"bloxer2skip", new object[] {false, -1, -1, 84, 85, -1, -1, -1  }},
            {"scissorsDancersRoom", new object[] {false, -1, -1, 85, 87, -1, -1, -1  }},
            {"trashMachine", new object[] {false, -1, -1, 87, 88, -1, -1, -1  }},
            {"starWalkerRoom", new object[] {false, -1, -1, 88, 89, -1, -1, -1  }},
            {"hiddenSwitchRoom", new object[] {false, -1, -1, 89, 90, -1, -1, -1  }},
            {"savePointRoomFo#2", new object[] {false, -1, -1, 90, 91, -1, -1, -1  }},
            {"mazeRoomFirstPart", new object[] {false, -1, -1, 91, 93, -1, -1, -1  }},
            {"mazeRoomSusie", new object[] {false, -1, -1, 93, 94, -1, -1, -1  }},
            {"mazeRoomSecondPart", new object[] {false, -1, -1, 94, 96, -1, -1, -1  }},
            {"savePointRoomFo#3", new object[] {false, -1, -1, 96, 97, -1, -1, -1  }},
            {"pre-susielancer", new object[] {false, -1, -1, -1, 97, 0, 1, -1  }},
            {"susielancer", new object[] {false, -1, -1, -1, 97, 1, 0, -1  }},
            {"post-susielancer", new object[] {false, -1, -1, 97, 98, -1, -1, -1  }},

            //Escape
            {"autoscroller#1", new object[] {false, -1, -1, 98, 99, -1, -1, -1  }},
            {"autoscroller#2", new object[] {false, -1, -1, 99, 100, -1, -1, -1  }},
            {"autoscroller#3", new object[] {false, -1, -1, 100, 101, -1, -1, -1  }},
            {"autoscroller#4", new object[] {false, -1, -1, 101, 102, -1, -1, -1  }},
            {"chase1roomFo", new object[] {false, -1, -1, 102, 103, -1, -1, -1  }},
            {"chase2roomFo", new object[] {false, -1, -1, 103, 104, -1, -1, -1  }},
            {"capturedCutscene", new object[] {false, -1, -1, 104, 105, -1, -1, -1  }},
            {"prizonPuzzle", new object[] {false, -1, -1, 105, 106, -1, -1, -1  }},
            {"pre-susiefight", new object[] {false, -1, -1, -1, 106, 0, 1, -1  }},
            {"susieFight", new object[] {false, -1, -1, -1, 106, 1, 0, -1  }},
            {"post-susieFight", new object[] {false, -1, -1, 106, 105, -1, -1, -1  }},
            {"escapePrisonCutscene", new object[] {false, -1, -1, 105, 106, -1, -1, 9  }},
            {"enterElevator#1", new object[] {false, -1, -1, 106, 107, -1, -1, -1  }},
            {"enterElevator#2", new object[] {false, -1, -1, 107, 109, -1, -1, -1  }},
            {"elevator", new object[] {false, -1, -1, 109, 114, -1, -1, -1  }},
            {"rudinnRangerSkip", new object[] {false, -1, -1, 114, 116, -1, -1, -1  }},
            {"spinningDiamondsRoom#1Castle", new object[] {false, -1, -1, 116, 117, -1, -1, -1  }},
            {"rouxlsPuzzle#1", new object[] {false, -1, -1, 117, 116, -1, -1, -1  }},
            {"spinningDiamondsRoom#2Castle", new object[] {false, -1, -1, 116, 118, -1, -1, -1  }},
            {"headHathySkip", new object[] {false, -1, -1, 118, 120, -1, -1, -1  }},
            {"scissorDancersRoom#1", new object[] {false, -1, -1, 120, 121, -1, -1, -1  }},
            {"rouxlPuzzle#2", new object[] {false, -1, -1, 121, 120, -1, -1, -1  }},
            {"scissorDancersRoom#2", new object[] {false, -1, -1, 120, 123, -1, -1, -1  }},
            {"cardCastle5f#1", new object[] {false, -1, -1, 123, 134, -1, -1, -1  }},
            {"hipShop", new object[] {false, -1, -1, 134, 123, -1, -1, -1  }},
            {"cardCastle5f#2", new object[] {false, -1, -1, 123, 125, -1, -1, -1  }},
            {"pre-kroundCastle", new object[] {false, -1, -1, -1, 125, 0, 1, -1  }},
            {"kroundCastle", new object[] {false, -1, -1, -1, 125, 1, 0, -1  }},
            {"post-kroundCastle", new object[] {false, -1, -1, 125, 126, -1, -1, -1  }},

            //Chaos King
            {"cardCastleThrone", new object[] {false, -1, -1, 126, 127, -1, -1, -1  }},
            {"pre-kingroom", new object[] {false, -1, -1, 127, 128, -1, -1, -1  }},
            {"pre-king", new object[] {false, -1, -1, -1, 128, 0, 1, -1  }},
            {"king", new object[] {false, -1, -1, -1, 128, 1, 0, -1  }},
            {"post-king", new object[] {false, -1, -1, 128, 129, -1, -1, -1  }},

            //Sleep
            {"post-kingRoom", new object[] {false, -1, -1, 129, 130, -1, -1, -1  }},
            {"fountainCutscene", new object[] {false, -1, -1, 130, 33, -1, -1, -1  }},
            {"unusedClassRoom", new object[] {false, -1, -1, 33, 31, -1, -1, -1  }},
            {"school1", new object[] {false, -1, -1, 31, 29, -1, -1, -1  }},
            {"school2", new object[] {false, -1, -1, 29, 14, -1, -1, -1  }},
            {"hometownSchool", new object[] {false, -1, -1, 14, 13, -1, -1, -1  }},
            {"hometownLibrary", new object[] {false, -1, -1, 13, 11, -1, -1, -1  }},
            {"hometownSans", new object[] {false, -1, -1, 11, 9, -1, -1, -1  }},
            {"hometownScatty", new object[] {false, -1, -1, 9, 7, -1, -1, -1  }},
            {"hometownTorielHouse", new object[] {false, -1, -1, 7, 5, -1, -1, -1  }},
            {"torielHouse#1", new object[] {false, -1, -1, 5, 3, -1, -1, -1  }},
            {"torielHouse#2", new object[] {false, -1, -1, 3, 2, -1, -1, -1  }},

            //Ends on the textwriter being discarded
            {"theEnd", new object[] {false, -1, 251, -1, 2, -1, -1, 2  }},
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
}

start {
  if (old.room == current.room) return false;

  print("[DELTARUNE] New room " + old.room + " -> " + current.room);

  switch(version) {
    case "SURVEY_PROGRAM":
      if (current.room == 1) { print("[DELTARUNE] START" + " Room: " + current.room); return true; }
      break;
    default:
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

  switch(version) {
    case "SURVEY_PROGRAM":
        if (current.room == 1) { print("[DELTARUNE] RESET"); return true; }
        break;
    default:
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
  if(current.plot != old.plot) print("[DELTARUNE] PLOT CHANGED " + old.plot + "->" + current.plot);
  if(current.fight != old.fight) print("[DELTARUNE] FIGHT CHANGED " + old.fight + "->" + current.fight);

  foreach (string goal in vars.splits.Keys) {
      // is this an enabled split that is armed?
      if ((true) && (!vars.splits[goal][vars.done])) {
          // is there a current room requirement?
          if ((vars.splits[goal][vars.curRoom] != -1) && (current.room != vars.splits[goal][vars.curRoom]))
              continue;

          // is there an old room requirement?
          if ((vars.splits[goal][vars.oldRoom] != -1) && (old.room != vars.splits[goal][vars.oldRoom]))
              continue;

          // is there an exact plot requirement?
          if ((vars.splits[goal][vars.reqPlot] != -1) && (current.plot != vars.splits[goal][vars.reqPlot]))
              continue;

          // is there a maximum plot requirement?
          if ((vars.splits[goal][vars.maxPlot] != -1) && (current.plot > vars.splits[goal][vars.maxPlot]))
              continue;

          // is there a current fight requirement ?
          if ((vars.splits[goal][vars.curFight] != -1) && (current.fight != vars.splits[goal][vars.curFight]))
              continue;

          // is there an old fight requirement ?
          if ((vars.splits[goal][vars.oldFight] != -1) && (old.fight != vars.splits[goal][vars.oldFight]))
              continue;
          
          // is there a special flag requirement?
          if (vars.splits[goal][vars.special] != -1) {
              bool pass = false;

              switch((int)vars.splits[goal][vars.special]) {
                  case 1:  // theendboxclosed
                      /*
                      When the final textbox is closed, the game stores global.fileChoice in a temp var
                      it then sets global.fileChoice + 3, saves the game, and then sets it back
                      we can use this to get the frame after the textbox was closed by looking for fileChoice > 2
                      as this will only be valid in this one case
                      */
                      pass = (current.fileChoice > 2);
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
                  case 8: //puzzleroom#2
                      pass = vars.splits["puzzleroom#1"][vars.done];
                      break;

                  case 9: //escapeprisoncutscene
                      pass = vars.splits["prizonpuzzle"][vars.done];
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

  return false;
}
