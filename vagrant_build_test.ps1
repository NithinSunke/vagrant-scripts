# Define the repository URL
$repoUrl = "https://github.com/NithinSunke/vagrant-scripts.git"

# Define the directory where the repository will be cloned
$cloneDirectory = "E:\vagrant"

# Check if the clone directory exists, if not create it
if (-not (Test-Path -Path $cloneDirectory)) {
    New-Item -ItemType Directory -Path $cloneDirectory
}

# Change to the clone directory
Set-Location -Path $cloneDirectory

# Clone the repository
git clone $repoUrl

# Optional: Change to the repository directory (assuming the repo name is 'vagrant-scripts')
Set-Location -Path (Join-Path $cloneDirectory "vagrant-scripts")

# Optional: Confirm the current directory
Write-Host "Repository cloned to: $(Get-Location)"


