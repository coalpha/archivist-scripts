// this migration tool works entirely with relative paths.
// don't do weird things
const fs = require("fs-extra");

const get_info_json_rec = dir =>
   fs.readdirSync(dir, {withFileTypes: true})
      .map(dirent =>
         dirent.isDirectory()
         ? get_info_json_rec(`${dir}/${dirent.name}`)
         : dirent.name.endsWith(".info.json")
            ? [`${dir}/${dirent.name}`]
            : [])
      .flat();

const {spawnSync} = require("child_process");

const new_format = require("./clips").format;

const sanitize = require("sanitize-filename");

function sanitize_obj(obj) {
   const new_obj = Object.create(null);
   for (const key of Object.keys(obj)) {
      if (typeof obj[key] === "string") {
         new_obj[key] = sanitize(obj[key], {replacement: "_"});
      } else {
         new_obj[key] = obj[key];
      }
   }
   return new_obj;
}

const pyformat = obj =>
   spawnSync(
      "python",
      [`${__dirname}/format.py`, new_format, JSON.stringify(sanitize_obj(obj))],
      {encoding: "utf8"}
   ).stdout


const {dirname, basename, join} = require("path");

class MoveInstruction {
   constructor(from, to) {
      this.from = from;
      this.to   = to;
   }
}

class Download {
   constructor(info_json_path) {
      this.info_json_path = info_json_path;
      this.info_json = JSON.parse(fs.readFileSync(info_json_path, "utf8"));
      this.dirname = dirname(info_json_path);
      this.base = basename(info_json_path.slice(0, -"info.json".length));
      this.associated_files =
         fs.readdirSync(this.dirname)
            .filter(dirent => dirent.startsWith(this.base))
      this.moves =
         this.associated_files
            .map(file =>
               new MoveInstruction(
                  `${this.dirname}/${file}`,
                  pyformat({...this.info_json, ext: file.replace(this.base, "")})))
   }
}

for (const info_json of get_info_json_rec(".")) {
   const dl = new Download(info_json);
   for (const mi of dl.moves) {
      if (join(mi.from) !== join(mi.to)) {
         try {
            fs.moveSync(mi.from, mi.to, {overwrite: false});
            console.log(`MOV ${mi.from}\n-> ${mi.to}`);
         } catch (e) {
            console.log(`BAD ${mi.from}`);
         }
      }
   }
}
