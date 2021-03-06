@echo off
color 0A
title Discord Privacy
set /a x=0

echo Copying...
xcopy %USERPROFILE%\AppData\Roaming\discord\Cache %cd%\img /Y /Q /I
echo Done copying!

echo Making structure...
dir img\* /b > results.txt
echo Structure done!

echo Converting images...
for /F "delims=" %%i in (results.txt) do (  
  set Z=%%i
  call :process
)
goto done

:done
echo Done, made by bilbodog!
pause
exit

:process
set /a x+=1
for /f "tokens=1,2 delims=^^" %%a in ("%Z%") do (
  echo [%x%] %Z% -^> %Z%.png
  ren img\%Z% %Z%.png
)
goto :EOF

:EOF