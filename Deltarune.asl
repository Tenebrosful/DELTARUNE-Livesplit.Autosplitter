// DELTARUNE Autosplitter by Narry, Tenebrosful & NERS

state("DELTARUNE", "SURVEY_PROGRAM")
{
    // Global
    double savefile : 0x48E5DC, 0x27C, 0x488, 0x4D0; // global.filechoice
    double plot     : 0x48E5DC, 0x27C, 0x488, 0x500; // global.plot
    double choicer  : 0x48E5DC, 0x27C, 0x28,  0x40;  // global.choice

    // Self
    double doorCloseCon      : 0x48BDEC, 0xC,  0x60, 0x10, 0x10,  0x0; // obj_darkdoorevent(_ch1).con
    double ch1Credits        : 0x48BDEC, 0x4,  0x60, 0x10, 0x34,  0x0; // obj_credits(_ch1).timer
    double jevilDance        : 0x48BDEC, 0x78, 0x60, 0x10, 0x10,  0x0; // obj_joker_body(_ch1).dancelv
    double jevilDance2       : 0x48BDEC, 0x7C, 0x60, 0x10, 0x10,  0x0; // Backup pointer
    double finalTextboxHalt  : 0x48BDEC, 0x98, 0x60, 0x10, 0x274, 0x0; // obj_writer(_ch1).halt
    double finalTextboxHalt2 : 0x48BDEC, 0x9C, 0x60, 0x10, 0x274, 0x0; // Backup pointer

    float kingPos : 0x6AEB80, 0x4, 0x178, 0x80, 0xC8, 0x8, 0xB4; // obj_kingcutscene(_ch1).king.x
}

state("DELTARUNE", "Demo v1.08/v1.09")
{
    double chapter : 0x6FCF38, 0x30, 0x24D8, 0x0; // global.chapter
    double fight   : 0x6FCF38, 0x30, 0x4F8,  0x0; // global.fighting

    double doorCloseCon     : 0x6EF220, 0x84, 0x24,  0x10, 0x18,  0x0;
    double ch1Credits       : 0x6EF220, 0xD4, 0x5C,  0x60, 0x24,  0x10, 0xC0,  0x0;
    double namerEvent       : 0x6EF220, 0xD4, 0x5C,  0x20, 0x24,  0x10, 0x9C,  0x0;                   // DEVICE_NAMER.EVENT
    double loadedDiskGreyBG : 0x6EF220, 0x84, 0x24,  0x10, 0x3D8, 0x0;                                // obj_shop_ch2_spamton.greybgtimer
    double snowgrave        : 0x6EF220, 0xF4, 0x27C, 0x6C, 0x5C,  0x20, 0x144, 0x24, 0x10, 0xC0, 0x0; // obj_spell_snowgrave.timer

    float kingPos : 0x6F1394, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string32  sound : 0x4E0794, 0x58, 0xC0,  0x40, 0x0;                        // Current sound (highest priority)
    string128 text  : 0x6FCE4C, 0x8,  0x144, 0x24, 0x10, 0x5A0, 0x0, 0x0, 0x0; // obj_writer(_ch1).mystring
    string256 song  : 0x4DFF58, 0x0,  0x44,  0x0;                              // Full path to the current song
}

state("DELTARUNE", "Demo v1.10")
{
    double chapter : 0x6FCF38, 0x30, 0x24D8, 0x0;
    double fight   : 0x6FCF38, 0x30, 0x4F8,  0x0;

    double doorCloseCon     : 0x6EF220, 0x84, 0x24,  0x10, 0x18,  0x0;
    double ch1Credits       : 0x6EF220, 0xD4, 0x5C,  0x60, 0x24,  0x10, 0xC0,  0x0;
    double namerEvent       : 0x6EF220, 0xD4, 0x5C,  0x20, 0x24,  0x10, 0x2F4, 0x0;
    double loadedDiskGreyBG : 0x6EF220, 0x84, 0x24,  0x10, 0x87C, 0x0;
    double snowgrave        : 0x6EF220, 0xF4, 0x27C, 0x6C, 0x5C,  0x20, 0x144, 0x24, 0x10, 0xC0, 0x0;

    float kingPos : 0x6F1394, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string32  sound : 0x4E0794, 0x58, 0xC0,  0x40, 0x0;
    string128 text  : 0x6FCE4C, 0x8,  0x144, 0x24, 0x10, 0x5A0, 0x0, 0x0, 0x0;
    string256 song  : 0x4DFF58, 0x0,  0x44,  0x0;
}

