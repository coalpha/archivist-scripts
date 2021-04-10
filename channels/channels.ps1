. ..\Get-Command.ps1

$opts = @{
   batch_file = "channels.txt"
   output = "%(uploader)s/%(upload_date)s_%(uploader)s_%(title)s.%(ext)s"
   archive_log = "channels_archive_log.txt"
   log_file = "channels_log.txt"
}

yt-dlp $(Get-Command $opts)
