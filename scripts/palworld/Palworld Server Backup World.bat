@echo off
set SOURCE_DIR="C:\steamcmd\steamapps\common\PalServer\Pal\Saved\SaveGames\0"
set BACKUP_DIR="C:\ARRCON\backup"
set DATE=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

"C:\Program Files\7-Zip\7z.exe" a -tzip "%BACKUP_DIR%\backup_%DATE%.zip" %SOURCE_DIR%

echo Backup of %SOURCE_DIR% completed at %BACKUP_DIR%\backup_%DATE%.zip