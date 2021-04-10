. ..\Get-Command.ps1

$opts = @{
   batch_file = "random.txt"
   output = "archives/%(upload_date)s_%(uploader)s_%(title)s_%(id)s.%(ext)s"
   archive_log = "random_archive_log.txt"
   log_file = "random_log.txt"
}

yt-dlp $(Get-Command $opts)