state("DELTARUNE", "Demo v1.12-v1.15")
{
    double chapter : 0x6FE860, 0x30, 0x2F34, 0x80;
    double fight   : 0x6FE860, 0x30, 0xA758, 0x0;

    double doorCloseCon     : 0x6F0B48, 0x84, 0x24,  0x10, 0x18, 0x0;
    double ch1Credits       : 0x6F0B48, 0xD4, 0x5C,  0x60, 0x24, 0x10, 0x120, 0x0;
    double namerEvent       : 0x6F0B48, 0xD4, 0x5C,  0x20, 0x24, 0x10, 0xFC,  0x0;
    double loadedDiskGreyBG : 0x6F0B48, 0x84, 0x24,  0x10, 0x0,  0x0;
    double snowgrave        : 0x6F0B48, 0xF4, 0x27C, 0x6C, 0x5C, 0x20, 0x144, 0x24, 0x10, 0x120, 0x0;

    float kingPos : 0x6F2CBC, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string32  sound : 0x4E20B4, 0x58, 0xC0,  0x40, 0x0;
    string128 text  : 0x6FE774, 0x8,  0x144, 0x24, 0x10, 0x0, 0x0, 0x0, 0x0;
    string256 song  : 0x4E1878, 0x0,  0x0,   0x0;
}

state("DELTARUNE", "Demo v1.19")
{
    double fight_ch1 : 0x6A1CA8, 0x48, 0x10, 0x5D0, 0x0;
    double fight_ch2 : 0x6A1CA8, 0x48, 0x10, 0x620, 0x50;

    double doorCloseCon     : 0x8B2790, 0xE0,  0x48,  0x10, 0x0,   0x0;
    double ch1Credits       : 0x8B2790, 0x178, 0x70,  0x78, 0x48,  0x10, 0x1A0, 0x0;
    double namerEvent       : 0x8B2790, 0x178, 0x70,  0x38, 0x48,  0x10, 0x3B0, 0x0;
    double loadedDiskGreyBG : 0x8B2790, 0xE0,  0x48,  0x10, 0x3C0, 0x0;
    double snowgrave        : 0x8B2790, 0x1A0, 0x3B0, 0x88, 0x70,  0x38, 0x1A0, 0x48, 0x10, 0x3D0, 0x0;

    float kingPos : 0x69FA98, 0x0, 0x530, 0x50, 0x158, 0x10, 0xE8;

    string32  sound    : 0x6A3818, 0x60, 0xD0,  0x58, 0x0;
    string128 text_ch1 : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0xF0, 0x0, 0x0, 0x0;

    // Chapter 2 in this version is a bit weird, this pointer changes on some textboxes and
    // also seems to change if you don't hold the automasher
    string128 text_ch2   : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0x5F0, 0x0, 0x0, 0x0;
    string128 text_ch2_2 : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0x6D0, 0x0, 0x0, 0x0;
    string128 text_ch2_3 : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0x6F0, 0x0, 0x0, 0x0;

    string256 song      : 0x6A2F90, 0x0, 0x0, 0x0;
    string256 directory : 0x8D06E0, 0x0; // Full path to the current game's directory
}

