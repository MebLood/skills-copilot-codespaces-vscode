Set-ExecutionPolicy Bypass -Scope Process -Force

# Ensure logs directory exists
New-Item -ItemType Directory -Path "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_v3\logs" -Force

# Restart Docker Service
Write-Host "Restarting Docker Service..."
$dockerService = Get-Service -Name "com.docker.service" -ErrorAction SilentlyContinue
if ($dockerService -eq $null) {
    Write-Host "Docker service not found! Installing Docker..."
    Invoke-WebRequest -Uri "https://desktop.docker.com/win/main/amd64/Docker Desktop Installer.exe" -OutFile "DockerInstaller.exe"
    Start-Process "DockerInstaller.exe" -Wait
} else {
    Restart-Service "com.docker.service" -Force
}

# Restart WSL2 for Docker compatibility
Write-Host "Restarting WSL2..."
wsl --shutdown
wsl --set-default-version 2

# Install Python dependencies
Write-Host "Installing Python dependencies..."
pip install --upgrade pip
pip install -r "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_v3\requirements.txt" --force-reinstall

# Ensure Docker Desktop is running
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe" -NoNewWindow
Start-Sleep -Seconds 15

# Fix Docker daemon issue
Write-Host "Restarting Docker Daemon..."
Restart-Service "com.docker.service" -Force

# Pull Python Docker image manually to avoid errors
Write-Host "Pulling Python 3.9 Docker image..."
docker pull python:3.9

# Run Docker Compose
Write-Host "Running Docker Compose..."
docker-compose -f "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_v3\docker\docker-compose.yml" up -d

# Run Bot
Write-Host "Running the bot..."
python "C:\Users\roozbeh\Desktop\scripts_package\multi_accounting_system_final_v3\scripts\run_bot.py"
