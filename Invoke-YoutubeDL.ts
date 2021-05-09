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
   min_views?: number;
   max_views?: number;
   match_filter?: string;
   sys_dl_log?: string;

   // download options
   concurrent_fragments?: number;
   limit_rate?: string;
   retries?: number;
   playlist_reverse?: boolean;

   // filesystem options
   batch_file?: string;
   /** output format, not to be confused with `format` */
   output?: string;
   no_continue?: boolean;

   // workarounds
   sleep_requests?: number;
   min_sleep_interval?: number;
   max_sleep_interval?: number;
   sleep_subtitles?: number;

   // video format options
   format?: string;

   // subtitle options
   sub_format?: string;

   // authentication options
   auth?: {
      username: string;
      password: string;
   };

   // post processing options
   /** Only meant for the user to see when things were downloaded */
   usr_dl_log?: string;

   // non options
   urls?: string[];
};
