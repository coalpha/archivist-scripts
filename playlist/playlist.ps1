. ..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "playlist.txt"
   output = "%(playlist_title)s/%(playlist_index)s_%(uploader)s_%(title)s.%(ext)s"
   download_archive = "playlist_archive.txt"
   download_log = "playlist_log.txt"
}

Invoke-YoutubeDL $opts
