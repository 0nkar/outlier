$directory = Read-Host "Enter the directory path"
if (!(Test-Path $directory)) { New-Item -ItemType Directory -Path $directory }

$fileNames = @("file1.txt", "file2.txt", "file3.txt")
foreach ($file in $fileNames) {
    $filePath = Join-Path $directory $file
    "Sample content for $file" | Set-Content -Path $filePath
}

Get-ChildItem -Path $directory | ForEach-Object { Write-Host "$($_.Name) - $($_.Length) bytes" }

$fileToDelete = Read-Host "Enter the name of the file to delete"
$filePath = Join-Path $directory $fileToDelete
if (Test-Path $filePath) { Remove-Item -Path $filePath -Force; Write-Host "$fileToDelete deleted." } 
else { Write-Host "File not found." }
