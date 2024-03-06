@echo off
echo Searching for the latest update!
call "C:\ARRCON\Palworld Server Check Update.bat"

echo Launching server
cd "C:\steamcmd\steamapps\common\PalServer"
start PalServer.exe -ServerName="Fan Club Club - kotone.dev" -port=8211 -players=32 -log -nosteam -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS EpicApp=PalServer -publicip=PUBLICIPHERE -publicport=8211