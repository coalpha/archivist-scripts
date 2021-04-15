function Invoke-YoutubeDL {
   param ([hashtable] $opts)

   $argv = @()

   # general options
   $argv += "--ignore-errors"

   # network options
   $argv += "--force-ipv4"

   # video selection
   if ($opts.ContainsKey("playlist_start")) {
      $argv += "--playlist-start", $opts.playlist_start
   }

   if ($opts.ContainsKey("playlist_end")) {
      $argv += "--playlist-end", $opts.playlist_end
   }

   if ($opts.ContainsKey("max_downloads")) {
      $argv += "--max-downloads", $opts.max_downloads
   }

   if ($opts.ContainsKey("min_filesize")) {
      $argv += "--min-filesize", $opts.min_filesize
   }

   if ($opts.ContainsKey("max_filesize")) {
      $argv += "--max-filesize", $opts.max_filesize
   }

   if ($opts.ContainsKey("on_date")) {
      $argv += "--date", $opts.on_date
   }

   if ($opts.ContainsKey("date_before")) {
      $argv += "--datebefore", $opts.date_before
   }

   if ($opts.ContainsKey("date_after")) {
      $argv += "--dateafter", $opts.date_after
   }

   if ($opts.ContainsKey("min_views")) {
      $argv += "--min-views", $opts.min_views
   }

   if ($opts.ContainsKey("max_views")) {
      $argv += "--max-views", $opts.max_views
   }

   $argv += @(
      "--download-archive", $($opts.download_archive ?? "download_archive.txt")
      # we're not gonna download livestreams
      "--match-filter", $($opts.match_filter ?? "!is_live & !live")
   )

   # download options
   if ($opts.ContainsKey("concurrent_fragments")) {
      argv += "--concurrent-fragments", $opts.concurrent_fragments
   }

   if ($opts.ContainsKey("limit_rate")) {
      $argv += "--limit-rate", $($opts.limit_rate)
   }

   if ($opts.ContainsKey("retries")) {
      $argv += "--retries $($opts.retries)"
   }

   if ($opts.playlist_reverse) {
      $argv += "--playlist-reverse"
   }

   # filesystem options
   if ($opts.ContainsKey("batch_file")) {
      $argv += "--batch-file", $($opts.batch_file)
   }

   $default_output = "archives/%(upload_date)s_%(uploader)s_%(title)s_%(id)s.%(ext)s"

   $argv += @(
      "--output", $($opts.output ?? $default_output)
      "--no-overwrites"
   )

   if ($opts.no_continue) {
      $argv += "--no-continue"
   }

   $argv += @(
      "--mtime"
      "--write-description"
      "--write-info-json"
      "--write-annotations"
      "--write-playlist-metafiles"
   )

   # thumbnail images
   $argv += @(
      "--write-thumbnail"
      "--write-all-thumbnails"
   )

   # internet shortcut options
   $argv += "--write-desktop-link"

   # verbosity and simulation options
   $argv += "--verbose"

   # workarounds
   if ($opts.ContainsKey("sleep_requests")) {
      argv += "--sleep-requests", $opts.sleep_requests
   }

   $argv += @(
      "--min-sleep-interval", $($opts.min_sleep_interval ?? 05)
      "--max-sleep-interval", $($opts.max_sleep_interval ?? 30)
      "--sleep-subtitles"   , $($opts.sleep_subtitles    ?? 01)
   )

   # video format options
   $argv += "--merge-output-format", $($opts.format ?? "mkv")

   # subtitle options
   $argv += @(
      "--write-subs"
      "--no-write-auto-subs"
      "--all-subs"
      "--sub-format", $($opts.sub_format ?? "best")
   )

   # authentication options
   if ($opts.ContainsKey("auth")) {
      $argv += @(
         "--username", $opts.auth.username
         "--password", $opts.auth.password
      )
   }

   # post processing options
   $argv += @(
      "--embed-subs"
      "--embed-thumbnail"
      "--add-metadata"
      "--exec", "pwsh $PSScriptRoot\Write-DownloadLog.ps1 $($opts.download_log ?? "download_log.txt") {}"
   )

   if ($opts.ContainsKey("urls")) {
      if ($opts.urls -is [array]) {
         $argv += $opts.urls
      } else {
         throw "opts.urls must be a string array!"
      }
   }

   yt-dlp $argv
}
