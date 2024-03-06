@echo off
set SOURCE_DIR="FOLDER_YOU_WANT_TO_BACKUP"
set BACKUP_DIR="BACKUP_DIRECTORY"
set DATE=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

"C:\Program Files\7-Zip\7z.exe" a -tzip "%BACKUP_DIR%\backup_%DATE%.zip" %SOURCE_DIR%

echo Backup of %SOURCE_DIR% completed at %BACKUP_DIR%\backup_%DATE%.zip