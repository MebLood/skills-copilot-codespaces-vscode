# Force execution policy
Set-ExecutionPolicy Bypass -Scope Process -Force

# Ensure logs directory exists
New-Item -ItemType Directory -Path "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_fixed\logs" -Force

# Fixing PowerShell script issue
$scriptPath = "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_fixed\install\setup.ps1"
(Get-Content $scriptPath) -replace 'OªU.OU. O', '' | Set-Content $scriptPath

# Ensure Docker service is running
Write-Host "🔄 Restarting Docker Service..."
$dockerService = Get-Service -Name "com.docker.service" -ErrorAction SilentlyContinue
if ($dockerService -eq $null) {
    Write-Host "🚨 Docker service not found! Installing Docker..."
    Invoke-WebRequest -Uri "https://desktop.docker.com/win/main/amd64/Docker Desktop Installer.exe" -OutFile "DockerInstaller.exe"
    Start-Process "DockerInstaller.exe" -Wait
} else {
    Restart-Service "com.docker.service" -Force
}

# Restarting WSL2 for Docker compatibility
Write-Host "🔄 Restarting WSL2..."
wsl --shutdown
wsl --set-default-version 2

# Install Python dependencies
Write-Host "🔍 Installing Python dependencies..."
pip install --upgrade pip
pip install -r "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_fixed\requirements.txt" --force-reinstall

# Ensure Docker Desktop is running
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe" -NoNewWindow
Start-Sleep -Seconds 15

# Fix Docker daemon issue
Write-Host "🔄 Restarting Docker Daemon..."
Restart-Service "com.docker.service" -Force

# Run Docker Compose
Write-Host "🚀 Running Docker Compose..."
docker-compose -f "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_fixed\docker\docker-compose.yml" up -d

# Run Bot
Write-Host "🚀 Running the bot..."
python "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_fixed\scripts\run_bot.py"
