/** @typedef {import("../Invoke-YoutubeDL").opts} opts */

const channels =
   [ "5uppp"
   , "stevesuptic"
   , "plushys"
   ]
;

const get_clips = channel => {
   const base = `https://www.twitch.tv/${channel}/clips?filter=clips&range`;
   return ({
      $all_time: `${base}=all`,
      $30_days:  `${base}=30d`,
      $7_days:   `${base}=7d` ,
   });
}

const select = key => obj => obj[key];

const output =
   "clips/%(creator)s/%(upload_date)s_%(title)s_%(id)s.%(ext)s"
exports.output = output;

/** @type {opts} */
const $all_time = {
   output,
   playlist_end: 100,
   usr_dl_log: "$all_time.log",
   sys_dl_log: "clips_sys.log",
   urls: channels.map(get_clips).map(select("$all_time")),
};

/** @type {opts} */
const $30_days = {
   output,
   playlist_end: 30,
   usr_dl_log: "$30_days.log",
   sys_dl_log: "clips_sys.log",
   urls: channels.map(get_clips).map(select("$30_days")),
};

/** @type {opts} */
const $7_days = {
   output,
   min_views: 500,
   playlist_end: 10,
   usr_dl_log: "$7_days.log",
   sys_dl_log: "clips_sys.log",
   urls: channels.map(get_clips).map(select("$7_days")),
};

exports.clip_configs = [$all_time, $30_days, $7_days];
