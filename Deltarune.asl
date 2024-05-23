// DELTARUNE Autosplitter by Narry, Tenebrosful & NERS

state("DELTARUNE", "SURVEY_PROGRAM")
{
    // Global
    double plot    : 0x48E5DC, 0x27C, 0x488, 0x500; // global.plot
    double choicer : 0x48E5DC, 0x27C, 0x28,  0x40;  // global.choice

    // Self
    double lancerCon         : 0x48BDEC, 0x10, 0x60, 0x10, 0x10,  0x0; // obj_darkcastle_event.con
    double doorCloseCon      : 0x48BDEC, 0xC,  0x60, 0x10, 0x10,  0x0; // obj_darkdoorevent.con
    double jevilDance        : 0x48BDEC, 0x78, 0x60, 0x10, 0x10,  0x0; // obj_joker_body.dancelv
    double jevilDance2       : 0x48BDEC, 0x7C, 0x60, 0x10, 0x10,  0x0;
    double finalTextboxHalt  : 0x48BDEC, 0x98, 0x60, 0x10, 0x274, 0x0; // obj_writer.halt
    double finalTextboxHalt2 : 0x48BDEC, 0x9C, 0x60, 0x10, 0x274, 0x0;

    float kingPos : 0x6AEB80, 0x4, 0x178, 0x80, 0xC8, 0x8, 0xB4;
}

state("DELTARUNE", "Demo v1.08 / v1.09")
{
    double chapter : 0x6FCF38, 0x30, 0x24D8, 0x0; // global.chapter
    double fight   : 0x6FCF38, 0x30, 0x4F8,  0x0; // global.fighting

    double lancerCon        : 0x6EF220, 0x128, 0x510, 0x20, 0x24,  0x10, 0xD8,  0x0;
    double doorCloseCon     : 0x6EF220, 0x84,  0x24,  0x10, 0x18,  0x0;       
    double namerEvent       : 0x6EF220, 0xD4,  0x5C,  0x20, 0x24,  0x10, 0x9C,  0x0;                   // DEVICE_NAMER.EVENT
    double loadedDiskGreyBG : 0x6EF220, 0x84,  0x24,  0x10, 0x3D8, 0x0;                                // obj_shop_ch2_spamton.greybgtimer
    double snowgrave        : 0x6EF220, 0xF4,  0x27C, 0x6C, 0x5C,  0x20, 0x144, 0x24, 0x10, 0xC0, 0x0; // obj_spell_snowgrave.timer

    float kingPos : 0x6F1394, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string32  sound : 0x4E0794, 0x58, 0xC0,  0x40, 0x0;
    string128 text  : 0x6FCE4C, 0x8,  0x144, 0x24, 0x10, 0x5A0, 0x0, 0x0, 0x0;
    string256 song  : 0x4DFF58, 0x0,  0x44,  0x0; // Full path
}

state("DELTARUNE", "Demo v1.10")
{
    double chapter : 0x6FCF38, 0x30, 0x24D8, 0x0;
    double fight   : 0x6FCF38, 0x30, 0x4F8,  0x0;

    double lancerCon        : 0x6EF220, 0x128, 0x510, 0x20, 0x24,  0x10, 0xD8,  0x0;
    double doorCloseCon     : 0x6EF220, 0x84,  0x24,  0x10, 0x18,  0x0;
    double namerEvent       : 0x6EF220, 0xD4,  0x5C,  0x20, 0x24,  0x10, 0x2F4, 0x0;
    double loadedDiskGreyBG : 0x6EF220, 0x84,  0x24,  0x10, 0x87C, 0x0;
    double snowgrave        : 0x6EF220, 0xF4,  0x27C, 0x6C, 0x5C,  0x20, 0x144, 0x24, 0x10, 0xC0, 0x0;

    float kingPos : 0x6F1394, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string32  sound : 0x4E0794, 0x58, 0xC0,  0x40, 0x0;
    string128 text  : 0x6FCE4C, 0x8,  0x144, 0x24, 0x10, 0x5A0, 0x0, 0x0, 0x0;
    string256 song  : 0x4DFF58, 0x0,  0x44,  0x0;
}

