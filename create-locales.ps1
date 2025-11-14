$localesDir = "C:\Users\natha\OneDrive\Documents\GitHub\marco-plugins\locales"
$files = Get-ChildItem "$localesDir\obx-ahrefs-agent.*.json"

foreach ($file in $files) {
    $content = Get-Content $file.FullName | ConvertFrom-Json
    $content.meta.title = "OBxMultiTool"
    $content.meta.description = "Comprehensive automation and workflow toolkit powered by RUBE. Search tools, execute workflows, run remote commands, create plans, and manage integrations."
    $content.meta.tags = @("outerbox", "automation", "workflow", "rube", "tools")

    $newName = $file.Name -replace "obx-ahrefs-agent", "obx-multitool"
    $newPath = Join-Path $localesDir $newName

    $content | ConvertTo-Json -Compress | Out-File -Encoding utf8 $newPath -NoNewline
    Write-Host "Created: $newName"
}

Write-Host "Done! Created $($files.Count) locale files."
