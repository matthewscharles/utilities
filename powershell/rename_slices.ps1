# A quick script to automate renaming the files from Ableton Live's slice folders
$replaceText = Read-Host -Prompt 'Enter the text to replace "Slice "'
Get-ChildItem | Rename-Item -NewName {
    # Replace "Slice " with user input and then format the numbers correctly
    $newName = $_.Name -replace "Slice ", $replaceText
    if ($newName -match '(\d+)$') {
        $number = $matches[1]
        if ($number.Length -eq 1) {
            $newName -replace $number, ('00' + $number)
        } elseif ($number.Length -eq 2) {
            $newName -replace $number, ('0' + $number)
        } else {
            $newName
        }
    } else {
        $newName
    }
}
