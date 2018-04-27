@echo off
set TITLE=PocketMine-MP Easy installer by Okin_Japan
echo %TITLE%
REM :lang
REM improving
REM echo *********** Select your langage ************
REM echo "*[English] > 1"
REM echo "*[日本語]  > 2"
REM echo "*[(ロシア語(русский))] ＞ 3"
REM echo *********************************************
REM echo.
REM set /p NUM0="Select your language in the number.>"
REM if "%NUM0%"=="1" goto checkbit
REM if "%NUM0%"=="2" goto checkbit-jpn
REM if "%NUM0%"=="3" goto checkbit-rus
REM if "%NUM0%"=="" goto confirm
echo ***************** Warning *******************
echo       This installer may be outdated.
echo *********************************************
REM echo.
set /p NUM="Do you want to continue?/続行しますか?(y/N)"
if "%NUM%"=="y" goto checkbit
if "%NUM%"=="n" goto end
if "%NUM%"=="N" goto end
goto end


REM :confirm
REM echo "Not selected. Con."
REM echo.
REM goto 

:checkbit
echo %PROCESSOR_ARCHITECTURE% | find "64" > nul
IF not errorlevel 1 GOTO 64bit
GOTO 32bit

REM :checkbit-jpn
REM echo %PROCESSOR_ARCHITECTURE% | find "64" > nul
REM IF not errorlevel 1 GOTO 64bit-jpn
REM GOTO 32bit-jpn

REM :checkbit-rus
REM echo %PROCESSOR_ARCHITECTURE% | find "64" > nul
REM IF not errorlevel 1 GOTO 64bit-rus
REM GOTO 32bit-rus


REM VER | find "Version 6.2." > nul 
REM IF not errorlevel 1 GOTO Win_8or2012 

:64bit
echo "Find running 64bit Windows." 
pause
echo "Install PHP 64bit version"
echo "***** Select PHP version *****"
REM echo "[5] PHP5 : Older.There is,however compatible"
echo "[7] PHP7 : Newer,faster. There is but any plugins that don't work."
echo "******************************"
set /p NUMe="Select  in the number."
REM if "%NUMe%"=="5" goto inst5-64
if "%NUMe%"=="7" goto inst7-64
REM goto error-64bit
goto inst7-64

:error-64bit
echo "Not selected. Please re-type."
goto 64bit

:32bit
echo "Find running 32bit Windows." 
pause
echo "Install PHP 32bit version" 
echo "***** Select PHP version *****"
REM echo "[5] PHP5 : Older.There is,however compatible (Sorry.Can't use PHP5.) "
echo "[7] PHP7 : Newer,faster. There is but any plugins that don't work."
echo "******************************"
set /p NUMf="Select  in the number."
REM if "%NUMf%"=="5" goto inst5-32
if "%NUMf%"=="7" goto inst7-32
REM goto error-32bit
goto inst7-32
 

:error-32bit
echo "Not selected. Please re-type."
goto 32bit
 

REM install php
:inst5-64
REM echo "Installing Visual C++ Redistributable for Visual Studio 2015.Follow the window."
REM VC2015\vc_redist.x64.exe
REM echo "Downloading PHP5"
echo "Sorry.Can't use PHP5."
goto inst7-64

:inst5-32
REM echo "Installing Visual C++ Redistributable for Visual Studio 2015.Follow the window."
REM VC2015\vc_redist.x86.exe
REM echo "Downloading PHP5"
echo "Sorry.Can't use PHP5."
goto inst7-32

:inst7-64
echo "Installing Visual C++ Redistributable for Visual Studio 2015.Follow the window."
VC2015\vc_redist.x64.exe 
echo "Downloading PHP7"
tools\wget --no-check-certificate https://dl.dropboxusercontent.com/s/kmbwdoqp8l0vfts/bin.zip
echo "Installing PHP7"
tools\7z.exe x bin.zip
echo "Delate tempfile"
del bin.zip
goto src-select

