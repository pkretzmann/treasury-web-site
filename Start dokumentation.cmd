@echo off
setlocal
rem ── Starter dokumentations-sitet lokalt og aabner det i browseren ──
rem Dobbeltklik denne fil. Luk vinduet for at stoppe serveren igen.
cd /d "%~dp0"
set "PORT=8769"
set "URL=http://localhost:%PORT%/da-DK/"

rem ── Find Python (py-launcher foretraekkes, ellers python) ──
set "PY="
where py >nul 2>nul && set "PY=py"
if not defined PY (where python >nul 2>nul && set "PY=python")
if not defined PY (
  echo.
  echo  Python blev ikke fundet paa denne maskine.
  echo  Installer Python fra https://www.python.org/downloads/
  echo  ^(husk flueben i "Add Python to PATH" under installationen^)
  echo.
  pause
  exit /b 1
)

echo.
echo  Starter dokumentationen paa %URL% ...
echo  Luk dette vindue for at stoppe serveren.
echo.

rem ── Aabn browseren automatisk, lige efter serveren er klar ──
start "" /min cmd /c "timeout /t 1 >nul & start "" %URL%"

rem ── Start den lokale webserver (blokerer indtil vinduet lukkes) ──
rem    serve.py serverer uden browser-cache, saa du altid ser den nyeste side.
%PY% "%~dp0serve.py" %PORT%

endlocal
