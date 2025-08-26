/*
    DELTARUNE Autosplitter

    Credits:
    - Originally inspired by Narry's DELTARUNE SURVEY_PROGRAM Autosplitter that was based on Glacia's UNDERTALE Autosplitter
    - Tenebrosful (Repository, Development, Testing)
    - NERS (Development, Memory pointers, In-Game Time, Testing)
    - Vintagix (Development, Testing)
    - devek1 (Linux-specific failsafes)
    - Jujstme (Sigscanning for room names)
    - Ero (Sigscanning for room names).
*/

state("DELTARUNE", "SURVEY_PROGRAM")
{
    // Global
    double savefile : 0x48E5DC, 0x27C, 0x488, 0x4D0; // global.filechoice
    double plot     : 0x48E5DC, 0x27C, 0x488, 0x500; // global.plot
    double choicer  : 0x48E5DC, 0x27C, 0x28,  0x40;  // global.choice
    double msc      : 0x48E5DC, 0x27C, 0x28,  0x140; // global.msc

    // Self
    double doorCloseCon      : 0x48BDEC, 0xC,  0x60, 0x10, 0x10,  0x0; // obj_darkdoorevent(_ch1).con
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
    double choicer : 0x6FCF38, 0x30, 0x18C0, 0x0;
    double msc     : 0x6FCF38, 0x30, 0x354C, 0x0;

    double doorCloseCon     : 0x6EF220, 0x84, 0x24,  0x10, 0x18,  0x0;
    double namerEvent       : 0x6EF220, 0xD4, 0x5C,  0x20, 0x24,  0x10, 0x9C,  0x0;                   // DEVICE_NAMER.EVENT
    double loadedDiskGreyBG : 0x6EF220, 0x84, 0x24,  0x10, 0x3D8, 0x0;                                // obj_shop_ch2_spamton.greybgtimer
    double snowgrave        : 0x6EF220, 0xF4, 0x27C, 0x6C, 0x5C,  0x20, 0x144, 0x24, 0x10, 0xC0, 0x0; // obj_spell_snowgrave.timer

    float kingPos : 0x6F1394, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string128 text  : 0x6FCE4C, 0x8,  0x144, 0x24, 0x10, 0x5A0, 0x0, 0x0, 0x0; // obj_writer(_ch1).mystring
    string256 sound : 0x4E0794, 0x58, 0xC0,  0x40, 0x0;                        // Current sound (highest priority)
    string256 song  : 0x4DFF58, 0x0,  0x44,  0x0;                              // Full path to the current song
}

state("DELTARUNE", "Demo v1.10")
{
    double chapter : 0x6FCF38, 0x30, 0x24D8, 0x0;
    double fight   : 0x6FCF38, 0x30, 0x4F8,  0x0;
    double choicer : 0x6FCF38, 0x30, 0x18C0, 0x0;
    double msc     : 0x6FCF38, 0x30, 0x354C, 0x0;

    double doorCloseCon     : 0x6EF220, 0x84, 0x24,  0x10, 0x18,  0x0;
    double namerEvent       : 0x6EF220, 0xD4, 0x5C,  0x20, 0x24,  0x10, 0x2F4, 0x0;
    double loadedDiskGreyBG : 0x6EF220, 0x84, 0x24,  0x10, 0x87C, 0x0;
    double snowgrave        : 0x6EF220, 0xF4, 0x27C, 0x6C, 0x5C,  0x20, 0x144, 0x24, 0x10, 0xC0, 0x0;

    float kingPos : 0x6F1394, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string128 text  : 0x6FCE4C, 0x8,  0x144, 0x24, 0x10, 0x5A0, 0x0, 0x0, 0x0;
    string256 sound : 0x4E0794, 0x58, 0xC0,  0x40, 0x0;
    string256 song  : 0x4DFF58, 0x0,  0x44,  0x0;
}

state("DELTARUNE", "Demo v1.12-v1.15")
{
    double chapter : 0x6FE860, 0x30, 0x2F34, 0x80;
    double fight   : 0x6FE860, 0x30, 0xA758, 0x0;
    double choicer : 0x6FE860, 0x30, 0xBA0,  0xC0;
    double msc     : 0x6FE860, 0x30, 0x17AC, 0x0;

    double doorCloseCon     : 0x6F0B48, 0x84, 0x24,  0x10, 0x18, 0x0;
    double namerEvent       : 0x6F0B48, 0xD4, 0x5C,  0x20, 0x24, 0x10, 0xFC,  0x0;
    double loadedDiskGreyBG : 0x6F0B48, 0x84, 0x24,  0x10, 0x0,  0x0;
    double snowgrave        : 0x6F0B48, 0xF4, 0x27C, 0x6C, 0x5C, 0x20, 0x144, 0x24, 0x10, 0x120, 0x0;

    float kingPos : 0x6F2CBC, 0x4, 0x140, 0x68, 0x3C, 0x8, 0xB0;

    string128 text  : 0x6FE774, 0x8,  0x144, 0x24, 0x10, 0x0, 0x0, 0x0, 0x0;
    string256 sound : 0x4E20B4, 0x58, 0xC0,  0x40, 0x0;
    string256 song  : 0x4E1878, 0x0,  0x0,   0x0;
}

state("DELTARUNE", "Demo v1.19")
{
    double fight_ch1   : 0x6A1CA8, 0x48, 0x10, 0x32F0, 0x710;
    double choicer_ch1 : 0x6A1CA8, 0x48, 0x10, 0x32F0, 0x0;
    double msc_ch1     : 0x6A1CA8, 0x48, 0x10, 0x32F0, 0xF0;

    double fight_ch2   : 0x6A1CA8, 0x48, 0x10, 0x7790, 0xBB0;
    double choicer_ch2 : 0x6A1CA8, 0x48, 0x10, 0x7790, 0x0;
    double msc_ch2     : 0x6A1CA8, 0x48, 0x10, 0x7790, 0x130;

    double doorCloseCon     : 0x8B2790, 0xE0,  0x48,  0x10, 0x0,   0x0;
    double namerEvent       : 0x8B2790, 0x178, 0x70,  0x38, 0x48,  0x10, 0x3B0, 0x0;
    double loadedDiskGreyBG : 0x8B2790, 0xE0,  0x48,  0x10, 0x3C0, 0x0;
    double snowgrave        : 0x8B2790, 0x1A0, 0x3B0, 0x88, 0x70,  0x38, 0x1A0, 0x48, 0x10, 0x3D0, 0x0;

    float kingPos : 0x69FA98, 0x0, 0x530, 0x50, 0x158, 0x10, 0xE8;

    string128 text_ch1 : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0xF0, 0x0, 0x0, 0x0;

    // Chapter 2 in LTS is a bit weird, this pointer changes on some textboxes and
    // also seems to change if you don't hold the automasher
    string128 text_ch2   : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0x5F0, 0x0, 0x0, 0x0;
    string128 text_ch2_2 : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0x6D0, 0x0, 0x0, 0x0;
    string128 text_ch2_3 : 0x8C2008, 0x10, 0x1A0, 0x48, 0x10, 0x6F0, 0x0, 0x0, 0x0;

    string256 sound     : 0x6A3818, 0x60, 0xD0, 0x58, 0x0;
    string256 song      : 0x6A2F90, 0x0,  0x0,  0x0;
    string256 directory : 0x8D06E0, 0x0; // Full path to the current game's directory
}

