# Define the remote server's hostname or IP address
$remoteServer = "192.168.0.10"

# Define the username and password for remote authentication
$username = "administrator"
$password = "Nithin#0712" | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)

# Define the path to your Vagrant project directory on the remote server
$remotePath = "D:\nfsshare\vagrant\gitlab\centos_vm_vagrant"

# Create a session to the remote server
$session = New-PSSession -ComputerName $remoteServer -Credential $credential

# Use Invoke-Command to run the vagrant up command on the remote server
Invoke-Command -Session $session -ScriptBlock {
    param($remotePath)
    Set-Location -Path $remotePath
    vagrant up
} -ArgumentList $remotePath

# Close the remote session
Remove-PSSession $session