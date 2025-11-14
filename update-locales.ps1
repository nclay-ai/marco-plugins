$localesDir = "C:\Users\natha\OneDrive\Documents\GitHub\marco-plugins\locales"
$files = Get-ChildItem "$localesDir\obx-multitool.*.json"

foreach ($file in $files) {
    $content = Get-Content $file.FullName | ConvertFrom-Json

    # Update metadata
    $content.meta.avatar = "📖"
    $content.meta.title = "Salesforce Read-Only"
    $content.meta.description = "RESTRICTED: Read-only Salesforce data access. Query contacts, accounts, leads, opportunities. NO write operations. NO other platforms."
    $content.meta.tags = @("salesforce", "read-only", "query", "crm", "data-retrieval", "sfdc")

    # Write back to file
    $content | ConvertTo-Json -Compress | Out-File -Encoding utf8 $file.FullName -NoNewline
    Write-Host "Updated: $($file.Name)"
}

Write-Host "Done! Updated $($files.Count) locale files."
