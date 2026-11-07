# MiSTer port of TK2000 (Apple-II clone)

#### original TK2000 by Victor Trucco
[MC2+ Release Bitstream p/ download no Gitlab](https://gitlab.com/victor.trucco/Multicore_Bitstreams/-/tree/master/Multicore%202%20Plus/Computers/TK2000)

[MC2 Release Bitstream p/ download no Gitlab](https://gitlab.com/victor.trucco/Multicore_Bitstreams/-/tree/master/Multicore%202/Computers/TK2000)

Updated to MiSTer by alanswx


- VGA
- HDMI
- Drive Disk II 


#### Use

This can use DSK or NIB files. 

"LOAD *.NIBDSK" in the menu and wait for the TK2000 to boot. Sometimes its necessary to go back to the OSD menu, and select the "RESET" option after loading a .NIB file.

#### OSD

```
TK2000
  Pri. drive (D1)    *.NIB/DSK/DO/PO   <- media: act at once
  Drive (D2)
  Tape               *.CT2
  Load ROM           (games/TK2000/boot0.rom by default)
  Machine  >   Disk interface On/Off, Tape speed 7x/Normal,
               Rewind tape, Tape play/stop
  Video    >   Display Color/B&W/Green/Amber, Tape overlay On/Off
  Audio    >   Tape audio Off/On
   Changes pending
  Apply and reset
```

Display and Disk interface take effect at **Apply and reset** (the "Changes
pending" line shows while they differ from the running machine). Media, the
tape settings and the tape buttons act at once.

#### Tape (CT2)

1. Set **Machine > Disk interface** to **Off** and **Apply and reset** (with the
   disk interface on and no disk, the TK2000 waits for the drive).
2. Load the `.ct2` in the **Tape** slot. A hint in the bottom-left corner says
   `TYPE LOADT ↵`.
3. Type `LOADT` and press Return. The tape starts by itself when the ROM starts
   reading it, and a status bar in the top-left corner shows elapsed/total time
   and progress.
4. Many tapes hold a BASIC program and stop at the `>` prompt after
   `NAME xx xx WAIT OK`: type `RUN` and press Return.

**Tape speed 7x** (default) runs the TK2000 seven times faster while the tape
plays, so a tape loads in a seventh of the time; the machine is back to normal
speed the moment the tape stops. **Tape play/stop** pauses the tape (Karateka:
stop it when "PLANSOFT apresenta" appears to watch the intro), **Rewind tape**
rewinds it. **Tape audio** plays the tape signal through the speaker.

##### Change log prior to official MiSTer conversion

- 003 : 09/12/2019 - HDMI and FAT32 disk support
- 002 : 09/07/2018 - initial version Multicore 2
- 001 : 16/03/2017 - initial release
