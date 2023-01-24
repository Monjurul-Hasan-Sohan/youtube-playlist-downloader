# YouTube Playlist Downloader
This is a bash script that can be used to download a YouTube playlist in mp3 format, add cover photos to the songs, and organize them into folders according to the singer's name.

## Usage
1. Install youtube-dl and ffmpeg by running the following command:
```bash
sudo apt-get install youtube-dl ffmpeg
```
Download the script by clicking on "Download" or clone the repository by running the following command:

```bash
git clone https://github.com/Monjurul-Hasan-Sohan/youtube-playlist-downloader.git
```
Make the script executable by running the following command:

```bash
chmod +x youtube-playlist-downloader.sh
```

Run the script by providing the YouTube playlist URL as an argument:

```bash
./youtube-playlist-downloader.sh https://www.youtube.com/playlist?list=PL_ID
```

**Note: Replace the PL_ID with the id of the youtube playlist you want to download.

## Dependencies

1. youtube-dl
2. ffmpeg
3. wget
