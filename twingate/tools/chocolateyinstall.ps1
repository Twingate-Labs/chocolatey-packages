
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = ''
$url64      = "https://binaries.twingate.com/client/windows/versions/1.0.18.11084/TwingateWindowsInstaller.msi"
$checksum64 = '9e83fe5e8095784e83e7cfccc1b663e6ea299e443599dd51a3c621fed0a70059'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'twingate*'

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:ChocolateyPackageVersion).MsiInstall.log`" no_optional_updates=true"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

















