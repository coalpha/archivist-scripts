. $PSScriptRoot\..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "random.txt"

   sys_dl_log = "random_sys.log"
   usr_dl_log = "random_usr.log"
   output     = "archives/%(upload_date)s_%(uploader)s_%(title)s_%(id)s.%(ext)s"
}

Invoke-YoutubeDL $opts
