reencode a file to av1 + opus `ffmpeg -i "file name.mp4" -c:a libopus -c:v libsvtav1 -preset 10 -crf 35 -threads 8 "output av1 opus.mp4"`
check file properties - `ffmpeg -i`
download .m3u8 `ffmpeg -i https://m3u8_LINK_HERE.local -c copy rename.mkv`
reencode to audio only `ffmpeg -i "FILE_IN_DIRECTORY_HERE" -vn -c:a libopus -b:a 128k -threads 16 "output.opus"`