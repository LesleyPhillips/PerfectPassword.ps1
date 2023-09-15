$strChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()`~-_=+[]{}\/|?<>,.;':"""
$strResult = ""
$strResult = For ($i=1; $i -lt 65; $i++){$StrResult + $strChars.substring((get-random 93),1)}
[string]::concat("Printable ascii: ", ($strResult -join ""))

$strChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
$strResult = ""
$strResult = For ($i=1; $i -lt 65; $i++){$StrResult + $strChars.substring((get-random 62),1)}
[string]::concat("Alpha numeric:   ", ($strResult -join ""))

$strChars = "0123456789ABCDEF"
$strResult = ""
$strResult = For ($i=1; $i -lt 65; $i++){$StrResult + $strChars.substring((get-random 16),1)}
[string]::concat("Hex:             ", ($strResult -join ""))

$strResult = ""
$strResult = For ($i=1; $i -lt 65; $i++){$StrResult + "0123456789ABCDEF".substring((get-random 16),1)}
[string]::concat("Hex without arg: ", ($strResult -join ""))

$strChars = "ÆƷűʘ ̊░▒▓"
$strResult = ""
$strResult = For ($i=1; $i -lt 65; $i++){$StrResult + $strChars.substring((get-random $strChars.length),1)}
[string]::concat("Silly string:    ", ($strResult -join ""))

## Strip Doubles based on numerical value of chars
$inStr = "MLIKsMf0jjgStZkAWgyWHMpyKe3hmrw3hNoiIKQo4GTIpb9u7yzc28DbUXAvR96A0tXt1ZStBbBommFdBwifSxtAq9Jq5sQ9j8UhN8GQ4I6911t1zgr7YyJPmCcNLPqE"
$strResult = $inStr[0]
For ($i=1; $i -lt $InStr.Length; $i++){
    if([int][char]$InStr[$i] -ne [int][char]$InStr[$i-1]){$strResult = $strResult + $InStr[$i]}
    write-host ('' + $i + " " + $InStr[$i]+ ' ' + ([int][char]$InStr[$i] -ne [int][char]$InStr[$i-1]))
}
[string]::concat("Strip Doubles started with: ", ($InStr -join ""))
[string]::concat("Strip Doubles    leftovers: ", ($strResult -join ""))

## Strip Dups based on existance withing the same string
$inStr = "MLIKsMf0jgStZkAWgyWHMpyKe3hmrw3hNoiIKQo4GTIpb9u7yzc28DbUXAvR96A0tXt1ZStBbBomFdBwifSxtAq9Jq5sQ9j8UhN8GQ4I691t1zgr7YyJPmCcN
LPqE"
$strResult = ''
For ($i=0; $i -lt $InStr.Length; $i++){
    if($strResult.contains($InStr[$i]) -eq $false){$strResult = $strResult + $InStr[$i]}
    write-host ('' + $i + " " + $InStr[$i]+ ' ' + ($strResult.contains($InStr[$i])))
}
[string]::concat("Strip Dupes started with: ", ($InStr -join ""))
[string]::concat("Strip Dupes    leftovers: ", ($strResult -join ""))

## Strip Sequence Neighbors
$inStr = "MLIKsf0jgStZkAWyHpe3hmrwNoiQ4GTb9u7zc28DUXvR61BFdxqJ5YPC"
$strSequence = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
$strResult = $inStr[0]
For ($i=1; $i -lt $InStr.Length; $i++){
    [string]$neighbors = ''
    $Loc = $strChars.indexof($inStr[$i-1])
    If($Loc -eq 0) { $neighbors = '<<' + $strSequence[$strSequence.Lengh - 1]} else { $neighbors = '<' + $strSequence[$Loc-1]}
    If($Loc -eq $strSequence.Length-1) {$neighbors = $neighbors + $strSequence[0] + '>>'} else { $neighbors = $neighbors + $strSequence[$Loc+1] + '>'}
    if($neighbors.contains($InStr[$i]) -eq $false){$strResult = $strResult + $InStr[$i]}
    write-host ('' + $i + " " + $InStr[$i]+ ' ' + $neighbors + ' ' + ($neighbors.contains($InStr[$i])))
}
[string]::concat("Strip Sequence Neighbors started with: ", ($InStr -join ""))
[string]::concat("Strip Sequence Neighbors    leftovers: ", ($strResult -join ""))


For ($i=0; $i -lt $InStr.Length; $i++) {
    write-host ('' + $i + ' ' + $InStr[$i]+ ' ' + ($i -lt $InStr.Length))
}


