function Receive-NodeClipConfigs {
   param ([string] $js_file)

   node -e "process.stdout.write(JSON.stringify(require('./$js_file').clip_configs))"
   | ConvertFrom-Json -AsHashTable
}

. $PSScriptRoot\Invoke-YoutubeDL.ps1

function Mount-NodeClipConfigs {
   param ([string] $js_file)
   foreach ($config in $(Receive-NodeClipConfigs $js_file)) {
      Invoke-YoutubeDL $config
   }
}