state("DELTARUNE", "Demo Steam Beta")
{
    double chapter : 0x6FE860, 0x30, 0x2F34, 0x80;
    double fight   : 0x6FE860, 0x30, 0xA758, 0x0;

    double lancerCon        : 0x6F0B48, 0x128, 0x510, 0x20, 0x24, 0x10, 0x138, 0x0;
    double doorCloseCon     : 0x6F0B48, 0x84,  0x24,  0x10, 0x18, 0x0;
    double namerEvent       : 0x6F0B48, 0xD4,  0x5C,  0x20, 0x24, 0x10, 0xFC,  0x0;
    double loadedDiskGreyBG : 0x6F0B48, 0x84,  0x24,  0x10, 0x0,  0x0;
    double snowgrave        : 0x6F0B48, 0xF4,  0x27C, 0x6C, 0x5C, 0x20, 0x144, 0x24, 0x10, 0x120, 0x0;

    float kingPos : 0x6F2CBC, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string32  sound : 0x4E20B4, 0x58, 0xC0,  0x40, 0x0;
    string128 text  : 0x6FE774, 0x8,  0x144, 0x24, 0x10, 0x0, 0x0, 0x0, 0x0;
    string256 song  : 0x4E1878, 0x0,  0x0,   0x0;
}

startup
{
    refreshRate = 30;
    vars.tempVar = 0;
    vars.forceSplit = false;
    vars.ACContinueRooms = new[,]
    {
        {null, null},                            //
        {"PLACE_MENU_ch1", "PLACE_CONTACT_ch1"}, // Chapter 1
        {"PLACE_MENU_ch2", "room_krisroom_ch2"}  // Chapter 1 -> 2
    };
    vars.OSTRooms = new[,]
    {
        {null, null},                         //
        {"PLACE_LOGO_ch1",    "room_ed_ch1"}, // Chapter 1
        {"room_torhouse_ch2", "room_ed_ch2"}  // Chapter 2
    };

    vars.resetVars = (Action)(() =>
    {
        vars.tempVar = 0;
        vars.forceSplit = false;
        print("[DELTARUNE] All variables have been reset to initial state");
    });

    vars.resetSplits = (Action)(() =>
    {
        foreach(string split in vars.splits.Keys) 
            vars.splits[split][0] = false;
        
        print("[DELTARUNE] All splits have been reset to initial state");
    });

    // -------------------------------------------------------------------------------------------
    settings.Add("AC", true, "All Chapters");
    settings.CurrentDefaultParent = "AC";

    settings.Add("AC_PauseTimer", true, "Pause timer between chapters");
     settings.SetToolTip("AC_PauseTimer",
        "This setting pauses the timer when you end a chapter and resumes it when you continue from a previous save in the next chapter.\n\n" +
        "NOTE: For this to work, Game Time must be enabled\n" +
        "(you will be asked if you want to enable it by turning on this setting and opening the game if the timer isn't already running, or you can do it yourself).");
    
    settings.Add("AC_PauseTimerOST", false, "(OST%) Pause timer between chapters");
     settings.SetToolTip("AC_PauseTimerOST",
        "This setting is the same as the above one, however it pauses the timer when the credits music starts playing instead.\n" +
        "Useful for OST%. NOTE: Enabling this will override the above setting (you can not have both activated at once).");

    settings.Add("AC_Continue", false, "Split on starting a chapter from a previous save file");
    settings.CurrentDefaultParent = null;
    // -------------------------------------------------------------------------------------------
    settings.Add("Ch1", false, "Chapter 1: The Beginning");
    settings.CurrentDefaultParent = "Ch1";

    settings.Add("Ch1_School",                false, "Enter Dark World (True Reset)");
    settings.Add("Ch1_Lancer_BikeExplosion",  false, "Lancer Bike Explosion");
    settings.Add("Ch1_CastleTown_DoorClose",  false, "Exit Castle Town (door close)");
    settings.Add("Ch1_CastleTown_RoomChange", false, "Exit Castle Town (room change)");
    settings.Add("Ch1_Fields_Exit",           false, "Exit Fields");
    settings.Add("Ch1_Checkerboard_Exit",     false, "Exit Checkerboard");
    settings.Add("Ch1_BakeSale_Enter",        false, "Enter Bake Sale");
    settings.Add("Ch1_SusieLancer_Exit",      false, "Exit Forest (Susie & Lancer room)");
    settings.Add("Ch1_Escape_Cell",           false, "Exit Prison Cell");
    settings.Add("Ch1_KRound2_Exit",          false, "Exit K. Round 2 room");
    settings.Add("Ch1_Throne_Exit",           false, "Exit Throne Room");
    settings.Add("Ch1_PreKing_Exit",          false, "Exit Pre-King room");
    settings.Add("Ch1_King_EndBattle",        false, "End King battle");
    settings.Add("Ch1_King_Exit",             false, "Exit King room");
    settings.Add("Ch1_Fountain_Enter",        false, "Enter Fountain");
    settings.Add("Ch1_Fountain_Exit",         false, "Exit Fountain");
    settings.Add("Ch1_Ending",                false, "Ending");
    settings.Add("Ch1_EndingOST",             false, "(OST%) Ending");

    settings.Add("Ch1_AB", false, "All Bosses Splits");
    settings.CurrentDefaultParent = "Ch1_AB";
     settings.Add("Ch1_Jevil_EnterRoom", false, "Enter Jevil room");
     settings.Add("Ch1_Jevil_EndBattle", false, "End Jevil battle");
      settings.SetToolTip("Ch1_Jevil_EndBattle", @"This autosplit does not work if you remove Jevil's battle theme from the game files (mus\joker.ogg) in non-SURVEY_PROGRAM versions.");
     settings.Add("Ch1_Jevil_LeaveRoom", false, "Exit Jevil room");
    settings.CurrentDefaultParent = null;
    // -------------------------------------------------------------------------------------------
    settings.Add("Ch2", false, "Chapter 2: A Cyber's World");
    settings.CurrentDefaultParent = "Ch2";

    settings.Add("Ch2_Library",          false, "Enter Dark World (True Reset)");
    settings.Add("Ch2_ArcadeGameText",   false, "Arcade Game (textbox close)");
    settings.Add("Ch2_ArcadeGameLeave",  false, "Arcade Game (room change)");
    settings.Add("Ch2_DJFight",          false, "End DJ battle");
    settings.Add("Ch2_DJShopRoom",       false, "Enter DJ Shop room");
    settings.Add("Ch2_Ragger2",          false, "Exit Ragger2 room");
    settings.Add("Ch2_CyberFields_Exit", false, "Exit Cyber Fields");
    settings.Add("Ch2_TrashZoneWarp",    false, "Trash Zone Warp");
    settings.Add("Ch2_MansionWarp",      false, "Mansion Warp");
    settings.Add("Ch2_Mouse2Puzzle",     false, "Exit Mouse 2 Puzzle room");
    settings.Add("Ch2_Berdly_Leave",     false, "Exit Berdly 2 room (Main Route)");
    settings.Add("Ch2_SpamtonLeave",     false, "Exit Spamton room");
    settings.Add("Ch2_CyberCity_Exit",   false, "Exit Cyber City (captured by Queen)");
    settings.Add("Ch2_Mansion_Entrance", false, "Enter Mansion Entrance save point room");
    settings.Add("Ch2_Mansion_Exit",     false, "Exit Mansion Entrance save point room");
    settings.Add("Ch2_TasqueManager",    false, "Exit Tasque Manager room");
    settings.Add("Ch2_Mauswheel",        false, "Exit Mauswheel room");
    settings.Add("Ch2_AcidLake_Enter",   false, "Enter Acid Lake");
    settings.Add("Ch2_AcidLake_Exit",    false, "Exit Acid Lake");
    settings.Add("Ch2_Queen",            false, "Exit Queen room");
    settings.Add("Ch2_GigaQueen",        false, "End Giga Queen battle");
    settings.Add("Ch2_Fountain_Enter",   false, "Enter Fountain");
    settings.Add("Ch2_Fountain_Exit",    false, "Exit Fountain");
    settings.Add("Ch2_Ending",           false, "Ending");
    settings.Add("Ch2_EndingOST",        false, "(OST%) Ending");

    settings.Add("Ch2_AB", false, "All Bosses Splits");
    settings.CurrentDefaultParent = "Ch2_AB";
     settings.Add("Ch2_Disk_Loaded",      false, "Obtain Loaded Disk");
     settings.Add("Ch2_SpamtonNEO_End",   false, "End basement Spamton NEO battle");
      settings.SetToolTip("Ch2_SpamtonNEO_End", @"This autosplit does not work if you remove Spamton NEO's battle theme from the game files (mus\spamton_neo_mix_ex_wip.ogg).");
     settings.Add("Ch2_SpamtonNEO_Leave", false, "Exit basement Spamton NEO room");
    settings.CurrentDefaultParent = "Ch2";

    settings.Add("Ch2_WR", false, "Weird Route Splits");
    settings.CurrentDefaultParent = "Ch2_WR";
     settings.Add("Ch2_FreezeRing",         false, "Obtain FreezeRing");
     settings.Add("Ch2_SGBerdly",           false, "Snowgrave Berdly");
     settings.Add("Ch2_SGBerdly_LeaveRoom", false, "Exit Berdly 2 room (Weird Route)");
     settings.Add("Ch2_SGSpamtonNEO_End",   false, "End fountain Spamton NEO battle");
    settings.CurrentDefaultParent = null;
    // -------------------------------------------------------------------------------------------
}

