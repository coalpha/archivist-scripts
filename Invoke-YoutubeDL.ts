export type opts = {
   // video selection
   playlist_start?: number;
   playlist_end?: number;
   playlist_items?: string;
   max_downloads?: number;
   min_filesize?: string;
   max_filesize?: string;
   on_date?: string;
   date_before?: string;
   date_after?: string;
   archive_log?: string;

   concurrent_fragments?: number;
   limit_rate?: string;

   playlist_reverse?: boolean;
   retries?: number;
   batch_file?: string;
   output?: string;
   no_continue?: boolean;
   sleep_requests?: number;
   min_sleep_interval?: number;
   max_sleep_interval?: number;
   sleep_subtitles?: number;
   format?: string;
   sub_format?: string;
   log_file?: string;
   urls?: string[];
};
