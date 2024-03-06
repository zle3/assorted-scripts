import os
from mutagen.oggopus import OggOpus

directory = r'FILE_PATH_HERE'

for filename in os.listdir(directory):
    if filename.endswith('.opus'):
        filepath = os.path.join(directory, filename)
        
        audio = OggOpus(filepath)
        audio['artist'] = 'Minato Aqua'
        audio.save()
