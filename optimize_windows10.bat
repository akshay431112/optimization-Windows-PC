@echo off
echo ===============================
echo   Windows 10 Performance Tuner
echo ===============================
echo.

:: Clear temp files
echo Clearing temporary files...
del /s /q %TEMP%\*
del /s /q C:\Windows\Temp\*
echo Temp files deleted.

:: Clear prefetch files (safe)
echo Clearing prefetch files...
del /s /q C:\Windows\Prefetch\*
echo Prefetch cleared.

:: Flush DNS cache
echo Flushing DNS cache...
ipconfig /flushdns

:: Run Disk Cleanup silently
echo Running Disk Cleanup...
cleanmgr /sagerun:1

:: Check disk errors on C: (read-only scan)
echo Checking disk for errors...
chkdsk C: /f /scan

:: Optimize drive (SSD aware)
echo Optimizing C: drive...
defrag C: /O

echo.
echo ===============================
echo   Optimization Completed!
echo ===============================
pause