state("DELTARUNE", "CH1-4 v1.02")
{
    double fight_ch1    : 0x6A1CA8, 0x48, 0x10,  0x1E40, 0x720;
    double choicer_ch1  : 0x6A1CA8, 0x48, 0x10,  0x1E40, 0x10;
    double msc_ch1      : 0x6A1CA8, 0x48, 0x10,  0x1E40, 0x100;
    string128 text_ch1  : 0x8C2008, 0x10, 0x1A0, 0x48,   0x10,  0x390, 0x0, 0x0, 0x0;
    double doorCloseCon : 0x8B2790, 0xE0, 0x48,  0x10,   0x30,  0x0;
    float kingPos       : 0x69FA98, 0x0,  0x560, 0x50,   0x158, 0x10,  0xE8;

    double fight_ch2        : 0x6A1CA8, 0x48,  0x10,  0x100,  0x0;
    double choicer_ch2      : 0x6A1CA8, 0x48,  0x10,  0x7870, 0x0;
    double msc_ch2          : 0x6A1CA8, 0x48,  0x10,  0x7310, 0x0;
    string128 text_ch2      : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x6F0, 0x0,   0x0,  0x0;
    string128 text_ch2_2    : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x700, 0x0,   0x0,  0x0;
    string128 text_ch2_3    : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x710, 0x0,   0x0,  0x0;
    string128 text_ch2_4    : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x7E0, 0x0,   0x0,  0x0;
    double namerEvent_ch2   : 0x8B2790, 0x178, 0x70,  0x38,   0x48,  0x10,  0x60,  0x0;
    double loadedDiskGreyBG : 0x8B2790, 0xE0,  0x48,  0x10,   0xC70, 0x0;
    double snowgrave        : 0x8B2790, 0x1A0, 0x3B0, 0x88,   0x70,  0x38,  0x1A0, 0x48, 0x10, 0xA0, 0x0;

    double fight_ch3      : 0x6A1CA8, 0x48,  0x10,   0x1190, 0x370;
    double plot_ch3       : 0x6A1CA8, 0x48,  0x10,   0x1000, 0x250;
    double knightResult   : 0x6A1CA8, 0x48,  0x10,   0x6A70, 0x0,  0x90, 0x4170;     // global.flag[1047]
    double namerEvent_ch3 : 0x8B2790, 0x178, 0x70,   0x38,   0x48, 0x10, 0x60,  0x0;
    double eggTimer       : 0x8B2790, 0x1E8, 0x530,  0x38,   0x48, 0x10, 0x290, 0x0; // obj_blocktree_dmg.mytimer
    float mantleOutro     : 0x69FA98, 0x0,   0x19B0, 0x18,   0x50, 0x10, 0xD0;       // obj_shadow_mantle_enemy_outro.image_speed

    double fight_ch4      : 0x6A1CA8, 0x48,  0x10,   0x72B0, 0x370;
    double plot_ch4       : 0x6A1CA8, 0x48,  0x10,   0x2F40, 0x30;
    double namerEvent_ch4 : 0x8B2790, 0x178, 0x70,   0x38,   0x48,  0x10,  0x280, 0x0;
    string128 text_ch4    : 0x8C2008, 0x10,  0x1A0,  0x48,   0x10,  0x300, 0x0,   0x0, 0x0;
    double mikeAction     : 0x8B2790, 0x1A0, 0x2F0,  0x90,   0x78,  0x38,  0x198, 0x48, 0x10, 0x140, 0x0; // obj_mike_attack_controller.action
    int susieSprite       : 0x69FA98, 0x0,   0x1008, 0x50,   0x158, 0x10,  0xBC;                          // obj_herosusie.sprite_index
    float playerX         : 0x69FA98, 0x0,   0x198,  0x0,    0x50,  0x158, 0x10,  0xE8;                   // obj_mainchara.x
    float playerY         : 0x69FA98, 0x0,   0x198,  0x0,    0x50,  0x158, 0x10,  0xEC;                   // obj_mainchara.y

    string256 sound     : 0x6A3818, 0x60, 0xD0, 0x58, 0x0;
    string256 song      : 0x6A2F90, 0x0,  0x0,  0x0;
    string256 directory : 0x8B2818, 0x0;
}

state("DELTARUNE", "CH1-4 v1.04")
{
    double fight_ch1    : 0x6A1CA8, 0x48, 0x10,  0x1E40, 0x720;
    double choicer_ch1  : 0x6A1CA8, 0x48, 0x10,  0x1E40, 0x10;
    double msc_ch1      : 0x6A1CA8, 0x48, 0x10,  0x1E40, 0x100;
    string128 text_ch1  : 0x8C2008, 0x10, 0x1A0, 0x48,   0x10,  0x390, 0x0, 0x0, 0x0;
    double doorCloseCon : 0x8B2790, 0xE0, 0x48,  0x10,   0x30,  0x0;
    float kingPos       : 0x69FA98, 0x0,  0x560, 0x50,   0x158, 0x10,  0xE8;
    
    double fight_ch2        : 0x6A1CA8, 0x48,  0x10,  0x100,  0x0;
    double choicer_ch2      : 0x6A1CA8, 0x48,  0x10,  0x7870, 0x0;
    double msc_ch2          : 0x6A1CA8, 0x48,  0x10,  0x7310, 0x0;
    string128 text_ch2      : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x6F0, 0x0,   0x0,  0x0;
    string128 text_ch2_2    : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x700, 0x0,   0x0,  0x0;
    string128 text_ch2_3    : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x710, 0x0,   0x0,  0x0;
    string128 text_ch2_4    : 0x8C2008, 0x10,  0x1A0, 0x48,   0x10,  0x7E0, 0x0,   0x0,  0x0;
    double namerEvent_ch2   : 0x8B2790, 0x178, 0x70,  0x38,   0x48,  0x10,  0x90,  0x0;
    double loadedDiskGreyBG : 0x8B2790, 0xE0,  0x48,  0x10,   0xCA0, 0x0;
    double snowgrave        : 0x8B2790, 0x1A0, 0x3B0, 0x88,   0x70,  0x38,  0x1A0, 0x48, 0x10, 0x80, 0x0;

    double fight_ch3      : 0x6A1CA8, 0x48,  0x10,   0x1190, 0x370;
    double plot_ch3       : 0x6A1CA8, 0x48,  0x10,   0x1000, 0x250;
    double knightResult   : 0x6A1CA8, 0x48,  0x10,   0x6A70, 0x0,  0x90, 0x4170;
    double namerEvent_ch3 : 0x8B2790, 0x178, 0x70,   0x38,   0x48, 0x10, 0x100, 0x0;
    double eggTimer       : 0x8B2790, 0x1E8, 0x40,   0x38,   0x48, 0x10, 0x300, 0x0;
    float mantleOutro     : 0x69FA98, 0x0,   0x19B0, 0x18,   0x50, 0x10, 0xD0;

    double fight_ch4      : 0x6A1CA8, 0x48,  0x10,   0x72B0, 0x370;
    double plot_ch4       : 0x6A1CA8, 0x48,  0x10,   0x2F60, 0x30;
    double namerEvent_ch4 : 0x8B2790, 0x178, 0x70,   0x38,   0x48,  0x10,  0x3A0, 0x0;
    string128 text_ch4    : 0x8C2008, 0x10,  0x1A0,  0x48,   0x10,  0x310, 0x0,   0x0,  0x0;
    double mikeAction     : 0x8B2790, 0x1A0, 0x2F0,  0x90,   0x78,  0x38,  0x198, 0x48, 0x10, 0x180, 0x0;
    int susieSprite       : 0x69FA98, 0x0,   0x1008, 0x50,   0x158, 0x10,  0xBC;
    float playerX         : 0x69FA98, 0x0,   0x198,  0x0,    0x50,  0x158, 0x10,  0xE8;
    float playerY         : 0x69FA98, 0x0,   0x198,  0x0,    0x50,  0x158, 0x10,  0xEC;

    string256 sound     : 0x6A3818, 0x60, 0xD0, 0x58, 0x0;
    string256 song      : 0x6A2F90, 0x0,  0x0,  0x0;
    string256 directory : 0x8B2818, 0x0;
}

