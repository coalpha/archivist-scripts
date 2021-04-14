/** @typedef {import("../../Invoke-YoutubeDL").opts} opts */

const channels = [
   "5uppp",
   "stevesuptic",
   "plushys",
   "dakotaz",
   "dumbdog",
   "hafu",
];

const twitch = "https://www.twitch.tv";

const get_clips = channel => {
   const base = `https://www.twitch.tv/${channel}/clips?filter=clips&range`;
   return ({
      $all_time: `${base}=all`,
      $30_days:  `${base}=30d`,
      $7_days:   `${base}=7d`,
   });
}

const select = key => obj => obj[key];

/** @type {opts} */
const $all_time = {
   playlist_end: 30,
   urls: channels.map(get_clips).map(select("$all_time")),
};

const $30_days = {
   playlist_end: 20,
   urls: channels.map(get_clips).map(select("$30_days")),
};

const $7_days = {
   playlist_end: 7,
   urls: channels.map(get_clips).map(select("$7_days")),
};

module.exports = [$all_time, $30_days, $7_days];
