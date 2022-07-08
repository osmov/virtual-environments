################################################################################
##  File:  Install-Tfsec.ps1
##  Desc:  Install Aquasecurity Tfsec (static analysis security scanner for Terraform code)
################################################################################

# Install Tfsec
Write-Host "Download Latest Tfsec"
$downloadUrl = ((Invoke-RestMethod -Uri "https://api.github.com/repos/aquasecurity/tfsec/releases/latest").assets | `
                  Where-Object {$_.name -eq "tfsec-windows-amd64.exe"}).browser_download_url
$tfsecFileName = "tfsec.exe"
$tfsecDirectory = "${env:windir}\System32"
Start-DownloadWithRetry -Url $downloadUrl -Name $tfsecFileName -DownloadPath $tfsecDirectory

Invoke-PesterTests -TestFile "Tools" -TestName "Tfsec"