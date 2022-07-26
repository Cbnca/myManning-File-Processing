Get-Verb
# C:\Users\neilp\VSCodeWorkSpace\Cbnca-file-processing-lp\images
$SourceDirectory =  'C:\Users\neilp\VSCodeWorkSpace\Cbnca-file-processing-lp\images'

Get-ChildItem -Path $SourceDirectory -filter *.jpg   | Where Name -match "^[0-9]{6}"

$x="kjdofjhio["
$x.GetType()




$_ -match "([0-9]{6}])"




Where-Object {$_.Name -eq "msedge"} 