state("DELTARUNE", "CH1-4 v1.05 Beta")
{
    double fight_ch1    : 0x6A9CA8, 0x48, 0x10,  0x1E40, 0x720;
    double choicer_ch1  : 0x6A9CA8, 0x48, 0x10,  0x1E40, 0x10;
    double msc_ch1      : 0x6A9CA8, 0x48, 0x10,  0x1E40, 0x100;
    string128 text_ch1  : 0x8CE220, 0x10, 0x1A0, 0x48,   0x10,  0x390, 0x0, 0x0, 0x0;
    double doorCloseCon : 0x8BA790, 0xE0, 0x48,  0x10,   0x30,  0x0;
    float kingPos       : 0x6A7A98, 0x0,  0x560, 0x50,   0x158, 0x10,  0xE8;
    
    double fight_ch2        : 0x6A9CA8, 0x48,  0x10,  0x100,  0x0;
    double choicer_ch2      : 0x6A9CA8, 0x48,  0x10,  0x7870, 0x0;
    double msc_ch2          : 0x6A9CA8, 0x48,  0x10,  0x7310, 0x0;
    string128 text_ch2      : 0x8CE220, 0x10,  0x1A0, 0x48,   0x10,  0x6F0, 0x0,   0x0,  0x0;
    string128 text_ch2_2    : 0x8CE220, 0x10,  0x1A0, 0x48,   0x10,  0x700, 0x0,   0x0,  0x0;
    string128 text_ch2_3    : 0x8CE220, 0x10,  0x1A0, 0x48,   0x10,  0x710, 0x0,   0x0,  0x0;
    string128 text_ch2_4    : 0x8CE220, 0x10,  0x1A0, 0x48,   0x10,  0x7E0, 0x0,   0x0,  0x0;
    double namerEvent_ch2   : 0x8BA790, 0x178, 0x70,  0x38,   0x48,  0x10,  0x90,  0x0;
    double loadedDiskGreyBG : 0x8BA790, 0xE0,  0x48,  0x10,   0xCA0, 0x0;
    double snowgrave        : 0x8BA790, 0x1A0, 0x3B0, 0x88,   0x70,  0x38,  0x1A0, 0x48, 0x10, 0x80, 0x0;

    double fight_ch3      : 0x6A9CA8, 0x48,  0x10,   0x1190, 0x370;
    double plot_ch3       : 0x6A9CA8, 0x48,  0x10,   0x1000, 0x250;
    double knightResult   : 0x6A9CA8, 0x48,  0x10,   0x6A70, 0x0,  0x90, 0x4170;
    double namerEvent_ch3 : 0x8BA790, 0x178, 0x70,   0x38,   0x48, 0x10, 0x100, 0x0;
    double eggTimer       : 0x8BA790, 0x1E8, 0x40,   0x38,   0x48, 0x10, 0x300, 0x0;
    float mantleOutro     : 0x6A7A98, 0x0,   0x19B0, 0x18,   0x50, 0x10, 0xD0;

    double fight_ch4      : 0x6A9CA8, 0x48,  0x10,   0x72B0, 0x370;
    double plot_ch4       : 0x6A9CA8, 0x48,  0x10,   0x2F70, 0x30;
    double namerEvent_ch4 : 0x8BA790, 0x178, 0x70,   0x38,   0x48,  0x10,  0x3C0, 0x0;
    string128 text_ch4    : 0x8CE220, 0x10,  0x1A0,  0x48,   0x10,  0x310, 0x0,   0x0,  0x0;
    double mikeAction     : 0x8BA790, 0x1A0, 0x2F0,  0x90,   0x78,  0x38,  0x198, 0x48, 0x10, 0x180, 0x0;
    int susieSprite       : 0x6A7A98, 0x0,   0x1008, 0x50,   0x158, 0x10,  0xBC;
    float playerX         : 0x6A7A98, 0x0,   0x198,  0x0,    0x50,  0x158, 0x10,  0xE8;
    float playerY         : 0x6A7A98, 0x0,   0x198,  0x0,    0x50,  0x158, 0x10,  0xEC;

    string256 sound     : 0x6AB818, 0x60, 0xD0, 0x58, 0x0;
    string256 song      : 0x6AAF90, 0x0,  0x0,  0x0;
    string256 directory : 0x8BA818, 0x0;
}

