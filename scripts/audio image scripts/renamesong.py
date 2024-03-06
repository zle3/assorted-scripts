import os
import subprocess

folder_path = r'FILE_PATH_HERE'  # Replace this with your folder path

# Iterate through files in the folder
for filename in os.listdir(folder_path):
    if filename.endswith(".mp3") or filename.endswith(".opus"):
        # Extract the file name without extension
        file_name_without_extension = os.path.splitext(filename)[0]

        # Update the song title metadata using FFmpeg
        full_path = os.path.join(folder_path, filename)
        subprocess.run([
            "ffmpeg",
            "-i", full_path,
            "-metadata", f"title={file_name_without_extension}",
            "-codec", "copy",
            os.path.join(folder_path, "temp_file.mp3")  # Output to a temporary file
        ])

        # Remove the original file
        os.remove(full_path)

        # Rename the temporary file to the original file name
        os.rename(os.path.join(folder_path, "temp_file.mp3"), full_path)