:inst7-32
echo "Installing Visual C++ Redistributable for Visual Studio 2015.Follow the window."
VC2015\vc_redist.x86.exe
echo "Downloading PHP7"
tools\wget --no-check-certificate https://dl.dropboxusercontent.com/s/whn17c76ckic7t3/bin86.zip
echo "Installing PHP7"
tools\7z.exe x bin86.zip
echo "Delate tempfile"
del bin86.zip
goto src-select

:src-select
echo "Successful PHP installation!"
echo "*************** Select src various ***************"
echo "You should check recently updated informations at src by yourself!"
echo "[1] BlueLight : Made by BlueLightJapan"
echo "[2] Caboto : Made by Caboto."
echo "[3] DualNova : Made by DualNova-Team"
echo "[4] Elywing : Made by H4PM"
echo "[5] OrionMine : Made by Takesikaityo"
echo "[6] PocketMine-MP(Default) : Made by pmmp"
echo "[7] Prismarine : Made by PrismarineMC"
echo "[8] Tesseract(recomend) : Made by TesseractTeam"
echo "[9] Other : Enter custom src url on Github."
echo "**************************************************"
set /p NUMg="Select in the number."
if "%NUMg%"=="1" goto pmmp-inst1
if "%NUMg%"=="2" goto pmmp-inst2
if "%NUMg%"=="3" goto pmmp-inst3
if "%NUMg%"=="4" goto pmmp-inst4
if "%NUMg%"=="5" goto pmmp-inst5
if "%NUMg%"=="6" goto pmmp-inst6
if "%NUMg%"=="7" goto pmmp-inst7
if "%NUMg%"=="8" goto pmmp-inst8
if "%NUMg%"=="9" goto pmmp-inst9
goto pmmp-instdef

:pmmp-instdef
echo "You select "Default"src.OK?(Y/n)"
set /p NUMh="Select in the number."
if "%NUMh%"=="y" goto pmmp-inst6
if "%NUMh%"=="Y" goto pmmp-inst6
if "%NUMh%"=="n" goto src-select
if "%NUMh%"=="N" goto src-select
goto pmmp-inst6

:pmmp-inst1
echo "Donwloading BlueLight"
tools\wget --no-check-certificate https://github.com/BlueLightJapan/BlueLight/archive/master.zip
echo "Installing PocketMine-MP"
tools\7z x master
del master
rd /s /q src
move BlueLight-master\src src
move BlueLight-master\start.cmd start.cmd
move BlueLight-master\日本語説明書.properties 日本語説明書.properties
rd /s /q BlueLight-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo rd /s /q start.cmd
>> update.bat echo tools\wget --no-check-certificate https://github.com/BlueLightJapan/BlueLight/archive/master.zip
echo echo "Updating BlueLight" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move BlueLight-master\src src
>> update.bat echo move BlueLight-master\start.cmd start.cmd
>> update.bat echo rd /s /q BlueLight-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done


:pmmp-inst2
echo "Donwloading Caboto"
tools\wget --no-check-certificate https://github.com/Caboto/Caboto/archive/master.zip
echo "Installing Caboto"
tools\7z x master
del master
rd /s /q src
move Caboto-master\src src
copy /Y tools\_start start.cmd
rd /s /q Caboto-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo tools\wget --no-check-certificate https://github.com/Caboto/Caboto/archive/master.zip
echo echo "Updating Caboto" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move Caboto\src src
>> update.bat echo rd /s /q Caboto-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done

:pmmp-inst3
echo "Donwloading DualNova"
tools\wget --no-check-certificate https://github.com/DualNova-Team/DualNova/archive/master.zip
echo "Installing DualNova"
tools\7z x master
del master
rd /s /q src
move DualNova-master\src src
move /Y DualNova-master\start.cmd start.cmd
rd /s /q DualNova-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo rd /s /q start.cmd
>> update.bat echo tools\wget --no-check-certificate https://github.com/DualNova-Team/DualNova/archive/master.zip
echo echo "Updating DualNova" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move DualNova-master\src src
>> update.bat echo move DualNova-master\start.cmd start.cmd
>> update.bat echo rd /s /q DualNova-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done

:pmmp-inst4

