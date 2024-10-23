# Script to rename slices folders from Ableton Live
Get-ChildItem | Rename-Item -NewName {
    # Split the filename to preserve the extension
    $baseName = $_.BaseName
    $extension = $_.Extension

    # Remove everything after the last space in the basename
    $modifiedName = if ($baseName -match '^(.*?)\s+\S+$') { $matches[1] } else { $baseName }

    # Append numbering with zeroes -- always three digits
    if ($modifiedName -match '(\d+)$') {
        $number = $matches[1]
        if ($number.Length -eq 1) {
            $modifiedName = $modifiedName -replace $number, ('00' + $number)
        } elseif ($number.Length -eq 2) {
            $modifiedName = $modifiedName -replace $number, ('0' + $number)
        }
    }
    
    $modifiedName = $modifiedName -replace ' ', '_'
    
    $modifiedName + $extension
}