startup
{
    vars.tempVar = 0;
    vars.forceSplit = false;
    vars.SPEndingTriggered = false; // Used to prevent a double split
    vars.IGTPopup = false; // Used to prevent the IGT pop-up opening multiple times, especially on LTS (the game fully closes and reopens every chapter switch)
    vars.UnknownPopup = false; // Same as above for the unknown version pop-up
    vars.ACContinueRooms = new[,]
    {
        {null, null},
        {"PLACE_MENU_ch1", "PLACE_CONTACT_ch1"}, // Chapter 1
        {"PLACE_MENU_ch2", "room_krisroom_ch2"}  // Chapter 1 -> 2
    };
    vars.OSTRooms = new[,]
    {
        {null, null},
        {null, null},                        // Chapter 1 (handled separately due to credits timing)
        {"room_torhouse_ch2", "room_ed_ch2"} // Chapter 2
    };

    vars.resetVars = (Action)(() =>
    {
        vars.tempVar = 0;
        vars.forceSplit = false;
        vars.SPEndingTriggered = false;
        print("[DELTARUNE] All variables have been reset to initial state");
    });

    // ver = version, org = original (equivalent to old), cur = current (can't use the same names)
    vars.checkTextOpen = (Func<string, dynamic, dynamic, string, string, bool>)((ver, org, cur, en, jp) => 
    {
        switch(ver)
        {
            case "SURVEY_PROGRAM":
                return false;
            case "Demo v1.19":
                return (org.text == null && (cur.text == en || cur.text == jp)) || (org.text_ch2_2 == null && (cur.text_ch2_2 == en || cur.text_ch2_2 == jp)) || (org.text_ch2_3 == null && (cur.text_ch2_3 == en || cur.text_ch2_3 == jp));
            default:
                return (org.text == null && (cur.text == en || cur.text == jp));
        }
    });

    vars.checkTextClose = (Func<string, dynamic, dynamic, string, string, bool>)((ver, org, cur, en, jp) => 
    {
        switch(ver)
        {
            case "SURVEY_PROGRAM":
                return false;
            case "Demo v1.19":
                return ((org.text == en || org.text == jp) && cur.text == null) || ((org.text_ch2_2 == en || org.text_ch2_2 == jp) && cur.text_ch2_2 == null) || ((org.text_ch2_3 == en || org.text_ch2_3 == jp) && cur.text_ch2_3 == null);
            default:
                return ((org.text == en || org.text == jp) && cur.text == null);
        }
    });
    
    // Ending splits are handled manually in update{}
    vars.splits = new Dictionary<string, Func<string, dynamic, dynamic, bool>>[2];
    vars.splits[0] = new Dictionary<string, Func<string, dynamic, dynamic, bool>>()
    {
        {"Ch1_School",                (ver, org, cur) => org.roomName == "room_insidecloset_ch1" && cur.roomName == "room_dark1_ch1"},
        {"Ch1_CastleTown_DoorClose",  (ver, org, cur) => cur.roomName == "room_castle_darkdoor_ch1" && org.doorCloseCon == 7 && cur.doorCloseCon == 21},
        {"Ch1_CastleTown_RoomChange", (ver, org, cur) => org.roomName == "room_castle_darkdoor_ch1" && cur.roomName == "room_field_start_ch1"},
        {"Ch1_Fields_Exit",           (ver, org, cur) => org.roomName == "room_field4_ch1" && cur.roomName == "room_field_checkers4_ch1"},
        {"Ch1_Checkerboard_Exit",     (ver, org, cur) => org.roomName == "room_field_checkersboss_ch1" && cur.roomName == "room_forest_savepoint1_ch1"},
        {"Ch1_BakeSale_Enter",        (ver, org, cur) => org.roomName == "room_forest_area3_ch1" && cur.roomName == "room_forest_savepoint2_ch1"},
        {"Ch1_Egg",                   (ver, org, cur) => cur.roomName == "room_man_ch1" && vars.checkTextClose(ver, org, cur, @"* (You received an Egg.)/%", @"＊ (タマゴを　手に入れた)/%")},
        {"Ch1_SusieLancer_Exit",      (ver, org, cur) => org.roomName == "room_forest_fightsusie_ch1" && cur.roomName == "room_forest_afterthrash2_ch1"},
        {"Ch1_Escape_Cell",           (ver, org, cur) => org.roomName == "room_cc_prison_cells_ch1" && cur.roomName == "room_cc_prisonlancer_ch1" && vars.tempVar == 2},
        {"Ch1_CFWarp",                (ver, org, cur) => org.roomName == "room_forest_fightsusie_ch1" && cur.roomName == "room_field3_ch1"},
        {"Ch1_FBWarp",                (ver, org, cur) => org.roomName == "room_field3_ch1" && cur.roomName == "room_forest_savepoint2_ch1"},
        {"Ch1_BCWarp",                (ver, org, cur) => org.roomName == "room_forest_savepoint2_ch1" && cur.roomName == "room_forest_fightsusie_ch1"},
        {"Ch1_Jevil_EnterRoom",       (ver, org, cur) => org.roomName == "room_cc_prison_prejoker_ch1" && cur.roomName == "room_cc_joker_ch1"},
        {"Ch1_Jevil_EndBattle",       (ver, org, cur) => cur.roomName == "room_cc_joker_ch1" && (ver == "SURVEY_PROGRAM" ? (cur.jevilDance == 4 || cur.jevilDance2 == 4) : (org.song.EndsWith(@"mus\joker.ogg") && cur.song == null))},
        {"Ch1_Jevil_LeaveRoom",       (ver, org, cur) => org.roomName == "room_cc_joker_ch1" && cur.roomName == "room_cc_prison_prejoker_ch1"},
        {"Ch1_KRound2_Exit",          (ver, org, cur) => org.roomName == "room_cc_6f_ch1" && cur.roomName == "room_cc_throneroom_ch1"},
        {"Ch1_Throne_Exit",           (ver, org, cur) => org.roomName == "room_cc_throneroom_ch1" && cur.roomName == "room_cc_preroof_ch1"},
        {"Ch1_PreKing_Exit",          (ver, org, cur) => org.roomName == "room_cc_preroof_ch1" && cur.roomName == "room_cc_kingbattle_ch1"},
        {"Ch1_King_EndBattle",        (ver, org, cur) => cur.roomName == "room_cc_kingbattle_ch1" && org.kingPos == 680 && cur.kingPos >= 1020 && cur.kingPos <= 1030},
        {"Ch1_King_Exit",             (ver, org, cur) => org.roomName == "room_cc_kingbattle_ch1" && cur.roomName == "room_cc_prefountain_ch1"},
        {"Ch1_Fountain_Enter",        (ver, org, cur) => org.roomName == "room_cc_prefountain_ch1" && cur.roomName == "room_cc_fountain_ch1"},
        {"Ch1_Fountain_Exit",         (ver, org, cur) => org.roomName == "room_cc_fountain_ch1" && cur.roomName == "room_school_unusedroom_ch1"}
    };
    vars.splits[1] = new Dictionary<string, Func<string, dynamic, dynamic, bool>>()
    {
        {"Ch2_Library",            (ver, org, cur) => org.roomName == "room_library_ch2" && cur.roomName == "room_dw_cyber_intro_1_ch2"},
        {"Ch2_ArcadeGameText",     (ver, org, cur) => cur.roomName == "room_dw_cyber_queen_boxing_ch2" && vars.checkTextClose(ver, org, cur, @"\EH* C'mon^1, let's go after&||her!/%", @"\EH＊ おまえら^1！&　 追っかけるぞ！/%")},
        {"Ch2_ArcadeGameLeave",    (ver, org, cur) => org.roomName == "room_dw_cyber_queen_boxing_ch2" && cur.roomName == "room_dw_cyber_musical_door_ch2"},
        {"Ch2_DJFight",            (ver, org, cur) => cur.roomName == "room_dw_cyber_music_final_ch2" && org.fight == 1 && cur.fight == 0},
        {"Ch2_DJShopRoom",         (ver, org, cur) => org.roomName == "room_dw_cyber_musical_door_ch2" && cur.roomName == "room_dw_cyber_musical_shop_ch2"},
        {"Ch2_Ragger2",            (ver, org, cur) => org.roomName == "room_dw_cyber_teacup_final_ch2" && cur.roomName == "room_dw_cyber_rollercoaster_ch2"},
        {"Ch2_CyberFields_Exit",   (ver, org, cur) => cur.roomName == "room_dw_cyber_rollercoaster_ch2" && org.sound == "snd_queen_laugh_0" && cur.sound == "snd_sussurprise"},
        {"Ch2_TrashZoneWarp",      (ver, org, cur) => org.roomName == "room_dw_cyber_musical_door_ch2" && cur.roomName == "room_dw_city_intro_ch2" && vars.tempVar == 0},
        {"Ch2_TrashZoneWarp2",     (ver, org, cur) => org.roomName == "room_dw_cyber_musical_door_ch2" && cur.roomName == "room_dw_city_intro_ch2" && vars.tempVar == 1},
        {"Ch2_MansionWarp",        (ver, org, cur) => org.roomName == "room_dw_cyber_musical_door_ch2" && cur.roomName == "room_dw_mansion_entrance_ch2" && vars.tempVar == 0},
        {"Ch2_MansionWarp2",       (ver, org, cur) => org.roomName == "room_dw_cyber_musical_door_ch2" && cur.roomName == "room_dw_mansion_entrance_ch2" && vars.tempVar == 1},
        {"Ch2_TZCFWarp",           (ver, org, cur) => org.roomName == "room_dw_city_intro_ch2" && cur.roomName == "room_dw_cyber_musical_door_ch2"},
        {"Ch2_TZMWarp",            (ver, org, cur) => org.roomName == "room_dw_city_intro_ch2" && cur.roomName == "room_dw_mansion_entrance_ch2"},
        {"Ch2_MCFWarp",            (ver, org, cur) => org.roomName == "room_dw_mansion_entrance_ch2" && cur.roomName == "room_dw_cyber_musical_door_ch2"},
        {"Ch2_MTZWarp",            (ver, org, cur) => org.roomName == "room_dw_mansion_entrance_ch2" && cur.roomName == "room_dw_city_intro_ch2"},
        {"Ch2_FreezeRing",         (ver, org, cur) => cur.roomName == "room_dw_city_big_2_ch2" && vars.checkTextClose(ver, org, cur, @"* (You got the FreezeRing.)/%", @"＊ (凍てつく指輪を　手に入れた)/%")},
        {"Ch2_Egg",                (ver, org, cur) => (cur.roomName == "room_dw_cyber_musical_door_ch2" || cur.roomName == "room_dw_city_man_ch2") && org.sound != "snd_egg" && cur.sound == "snd_egg"},
        {"Ch2_Mouse2Puzzle",       (ver, org, cur) => org.roomName == "room_dw_city_mice2_ch2" && cur.roomName == "room_dw_city_cheesemaze_ch2"},
        {"Ch2_ThornRing",          (ver, org, cur) => cur.roomName == "room_dw_city_moss_ch2" && vars.checkTextClose(ver, org, cur, @"\S1* (You got the ThornRing.)/%", @"\S1＊ (いばらの指輪を　手に入れた)/%")},
        {"Ch2_SGBerdly",           (ver, org, cur) => cur.roomName == "room_dw_city_berdly_ch2" && org.snowgrave < 127 && cur.snowgrave >= 127},
        {"Ch2_SGBerdly_LeaveRoom", (ver, org, cur) => org.roomName == "room_dw_city_berdly_ch2" && cur.roomName == "room_dw_city_poppup_ch2"},
        {"Ch2_Berdly_Leave",       (ver, org, cur) => org.roomName == "room_dw_city_berdly_ch2" && cur.roomName == "room_dw_city_traffic_4_ch2"},
        {"Ch2_SpamtonLeave",       (ver, org, cur) => org.roomName == "room_dw_city_spamton_alley_ch2" && cur.roomName == "room_dw_city_traffic_4_ch2"},
        {"Ch2_CyberCity_Exit",     (ver, org, cur) => org.roomName == "room_dw_city_mansion_front_ch2" && cur.roomName == "room_dw_mansion_krisroom_ch2"},
        {"Ch2_Mansion_Entrance",   (ver, org, cur) => org.roomName == "room_dw_mansion_dining_a_ch2" && cur.roomName == "room_dw_mansion_entrance_ch2"},
        {"Ch2_Mansion_Exit",       (ver, org, cur) => org.roomName == "room_dw_mansion_entrance_ch2" && cur.roomName == "room_dw_mansion_fire_paintings_ch2"},
        {"Ch2_TasqueManager",      (ver, org, cur) => org.roomName == "room_dw_mansion_tasquePaintings_ch2" && cur.roomName == "room_dw_mansion_traffic_ch2"},
        {"Ch2_Mauswheel",          (ver, org, cur) => org.roomName == "room_dw_mansion_kitchen_ch2" && cur.roomName == "room_dw_mansion_east_2f_transformed_new_ch2"},
        {"Ch2_Disk_Loaded",        (ver, org, cur) => cur.roomName == "room_shop_ch2_spamton_ch2" && org.loadedDiskGreyBG < 121 && cur.loadedDiskGreyBG == 121},
        {"Ch2_Disk_Inserted",      (ver, org, cur) => cur.roomName == "room_dw_mansion_b_east_b_ch2" && vars.checkTextClose(ver, org, cur, @"* (Nothing happened.)/%", @"＊ (なにも起こらなかった)/%")},
        {"Ch2_SpamtonNEO_End",     (ver, org, cur) => cur.roomName == "room_dw_mansion_b_east_ch2" && org.song.EndsWith(@"mus\spamton_neo_mix_ex_wip.ogg") && cur.song == null},
        {"Ch2_SpamtonNEO_Leave",   (ver, org, cur) => org.roomName == "room_dw_mansion_b_east_ch2" && cur.roomName == "room_dw_mansion_b_east_a_ch2"},
        {"Ch2_AcidLake_Enter",     (ver, org, cur) => org.roomName == "room_dw_mansion_east_3f_ch2" && cur.roomName == "room_dw_mansion_acid_tunnel_ch2"},
        {"Ch2_AcidLake_Exit",      (ver, org, cur) => org.roomName == "room_dw_mansion_acid_tunnel_loop_rouxls_ch2" && cur.roomName == "room_dw_mansion_acid_tunnel_exit_ch2"},
        {"Ch2_Queen",              (ver, org, cur) => org.roomName == "room_dw_mansion_east_4f_d_ch2" && cur.roomName == "room_dw_mansion_top_ch2"},
        {"Ch2_GigaQueen",          (ver, org, cur) => org.roomName == "room_dw_mansion_top_ch2" && cur.roomName == "room_dw_mansion_top_post_ch2"},
        {"Ch2_Fountain_Enter",     (ver, org, cur) => (org.roomName == "room_dw_mansion_top_post_ch2" && cur.roomName == "room_cc_fountain_ch2") || (org.roomName == "room_dw_mansion_prefountain_ch2" && cur.roomName == "room_dw_mansion_fountain_ch2")},
        {"Ch2_SGSpamtonNEO_End",   (ver, org, cur) => cur.roomName == "room_dw_mansion_fountain_ch2" && org.fight == 1 && cur.fight == 0},
        {"Ch2_Fountain_Exit",      (ver, org, cur) => (org.roomName == "room_cc_fountain_ch2" || org.roomName == "room_dw_mansion_fountain_ch2") && cur.roomName == "room_lw_computer_lab_ch2"},
        {"Ch2_PuppetScarfChest",   (ver, org, cur) => cur.roomName == "room_dw_castle_west_cliff_ch2" && vars.checkTextOpen(ver, org, cur, @"* (You opened the treasure&||chest.^1)&* (Inside was \cYPuppetScarf\cW.)/", @"＊ (宝箱を開けた^1)&＊ (\cYパペットマフラー\cWが&　 入っていた)/")}
    };
    vars.completedSplits = new HashSet<string>();

    vars.resetSplits = (Action)(() =>
    {
        vars.completedSplits.Clear();
        print("[DELTARUNE] All splits have been reset to initial state");
    });

    settings.Add("AC", true, "All Chapters");
    settings.CurrentDefaultParent = "AC";

    settings.Add("AC_PauseTimer", true, "Pause timer between chapters");
     settings.SetToolTip("AC_PauseTimer",
        "This setting pauses the timer when you end a chapter and resumes it when you continue from a previous save file in the next chapter.\n\n" +
        "NOTE: For this to work, Game Time must be enabled\n" +
        "(you will be asked if you want to enable it by turning on this setting and opening the game if the timer isn't already running, or you can do it yourself).");

    settings.Add("AC_PauseTimerOST", false, "(OST%) Pause timer between chapters");
     settings.SetToolTip("AC_PauseTimerOST",
        "This setting is the same as the one above, however it pauses the timer when the credits music starts playing instead.\n" +
        "Useful for OST%. NOTE: Enabling this will override the above setting (you can not have both activated at once).");

    settings.Add("AC_Continue", false, "Split on starting a chapter from a previous save file");
    settings.CurrentDefaultParent = null;

    settings.Add("Ch1", false, "Chapter 1: The Beginning");
    settings.CurrentDefaultParent = "Ch1";

    settings.Add("Ch1_School",                false, "Enter Dark World (True Reset)");
    settings.Add("Ch1_CastleTown_DoorClose",  false, "Exit Castle Town (door close)");
    settings.Add("Ch1_CastleTown_RoomChange", false, "Exit Castle Town (room change)");
    settings.Add("Ch1_Fields_Exit",           false, "Exit Field");
    settings.Add("Ch1_Checkerboard_Exit",     false, "Exit Checkerboard");
    settings.Add("Ch1_BakeSale_Enter",        false, "Enter Bake Sale");
    settings.Add("Ch1_Egg",                   false, "Obtain Egg");
     settings.SetToolTip("Ch1_Egg", "This autosplit does not work in SURVEY_PROGRAM.");
    settings.Add("Ch1_SusieLancer_Exit",      false, "Exit Forest (Susie & Lancer fight room)");
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
     settings.Add("Ch1_CFWarp",          false, "Warp from Castle to Field");
     settings.Add("Ch1_FBWarp",          false, "Warp from Field to Bake Sale");
     settings.Add("Ch1_BCWarp",          false, "Warp from Bake Sale to Castle");
     settings.Add("Ch1_Jevil_EnterRoom", false, "Enter Jevil room");
     settings.Add("Ch1_Jevil_EndBattle", false, "End Jevil battle");
      settings.SetToolTip("Ch1_Jevil_EndBattle", @"This autosplit does not work if you remove Jevil's battle theme from the game files (mus\joker.ogg) in non-SURVEY_PROGRAM versions.");
     settings.Add("Ch1_Jevil_LeaveRoom", false, "Exit Jevil room");
    settings.CurrentDefaultParent = null;

    settings.Add("Ch2", false, "Chapter 2: A Cyber's World");
    settings.CurrentDefaultParent = "Ch2";

    settings.Add("Ch2_Library",          false, "Enter Dark World (True Reset)");
    settings.Add("Ch2_ArcadeGameText",   false, "End Punch-Out minigame (textbox close)");
    settings.Add("Ch2_ArcadeGameLeave",  false, "End Punch-Out minigame (room change)");
    settings.Add("Ch2_DJFight",          false, "End Sweet Cap'n Cakes battle");
    settings.Add("Ch2_DJShopRoom",       false, "Enter Sweet Cap'n Cakes' shop room");
    settings.Add("Ch2_Ragger2",          false, "Exit Ragger2 room");
    settings.Add("Ch2_CyberFields_Exit", false, "Exit Cyber Field");
    settings.Add("Ch2_TrashZoneWarp",    false, "Warp from Cyber Field to Trash Zone (normally)");
    settings.Add("Ch2_TrashZoneWarp2",   false, "Warp from Cyber Field to Trash Zone (with Door Overflow)");
    settings.Add("Ch2_MansionWarp",      false, "Warp from Cyber Field to Mansion (normally)");
    settings.Add("Ch2_MansionWarp2",     false, "Warp from Cyber Field to Mansion (with Door Overflow)");
    settings.Add("Ch2_TZCFWarp",         false, "Warp from Trash Zone to Cyber Field");
    settings.Add("Ch2_TZMWarp",          false, "Warp from Trash Zone to Mansion");
    settings.Add("Ch2_MCFWarp",          false, "Warp from Mansion to Cyber Field");
    settings.Add("Ch2_MTZWarp",          false, "Warp from Mansion to Trash Zone");
    settings.Add("Ch2_Egg",              false, "Obtain Egg (both sources)");
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
    settings.Add("Ch2_PuppetScarfChest", false, "Open PuppetScarf Chest (Castle Town)");
    settings.Add("Ch2_Ending",           false, "Ending");
    settings.Add("Ch2_EndingOST",        false, "(OST%) Ending");

    settings.Add("Ch2_AB", false, "All Bosses Splits");
    settings.CurrentDefaultParent = "Ch2_AB";
     settings.Add("Ch2_Disk_Loaded",      false, "Obtain Loaded Disk");
     settings.Add("Ch2_Disk_Inserted",    false, "Insert Loaded Disk");
     settings.Add("Ch2_SpamtonNEO_End",   false, "End basement Spamton NEO battle");
      settings.SetToolTip("Ch2_SpamtonNEO_End", @"This autosplit does not work if you remove Spamton NEO's battle theme from the game files (mus\spamton_neo_mix_ex_wip.ogg).");
     settings.Add("Ch2_SpamtonNEO_Leave", false, "Exit basement Spamton NEO room");
    settings.CurrentDefaultParent = "Ch2";

    settings.Add("Ch2_WR", false, "Weird Route Splits");
    settings.CurrentDefaultParent = "Ch2_WR";
     settings.Add("Ch2_FreezeRing",         false, "Obtain FreezeRing");
     settings.Add("Ch2_ThornRing",          false, "Obtain ThornRing (original source)");
     settings.Add("Ch2_SGBerdly",           false, "Snowgrave Berdly");
     settings.Add("Ch2_SGBerdly_LeaveRoom", false, "Exit Berdly 2 room (Weird Route)");
     settings.Add("Ch2_SGSpamtonNEO_End",   false, "End fountain Spamton NEO battle");
    settings.CurrentDefaultParent = null;
}

