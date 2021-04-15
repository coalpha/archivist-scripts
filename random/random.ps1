. ..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "random.txt"
   
   log_file   = "random_log.txt"
   output     = "archives/%(upload_date)s_%(uploader)s_%(title)s_%(id)s.%(ext)s"
}

Invoke-YoutubeDL $opts
