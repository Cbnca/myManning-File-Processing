
# input a file object, returns an array. [0] is boolean, matched a sku number ;   [1] is a string : the SKU with extension.
function Rename-SKU {
    param (
        [System.IO.FileInfo]
        $thisFileName
        )
    process{
        # automatic hashtable named $Matches
        $thisFileName -match "(?<sku>[0-9]{6})"
        
        #Return $Matches.sku + '.jpg'

        #$ext = [io.path]::GetExtension($thisFileName)
        #Write-Host "$($ext) "
        Return $Matches.sku +  [io.path]::GetExtension($thisFileName)
    }
}

$SourceDirectory =  'C:\Users\neilp\VSCodeWorkSpace\Cbnca-file-processing-lp\images'
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-item?view=powershell-7.2
# put function call and resulting array ref inside curly braces, it works. WHY are curly braces needed ?
# without curly braces each file is wrongly renamed to the *last* SKU in the result set  !
Get-ChildItem -Path $SourceDirectory -filter *.jpg   | Rename-Item -NewName { (Rename-SKU $_ )[1] } -WhatIf

#
# Helper stuff.
#

<############################

$SourceDirectory =  'C:\Users\neilp\VSCodeWorkSpace\Cbnca-file-processing-lp\images'
$FileNames = Get-ChildItem -Path $SourceDirectory -filter *.jpg 
$i = 0
foreach ($File in $FileNames) 
{
    if ($File -match "(?<sku>[0-9]{6})")             #Is already filtered for jpg's in Get-ChildItem,    ($File.Extension -eq '.jpg') -and            
    {
        $i++
        $myNewName = $Matches.sku + '.jpg'
        Write-Host "$($i)`t $($File.GetType()) `t $($Matches.sku) `t $($myNewName) `t >$($File.Name)<"
        $ext = [io.path]::GetExtension($File)

        $File | Rename-Item -NewName (Rename-SKU  $File)[1] -WhatIf
    }
    else 
    {
        Write-Host "Not a SKU Image"
    }
}


## Rename-Item 
## Q.what object type is OK to use as a parameter?   A. a String object.
$File | Rename-Item -NewName 'zyx' -WhatIf
'zyx'.GetType()

## Q.What does the function return ? A. an Array
(Rename-SKU  $File).GetType()
(Rename-SKU  $File)[0]    # < True
(Rename-SKU  $File)[1]    # < 170288.jpg
(Rename-SKU  $File)[1].GetType()  # its a string = OK to use for parameter in Rename-Item

## Here's the rename command
$File | Rename-Item -NewName (Rename-SKU  $File)[1] -WhatIf

## Q.What does the extension look like ?  A. '.jpg'
$File.Extension

####################>