exit
{
    vars.resetVars();
}

init
{
    var module = modules.First();
    int mms = module.ModuleMemorySize;
    vars.x64 = game.Is64Bit();

    // Thanks to Jujstme and Ero for this (finding room names)
    var scanner = new SignatureScanner(game, module.BaseAddress, module.ModuleMemorySize);
    Func<int, string, IntPtr> scan = (o, sig) =>
    {
        IntPtr ptr = vars.x64 // It's possible that the game may be on the new 64-bit only GameMaker runtime in the future, so I added this just in case
            ? scanner.Scan(new SigScanTarget(o, sig) { OnFound = (p, s, addr) => addr + p.ReadValue<int>(addr) + 0x4 })
            : scanner.Scan(new SigScanTarget(o, sig) { OnFound = (p, s, addr) => p.ReadPointer(addr) });

        if(ptr == IntPtr.Zero) throw new NullReferenceException("[DELTARUNE] Signature scanning failed");
        print("[DELTARUNE] Signature found at " + ptr.ToString("X"));
        return ptr;
    };
    
    IntPtr ptrRoomArray = vars.x64 
        ? scan(5, "74 0C 48 8B 05 ?? ?? ?? ?? 48 8B 04 D0")
        : scan(2, "8B 3D ?? ?? ?? ?? 2B EF");

    vars.ptrRoomID = vars.x64 
        ? scan(9, "48 8B 05 ?? ?? ?? ?? 89 3D ?? ?? ?? ??")
        : scan(2, "FF 35 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 04 50 68");

    vars.getRoomName = (Func<string>)(() =>
    {
        IntPtr arrayMain = game.ReadPointer(ptrRoomArray);
        if(arrayMain == IntPtr.Zero) return string.Empty;

        IntPtr arrayItem = vars.x64 
            ? game.ReadPointer(arrayMain + game.ReadValue<int>((IntPtr)vars.ptrRoomID) * 8)
            : game.ReadPointer(arrayMain + game.ReadValue<int>((IntPtr)vars.ptrRoomID) * 4);

        if(arrayItem == IntPtr.Zero) return string.Empty;
        return game.ReadString(arrayItem, 64);
    });

    switch(mms)
    {
        case 7954432:
            version = "SURVEY_PROGRAM";
            break;

        case 7503872:
            version = "Demo Steam Beta";
            break;

        case 7495680:
            string hash;
            using(var md5 = System.Security.Cryptography.MD5.Create())
                using(var fs = File.OpenRead(modules.First().FileName)) 
                    hash = string.Concat(md5.ComputeHash(fs).Select(b => b.ToString("X2")));

            if(hash == "DCFB86F7A80D9906BBBAFA1B2C224848") 
                version = "Demo v1.10";

            else
                version = "Demo v1.08 / v1.09";
            break;

        default:
            version = "Unknown";

            MessageBox.Show
            (
                "This version of DELTARUNE is not supported by the autosplitter.\nIf you are playing an older version, update your game.\nIf not, please wait until the autosplitter receives an update.",
                "LiveSplit | DELTARUNE", MessageBoxButtons.OK, MessageBoxIcon.Warning
            );
            break;
    }
    print("[DELTARUNE] Detected game version: " + version + " (" + mms + ")");

    vars.splits = new Dictionary<string, object[]>()
    {
        // Ending splits are handled manually in update{}
        // Object variables in order: done, old room, new room, old fight, new fight, special condition
        {"Ch1_School",                new object[] {false, "room_insidecloset_ch1",       "room_dark1_ch1",                -1, -1, 0}},
        {"Ch1_Lancer_BikeExplosion",  new object[] {false, null,                          "room_castle_front_ch1",         -1, -1, 1}},
        {"Ch1_CastleTown_DoorClose",  new object[] {false, null,                          "room_castle_darkdoor_ch1",      -1, -1, 2}},
        {"Ch1_CastleTown_RoomChange", new object[] {false, "room_castle_darkdoor_ch1",    "room_field_start_ch1",          -1, -1, 0}},
        {"Ch1_Fields_Exit",           new object[] {false, "room_field4_ch1",             "room_field_checkers4_ch1",      -1, -1, 0}},
        {"Ch1_Checkerboard_Exit",     new object[] {false, "room_field_checkersboss_ch1", "room_forest_savepoint1_ch1",    -1, -1, 0}},
        {"Ch1_BakeSale_Enter",        new object[] {false, "room_forest_area3_ch1",       "room_forest_savepoint2_ch1",    -1, -1, 0}},
        {"Ch1_SusieLancer_Exit",      new object[] {false, "room_forest_fightsusie_ch1",  "room_forest_afterthrash2_ch1",  -1, -1, 0}},
        {"Ch1_Escape_Cell",           new object[] {false, "room_cc_prison_cells_ch1",    "room_cc_prisonlancer_ch1",      -1, -1, 3}},
        {"Ch1_Jevil_EnterRoom",       new object[] {false, "room_cc_prison_prejoker_ch1", "room_cc_joker_ch1",             -1, -1, 0}},
        {"Ch1_Jevil_EndBattle",       new object[] {false, null,                          "room_cc_joker_ch1",             -1, -1, 4}},
        {"Ch1_Jevil_LeaveRoom",       new object[] {false, "room_cc_joker_ch1",           "room_cc_prison_prejoker_ch1",   -1, -1, 0}},
        {"Ch1_KRound2_Exit",          new object[] {false, "room_cc_6f_ch1",              "room_cc_throneroom_ch1",        -1, -1, 0}},
        {"Ch1_Throne_Exit",           new object[] {false, "room_cc_throneroom_ch1",      "room_cc_preroof_ch1",           -1, -1, 0}},
        {"Ch1_PreKing_Exit",          new object[] {false, "room_cc_preroof_ch1",         "room_cc_kingbattle_ch1",        -1, -1, 0}},
        {"Ch1_King_EndBattle",        new object[] {false, null,                          "room_cc_kingbattle_ch1",        -1, -1, 5}},
        {"Ch1_King_Exit",             new object[] {false, "room_cc_kingbattle_ch1",      "room_cc_prefountain_ch1",       -1, -1, 0}},
        {"Ch1_Fountain_Enter",        new object[] {false, "room_cc_prefountain_ch1",     "room_cc_fountain_ch1",          -1, -1, 0}},
        {"Ch1_Fountain_Exit",         new object[] {false, "room_cc_fountain_ch1",        "room_school_unusedroom_ch1",    -1, -1, 0}},

        {"Ch2_Library",            new object[] {false, "room_library_ch2",                            "room_dw_cyber_intro_1_ch2",                   -1, -1,  0}},
        {"Ch2_ArcadeGameText",     new object[] {false, null,                                          "room_dw_cyber_queen_boxing_ch2",              -1, -1,  6}},
        {"Ch2_ArcadeGameLeave",    new object[] {false, "room_dw_cyber_queen_boxing_ch2",              "room_dw_cyber_musical_door_ch2",              -1, -1,  0}},
        {"Ch2_DJFight",            new object[] {false, null,                                          "room_dw_cyber_music_final_ch2",                1,  0,  0}},
        {"Ch2_DJShopRoom",         new object[] {false, "room_dw_cyber_musical_door_ch2",              "room_dw_cyber_musical_shop_ch2",              -1, -1,  0}},
        {"Ch2_Ragger2",            new object[] {false, "room_dw_cyber_teacup_final_ch2",              "room_dw_cyber_rollercoaster_ch2",             -1, -1,  0}},
        {"Ch2_CyberFields_Exit",   new object[] {false, null,                                          "room_dw_cyber_rollercoaster_ch2",             -1, -1,  7}},
        {"Ch2_TrashZoneWarp",      new object[] {false, "room_dw_cyber_musical_door_ch2",              "room_dw_city_intro_ch2",                      -1, -1,  0}},
        {"Ch2_MansionWarp",        new object[] {false, "room_dw_cyber_musical_door_ch2",              "room_dw_mansion_entrance_ch2",                -1, -1,  0}},
        {"Ch2_FreezeRing",         new object[] {false, null,                                          "room_dw_city_big_2_ch2",                      -1, -1,  8}},
        {"Ch2_Mouse2Puzzle",       new object[] {false, "room_dw_city_mice2_ch2",                      "room_dw_city_cheesemaze_ch2",                 -1, -1,  0}},
        {"Ch2_SGBerdly",           new object[] {false, null,                                          "room_dw_city_berdly_ch2",                     -1, -1,  9}},
        {"Ch2_SGBerdly_LeaveRoom", new object[] {false, "room_dw_city_berdly_ch2",                     "room_dw_city_poppup_ch2",                     -1, -1,  0}},
        {"Ch2_Berdly_Leave",       new object[] {false, "room_dw_city_berdly_ch2",                     "room_dw_city_traffic_4_ch2",                  -1, -1,  0}},
        {"Ch2_SpamtonLeave",       new object[] {false, "room_dw_city_spamton_alley_ch2",              "room_dw_city_traffic_4_ch2",                  -1, -1,  0}},
        {"Ch2_CyberCity_Exit",     new object[] {false, "room_dw_city_mansion_front_ch2",              "room_dw_mansion_krisroom_ch2",                -1, -1,  0}},
        {"Ch2_Mansion_Entrance",   new object[] {false, "room_dw_mansion_dining_a_ch2",                "room_dw_mansion_entrance_ch2",                -1, -1,  0}},
        {"Ch2_Mansion_Exit",       new object[] {false, "room_dw_mansion_entrance_ch2",                "room_dw_mansion_fire_paintings_ch2",          -1, -1,  0}},
        {"Ch2_TasqueManager",      new object[] {false, "room_dw_mansion_tasquePaintings_ch2",         "room_dw_mansion_traffic_ch2",                 -1, -1,  0}},
        {"Ch2_Mauswheel",          new object[] {false, "room_dw_mansion_kitchen_ch2",                 "room_dw_mansion_east_2f_transformed_new_ch2", -1, -1,  0}},
        {"Ch2_Disk_Loaded",        new object[] {false, null,                                          "room_shop_ch2_spamton_ch2",                   -1, -1, 10}},
        {"Ch2_SpamtonNEO_End",     new object[] {false, null,                                          "room_dw_mansion_b_east_ch2",                  -1, -1, 11}},
        {"Ch2_SpamtonNEO_Leave",   new object[] {false, "room_dw_mansion_b_east_ch2",                  "room_dw_mansion_b_east_a_ch2",                -1, -1,  0}},
        {"Ch2_AcidLake_Enter",     new object[] {false, "room_dw_mansion_east_3f_ch2",                 "room_dw_mansion_acid_tunnel_ch2",             -1, -1,  0}},
        {"Ch2_AcidLake_Exit",      new object[] {false, "room_dw_mansion_acid_tunnel_loop_rouxls_ch2", "room_dw_mansion_acid_tunnel_exit_ch2",        -1, -1,  0}},
        {"Ch2_Queen",              new object[] {false, "room_dw_mansion_east_4f_d_ch2",               "room_dw_mansion_top_ch2",                     -1, -1,  0}},
        {"Ch2_GigaQueen",          new object[] {false, "room_dw_mansion_top_ch2",                     "room_dw_mansion_top_post_ch2",                -1, -1,  0}},
        {"Ch2_Fountain_Enter",     new object[] {false, null,                                          null,                                          -1, -1, 12}},
        {"Ch2_SGSpamtonNEO_End",   new object[] {false, null,                                          "room_dw_mansion_fountain_ch2",                 1,  0,  0}},
        {"Ch2_Fountain_Exit",      new object[] {false, null,                                          "room_lw_computer_lab_ch2",                    -1, -1, 13}}
    };

    if(version != "SURVEY_PROGRAM" && timer.CurrentPhase == TimerPhase.NotRunning && timer.CurrentTimingMethod == TimingMethod.RealTime && (settings["AC_PauseTimer"] || settings["AC_PauseTimerOST"]))
    {
        var message = MessageBox.Show
        (
            "LiveSplit uses Game Time for this game. Would you like to change the current timing method to Game Time instead of Real Time?",
            "LiveSplit | DELTARUNE", MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if(message == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

update
{
    if(version == "Unknown")
        return false;

    current.room = game.ReadValue<int>((IntPtr)vars.ptrRoomID);
    current.roomName = vars.getRoomName();

    if(version == "SURVEY_PROGRAM")
        current.chapter = 1;

    if(current.chapter > 0)
    {
        int ch = (int)current.chapter;
        string chapterStr = ("_ch" + ch);
        if(!current.roomName.EndsWith(chapterStr)) 
            current.roomName += chapterStr;

        bool endCondition = false;
        switch(ch)
        {
            case 1:
                if(version == "SURVEY_PROGRAM")
                    endCondition = (((old.finalTextboxHalt == 2 && current.finalTextboxHalt != 2) || (old.finalTextboxHalt2 == 2 && current.finalTextboxHalt2 != 2)) && current.choicer == 0 && current.plot == 251);
               
                else
                    endCondition = ((old.text == @"＊ (ねむることにした)/%" || old.text == @"* (You decided to go to bed.)/%") && current.text == null);
                break;
                
            case 2:
                endCondition = ((old.text == @"\E1＊ …ふたりとも　もう&　 ねむってしまったのね。/%" || old.text == @"\E1* ... they're already&||asleep.../%") && current.text == null);
                break;
        }
        if(endCondition)
        {
            if(settings["AC_PauseTimer"] && !settings["AC_PauseTimerOST"])
            {
                print("[DELTARUNE] All Chapters: Chapter " + ch + " ended, timer paused");
                timer.IsGameTimePaused = true;
                vars.resetSplits();
            }
            vars.forceSplit = settings["Ch" + ch + "_Ending"];
        }

        else if(old.roomName == vars.OSTRooms[ch, 0] && current.roomName == vars.OSTRooms[ch, 1])
        {
            if(settings["AC_PauseTimerOST"] && !timer.IsGameTimePaused)
            {
                print("[DELTARUNE] (OST%) All Chapters: Chapter " + ch + " ended, timer paused");
                timer.IsGameTimePaused = true;
                vars.resetSplits();
            }
            vars.forceSplit = settings["Ch" + ch + "_EndingOST"];
        }

        if(old.roomName == vars.ACContinueRooms[ch, 0] && current.roomName == vars.ACContinueRooms[ch, 1] && timer.IsGameTimePaused)
        {
            print("[DELTARUNE] All Chapters: Chapter " + ch + " started, timer resumed");
            timer.IsGameTimePaused = false;
            vars.forceSplit = settings["AC_Continue"];
        }
    }

    if(old.room != current.room)
    {
        print("[DELTARUNE] Room: " + old.room + " (" + old.roomName + ")" + " -> " + current.room + " (" + current.roomName + ")");
        if(old.roomName == "room_cc_prison_cells_ch1" && current.roomName == "room_cc_prisonlancer_ch1" && settings["Ch1_Escape_Cell"]) 
            vars.tempVar ++;
    }
}

start
{
    if(old.room != current.room && current.roomName == "PLACE_CONTACT_ch1")
    {
        print("[DELTARUNE] Timer started (Start Room for Chapter 1 detected)");
        return true;
    }

    else if(version != "SURVEY_PROGRAM")
    {
        if(old.namerEvent == 74 && current.namerEvent == 75)
        {
            print("[DELTARUNE] Timer started (Start Event for Chapter " + current.chapter + " detected)");
            return true;
        }
    }
}

onStart
{
    timer.IsGameTimePaused = true;  // Weird workaround for
    timer.IsGameTimePaused = false; // split times not showing up with Game Time
}

reset
{
    if(old.room != current.room && current.roomName == "PLACE_CONTACT_ch1")
    {
        print("[DELTARUNE] Timer reset (Start Room for Chapter 1 detected)");
        return true;
    }

    else if(version != "SURVEY_PROGRAM")
    {
        if(old.namerEvent == 74 && current.namerEvent == 75)
        {
            print("[DELTARUNE] Timer reset (Start Event for Chapter " + current.chapter + " detected)");
            return true;
        }
    }
}

onReset
{
    vars.resetVars();
    if(game != null)
        vars.resetSplits();
}

split
{
    if(vars.forceSplit)
    {
        vars.forceSplit = false;
        return true;
    }

    int done      = 0,
        oldRoom   = 1,
        newRoom   = 2,
        oldFight  = 3,
        newFight  = 4,
        condition = 5;

    foreach(string splitKey in vars.splits.Keys)
    {
        if((!settings[splitKey] || vars.splits[splitKey][done]) ||
           (vars.splits[splitKey][oldRoom] != null && old.roomName != vars.splits[splitKey][oldRoom]) ||
           (vars.splits[splitKey][newRoom] != null && current.roomName != vars.splits[splitKey][newRoom]) ||
           (vars.splits[splitKey][oldFight] != -1 && old.fight != vars.splits[splitKey][oldFight]) ||
           (vars.splits[splitKey][newFight] != -1 && current.fight != vars.splits[splitKey][newFight])) continue;

        bool pass = false;
        switch((int)vars.splits[splitKey][condition])
        {
            case 0:
                pass = true;
                break;

            case 1: // Ch1_Lancer_BikeExplosion
                pass = (old.lancerCon == 46 && current.lancerCon == 47);
                break;

            case 2: // Ch1_CastleTown_DoorClose
                pass = (old.doorCloseCon == 7 && current.doorCloseCon == 21);
                break;

            case 3: // Ch1_Escape_Cell
                if(vars.tempVar == 2)
                {
                    vars.tempVar = 0;
                    pass = true;
                }
                break;

            case 4: // Ch1_Jevil_EndBattle
                if(version == "SURVEY_PROGRAM")
                    pass = (current.jevilDance == 4 || current.jevilDance2 == 4);

                else
                    pass = (old.song.EndsWith(@"mus\joker.ogg") && current.song == null);
                break;

            case 5: // Ch1_King_EndBattle
                pass = (old.kingPos == 680 && current.kingPos >= 1020 && current.kingPos <= 1030);
                break;

            case 6: // Ch2_ArcadeGameText
                pass = ((old.text == @"\EH＊ おまえら^1！&　 追っかけるぞ！/%" || old.text == @"\EH* C'mon^1, let's go after&||her!/%") && current.text == null);
                break;

            case 7: // Ch2_CyberFields_Exit
                pass = (old.sound == "snd_queen_laugh_0" && current.sound == "snd_sussurprise");
                break;

            case 8: // Ch2_FreezeRing
                pass = ((old.text == @"＊ (凍てつく指輪を　手に入れた)/%" || old.text == @"* (You got the FreezeRing.)/%") && current.text == null);
                break;

            case 9: // Ch2_SGBerdly
                pass = (old.snowgrave <= 125 && current.snowgrave >= 125);
                break;

            case 10: // Ch2_Disk_Loaded
                pass = (old.loadedDiskGreyBG <= 121 && current.loadedDiskGreyBG == 121);
                break;

            case 11: // Ch2_SpamtonNEO_End
                pass = (old.song.EndsWith(@"mus\spamton_neo_mix_ex_wip.ogg") && current.song == null);
                break;

            case 12: // Ch2_Fountain_Enter
                pass = (current.roomName == "room_cc_fountain_ch2" || current.roomName == "room_dw_mansion_fountain_ch2");
                break;

            case 13: // Ch2_Fountain_Exit
                pass = (old.roomName == "room_cc_fountain_ch2" || old.roomName == "room_dw_mansion_fountain_ch2");
                break;
        }

        if(pass)
        {
            vars.splits[splitKey][done] = true;
            print("[DELTARUNE] Split triggered (" + splitKey + ")");
            return true;
        }
    }
}
