function Receive-NodeExports {
   param ([string] $js_file)

   node -e "process.stdout.write(JSON.stringify(require('./$js_file')))"
   | ConvertFrom-Json -AsHashTable
}
