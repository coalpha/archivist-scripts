. ..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "channels.txt"
   output = "%(uploader)s/%(upload_date)s_%(uploader)s_%(title)s.%(ext)s"
   download_archive = "channels_archive.txt"
   download_log = "channels_log.txt"
}

Invoke-YoutubeDL $opts