echo "Donwloading Elywing"
tools\wget --no-check-certificate https://github.com/H4PM/Elywing/archive/master.zip
echo "Installing Elywing"
tools\7z x master
del master
rd /s /q src
move Elywing-master\src src
move /Y Elywing-master\start.cmd start.cmd
rd /s /q Elywing-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo rd /s /q start.cmd
>> update.bat echo tools\wget --no-check-certificate https://github.com/H4PM/Elywing/archive/master.zip
echo echo "Updating Elywing" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move Elywing-master\src src
>> update.bat echo move Elywing-master\start.cmd start.cmd
>> update.bat echo rd /s /q Elywing-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done

:pmmp-inst5
echo "Donwloading OrionMine"
tools\wget --no-check-certificate https://github.com/Takesikaityo/OrionMine/archive/master.zip
echo "Installing OrionMine"
tools\7z x master
del master
rd /s /q src
move OrionMine-master\src src
copy /Y tools\_start start.cmd
rd /s /q OrionMine-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo tools\wget --no-check-certificate https://github.com/Takesikaityo/OrionMine/archive/master.zip
echo echo "Updating OrionMine" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move OrionMine-master\src src
>> update.bat echo rd /s /q OrionMine-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done


:pmmp-inst6
echo "Donwloading PocketMine-MP"
tools\wget --no-check-certificate https://github.com/pmmp/PocketMine-MP/archive/master.zip
echo "Installing PocketMine-MP"
tools\7z x master
del master
rd /s /q src
move PocketMine-MP-master\src src
move /Y PocketMine-MP-master\start.cmd start.cmd
rd /s /q PocketMine-MP-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo rd /s /q start.cmd
>> update.bat echo tools\wget --no-check-certificate https://github.com/pmmp/PocketMine-MP/archive/master.zip
echo echo "Updating PocketMine-MP" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move PocketMine-MP-master\src src
>> update.bat echo move PocketMine-MP-master\start.cmd start.cmd
>> update.bat echo rd /s /q PocketMine-MP-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done

:pmmp-inst7
echo "Donwloading Prismarine"
tools\wget --no-check-certificate https://github.com/PrismarineMC/Prismarine/archive/master.zip
echo "Installing Prismarine"
tools\7z x master
del master
rd /s /q src
move Prismarine-master\src src
move /Y Prismarine-master\start.cmd start.cmd
move /Y Prismarine-master\loop.cmd loop.cmd
rd /s /q Prismarine-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo rd /s /q start.cmd
>> update.bat echo rd /s /q loop.cmd
>> update.bat echo tools\wget --no-check-certificate https://github.com/PrismarineMC/Prismarine/archive/master.zip
echo echo "Updating Prismarine" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move Prismarine-master\src src
>> update.bat echo move Prismarine-master\start.cmd start.cmd
>> update.bat echo move /Y Prismarine-master\loop.cmd loop.cmd
>> update.bat echo rd /s /q Prismarine-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done

:pmmp-inst8

echo "Donwloading Tesseract"
tools\wget --no-check-certificate https://github.com/TesseractTeam/Tesseract/archive/master.zip
echo "Installing Tesseract"
tools\7z x master
del master
rd /s /q src
move Tesseract-master\src src
move /Y Tesseract-master\start.cmd start.cmd
rd /s /q Tesseract-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo rd /s /q start.cmd
>> update.bat echo tools\wget --no-check-certificate https://github.com/TesseractTeam/Tesseract/archive/master.zip
echo echo "Updating Tesseract" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move Tesseract-master\src src
>> update.bat echo move Tesseract-master\start.cmd start.cmd
>> update.bat echo rd /s /q Tesseract-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done

:pmmp-inst9
rem Reset
set USR_INPUT_URL=
rem 入力要求
set /P USR_INPUT_URL="Please input Github page url: "
echo "%USR_INPUT_URL% OK?"
set /p NUMj="Do you want to Continue?(Y/n)"
if "%NUMj%"=="y" goto pmmp-inst9-srcname
if "%NUMj%"=="Y" goto pmmp-inst9-srcname
if "%NUMj%"=="n" goto pmmp-inst9
if "%NUMj%"=="n" goto pmmp-inst9
goto pmmp-inst9-srcname

