@echo off

echo.
echo.
echo This script will install and configure
echo.
echo  - Google Chrome
echo  - Powerline-patched Meslo font
echo  - PuTTY
echo.
echo This script is meant to be run on a fresh user profile (as would be
echo the usual case when on a public computer).
echo.
echo If you already have these applications/resources on your system, it
echo is possible that your settings may be overwritten.
echo.
echo ANYTHING IN THE dl OR apps DIRECTORY WILL BE DELETED.
echo.
echo To cancel installation, press CTRL-C
echo.
pause

rmdir /s /q dl
mkdir dl

rmdir /s /q apps
mkdir apps

echo.
echo.
echo Downloading resources...
echo.
echo.

echo.
echo.
echo Fetching Powerline-patched Meslo font...
echo.
echo.

dep\wget\wget.exe --no-check-certificate -O dl\Meslo-LG-M-Regular-for-Powerline.otf "https://raw.githubusercontent.com/powerline/fonts/master/Meslo/Meslo%%20LG%%20M%%20Regular%%20for%%20Powerline.otf"

echo.
echo.
echo Fetching PuTTY...
echo.
echo.

dep\wget\wget.exe --no-check-certificate -O dl\putty.zip "http://the.earth.li/~sgtatham/putty/latest/x86/putty.zip"

echo.
echo.
echo Fetching Google Chrome...
echo.
echo.

dep\wget\wget.exe --no-check-certificate -O dl\ChromeStandaloneSetup.exe "https://dl.google.com/tag/s/appguid={8A69D345-D564-463C-AFF1-A69D9E530F96}&iid={5475D0B9-5AB6-BC63-F76A-06FC1C96AF15}&lang=en&browser=2&usagestats=0&appname=Google%%20Chrome&needsadmin=false&installdataindex=defaultbrowser/update2/installers/ChromeStandaloneSetup.exe"

echo.
echo.
echo Unpacking...
echo.
echo.

echo.
echo.
echo Unpacking PuTTY...
echo.
echo.

dep\7z\7za.exe e -aoa -oapps\PuTTY dl\putty.zip

echo.
echo.
echo Installing...
echo.
echo.

echo.
echo.
echo Registering Powerline-patched Meslo font...
echo.
echo.

dep\RegisterFont\RegisterFont.exe add "dl\Meslo-LG-M-Regular-for-Powerline.otf"

echo.
echo.
echo Starting Google Chrome Installer...
echo.
echo.

start "Installing Chrome..." /D dl /WAIT ChromeStandaloneSetup.exe /silent /install

echo.
echo.
echo Configuring...
echo.
echo.

echo.
echo.
echo Configuring PuTTY...
echo.
echo.

powershell -ExecutionPolicy ByPass -File conf\putty.ps1

echo.
echo.
echo You're all set.
echo.
echo You'll find PuTTY in the newly-created apps folder.
echo.
echo Have fun!
echo.
echo.
pause
echo.