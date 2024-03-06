download multiple youtube links - `yt-dlp -a links.txt --paths "PATH_TO_OUTPUT" -f ba -x --audio-format mp3`
geo bypass `yt-dlp -f bestaudio --extract-audio --audio-quality 0 --embed-thumbnail --add-metadata --output "%(title)s.%(ext)s" --geo-bypass-country "JP" "https://www.youtube.com/@ZachLe"`