startup
{
    vars.offset = new Stopwatch();
    vars.tempVar = 0;
    vars.forceSplit = false;
    vars.SPEndingTriggered = false; // Used to prevent a double split
    vars.IGTPopup = false; // Used to prevent the IGT pop-up opening multiple times, especially on LTS (the game fully closes and reopens every chapter switch)
    vars.UnknownPopup = false; // Same as above for the unknown version pop-up
    vars.ACContinueRooms = new[]
    {
        null,
        "PLACE_CONTACT_ch1",                 // Chapter 1
        "room_krisroom_ch2",                 // Chapter 1 -> 2
        "room_dw_couch_overworld_intro_ch3", // Chapter 2 -> 3
        "room_cc_fountain_ch4"               // Chapter 3 -> 4
    };
    vars.OSTRooms = new[]
    {
        null,
        null,                         // Chapter 1 (handled separately due to credits timing)
        "room_torhouse_ch2",          // Chapter 2
        "room_town_shelter_ch3",      // Chapter 3
        "room_town_krisyard_dark_ch4" // Chapter 4
    };

    vars.resetVars = (Action)(() =>
    {
        vars.offset.Reset();
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
                return (org.text != en && org.text != jp && (cur.text == en || cur.text == jp)) || (org.text_ch2_2 != en && org.text_ch2_2 != jp && (cur.text_ch2_2 == en || cur.text_ch2_2 == jp)) || (org.text_ch2_3 != en && org.text_ch2_3 != jp && (cur.text_ch2_3 == en || cur.text_ch2_3 == jp));

            case "CH1-4 v1.02":
            case "CH1-4 v1.04":
            case "CH1-4 v1.05 Beta":
                return (org.text != en && org.text != jp && (cur.text == en || cur.text == jp)) || (org.text_ch2_2 != en && org.text_ch2_2 != jp && (cur.text_ch2_2 == en || cur.text_ch2_2 == jp)) || (org.text_ch2_3 != en && org.text_ch2_3 != jp && (cur.text_ch2_3 == en || cur.text_ch2_3 == jp)) || (org.text_ch2_4 != en && org.text_ch2_4 != jp && (cur.text_ch2_4 == en || cur.text_ch2_4 == jp));

            default:
                return (org.text != en && org.text != jp && (cur.text == en || cur.text == jp));
        }
    });

    vars.checkTextClose = (Func<string, dynamic, dynamic, string, string, bool>)((ver, org, cur, en, jp) => 
    {
        switch(ver)
        {
            case "SURVEY_PROGRAM":
                return false;

            case "Demo v1.19":
                return ((org.text == en || org.text == jp) && cur.text != en && cur.text != jp) || ((org.text_ch2_2 == en || org.text_ch2_2 == jp) && cur.text_ch2_2 != en && cur.text_ch2_2 != jp) || ((org.text_ch2_3 == en || org.text_ch2_3 == jp) && cur.text_ch2_3 != en && cur.text_ch2_3 != jp);

            case "CH1-4 v1.02":
            case "CH1-4 v1.04":
            case "CH1-4 v1.05 Beta":
                return ((org.text == en || org.text == jp) && cur.text != en && cur.text != jp) || ((org.text_ch2_2 == en || org.text_ch2_2 == jp) && cur.text_ch2_2 != en && cur.text_ch2_2 != jp) || ((org.text_ch2_3 == en || org.text_ch2_3 == jp) && cur.text_ch2_3 != en && cur.text_ch2_3 != jp) || ((org.text_ch2_4 == en || org.text_ch2_4 == jp) && cur.text_ch2_4 != en && cur.text_ch2_4 != jp);

            default:
                return ((org.text == en || org.text == jp) && cur.text != en && cur.text != jp);
        }
    });

    // Ending splits are handled manually in update{}
    vars.splits = new Dictionary<string, Func<string, dynamic, dynamic, bool>>[4];
    vars.splits[0] = new Dictionary<string, Func<string, dynamic, dynamic, bool>>()
    {
        {"Ch1_School",                (ver, org, cur) => (org.roomName == "room_krisroom_ch1" || org.roomName == "room_insidecloset_ch1") && cur.roomName == "room_dark1_ch1"},
        {"Ch1_CastleTown_DoorClose",  (ver, org, cur) => cur.roomName == "room_castle_darkdoor_ch1" && org.doorCloseCon == 7 && cur.doorCloseCon == 21},
        {"Ch1_CastleTown_RoomChange", (ver, org, cur) => org.roomName == "room_castle_darkdoor_ch1" && cur.roomName == "room_field_start_ch1"},
        {"Ch1_Fields_Exit",           (ver, org, cur) => org.roomName == "room_field4_ch1" && cur.roomName == "room_field_checkers4_ch1"},
        {"Ch1_Checkerboard_Exit",     (ver, org, cur) => org.roomName == "room_field_checkersboss_ch1" && cur.roomName == "room_forest_savepoint1_ch1"},
        {"Ch1_BakeSale_Enter",        (ver, org, cur) => org.roomName == "room_forest_area3_ch1" && cur.roomName == "room_forest_savepoint2_ch1"},
        {"Ch1_Egg",                   (ver, org, cur) => cur.roomName == "room_man_ch1" && org.msc != 601 && cur.msc == 601 && cur.choicer == 0},
        {"Ch1_SusieLancer_Exit",      (ver, org, cur) => org.roomName == "room_forest_fightsusie_ch1" && cur.roomName == "room_forest_afterthrash2_ch1"},
        {"Ch1_Escape_Cell",           (ver, org, cur) => org.roomName == "room_cc_prison_cells_ch1" && cur.roomName == "room_cc_prisonlancer_ch1" && vars.tempVar == 2},
        {"Ch1_Enter_Elevator",        (ver, org, cur) => org.roomName == "room_cc_prison_to_elevator_ch1" && cur.roomName == "room_cc_prisonelevator_ch1"},
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
        {"Ch2_Library",            (ver, org, cur) => (org.roomName == "room_krisroom_ch2" || org.roomName == "room_library_ch2") && cur.roomName == "room_dw_cyber_intro_1_ch2"},
        {"Ch2_ArcadeGameText",     (ver, org, cur) => cur.roomName == "room_dw_cyber_queen_boxing_ch2" && cur.msc == 1015 && !org.song.EndsWith(@"mus\cyber.ogg") && cur.song.EndsWith(@"mus\cyber.ogg")},
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
        {"Ch2_FreezeRing",         (ver, org, cur) => cur.roomName == "room_dw_city_big_2_ch2" && vars.checkTextOpen(ver, org, cur, @"* (You got the FreezeRing.)/%", @"＊ (凍てつく指輪を　手に入れた)/%")},
        {"Ch2_Egg",                (ver, org, cur) => (cur.roomName == "room_dw_cyber_musical_door_ch2" || cur.roomName == "room_dw_city_man_ch2") && org.msc == 1173 && cur.msc > 1173 && cur.choicer <= 0},
        {"Ch2_Mouse2Puzzle",       (ver, org, cur) => org.roomName == "room_dw_city_mice2_ch2" && cur.roomName == "room_dw_city_cheesemaze_ch2"},
        {"Ch2_ThornRing",          (ver, org, cur) => cur.roomName == "room_dw_city_moss_ch2" && vars.checkTextClose(ver, org, cur, @"\S1* (You got the ThornRing.)/%", @"\S1＊ (いばらの指輪を　手に入れた)/%")},
        {"Ch2_SGBerdly",           (ver, org, cur) => cur.roomName == "room_dw_city_berdly_ch2" && org.snowgrave < 127 && cur.snowgrave >= 127 && cur.snowgrave <= 150},
        {"Ch2_SGBerdly_LeaveRoom", (ver, org, cur) => org.roomName == "room_dw_city_berdly_ch2" && cur.roomName == "room_dw_city_poppup_ch2"},
        {"Ch2_Berdly_Leave",       (ver, org, cur) => org.roomName == "room_dw_city_berdly_ch2" && cur.roomName == "room_dw_city_traffic_4_ch2"},
        {"Ch2_SpamtonLeave",       (ver, org, cur) => org.roomName == "room_dw_city_spamton_alley_ch2" && cur.roomName == "room_dw_city_traffic_4_ch2"},
        {"Ch2_CyberCity_Exit",     (ver, org, cur) => org.roomName == "room_dw_city_mansion_front_ch2" && cur.roomName == "room_dw_mansion_krisroom_ch2"},
        {"Ch2_Mansion_Entrance",   (ver, org, cur) => org.roomName == "room_dw_mansion_dining_a_ch2" && cur.roomName == "room_dw_mansion_entrance_ch2"},
        {"Ch2_Mansion_Exit",       (ver, org, cur) => org.roomName == "room_dw_mansion_entrance_ch2" && cur.roomName == "room_dw_mansion_fire_paintings_ch2"},
        {"Ch2_TasqueManager",      (ver, org, cur) => org.roomName == "room_dw_mansion_tasquePaintings_ch2" && cur.roomName == "room_dw_mansion_traffic_ch2"},
        {"Ch2_Mauswheel",          (ver, org, cur) => org.roomName == "room_dw_mansion_kitchen_ch2" && cur.roomName == "room_dw_mansion_east_2f_transformed_new_ch2"},
        {"Ch2_Disk_Loaded",        (ver, org, cur) => cur.roomName == "room_shop_ch2_spamton_ch2" && org.loadedDiskGreyBG < 121 && cur.loadedDiskGreyBG == 121},
        {"Ch2_Disk_Inserted",      (ver, org, cur) => cur.roomName == "room_dw_mansion_b_east_b_ch2" && org.msc != 1134 && cur.msc == 1134 && cur.choicer == 0},
        {"Ch2_SpamtonNEO_End",     (ver, org, cur) => cur.roomName == "room_dw_mansion_b_east_ch2" && org.song.EndsWith(@"mus\spamton_neo_mix_ex_wip.ogg") && cur.song == null},
        {"Ch2_SpamtonNEO_Leave",   (ver, org, cur) => org.roomName == "room_dw_mansion_b_east_ch2" && cur.roomName == "room_dw_mansion_b_east_a_ch2"},
        {"Ch2_AcidLake_Enter",     (ver, org, cur) => org.roomName == "room_dw_mansion_east_3f_ch2" && cur.roomName == "room_dw_mansion_acid_tunnel_ch2"},
        {"Ch2_AcidLake_Exit",      (ver, org, cur) => org.roomName == "room_dw_mansion_acid_tunnel_loop_rouxls_ch2" && cur.roomName == "room_dw_mansion_acid_tunnel_exit_ch2"},
        {"Ch2_Queen",              (ver, org, cur) => org.roomName == "room_dw_mansion_east_4f_d_ch2" && cur.roomName == "room_dw_mansion_top_ch2"},
        {"Ch2_GigaQueen",          (ver, org, cur) => org.roomName == "room_dw_mansion_top_ch2" && cur.roomName == "room_dw_mansion_top_post_ch2"},
        {"Ch2_Fountain_Enter",     (ver, org, cur) => (org.roomName == "room_dw_mansion_top_post_ch2" && cur.roomName == "room_cc_fountain_ch2") || (org.roomName == "room_dw_mansion_prefountain_ch2" && cur.roomName == "room_dw_mansion_fountain_ch2")},
        {"Ch2_SGSpamtonNEO_End",   (ver, org, cur) => cur.roomName == "room_dw_mansion_fountain_ch2" && org.fight == 1 && cur.fight == 0},
        {"Ch2_Fountain_Exit",      (ver, org, cur) => (org.roomName == "room_cc_fountain_ch2" || org.roomName == "room_dw_mansion_fountain_ch2") && cur.roomName == "room_lw_computer_lab_ch2"},
        {"Ch2_PuppetScarfChest",   (ver, org, cur) => cur.roomName == "room_dw_castle_west_cliff_ch2" && (vars.checkTextOpen(ver, org, cur, @"* (You opened the treasure&||chest.^1)&* (Inside was \cYPuppetScarf\cW.)/", @"＊ (宝箱を開けた^1)&＊ (\cYパペットマフラー\cWが&　 入っていた)/") || vars.checkTextOpen(ver, org, cur, @"* (You have too many \cYWEAPONs\cW to&||take \cYPuppetScarf\c0.)/%", @"＊ (\cYぶき\cWが多すぎて&　 \cYパペットマフラー\c0を&　 持てない)/%"))}
    };
    vars.splits[2] = new Dictionary<string, Func<string, dynamic, dynamic, bool>>()
    {
        {"Ch3_EnterRound1",  (ver, org, cur) => (org.roomName == "room_dw_couch_overworld_intro_ch3" || org.roomName == "room_ch3_gameshowroom_ch3") && cur.roomName == "room_board_gsa02_b0_ch3"},
        {"Ch3_EnterChef",    (ver, org, cur) => org.roomName == "room_board_1_ch3" && cur.roomName == "room_dw_chef_ch3"},
        {"Ch3_EndRound1",    (ver, org, cur) => org.roomName == "room_ch3_gameshowroom_ch3" && cur.roomName == "room_dw_green_room_ch3" && (cur.plot_ch3 == 110 || cur.plot_ch3 == 120)},
        {"Ch3_IceKey",       (ver, org, cur) => org.roomName == "room_board_1_sword_trees_ch3" && cur.roomName == "room_dw_console_room_ch3"},
        {"Ch3_EnterRhythm",  (ver, org, cur) => org.roomName == "room_board_2_ch3" && cur.roomName == "room_dw_rhythm_ch3"},
        {"Ch3_EndRound2",    (ver, org, cur) => org.roomName == "room_ch3_gameshowroom_ch3" && cur.roomName == "room_dw_green_room_ch3" && (cur.plot_ch3 == 140 || cur.plot_ch3 == 150)},
        {"Ch3_ShelterKey",   (ver, org, cur) => org.roomName == "room_board_dungeon_2_ch3" && cur.roomName == "room_dw_console_room_ch3"},
        {"Ch3_EndRound3",    (ver, org, cur) => org.roomName == "room_ch3_gameshowroom_ch3" && cur.roomName == "room_dw_backstage_ch3"},
        {"Ch3_EnterTVW",     (ver, org, cur) => org.roomName == "room_dw_backstage_ch3" && cur.roomName == "room_dw_teevie_intro_ch3"},
        {"Ch3_EnterRouxls",  (ver, org, cur) => org.roomName == "room_dw_teevie_stealth_d_ch3" && cur.roomName == "room_dw_teevie_chef_ch3"},
        {"Ch3_ExitRouxls",   (ver, org, cur) => org.roomName == "room_dw_teevie_chef_ch3" && cur.roomName == "room_dw_teevie_dust_ch3"},
        {"Ch3_Egg",          (ver, org, cur) => cur.roomName == "room_dw_ch3_man_ch3" && org.eggTimer <= 1 && cur.eggTimer > 1},
        {"Ch3_EnterMantle",  (ver, org, cur) => org.roomName == "room_board_preshadowmantle_ch3" && cur.roomName == "room_shadowmantle_ch3"},
        {"Ch3_EndMantle",    (ver, org, cur) => cur.roomName == "room_shadowmantle_ch3" && org.mantleOutro != 0.125 && cur.mantleOutro == 0.125},
        {"Ch3_ShadowMantle", (ver, org, cur) => org.roomName == "room_board_postshadowmantle_ch3" && cur.roomName == "room_dw_console_room_ch3"},
        {"Ch3_StartTenna",   (ver, org, cur) => cur.roomName == "room_dw_snow_zone_battle_ch3" && org.fight == 0 && cur.fight == 1},
        {"Ch3_EndTenna",     (ver, org, cur) => org.roomName == "room_dw_snow_zone_battle_ch3" && cur.roomName == "room_dw_snow_zone_ch3"},
        {"Ch3_StartKnight",  (ver, org, cur) => cur.roomName == "room_dw_snow_zone_ch3" && org.fight == 0 && cur.fight == 1},
        {"Ch3_DieToKnight",  (ver, org, cur) => org.roomName == "room_dw_snow_zone_ch3" && (cur.roomName == "room_gameover_ch3" || (org.knightResult == 0 && cur.knightResult == 2))},
        {"Ch3_EndKnight",    (ver, org, cur) => cur.roomName == "room_dw_snow_zone_ch3" && org.knightResult == 0 && cur.knightResult == 1}
    };
    vars.splits[3] = new Dictionary<string, Func<string, dynamic, dynamic, bool>>()
    {
        {"Ch4_EnterCT",         (ver, org, cur) => (org.roomName == "room_schooldoor_ch4" || org.roomName == "room_dw_church_knightclimb_post_ch4") && cur.roomName == "room_dw_castle_area_1_ch4"},
        {"Ch4_StartMike",       (ver, org, cur) => cur.roomName == "room_dw_castle_tv_zone_battle_ch4" && org.fight == 0 && cur.fight == 1},
        {"Ch4_EndMike",         (ver, org, cur) => cur.roomName == "room_dw_castle_tv_zone_battle_ch4" && cur.fight == 1 && org.mikeAction != 18 && cur.mikeAction == 18},
        {"Ch4_NoellesHouse",    (ver, org, cur) => org.roomName == "room_town_noellehouse_ch4" && cur.roomName == "room_lw_noellehouse_main_ch4"},
        {"Ch4_EnterDW",         (ver, org, cur) => (org.roomName == "room_torhouse_ch4" || org.roomName == "room_town_church_ch4") && cur.roomName == "room_dw_church_intro1_ch4"},
        {"Ch4_EnterStudy",      (ver, org, cur) => org.roomName == "room_dw_church_darkmaze_ch4" && cur.roomName == "room_dw_church_gersonstudy_ch4"},
        {"Ch4_Jackenstein",     (ver, org, cur) => cur.roomName == "room_dw_church_jackenstein_ch4" && org.fight == 1 && cur.fight == 0},
        {"Ch4_GoldenPiano",     (ver, org, cur) => org.roomName == "room_dw_church_secretpiano_ch4" && cur.roomName == "room_dw_church_gersonstudy_ch4"},
        {"Ch4_EnterHoJ",        (ver, org, cur) => org.roomName == "room_dw_church_gersonstudy_ch4" && cur.roomName == "room_dw_church_arena_ch4"},
        {"Ch4_HammerofJustice", (ver, org, cur) => cur.roomName == "room_dw_church_arena_ch4" && cur.fight == 1 && ((org.susieSprite == 1535 && cur.susieSprite == 1553) || (org.susieSprite == 1536 && cur.susieSprite == 1554)) && vars.tempVar == 1},
        {"Ch4_ExitHoJ",         (ver, org, cur) => org.roomName == "room_dw_church_arena_ch4" && cur.roomName == "room_dw_church_gersonstudy_ch4"},
        {"Ch4_GrandPiano",      (ver, org, cur) => org.roomName == "room_dw_church_organpuzzle_ch4" && (cur.roomName == "room_dw_church_trueclimbadventure_ch4" || cur.roomName == "room_dw_church_rightconnect_ch4")},
        {"Ch4_MissMizzle",      (ver, org, cur) => org.roomName == "room_dw_church_holywatercooler_ch4" && cur.roomName == "room_dw_church_intro_gerson_ch4"},
        {"Ch4_Fountain1",       (ver, org, cur) => org.roomName == "room_dw_church_fountain_ch4" && cur.roomName == "room_lw_church_entrance_ch4"},
        {"Ch4_Egg",             (ver, org, cur) => cur.roomName == "room_dw_churchb_man_ch4" && vars.checkTextClose(ver, org, cur, @"* (An Egg was picked up from a&||nearby easel.)/%", "＊ (近くのイーゼルから\n　 タマゴを　拾いあげた)/%")},
        {"Ch4_FallDown",        (ver, org, cur) => org.roomName == "room_dw_churchb_darkclimb_scene_ch4" && cur.roomName == "room_dw_churchb_darkclimb_ch4"},
        {"Ch4_FakeGerson",      (ver, org, cur) => org.roomName == "room_dw_churchb_nongerson_ch4" && cur.roomName == "room_dw_churchb_nongerson_post_ch4"},
        {"Ch4_Fountain2",       (ver, org, cur) => org.roomName == "room_dw_churchb_fountain_ch4" && cur.roomName == "room_lw_church_entrance_ch4"},
        {"Ch4_PrincessRBN",     (ver, org, cur) => cur.roomName == "room_dw_churchc_prophecies_ch4" && vars.checkTextOpen(ver, org, cur, @"* (\cYPrincessRBN\cW was added to your&||\cYARMORs\cW.)/%", @"＊ (\cYプリティリボン\cWが&　 \cYぼうぐ\cWに　加わった)/%")},       
        {"Ch4_PreClimbTitan1",  (ver, org, cur) => org.roomName == "room_dw_churchc_pretitan_ch4" && cur.roomName == "room_dw_churchc_titanclimb1_ch4"},
        {"Ch4_ClimbTitan1",     (ver, org, cur) => org.roomName == "room_dw_churchc_titanclimb1_ch4" && cur.roomName == "room_dw_churchc_titanclimb1_post_ch4"},
        {"Ch4_PreClimbTitan2",  (ver, org, cur) => org.roomName == "room_dw_churchc_titanclimb1_post_ch4" && cur.roomName == "room_dw_churchc_titanclimb2_ch4"},
        {"Ch4_ClimbTitan",      (ver, org, cur) => org.roomName == "room_dw_churchc_titanclimb2_ch4" && cur.roomName == "room_dw_churchc_titanclimb2_post_ch4"},
        {"Ch4_StartTitan",      (ver, org, cur) => org.roomName == "room_dw_churchc_titanclimb2_post_ch4" && org.fight == 0 && cur.fight == 1},
        {"Ch4_InsideTitan",     (ver, org, cur) => org.roomName == "room_dw_churchc_titanclimb2_post_ch4" && cur.roomName == "room_dw_churchc_insidetitan_ch4"},
        {"Ch4_EndTitan",        (ver, org, cur) => org.roomName == "room_dw_churchc_insidetitan_ch4" && cur.roomName == "room_dw_churchc_titandefeated_ch4"},
        {"Ch4_Fountain3",       (ver, org, cur) => org.roomName == "room_cc_fountain_ch4" && cur.roomName == "room_lw_church_main_ch4"}
    };
    vars.completedSplits = new HashSet<string>();

    vars.resetSplits = (Action)(() =>
    {
        vars.completedSplits.Clear();
        print("[DELTARUNE] All splits have been reset to initial state");
    });

    settings.Add("AC", true, "All Chapters");
    settings.CurrentDefaultParent = "AC";

    settings.Add("AC_PauseTimer", true, "Pause the timer between chapters");
     settings.SetToolTip("AC_PauseTimer",
        "This setting pauses the timer when you end a chapter and resumes it when you continue from a previous save file in the next chapter.\n\n" +
        "NOTE: For this to work, Game Time must be enabled\n" +
        "(you will be asked if you want to enable it by turning on this setting and opening the game if the timer isn't already running, or you can do it yourself).");

    settings.Add("AC_AlternateCh2", true, "Pause Chapter 2 when Susie falls asleep");
     settings.SetToolTip("AC_AlternateCh2",
        "This setting pauses the timer when Susie falls asleep instead of when you close Toriel's final textbox\n" +
        "(and it also changes the Ending autosplit location accordingly).\n" +
        "This is the timing used for All Chapters runs. Disable this if you're running Chapter 2 or Chapter 1&2.\n\n" +
        @"This setting does not work if you remove You Can Always Come Home from the game files (mus\home.ogg).");

    settings.Add("AC_PauseTimerOST", false, "(OST%) Pause the timer between chapters");
     settings.SetToolTip("AC_PauseTimerOST",
        "This setting pauses the timer when the credits music starts playing instead.\n" +
        "Useful for OST%. NOTE: If you still want Chapter 2 to pause when Susie falls asleep, enable every setting above as well.");

    settings.Add("AC_UnpauseOnLoad",  false, "Also unpause the timer when loading a save file");
    settings.Add("AC_UnpauseOnStart", false, "Also unpause the timer when starting from a new save file");
    settings.CurrentDefaultParent = null;

    settings.Add("Ch1", false, "Chapter 1: The Beginning");
    settings.CurrentDefaultParent = "Ch1";
    settings.Add("Ch1_School",                false, "Enter Dark World");
    settings.Add("Ch1_CastleTown_DoorClose",  false, "Exit Castle Town (door close)");
    settings.Add("Ch1_CastleTown_RoomChange", false, "Exit Castle Town (room exit)");
    settings.Add("Ch1_Fields_Exit",           false, "Exit Field");
    settings.Add("Ch1_Checkerboard_Exit",     false, "Exit Checkerboard");
    settings.Add("Ch1_BakeSale_Enter",        false, "Enter Bake Sale");
    settings.Add("Ch1_Egg",                   false, "Obtain Egg");
    settings.Add("Ch1_SusieLancer_Exit",      false, "Exit Forest (Susie & Lancer battle room)");
    settings.Add("Ch1_Escape_Cell",           false, "Exit Prison Cell");
    settings.Add("Ch1_Enter_Elevator",        false, "Enter Elevator");
    settings.Add("Ch1_KRound2_Exit",          false, "Exit K. Round 2 battle room");
    settings.Add("Ch1_Throne_Exit",           false, "Exit Throne Room");
    settings.Add("Ch1_PreKing_Exit",          false, "Exit Pre-King battle room");
    settings.Add("Ch1_King_EndBattle",        false, "End King battle");
    settings.Add("Ch1_King_Exit",             false, "Exit King battle room");
    settings.Add("Ch1_Fountain_Enter",        false, "Enter Fountain");
    settings.Add("Ch1_Fountain_Exit",         false, "Seal Fountain");
    settings.Add("Ch1_Ending",                false, "Ending");
    settings.Add("Ch1_EndingOST",             false, "(OST%) Ending");

    settings.Add("Ch1_AB", false, "All Bosses Splits");
    settings.CurrentDefaultParent = "Ch1_AB";
     settings.Add("Ch1_CFWarp",          false, "Warp from Castle to Field");
     settings.Add("Ch1_FBWarp",          false, "Warp from Field to Bake Sale");
     settings.Add("Ch1_BCWarp",          false, "Warp from Bake Sale to Castle");
     settings.Add("Ch1_Jevil_EnterRoom", false, "Enter Jevil battle room");
     settings.Add("Ch1_Jevil_EndBattle", false, "End Jevil battle");
      settings.SetToolTip("Ch1_Jevil_EndBattle", @"This autosplit does not work if you remove THE WORLD REVOLVING from the game files (mus\joker.ogg) in non-SURVEY_PROGRAM versions.");
     settings.Add("Ch1_Jevil_LeaveRoom", false, "Exit Jevil battle room");
    settings.CurrentDefaultParent = null;

    settings.Add("Ch2", false, "Chapter 2: A Cyber's World");
    settings.CurrentDefaultParent = "Ch2";
    settings.Add("Ch2_Library",          false, "Enter Dark World");
    settings.Add("Ch2_ArcadeGameText",   false, "End Punch-Out minigame (textbox close)");
     settings.SetToolTip("Ch2_ArcadeGameText", @"This autosplit does not work if you remove A CYBER'S WORLD? from the game files (mus\cyber.ogg).");
    settings.Add("Ch2_ArcadeGameLeave",  false, "End Punch-Out minigame (room exit)");
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
    settings.Add("Ch2_Berdly_Leave",     false, "Exit Berdly 2 battle room (Main Route)");
    settings.Add("Ch2_SpamtonLeave",     false, "Exit Spamton battle room");
    settings.Add("Ch2_CyberCity_Exit",   false, "Exit Cyber City (captured by Queen)");
    settings.Add("Ch2_Mansion_Entrance", false, "Enter Mansion Entrance save point room");
    settings.Add("Ch2_Mansion_Exit",     false, "Exit Mansion Entrance save point room");
    settings.Add("Ch2_TasqueManager",    false, "Exit Tasque Manager battle room");
    settings.Add("Ch2_Mauswheel",        false, "Exit Mauswheel battle room");
    settings.Add("Ch2_AcidLake_Enter",   false, "Enter Acid Lake");
    settings.Add("Ch2_AcidLake_Exit",    false, "Exit Acid Lake");
    settings.Add("Ch2_Queen",            false, "Exit Queen battle room");
    settings.Add("Ch2_GigaQueen",        false, "End Giga Queen battle");
    settings.Add("Ch2_Fountain_Enter",   false, "Enter Fountain");
    settings.Add("Ch2_Fountain_Exit",    false, "Seal Fountain");
    settings.Add("Ch2_PuppetScarfChest", false, "Open PuppetScarf Chest (Castle Town)");
    settings.Add("Ch2_Ending",           false, "Ending");
    settings.Add("Ch2_EndingOST",        false, "(OST%) Ending");

    settings.Add("Ch2_AB", false, "All Bosses Splits");
    settings.CurrentDefaultParent = "Ch2_AB";
     settings.Add("Ch2_Disk_Loaded",      false, "Obtain Loaded Disk");
     settings.Add("Ch2_Disk_Inserted",    false, "Insert Loaded Disk");
     settings.Add("Ch2_SpamtonNEO_End",   false, "End basement Spamton NEO battle");
      settings.SetToolTip("Ch2_SpamtonNEO_End", @"This autosplit does not work if you remove BIG SHOT from the game files (mus\spamton_neo_mix_ex_wip.ogg).");
     settings.Add("Ch2_SpamtonNEO_Leave", false, "Exit basement Spamton NEO room");
    settings.CurrentDefaultParent = "Ch2";

    settings.Add("Ch2_WR", false, "Weird Route Splits");
    settings.CurrentDefaultParent = "Ch2_WR";
     settings.Add("Ch2_FreezeRing",         false, "Obtain FreezeRing");
     settings.Add("Ch2_ThornRing",          false, "Obtain ThornRing (original source)");
     settings.Add("Ch2_SGBerdly",           false, "Snowgrave Berdly");
     settings.Add("Ch2_SGBerdly_LeaveRoom", false, "Exit Berdly 2 battle room (Weird Route)");
     settings.Add("Ch2_SGSpamtonNEO_End",   false, "End fountain Spamton NEO battle");
    settings.CurrentDefaultParent = null;

    settings.Add("Ch3", false, "Chapter 3: Late Night");
    settings.CurrentDefaultParent = "Ch3";
    settings.Add("Ch3_EnterRound1", false, "Enter Round 1");
    settings.Add("Ch3_EnterChef",   false, "Enter Cooking Show");
    settings.Add("Ch3_EndRound1",   false, "Enter Green Room (post-Round 1)");
    settings.Add("Ch3_EnterRhythm", false, "Enter Lightners Live");
    settings.Add("Ch3_EndRound2",   false, "Enter Green Room (post-Round 2)");
    settings.Add("Ch3_EndRound3",   false, "Enter TV World Backstage (post-Round 3)");
    settings.Add("Ch3_EnterTVW",    false, "Enter TV World");
    settings.Add("Ch3_EnterRouxls", false, "Enter Rouxls battle room");
    settings.Add("Ch3_ExitRouxls",  false, "Exit Rouxls battle room");
    settings.Add("Ch3_Egg",         false, "Obtain Egg");
    settings.Add("Ch3_StartTenna",  false, "Start Tenna battle");
    settings.Add("Ch3_EndTenna",    false, "End Tenna battle");
    settings.Add("Ch3_StartKnight", false, "Start Knight battle");
    settings.Add("Ch3_DieToKnight", false, "End Knight battle (loss)");
    settings.Add("Ch3_EndKnight",   false, "End Knight battle (win)");
    settings.Add("Ch3_Ending",      false, "Ending");
     settings.SetToolTip("Ch3_Ending", @"This autosplit does not work if you remove Crickets from the game files (mus\night_ambience.ogg).");
    settings.Add("Ch3_EndingOST",   false, "(OST%) Ending");

    settings.Add("Ch3_AB", false, "All Bosses Splits");
    settings.CurrentDefaultParent = "Ch3_AB";
     settings.Add("Ch3_IceKey",       false, "Obtain Ice Key (room exit)");
     settings.Add("Ch3_ShelterKey",   false, "Obtain Shelter Key (room exit)");
     settings.Add("Ch3_EnterMantle",  false, "Start Shadow Mantle battle");
     settings.Add("Ch3_EndMantle",    false, "End Shadow Mantle battle");
     settings.Add("Ch3_ShadowMantle", false, "Obtain Shadow Mantle (room exit)");
    settings.CurrentDefaultParent = null;

    settings.Add("Ch4", false, "Chapter 4: Prophecy");
    settings.CurrentDefaultParent = "Ch4";
    settings.Add("Ch4_EnterCT",        false, "Enter Castle Town");
    settings.Add("Ch4_StartMike",      false, "Start Mike battle");
    settings.Add("Ch4_EndMike",        false, "End Mike battle");
    settings.Add("Ch4_NoellesHouse",   false, "Enter Noelle's house");
    settings.Add("Ch4_EnterDW",        false, "Enter Dark World");
    settings.Add("Ch4_EnterStudy",     false, "Enter Gerson's study");
    settings.Add("Ch4_Jackenstein",    false, "End Jackenstein battle");
    settings.Add("Ch4_GrandPiano",     false, "Exit Grand Piano room");
    settings.Add("Ch4_MissMizzle",     false, "Exit Miss Mizzle battle room");
    settings.Add("Ch4_Fountain1",      false, "Seal Fountain 1");
    settings.Add("Ch4_FallDown",       false, "Fall down below the study");
    settings.Add("Ch4_Egg",            false, "Obtain Egg");
    settings.Add("Ch4_FakeGerson",     false, "End Sound of Justice (Fake Gerson) battle");
    settings.Add("Ch4_Fountain2",      false, "Seal Fountain 2");
    settings.Add("Ch4_PrincessRBN",    false, "Obtain Princess Ribbon");
    settings.Add("Ch4_PreClimbTitan1", false, "Start Titan Climb 1");
    settings.Add("Ch4_ClimbTitan1",    false, "End Titan Climb 1");
    settings.Add("Ch4_PreClimbTitan2", false, "Start Titan Climb 2");
    settings.Add("Ch4_ClimbTitan",     false, "End Titan Climb 2");
    settings.Add("Ch4_StartTitan",     false, "Start Titan battle");
    settings.Add("Ch4_InsideTitan",    false, "End Titan battle");
    settings.Add("Ch4_EndTitan",       false, "Seal Titan");
    settings.Add("Ch4_Fountain3",      false, "Seal Fountain 3");
    settings.Add("Ch4_Ending",         false, "Ending");
    settings.Add("Ch4_EndingOST",      false, "(OST%) Ending");

    settings.Add("Ch4_AB", false, "All Bosses Splits");
    settings.CurrentDefaultParent = "Ch4_AB";
     settings.Add("Ch4_GoldenPiano",     false, "Solve the Golden Piano puzzle");
     settings.Add("Ch4_EnterHoJ",        false, "Enter Hammer of Justice battle room");
     settings.Add("Ch4_HammerofJustice", false, "End Hammer of Justice battle");
     settings.Add("Ch4_ExitHoJ",         false, "Exit Hammer of Justice battle room");
}

