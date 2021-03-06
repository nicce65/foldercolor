﻿<#
Thanks to Adam Dimech,  https://code.adonline.id.au/folder-file-browser-dialogues-powershell/
# Wayne Lindimore, wlindimore@gmail.com, AdminsCache.Wordpress.com
#>

Function Foldercolor ($args0, $args1, $args2, $args3) {
Add-Type -AssemblyName System.Drawing
$folderPng = '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'
$ms = New-Object System.IO.MemoryStream ([Convert]::FromBase64String($folderPng), $false)
$grayFolder = [System.Drawing.Image]::FromStream($ms)
$colorFolder = New-Object System.Drawing.Bitmap ($grayFolder.Width, $grayFolder.Height)

# Recolor the image
$desiredColor = [System.Drawing.Color]::FromArgb($args0, $args1, $args2)
For ($y = 0; $y -lt $grayFolder.Height; $y++) {
    For ($x = 0; $x -lt $grayFolder.Width; $x++) {
        $color = $grayFolder.GetPixel($x, $y)
        $r = $color.R + (1 - $color.R / 255) * $desiredColor.R
        $g = $color.G + (1 - $color.G / 255) * $desiredColor.G
        $b = $color.B + (1 - $color.B / 255) * $desiredColor.B
        $colorFolder.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($color.A, $r, $g, $b))
    }
}
$colorFolder.MakeTransparent()
$iconPath = Join-Path $args3 'foldericon.ico'

GCI -File -Path $args3 -Include foldericon.ico -Recurse -Force | foreach {$_.Delete()}

# Generate an ICO from the image
$file = New-Object System.IO.FileStream ($iconPath, 'Create')
$bw = New-Object System.IO.BinaryWriter $file
$bw.Write([int16]0)
$bw.Write([int16]1)
$bw.Write([int16]1)
$bw.Write([byte]($colorFolder.Width))
$bw.Write([byte]($colorFolder.Height))
$bw.Write([byte]0)
$bw.Write([byte]0)
$bw.Write([int16]0)
$bw.Write([int16]0)
$lenPosition = $file.Position
$bw.Write([int]0)
$start = $file.Position + 4
$bw.Write([int]$start)
$colorFolder.Save($file, [System.Drawing.Imaging.ImageFormat]::Png)
$imgSize = $file.Position - $start
$file.Seek([int]$lenPosition, 'Begin')
$bw.Write([int]$imgSize)

# Finish up
($file, $bw, $grayFolder, $colorFolder, $ms) | % {$_.Dispose()}
GCI -File -Path $args3 -Include desktop.ini -Recurse -Force | foreach {$_.Delete()}

$desktopPath = Join-Path $args3 'desktop.ini'
[IO.File]::WriteAllText($desktopPath, "[.ShellClassInfo]`r`nIconResource=foldericon.ico`r`n")
(gi $desktopPath).Attributes = 'Hidden, System'
(gi $iconPath).Attributes = 'Hidden'
#(gi $args3).Attributes = 'ReadOnly'
}


$Applybutton_Click = { 
	$args0 = $redTextBox.Text
	$args1 = $greenTextBox.Text
	$args2 = $blueTextBox.Text
	$args3 = $FolderBox.Text

	Foldercolor $args0 $args1 $args2 $args3
	#Check that files are created and return a result to user
	$CheckDesktop = Join-Path $FolderBox.Text 'desktop.ini'
	$CheckFoldericon = Join-Path $FolderBox.Text 'foldericon.ico'
	Try{
		If ((Test-Path $CheckDesktop) -and (test-path $CheckFoldericon)) {$Result.Text = "Folder update with new color"}
		}
		Catch{
		$Result.Text = "Something went wrong please try again"
		}
}

$Folderbutton_Click = {Find-Folders }

$Exit_Click = {$mainForm.close() }

$PickAColor = {PickColor }

$MainForm_Load = {

}
############
function PickColor {
    $colorDialog = new-object System.Windows.Forms.ColorDialog 
    $colorDialog.AllowFullOpen = $true
    $colorDialog.ShowDialog()
    $alphaTextBox.Text = $colordialog.color.A 
    $redTextBox.Text = $colordialog.color.R  
    $greenTextBox.Text = $colordialog.color.G  
    $blueTextBox.Text = $colordialog.color.B  
    $HexBox.Text = $colorDialog.Color.Name.ToUpper()
    $error.clear()
    $ShowColorbutton.BackColor = [Convert]::ToInt32($colorDialog.Color.Name, 16) 
    If($error.count -gt 0) {
        $ShowColorbutton.BackColor =  $colorDialog.Color.Name
		}
	}
	#### 
	function Find-Folders {
    [Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $browse = New-Object System.Windows.Forms.FolderBrowserDialog
    $browse.SelectedPath = "C:\"
    $browse.ShowNewFolderButton = $false
    $browse.Description = "Select a directory"

    $loop = $true
    while($loop)
    {
        if ($browse.ShowDialog() -eq "OK")
        {
        $loop = $false
		
		#Insert your script here
		
        } else
        {
            $res = [System.Windows.Forms.MessageBox]::Show("You clicked Cancel. Would you like to try again or exit?", "Select a location", [System.Windows.Forms.MessageBoxButtons]::RetryCancel)
            if($res -eq "Cancel")
            {
                #Ends script
                return
            }
        }
    }
    $browse.SelectedPath
    $browse.Dispose()
	$FolderBox.Text =$browse.SelectedPath
} 



. (Join-Path $PSScriptRoot 'FolderColor.designer.ps1')

$MainForm.ShowDialog()