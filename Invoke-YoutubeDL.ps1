function Invoke-YoutubeDL {
   param ([hashtable] $opts)

   $argv = @()

   # general options
   $argv += "--ignore-errors"

   # network options
   $argv += "--force-ipv4"

   # video selection
   $argv += @(
      "--download-archive", $($opts.archive_log ?? "archive.log")
      # we're not gonna download livestreams
      "--match-filter", "!is_live & !live"
   )

   # download options
   $argv += "--concurrent-fragments", $($opts.concurrent_fragments ?? 1)

   if ($opts.ContainsKey("limit_rate")) {
      $argv += @("--limit-rate", $($opts.limit_rate))
   }

   if ($opts.playlist_reverse) {
      $argv += "--playlist-reverse"
   }

   if ($opts.ContainsKey("retries")) {
      $argv += "--retries $($opts.retries)"
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
   $argv += @(
      "--sleep-requests", $($opts.sleep_requests ?? 0)
      "--min-sleep-interval", $($opts.min_sleep_interval ?? 5)
      "--max-sleep-interval", $($opts.max_sleep_interval ?? 30)
      "--sleep-subtitles", $($opts.sleep_subtitles ?? 1)
   )

   # video format options
   $argv += @(
      "--merge-output-format", $($opts.format ?? "mkv")
   )

   # subtitle options
   $argv += @(
      "--write-subs"
      "--no-write-auto-subs"
      "--all-subs"
      "--sub-format", $($opts.sub_format ?? "best")
   )

   $argv += @(
      "--embed-subs"
      "--embed-thumbnail"
      "--add-metadata"
      "--exec", "pwsh $PSScriptRoot\Write-PostLog.ps1 $($opts.log_file ?? "log.txt") {}"
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
