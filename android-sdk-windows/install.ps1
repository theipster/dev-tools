$ProgressPreference = "SilentlyContinue"  # https://github.com/PowerShell/PowerShell/issues/2138#issuecomment-1264124324

[int]$AndroidSDKVersion = 9123335

$Tmp = New-TemporaryFile
$ZipFile = Rename-Item $Tmp "$Tmp.zip" -PassThru
Invoke-WebRequest "https://dl.google.com/android/repository/commandlinetools-win-${AndroidSDKVersion}_latest.zip" -OutFile $ZipFile

$ZipDir = New-Item (Join-Path $env:TMP (New-Guid)) -Type Directory
Expand-Archive $ZipFile $ZipDir
Remove-Item $ZipFile

$CmdToolsDir = New-Item "$env:LOCALAPPDATA\Android\Sdk\cmdline-tools" -Type Directory
Move-Item "$ZipDir\cmdline-tools" "$CmdToolsDir\tools"
Remove-Item $ZipDir
