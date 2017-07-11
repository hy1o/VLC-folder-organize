# VLC-folder-organize
Organizing files and folders for VLC iOS app in terms of sql script

## VLC iOS app's Limitation
VLC is a free and open source cross-platform media player.

It can play almost all kinds of video format, including webm, only few apps in iOS can support it.

This great player has a limitation when it comes to organizing files and folders.

I had put handful of videos into VLC that were already organized in folder hierarchy, but the app showed the videos in flat, one-dimensional way, without any folders.

Fortunately, It allows us to create folders manually and assign each video to a specific folder.

Though, for dozens of videos, it is way too tedious.

So, I wrote a script for it.


## Requirements
(1) Your iDevice should be jailbroken to access the inner files

(2) sqlite3 on your device

(3) iFile or Filza(to locate VLC folder, it is not necessary)

(4) You should be more than a novice regarding bash scripting(especially find command)

    Since this script is not completely click-and-go


## Limitations
(1) Since VLC app does not support nested folders, we will be restricted by that too.

(2) I don't know about the situation on Android VLC app. 

    But I guess the mechanism using sqlite database would be same.


## Usage
Our target DB is located in /var/mobile/Container/Shared/AppGroup/{VLC_Folder}/MediaLibrary.sqlite

But first, you should generate sqlite commands by executing modified script.

To be specific, you should modify the first line of script, find's argument, to meet your files.


> ./vlc.sh > vlc_sqlite.sh


This will write sqlite commands that desribing a relation of your file and its parent folder.

Then, bring the generated script to the target DB location, and give it a executable permission, and fire it!