:pmmp-inst9-srcname
rem Reset
set USR_INPUT_NAME=
rem 入力要求
set /P USR_INPUT_NAME="Please input Github src name: "
echo %USR_INPUT_URL% | find "%USR_INPUT_NAME%" >NUL
if not ERRORLEVEL 1 goto pmmp-inst9-srcname-v
echo "Mismatch url and src name!Retype,please."
goto pmmp-inst9
:pmmp-inst9-srcname-v
echo "%USR_INPUT_NAME% OK?"
set /p NUMk="Do you want to Continue?(Y/n)"
if "%NUMk%"=="y" goto pmmp-inst9-branch
if "%NUMk%"=="Y" goto pmmp-inst9-branch
if "%NUMk%"=="n" goto pmmp-inst9-srcname
if "%NUMk%"=="n" goto pmmp-inst9-srcname
goto pmmp-inst9-branch

:pmmp-inst9-branch
rem set master
set USR_INPUT_BRANCH=master
rem 入力要求
set /P USR_INPUT_BRANCH="Please input Github src name(default:master): "
echo "%USR_INPUT_BRANCH% OK?"
set /p NUMl="Do you want to Continue?(Y/n)"
if "%NUMl%"=="y" goto pmmp-inst9-inst
if "%NUMl%"=="Y" goto pmmp-inst9-inst
if "%NUMl%"=="n" goto pmmp-inst9-srcname
if "%NUMl%"=="n" goto pmmp-inst9-srcname
goto pmmp-inst9-inst

:pmmp-inst9-inst
echo "Donwloading %USR_INPUT_NAME%"
tools\wget --no-check-certificate %USR_INPUT_URL%/archive/%USR_INPUT_BRANCH%.zip
echo "Installing %USR_INPUT_NAME%"
tools\7z x master
del master
rd /s /q src
move %USR_INPUT_NAME%-master\src src
if exist %USR_INPUT_NAME%-master\start.cmd (
	move /Y %USR_INPUT_NAME%-master\start.cmd start.cmd
) else (
	if exist tools\_start (
		copy /Y tools\_start start.cmd
	) else (
		echo "Installer was Broken!Please re-download & Unzip!"
		pause
		exit 1
	)
) 
rd /s /q %USR_INPUT_NAME%-master
echo @echo off > update.bat
>> update.bat echo rd /s /q src
>> update.bat echo rd /s /q start.cmd
>> update.bat echo tools\wget --no-check-certificate %USR_INPUT_URL%/archive/%USR_INPUT_BRANCH%.zip
>> update.bat echo echo "Updating %USR_INPUT_NAME%" >> update.bat 
>> update.bat echo tools\7z x master 
>> update.bat echo del master
>> update.bat echo move %USR_INPUT_NAME%-master\src src
>> update.bat echo if exist %USR_INPUT_NAME%-master\start.cmd (
>> update.bat echo 	move /Y %USR_INPUT_NAME%-master\start.cmd start.cmd
>> update.bat echo ) else (
>> update.bat echo 	if exist tools\_start (
>> update.bat echo 		copy /Y tools\_start start.cmd
>> update.bat echo 	) else (
>> update.bat echo 		echo "Installer was Broken!Please re-download & Unzip!"
>> update.bat echo 		pause
>> update.bat echo 		exit 1
>> update.bat echo 	)
>> update.bat echo ) 
>> update.bat echo rd /s /q %USR_INPUT_NAME%-master
>> update.bat echo echo "Update complate!"
>> update.bat echo pause
goto done
:done
echo "All Done! Enjoy your Minecraft PE Server!"

set /p NUMi="Do you want to start your server?/サーバーを起動しますか?(Y/n)"
if "%NUMi%"=="y" goto start
if "%NUMi%"=="Y" goto start
if "%NUMi%"=="n" goto end
if "%NUMi%"=="" goto start
goto start
:start
start start.cmd
goto end
:end
echo Thanks you use this installer! Have a nice day!
pause
exit
