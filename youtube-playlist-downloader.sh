#!/bin/bash

# install youtube-dl and ffmpeg
sudo apt-get install youtube-dl ffmpeg

# download the YouTube playlist in .mp3 format
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PL_ID

# loop through all the files in the current directory
for file in *; do
  # get the artist name and song title from the file name
  artist=$(echo $file | cut -d '-' -f1)
  title=$(echo $file | cut -d '-' -f2 | cut -d '.' -f1)
  # create a folder for the artist
  mkdir -p "$artist"
  # move the file to the artist's folder
  mv "$file" "$artist/$file"
  # Download the cover image
  wget -O cover.jpg "https://coverartarchive.org/release/$(ffprobe -v quiet -show_format "$file" | grep 'musicbrainz_albumid' | awk -F '=' '{print $2}' )/front"
  # Add cover image to mp3 file
  ffmpeg -i "$artist/$file" -i cover.jpg -map 0:0 -map 1:0 -c copy -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" "$artist/$file"
  # Remove cover.jpg
  rm cover.jpg
done
