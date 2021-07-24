. $PSScriptRoot\..\Invoke-YoutubeDL.ps1

$opts = @{
   batch_file = "playlist.txt"
   sys_dl_log = "playlist_sys.log"
   usr_dl_log = "playlist_usr.log"
   output     = "%(playlist_title)s/%(playlist_index)s_%(uploader)s_%(title)s.%(ext)s"
}

Invoke-YoutubeDL $opts
