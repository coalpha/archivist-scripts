. ..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "channels.txt"
   limit_rate = "2M"
   output = "%(uploader)s/%(upload_date)s_%(uploader)s_%(title)s.%(ext)s"
   archive_log = "channels_archive_log.txt"
   log_file = "channels_log.txt"
}

New-Download $opts
