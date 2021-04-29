. $PSScriptRoot\..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "channels.txt"
   output = "%(uploader)s/%(upload_date)s_%(uploader)s_%(title)s.%(ext)s"
   sys_dl_log = "channels_sys.log"
   usr_dl_log = "channels_usr.log"
}

Invoke-YoutubeDL $opts
