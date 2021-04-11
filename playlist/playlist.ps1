. ..\New-Download.ps1

$opts = @{
   batch_file = "playlist.txt"
   output = "%(playlist_title)s/%(playlist_index)s_%(uploader)s_%(title)s.%(ext)s"
   archive_log = "playlist_archive_log.txt"
   log_file = "playlist_log.txt"
}

New-Download $opts
