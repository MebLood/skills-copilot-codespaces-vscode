Set-ExecutionPolicy Bypass -Scope Process -Force

# بررسی و نصب WSL2
wsl --install -d Ubuntu
wsl --shutdown

# بررسی و نصب Docker
$dockerInstalled = Get-Command docker -ErrorAction SilentlyContinue
if ($dockerInstalled -eq $null) {
    Write-Host "❌ Docker نصب نیست! در حال نصب..."
    Invoke-WebRequest -Uri "https://desktop.docker.com/win/main/amd64/Docker Desktop Installer.exe" -OutFile "DockerInstaller.exe"
    Start-Process "DockerInstaller.exe" -Wait
}

# بررسی و نصب Minikube
$minikubeInstalled = Get-Command minikube -ErrorAction SilentlyContinue
if ($minikubeInstalled -eq $null) {
    Write-Host "❌ Minikube نصب نیست! در حال نصب..."
    Invoke-WebRequest -Uri "https://storage.googleapis.com/minikube/releases/latest/minikube-installer.exe" -OutFile "minikube-installer.exe"
    Start-Process "minikube-installer.exe" -Wait
}

# اضافه کردن مسیرها به متغیر PATH
[System.Environment]::SetEnvironmentVariable("Path", "$Env:Path;C:\Program Files\Docker\Docker;C:\Program Files\Minikube", [System.EnvironmentVariableTarget]::Machine)

Write-Host "✅ نصب تمام شد! لطفاً سیستم را ریستارت کنید."
