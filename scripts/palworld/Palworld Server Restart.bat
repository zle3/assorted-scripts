@echo off
echo Saving Palworld Server... && C:\ARRCON\ARRCON.exe -H 127.0.0.1 -P 25575 -p akutancute3 "save"
echo Palworld server Saved...
timeout 5
echo  Shutting Down Palworld Server... && C:\ARRCON\ARRCON.exe -H 127.0.0.1 -P 25575 -p akutancute3 "shutdown 60 The_server_will_be_restarting_in_60_seconds"
timeout 30
echo Sending Restart Update Message... && C:\ARRCON\ARRCON.exe -H 127.0.0.1 -P 25575 -p akutancute3 "broadcast The_server_will_be_restarting_in_30_seconds"
timeout 20
echo Sending Restart Update Message... && C:\ARRCON\ARRCON.exe -H 127.0.0.1 -P 25575 -p akutancute3 "broadcast The_server_will_be_restarting_in_10_seconds"
timeout 20
echo Palworld Server Was Shutdown. Ending residual processes...
set task1=PalServer-Win64-Test-Cmd
call "C:\ARRCON\Palworld Server Backup World.bat"
tasklist | find /i "%task1%" > nul
if errorlevel 1 (
    echo Task %task1% is not running. Starting Server...
) else (
    echo Task %task1% is running. Ending the process...
    taskkill /f /im PalServer-Win64-Test-Cmd.exe
    timeout 5
    taskkill /f /im PalServer-Win64-Test-Cmd.exe
    timeout 5
    echo Process ended. Starting the Server...
)
timeout 5
call "C:\steamcmd\start.bat"
echo Palworld Server Started.
echo Exiting in 5 seconds...
timeout 5
exit
