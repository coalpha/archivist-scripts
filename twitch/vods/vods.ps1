. ..\..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "vods.txt"
   playlist_reverse = $true
   output = "%(uploader)s/%(upload_date)s_%(uploader)s_%(title)s.%(ext)s"
   archive_log = "vods_archive_log.txt"
   log_file = "vods_log.txt"
}

Invoke-YoutubeDL $opts
