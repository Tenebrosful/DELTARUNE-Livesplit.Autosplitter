# DELTARUNE LiveSplit Autosplitter

This is a LiveSplit Autosplitter for DELTARUNE speedruns.

## Supported versions

- SURVEY_PROGRAM
- Chapter 1&2 v1.08-v1.15, v1.19
  - The item tracker mod for v1.15 is also supported.

## How to install

### Easy way

To use the autosplitter, follow these easy steps:

1. Open your splits and go in `Edit Splits`
2. Insert `Deltarune` or `Deltarune Category Extensions` as the Game Name
3. You should now have access to the autosplitter and be able to activate it.

![Splits Editor header with the Game Name and the suggested autosplitter](/assets/quickInstall.png)

### Manual way (also for developers)

1. Download the [latest release of the autosplitter](https://github.com/Tenebrosful/DELTARUNE-Livesplit.Autosplitter/releases)
or clone the repository
2. Open LiveSplit and add the component `Control -> Scriptable Auto Splitter` on your layout
3. Insert the path to the autosplitter file in `Script Path`.

![Layout Editor with Control -> Scriptable Auto Splitter selected](/assets/manualInstall.png)

> The autosplitter file will auto-refresh when you save it.

## How to use

To use and configure the autosplitter, just click `Settings` and enable the locations you want the autosplitter
to split on.

![Settings options with Start, Split, Reset and individual splits that can be enabled or disabled](/assets/options.png)

### All Chapters

If you enable the All Chapters section, you will have to put your LiveSplit to In-Game Time (IGT) otherwise some functionalities
like the timer pause will not work.

## Want to help with / request something?

Want to get in touch with the developers?
In that case, we recommend you join the Deltarune Speedrunning community Discord server ["Fast Little Boys"](https://discord.gg/W6uckvkuer)
(FLB) and ping one of the developers in the channel #autosplitter-feedback.

You can also create an issue on this repository by clicking on the [Issues](https://github.com/Tenebrosful/DELTARUNE-Livesplit.Autosplitter/issues)
tab and then on `New Issue`.
That can be made to report a bug or to request a new feature / new split.

## Credits

- Originally inspired by **Narry's** [DELTARUNE SURVEY_PROGRAM Autosplitter](https://drive.google.com/file/d/1SCpuUpDgIYHmbc6xKK3ZrNk1zaIeDUMq/view?usp=sharing)
that was based on **Glacia's** UNDERTALE Autosplitter
- [**Tenebrosful**](https://github.com/Tenebrosful) (Repository, Development, Testing)
- [**NERS**](https://github.com/NERS1111) (Development, Memory pointers, In-Game Time, Testing)
- [**Vintagix**](https://github.com/VintagixDev) (Development, Testing)
- [**Jujstme**](https://github.com/jujstme) (Sigscanning for room names)
- [**Ero**](https://github.com/just-ero) (Sigscanning for room names)
