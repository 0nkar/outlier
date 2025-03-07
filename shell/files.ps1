param (
    [string]$directory = "."
)

$txtFiles = Get-ChildItem -Path $directory -Filter "*.txt"
if ($txtFiles.Count -eq 0) { Write-Host "No text files found."; exit }

for ($i = 0; $i -lt $txtFiles.Count; $i++) {
    Write-Host "$($i + 1): $($txtFiles[$i].Name)"
}

$selection = Read-Host "Enter the number of the file to display"
if ($selection -match "^\d+$" -and [int]$selection -gt 0 -and [int]$selection -le $txtFiles.Count) {
    $fileContent = Get-Content -Path $txtFiles[$selection - 1].FullName
    Write-Host "`n$fileContent"
} else {
    Write-Host "Invalid selection."
}
