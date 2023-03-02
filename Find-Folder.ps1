$drives = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    Write-Host "Drive letter:" $_.Name
    Write-Host "Drive type:" $_.DriveType
    Write-Host "Free space:" $_.Free
    Write-Host "------------------------"
    $_  # output the drive object
}

foreach($drive in $drives){
    $d="$drive`:\"
    Write-Host $d
    Get-ChildItem -Path "$d" -Recurse -Directory -Filter "*nasm*" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName
}