exit
{
    vars.resetVars();
}

init
{
    var module = modules.First();
    vars.x64 = game.Is64Bit();

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
        case "3E9DD6292911D35417E19CD39DF81687": // v1.09 (itch.io, item tracker mod)
        case "4BDF08DD35BCD8BC39EF71C5E7247C4A": // v1.09 (itch.io, OST% tracker mod)
        case "267A8ABE468D824222810201F00003BE": // v1.09 (Steam)
        case "DF5D64B395AD186DB974C265C87E3336": // v1.09 (Steam, item tracker mod)
        case "7B73FE95B0E0251CDC3C26155089A5A4": // v1.09 (Steam, OST% tracker mod)
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
        case "3AEFE7A34739E5677CF3AB1829536BC7": // v1.15 (OST% tracker mod)
            version = "Demo v1.12-v1.15";
            break;

        // game_change versions - Chapter Select data.win
        // Not checking the individual chapters does mean that mods could get through, but chances are the autosplitter will just break anyway
        // Just hoping it does not become a problem
        case "7AD299A8B33FA449E20EDFE0FEDEDDB2":
            version = "Demo v1.19";
            break;

        case "B5EF0EEC9554C491777D6C4E93E0DF76":
        case "5AD96F21CEE4AE12B85B5F24BBBDB93A": // Item tracker mod
        case "D6ECCBC495E06E835B17815D0A5B2852": // OST% tracker mod
            version = "CH1-4 v1.02";
            break;

        case "9D1FEA9DE81219EA7304F32F1AE7A878":
        case "28660F14803390E2D1061ECE661E3CD0": // Item tracker mod
        case "5CDE5CD6C739B962D583D297514C6C1C": // OST% tracker mod
            version = "CH1-4 v1.04";
            break;

        case "5D3E158DBE6888FBF24471019FBDE3C9":
        case "0A9267AD2A88CBDE8D9650CFE8265085": // Item tracker mod
        case "9FB4D5FCB9D42765BFC2A57BE1FBD945": // OST% tracker mod
            version = "CH1-4 v1.05 Beta";
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
                    "If you are playing an unsupported mod, switch to the vanilla game or these supported mods:\n" +
                    "- Item tracker mod\n" +
                    "- OST% tracker mod.\n\n" +

                    "Make sure the game's executable is named \"DELTARUNE.exe\" and the main data file is named \"data.win\".\n" +
                    "Supported versions:\n" +
                    "- SURVEY_PROGRAM\n" +
                    "- Chapter 1&2 v1.08-v1.15, v1.19\n" +
                    "- Chapters 1-4 v1.02, v1.04, v1.05 Beta.\n\n" +
            
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

    current.chapter           = 0;
    current.fight             = 0;
    current.choicer           = -1;
    current.msc               = 0;
    current.text              = null;
    current.namerEvent        = 0;
    current.room              = 0;
    current.roomName          = null;
    current.song              = null;
    current.finalTextboxHalt  = 0;
    current.finalTextboxHalt2 = 0;
    current.text_ch2_2        = null;
    current.text_ch2_3        = null;
    current.directory         = null;
    vars.firstUpdateDone      = false;
}