exit
{
    vars.resetVars();
}

init
{
    var module = modules.First();
    vars.x64 = game.Is64Bit();

    // Thanks to Jujstme and Ero for this (finding room names)
    var scanner = new SignatureScanner(game, module.BaseAddress, module.ModuleMemorySize);
    Func<int, string, IntPtr> scan = (o, sig) =>
    {
        IntPtr ptr = vars.x64
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
        ? scan(6, "48 ?? ?? ?? 3B 35 ?? ?? ?? ?? 41 ?? ?? ?? 49 ?? ?? E8 ?? ?? ?? ?? FF")
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

    string hash = "Invalid hash";
    string dataFile = new FileInfo(module.FileName).DirectoryName + @"\data.win";
    if(File.Exists(dataFile))
    {
        using(var md5 = System.Security.Cryptography.MD5.Create())
            using(var fs = File.OpenRead(dataFile))
                hash = string.Concat(md5.ComputeHash(fs).Select(b => b.ToString("X2")));
    }
    switch(hash)
    {
        case "A88A2DB3A68C714CA2B1FF57AC08A032": // English
        case "22008370824A37BAEF8948127963C769": // Japanese
            version = "SURVEY_PROGRAM";
            break;

        case "B465A74B67E4AB915856330AD1149A62": // v1.08 (itch.io)
        case "AFA40591602758CC56F445E819023E76": // v1.08 (Steam)
        case "616C5751AC9FC584AF250F1B04474AFD": // v1.09 (itch.io)
        case "267A8ABE468D824222810201F00003BE": // v1.09 (Steam)
            version = "Demo v1.08/v1.09";
            break;

        case "5FBE01F2BC1C04F45D809FFD060AC386": // itch.io
        case "CD77A63D7902990DBC704FE32B30700A": // Steam
            version = "Demo v1.10";
            break;

        case "7FA7658151211076FA09BE378BD6BD2B": // v1.12
        case "D64C80F30EC1AA5718307A2C6EA8DDB5": // v1.13
        case "8892ACA0ECE33A17711D7780C70CA3DE": // v1.14
        case "ED4568BAB864166BFD6322CEEB3FB544": // v1.15
        case "BCB61AE64476526BB41AC2CAD7B3B160": // v1.15 (item tracker mod)
            version = "Demo v1.12-v1.15";
            break;

        // game_change versions - Chapter Select data.win
        // Not checking the individual chapters does mean that mods could get through, but chances are the autosplitter will just break anyway
        // Just hoping it does not become a problem
        case "7AD299A8B33FA449E20EDFE0FEDEDDB2":
            version = "Demo v1.19";
            break;

        default:
            version = "Unknown";
            print("[DELTARUNE] Unknown version detected: " + hash);

            if(!vars.UnknownPopup)
            {
                MessageBox.Show
                (
                    "This version of DELTARUNE is not supported by the autosplitter.\n" +
                    "If you are playing an older version, update your game.\n" +
                    "If you are playing an unsupported mod, switch to the vanilla game or the allowed item tracker mod.\n\n" +

                    "Make sure the game's executable is named \"DELTARUNE.exe\" and the data file is named \"data.win\".\n\n" +

                    "Supported versions:\n" +
                    "- SURVEY_PROGRAM\n" +
                    "- Chapter 1&2 v1.08-v1.15, v1.19.\n\n" +
            
                    "You will not be notified again until the next time you start the autosplitter.",

                    "LiveSplit | DELTARUNE", MessageBoxButtons.OK, MessageBoxIcon.Warning
                );

                vars.UnknownPopup = true;
            }
            return;
    }
    print("[DELTARUNE] Detected game version: " + version + " (" + hash + ")");

    if((settings["AC_PauseTimer"] || settings["AC_PauseTimerOST"]) && !vars.IGTPopup && version != "SURVEY_PROGRAM" && timer.CurrentPhase == TimerPhase.NotRunning && timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        var message = MessageBox.Show
        (
            "LiveSplit uses Game Time for this game. Would you like to change the current timing method to Game Time instead of Real Time?\n\n" +
            "You will not be notified again until the next time you start the autosplitter.",
            "LiveSplit | DELTARUNE", MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if(message == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;

        vars.IGTPopup = true;
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

    else if(vars.x64) // game_change fully unloads and loads games so consistent pointer paths between chapters are not an option
    {
        if(current.directory.EndsWith(@"\chapter1_windows\"))
        {
            current.chapter = 1;
            current.fight   = current.fight_ch1;
            current.text    = current.text_ch1;
        }
        else if(current.directory.EndsWith(@"\chapter2_windows\"))
        {
            current.chapter = 2;
            current.fight   = current.fight_ch2;
            current.text    = current.text_ch2;
        }
        else
        {
            current.chapter = 0;
            current.fight   = 0;
            current.text    = null;
        }
    }

    if(current.chapter > 0)
    {
        int ch = (int)current.chapter;
        string chapterStr = ("_ch" + ch);

        // Older Chapter 1&2 versions (1.00-1.15) have the _ch1 suffix added to Chapter 1 rooms and objects. SURVEY_PROGRAM and LTS versions do not
        // It's also useful for differentiating duplicate rooms using the chapter number
        if(!current.roomName.EndsWith(chapterStr))
            current.roomName += chapterStr;

        bool endCondition = false;
        switch(ch)
        {
            case 1:
                if(version == "SURVEY_PROGRAM")
                {
                    if(!vars.SPEndingTriggered && current.plot == 251 && current.choicer == 0) // Can't check for the text in this version so this is a bit weird but at least it works
                    {
                        endCondition = (old.finalTextboxHalt == 2 && current.finalTextboxHalt != 2);

                        if(!endCondition)
                            endCondition = (old.finalTextboxHalt2 == 2 && current.finalTextboxHalt2 != 2);

                        if(!endCondition)
                            endCondition = (current.savefile > 2); // 3-5 for completion data, 9 for autosave

                        if(endCondition)
                            vars.SPEndingTriggered = true;
                    }
                }
                else
                    endCondition = vars.checkTextClose(version, old, current, @"* (You decided to go to bed.)/%", @"＊ (ねむることにした)/%");
                break;

            case 2:
                // This is the only situation where the Door Overflow splits could get triggered
                // You can not have the 400 bagels and the door available at the same time in regular gameplay
                if((settings["Ch2_TrashZoneWarp2"] || settings["Ch2_MansionWarp2"]) && vars.tempVar == 0 && current.roomName == "room_dw_cyber_musical_door_ch2" && vars.checkTextClose(version, old, current, @"* (You were crushed under the&||weight of 400 bagels and&||defeated instantly...)/%", @"＊ (ベーグル400コの　重みに耐えきれ^1ず&　たちまち　力つきた…)/%"))
                    vars.tempVar = 1;
                else
                    endCondition = vars.checkTextClose(version, old, current, @"\E1* ... they're already&||asleep.../%", @"\E1＊ …ふたりとも　もう&　 ねむってしまったのね。/%");
                break;
        }
        if(endCondition)
        {
            if(settings["AC_PauseTimer"] && !settings["AC_PauseTimerOST"] && !timer.IsGameTimePaused)
            {
                print("[DELTARUNE] All Chapters: Chapter " + ch + " ended, timer paused");
                timer.IsGameTimePaused = true;
            }
            vars.resetSplits();
            vars.forceSplit = settings["Ch" + ch + "_Ending"];
        }

        else if((current.chapter == 1 && current.roomName == "room_ed_ch1" && old.ch1Credits < 108 && current.ch1Credits >= 108) || (current.chapter > 1 && old.roomName == vars.OSTRooms[ch, 0] && current.roomName == vars.OSTRooms[ch, 1]))
        {
            if(settings["AC_PauseTimerOST"] && !timer.IsGameTimePaused)
            {
                print("[DELTARUNE] (OST%) All Chapters: Chapter " + ch + " ended, timer paused");
                timer.IsGameTimePaused = true;
            }
            vars.forceSplit = settings["Ch" + ch + "_EndingOST"];
        }

        if(old.roomName == vars.ACContinueRooms[ch, 0] && current.roomName == vars.ACContinueRooms[ch, 1])
        {
            if((settings["AC_PauseTimer"] || settings["AC_PauseTimerOST"]) && timer.IsGameTimePaused)
            {
                print("[DELTARUNE] All Chapters: Chapter " + ch + " started, timer resumed");
                timer.IsGameTimePaused = false;
            }
            if(settings["AC_Continue"])
            {
                if(current.chapter == 1)
                    vars.forceSplit = (timer.CurrentTime.RealTime > TimeSpan.FromSeconds(0)); // Workaround for Chapter 1 splitting right after starting
                else
                    vars.forceSplit = (old.namerEvent != 75); // Workaround for Chapter 2+ splitting on the cut to black after starting
            }
        }
    }

    if(old.room != current.room)
    {
        print("[DELTARUNE] Room: " + old.room + " (" + old.roomName + ")" + " -> " + current.room + " (" + current.roomName + ")");

        // You enter the room twice, once in the cutscene and once when you regain control
        // so we need to keep track of the number of room entrances, otherwise it would split during the cutscene
        if(settings["Ch1_Escape_Cell"] && vars.tempVar < 2 && old.roomName == "room_cc_prison_cells_ch1" && current.roomName == "room_cc_prisonlancer_ch1")
            vars.tempVar ++;

        // Edge case: Reset vars.tempVar to make sure Door Overflow splits don't get triggered by doing the 400 bagels cutscene and then playing normally until the door is properly accessible
        else if((settings["Ch2_TrashZoneWarp2"] || settings["Ch2_MansionWarp2"]) && current.chapter == 2 && vars.tempVar == 2 && current.roomName != "room_dw_city_intro_ch2" && current.roomName != "room_dw_mansion_entrance_ch2")
            vars.tempVar = 0;
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
    vars.resetSplits();
}

split
{
    if(vars.forceSplit)
    {
        vars.forceSplit = false;
        return true;
    }
    
    if(current.chapter == 0) // Don't try to split if on Chapter Select
        return;

    foreach(var split in vars.splits[(int)current.chapter - 1])
    {
        if(!settings[split.Key] || 
           vars.completedSplits.Contains(split.Key) ||
           !split.Value(version, old, current)) continue;

        if(vars.tempVar > 0)
            vars.tempVar = 0;

        vars.completedSplits.Add(split.Key);
        print("[DELTARUNE] Split triggered (" + split.Key + ")");
        return true;
    }
}
