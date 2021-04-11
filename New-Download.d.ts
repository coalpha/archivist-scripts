type opts = {
   archive_log?: string;
   concurrent_fragments?: number;
   limit_rate?: string;
   playlist_reverse?: boolean;
   retries?: number;
   batch_file: string;
   output?: string;
   no_continue?: boolean;
   sleep_requests?: number;
   min_sleep_interval?: number;
   max_sleep_interval?: number;
   sleep_subtitles?: number;
   format?: string;
   sub_format?: string;
   log_file?: string;
};

declare function New_Download(opts: opts): void;

declare const exports: {["New-Download"]: typeof New_Download};

export = exports;