update
{
    if(version == "Unknown")
        return false;

    current.room = game.ReadValue<int>((IntPtr)vars.ptrRoomID);
    current.roomName = vars.getRoomName();

    if(version == "SURVEY_PROGRAM")
    {
        current.chapter = 1;
    }
    else if(vars.x64) // game_change fully unloads and loads games so consistent pointer paths between chapters are not an option
    {
        if(current.directory == null)
            return false;

        if(current.directory.EndsWith(@"\chapter1_windows\"))
        {
            current.chapter    = 1;
            current.fight      = current.fight_ch1;
            current.choicer    = current.choicer_ch1;
            current.msc        = current.msc_ch1;
            current.text       = current.text_ch1;
            current.namerEvent = 0; // Fixes an error if you load the autosplitter while in-game in Chapter 1
        }
        else if(current.directory.EndsWith(@"\chapter2_windows\"))
        {
            current.chapter = 2;
            current.fight   = current.fight_ch2;
            current.choicer = current.choicer_ch2;
            current.msc     = current.msc_ch2;
            current.text    = current.text_ch2;
            
            if(version.StartsWith("CH1-"))
                current.namerEvent = current.namerEvent_ch2;
        }
        else if(current.directory.EndsWith(@"\chapter3_windows\"))
        {
            current.chapter    = 3;
            current.fight      = current.fight_ch3;
            current.namerEvent = current.namerEvent_ch3;
        }
        else if(current.directory.EndsWith(@"\chapter4_windows\"))
        {
            current.chapter    = 4;
            current.fight      = current.fight_ch4;
            current.text       = current.text_ch4;
            current.namerEvent = current.namerEvent_ch4;
        }
        else
        {
            current.chapter    = 0;
            current.fight      = 0;
            current.choicer    = -1;
            current.msc        = 0;
            current.text       = null;
            current.namerEvent = 0;
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

        if(!vars.firstUpdateDone)
        {
            vars.firstUpdateDone = true;
            return false;
        }

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
                {
                    endCondition = vars.checkTextClose(version, old, current, @"* (You decided to go to bed.)/%", @"＊ (ねむることにした)/%");
                }
                break;

            case 2:
                // This is the only situation where the Door Overflow splits could get triggered
                // You can not have the 400 bagels and the door available at the same time in regular gameplay
                if((settings["Ch2_TrashZoneWarp2"] || settings["Ch2_MansionWarp2"]) && vars.tempVar == 0 && current.roomName == "room_dw_cyber_musical_door_ch2" && vars.checkTextClose(version, old, current, @"* (You were crushed under the&||weight of 400 bagels and&||defeated instantly...)/%", @"＊ (ベーグル400コの　重みに耐えきれ^1ず&　たちまち　力つきた…)/%"))
                {
                    vars.tempVar = 1;
                }
                else
                {
                    if(settings["AC_AlternateCh2"] && current.roomName == "room_torhouse_ch2")
                    {
                        if(((old.sound == "snd_wing" && current.sound == "snd_bump") || (old.sound != null && old.sound.EndsWith(@"mus\home.ogg") && current.sound == null) || (old.song != null && old.song.EndsWith(@"mus\home.ogg") && current.song == null)) && current.msc == 1090 && !vars.offset.IsRunning)
                        {
                            vars.offset.Start();
                        }
                        else
                        {
                            endCondition = (vars.offset.ElapsedMilliseconds >= 3667);
                        }
                    }
                    else
                    {
                        endCondition = vars.checkTextClose(version, old, current, @"\E1* ... they're already&||asleep.../%", @"\E1＊ …ふたりとも　もう&　 ねむってしまったのね。/%");
                    }
                }
                break;

            case 3:
                if(old.song != null)
                {
                    endCondition = (current.roomName == "room_town_shelter_ch3" && old.song.EndsWith(@"mus\night_ambience.ogg") && current.song == null);
                }
                break;

            case 4:
                if(settings["Ch4_HammerofJustice"] && vars.tempVar == 0 && current.roomName == "room_dw_church_arena_ch4" && current.fight == 1 && (old.susieSprite >= 3128 && old.susieSprite <= 3130) && old.susieSprite != current.susieSprite)
                {
                    vars.tempVar = 1;
                }
                else
                {
                    endCondition = (current.roomName == "room_torhouse_ch4" && current.plot_ch4 == 310 && (old.playerX != current.playerX || old.playerY != current.playerY) && current.playerX < 160 && current.playerY < 80);
                }
                break;
        }

        if(endCondition)
        {
            if(settings["AC_PauseTimer"] && (!settings["AC_PauseTimerOST"] || (current.chapter == 2 && settings["AC_AlternateCh2"]) || (current.chapter == 3 && !settings["AC_AlternateCh2"])) && !timer.IsGameTimePaused)
            {
                print("[DELTARUNE] All Chapters: Chapter " + ch + " ended, timer paused");
                timer.IsGameTimePaused = true;
            }
            vars.offset.Reset();
            vars.resetSplits();
            vars.forceSplit = settings["Ch" + ch + "_Ending"];
        }
        else if((current.chapter == 1 && current.roomName == "room_ed_ch1" && vars.offset.ElapsedMilliseconds >= 3600) || (current.chapter > 1 && old.roomName == vars.OSTRooms[ch] && current.roomName.StartsWith("room_ed")))
        {
            if(settings["AC_PauseTimerOST"] && !timer.IsGameTimePaused)
            {
                print("[DELTARUNE] (OST%) All Chapters: Chapter " + ch + " ended, timer paused");
                timer.IsGameTimePaused = true;
            }
            vars.offset.Reset();
            vars.forceSplit = settings["Ch" + ch + "_EndingOST"];
        }

        if(old.room != current.room)
        {
            print("[DELTARUNE] Room: " + old.room + " (" + old.roomName + ")" + " -> " + current.room + " (" + current.roomName + ")");

            if((settings["AC_PauseTimer"] || settings["AC_PauseTimerOST"]) && timer.IsGameTimePaused && old.roomName.StartsWith("PLACE_MENU") && (current.roomName == vars.ACContinueRooms[ch] || (settings["AC_UnpauseOnLoad"] && current.roomName != vars.ACContinueRooms[ch])))
            {
                print("[DELTARUNE] All Chapters: Chapter " + ch + " started, timer resumed");
                timer.IsGameTimePaused = false;
            }

            // You enter the room twice, once in the cutscene and once when you regain control
            // so we need to keep track of the number of room entrances, otherwise it would split during the cutscene
            else if(settings["Ch1_Escape_Cell"] && vars.tempVar < 2 && old.roomName == "room_cc_prison_cells_ch1" && current.roomName == "room_cc_prisonlancer_ch1")
            {
                vars.tempVar++;
            }
            else if((settings["AC_PauseTimerOST"] || settings["Ch1_EndingOST"]) && current.roomName == "room_ed_ch1" && !vars.offset.IsRunning)
            {
                vars.offset.Start();
            }
            // Edge case: Reset vars.tempVar to make sure Door Overflow splits don't get triggered by doing the 400 bagels cutscene and then playing normally until the door is properly accessible
            else if((settings["Ch2_TrashZoneWarp2"] || settings["Ch2_MansionWarp2"]) && current.chapter == 2 && vars.tempVar == 2 && current.roomName != "room_dw_city_intro_ch2" && current.roomName != "room_dw_mansion_entrance_ch2")
            {
                vars.tempVar = 0;
            }
        }
    }
    else if(!vars.firstUpdateDone)
    {
        vars.firstUpdateDone = true;
        return false;
    }
}

start
{
    if(timer.Run.Offset != TimeSpan.FromSeconds(0))
        return false;

    if(old.room != current.room && current.roomName == "PLACE_CONTACT_ch1")
    {
        print("[DELTARUNE] Timer started (Start Room for Chapter 1 detected)");
        return true;
    }

    else if(version != "SURVEY_PROGRAM")
    {
        if(old.namerEvent == 74 && current.namerEvent == 75 && current.roomName.StartsWith("PLACE_MENU"))
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
    if(timer.Run.Offset != TimeSpan.FromSeconds(0))
        return false;

    if(old.room != current.room && current.roomName == "PLACE_CONTACT_ch1")
    {
        if(settings["AC_UnpauseOnStart"] && timer.IsGameTimePaused)
        {
            timer.IsGameTimePaused = false;
            return false;
        }
        print("[DELTARUNE] Timer reset (Start Room for Chapter 1 detected)");
        return true;
    }

    else if(version != "SURVEY_PROGRAM")
    {
        if(old.namerEvent == 74 && current.namerEvent == 75 && current.roomName.StartsWith("PLACE_MENU"))
        {
            if(settings["AC_UnpauseOnStart"] && timer.IsGameTimePaused)
            {
                timer.IsGameTimePaused = false;
                return false;
            }
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
    
    if(current.chapter == 0)
        return;

    foreach(var split in vars.splits[(int)current.chapter - 1])
    {
        if(!settings[split.Key] || 
           vars.completedSplits.Contains(split.Key) ||
           !split.Value(version, old, current)) continue;

        vars.tempVar = 0;
        vars.completedSplits.Add(split.Key);
        print("[DELTARUNE] Split triggered (" + split.Key + ")");
        return true;
    }
}
