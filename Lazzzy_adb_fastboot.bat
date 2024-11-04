@ECHO OFF
mkdir boot
mkdir recovery
mkdir sideload
mkdir vbmeta
color 0E
:MENU
CLS
ECHO.
ECHO Lazzzy adb/fastboot by @antagonizzzt
ECHO Install adb drivers properly before using this tool :)
ECHO.
ECHO Main menu
ECHO.
ECHO 1 - ADB Commands
ECHO 2 - Fastboot Commands
ECHO 3 - Your Own Commands
ECHO 0 - exit
ECHO.
ECHO Enter a number
SET /P M=
IF %M%==1 GOTO ADB
IF %M%==2 GOTO FAST
IF %M%==3 goto mown
IF %M%==0 timeout /t 3 & exit
::
cls
echo Invalid sh*t. Enter Proper sh*t buddy :)
pause
GOTO MENU
:ADB
cls
ECHO.
ECHO Any issues? just close this tool and open it again
ECHO If no device found, it'll automatically return to this window
ECHO.
ECHO ADB Commands
ECHO.
ECHO 1 - Reboot to recovery
ECHO 2 - Reboot to bootloader
ECHO 3 - Reboot system
ECHO 4 - Adb shell
ECHO 5 - Adb devices
ECHO 6 - Own Commands
ECHO 7 - Adb Sideload
ECHO 8 - Previous menu
ECHO 0 - exit
ECHO.
ECHO Enter a number
SET /P A=
IF %A%==1 GOTO AREC
IF %A%==2 GOTO AFAST
IF %A%==3 GOTO Asys
IF %A%==4 GOTO shell
IF %A%==5 GOTO adevices
IF %A%==6 GOTO aown
IF %A%==7 GOTO side
IF %A%==8 GOTO menu
IF %A%==0 timeout /t 3 & exit
::
cls
echo Invalid sh*t. Enter Proper sh*t buddy :)
pause
GOTO adb
:arec
CLS
adb reboot recovery
ECHO done
timeout /t 5
GOTO adb
:afast
CLS
adb reboot fastboot
ECHO done
timeout /t 5
GOTO adb
:asys
CLS
adb reboot
ECHO done
timeout /t 5
GOTO adb
:shell
CLS
ECHO Enter "exit" when you done.
adb shell
ECHO done
timeout /t 5
GOTO adb
:adevices
CLS
adb kill-server
adb shell
pause
GOTO adb
:aown
CLS
start cmd.exe /k "color 0E"
ECHO done
timeout /t 5
GOTO adb
:side
cd sideload
dir /B *.zip >> orig_file.txt
ren *.zip sideload.zip
cd ..
CLS
ECHO.
ECHO Your given file name will be changed to "sideload.zip" (You may find the original file name inside "orig_file.txt")
adb sideload sideload\sideload.zip
ECHO Flashed Successfully
timeout /t 5
GOTO adb
:FAST
cls
ECHO.
ECHO Any issues? just close this tool and open again
ECHO If no device found, it'll automatically return to this window
ECHO.
ECHO Fastboot Commands
ECHO.
ECHO 1 - Reboot to recovery
ECHO 2 - Reboot bootloader
ECHO 3 - Reboot to system
ECHO 4 - Flash Recovery
ECHO 5 - Flash Boot
ECHO 6 - Flash vbmeta
ECHO 7 - Bootloader unlock
ECHO 8 - Format data / factory reset
ECHO 9 - Previous menu
ECHO 0 - exit
ECHO.
ECHO Put the respective file into the respective folder to flash.
ECHO No need to rename anything just put any (.img or .bin) files.
ECHO.
ECHO Enter a number
SET /P F=
IF %F%==1 GOTO frec
IF %F%==2 GOTO ffast
IF %F%==3 GOTO fsys
IF %F%==4 GOTO flrec
IF %F%==5 GOTO flboot
IF %F%==6 GOTO flvb
IF %F%==7 GOTO unlock
IF %F%==8 GOTO format
IF %F%==9 GOTO menu
IF %F%==0 timeout /t 3 & exit
::
cls
echo Invalid sh*t. Enter Proper sh*t buddy :)
pause
GOTO fast
:frec
CLS
fastboot reboot recovery
ECHO done
timeout /t 5
GOTO fast
:ffast
CLS
fastboot reboot fastboot
ECHO done
timeout /t 5
GOTO fast
:fsys
CLS
fastboot reboot
ECHO done
timeout /t 5
GOTO fast
:flrec
cls
cd recovery
dir /B *.img *.bin >> orig_file.txt
ren *.bin recovery.img
ren *.img recovery.img
cd ..
CLS
ECHO.
ECHO Your given file name will be changed to "recovery.img" (You may find the original file name inside "orig_file.txt")
fastboot flash recovery recovery\recovery.img
ECHO Flashed Successfully
timeout /t 5
GOTO fast
:flboot
cls
cd boot
dir /B *.img *.bin >> orig_file.txt
ren *.bin boot.img
ren *.img boot.img
cd ..
CLS
ECHO.
ECHO Your given file name will be changed to "boot.img" (You may find the original file name inside "orig_file.txt")
fastboot flash boot boot\boot.img
ECHO Flashed Successfully
timeout /t 5
GOTO fast
:flvb
cls
ECHO Which one?
ECHO 1 -  --disable-verification
ECHO 2 -  --disable-verity --disable-verification
ECHO 3 -  Just flash
ECHO 4 -  Go back
SET /P v=
IF %v%==1 GOTO vb1
IF %v%==2 GOTO vb2
IF %v%==3 GOTO vb0
IF %v%==4 GOTO fast
::
cls
echo Invalid sh*t. Enter Proper sh*t buddy :)
pause
GOTO fast
:vb0
cd vbmeta
dir /B *.img *.bin >> orig_file.txt
ren *.bin vbmeta.img
ren *.img vbmeta.img
cd ..
CLS
ECHO.
ECHO Your given file name will be changed to "vbmeta.img" (You may find the original file name inside "orig_file.txt")
fastboot flash vbmeta vbmeta\vbmeta.img
ECHO Flashed Successfully
timeout /t 5
GOTO fast
:vb1
cd vbmeta
dir /B *.img *.bin >> orig_file.txt
ren *.bin vbmeta.img
ren *.img vbmeta.img
cd ..
CLS
ECHO.
ECHO Your given file name will be changed to "vbmeta.img" (You may find the original file name inside "orig_file.txt")
fastboot flash vbmeta --disable-verification vbmeta\vbmeta.img
ECHO Flashed Successfully
timeout /t 5
GOTO fast
:vb2
cd vbmeta
dir /B *.img *.bin >> orig_file.txt
ren *.bin vbmeta.img
ren *.img vbmeta.img
cd ..
CLS
ECHO.
ECHO Your given file name will be changed to "vbmeta.img" (You may find the original file name inside "orig_file.txt")
fastboot flash --disable-verity --disable-verification vbmeta vbmeta\vbmeta.img
ECHO Flashed Successfully
timeout /t 5
GOTO fast
:unlock
CLS
ECHO.
ECHO As Bootloader (flashing/oem unlock) command varies from device to device, I left adding this command as it may mess up with your device. So take time to surf the internet and find the proper way yourself. Don't be Lazzzy :)
pause
GOTO fast
:format
CLS
ECHO.
ECHO To avoid accidental data loss, I haven't added the reset command in this script.
ECHO But don't worry, a new window will be opened in a few seconds
ECHO Manually type one of the commands below to do format/factory reset
ECHO Replace underscores (_) with spaces ( )
ECHO.
ECHO.
ECHO fastboot_erase_userdata
ECHO.
ECHO 	or
ECHO.
ECHO fastboot_-w
ECHO.
ECHO.
timeout /t 20
start cmd.exe /k "color 0E"
pause
GOTO fast
:fown
CLS
start cmd.exe /k "color 0E"
ECHO done
timeout /t 5
GOTO fast
:mown
CLS
start cmd.exe /k "color 0E"
ECHO done
timeout /t 5
GOTO menu
