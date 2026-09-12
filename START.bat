@echo off
setlocal
cd /d "%~dp0"

set "PROFILE=%TEMP%\GreenScape_Autoplay_Profile"
set "PAGE=%CD:\=/%"
set "URL=file:///%PAGE%/index.html"

set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME%" goto launch

set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME%" goto launch

set "CHROME=%LocalAppData%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME%" goto launch

echo Google Chrome not found.
echo Opening normally. Browser autoplay restrictions may apply.
start "" "%URL%"
exit /b

:launch
start "" "%CHROME%" ^
  --user-data-dir="%PROFILE%" ^
  --autoplay-policy=no-user-gesture-required ^
  --no-first-run ^
  --no-default-browser-check ^
  --new-window ^
  "%URL%"
exit /b
