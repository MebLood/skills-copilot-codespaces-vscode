# اسکریپت نصب پیش‌نیازها
Set-ExecutionPolicy Bypass -Scope Process -Force

# فعال‌سازی WSL، Virtual Machine Platform، و Hyper-V
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart

# دانلود و نصب هسته WSL2 در صورت نیاز
$wsl_update = "https://aka.ms/wsl2kernel"
Invoke-WebRequest -Uri $wsl_update -OutFile "wsl_update_x64.msi"
Start-Process "wsl_update_x64.msi" -Wait

# نصب Ubuntu در WSL
wsl --install -d Ubuntu

# نصب Docker Desktop
$docker_installer = "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
Invoke-WebRequest -Uri $docker_installer -OutFile "DockerInstaller.exe"
Start-Process "DockerInstaller.exe" -ArgumentList "install --quiet --accept-license" -Wait

# دانلود و نصب Minikube
$minikube_url = "https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe"
Invoke-WebRequest -Uri $minikube_url -OutFile "C:\minikube\minikube.exe"
[Environment]::SetEnvironmentVariable("Path", "$Env:Path;C:\minikube", [EnvironmentVariableTarget]::Machine)

# دانلود و نصب مرورگر Tor
$tor_browser = "https://archive.torproject.org/tor-package-archive/torbrowser/14.0.6/tor-browser-windows-x86_64-portable-14.0.6.exe"
Invoke-WebRequest -Uri $tor_browser -OutFile "tor_browser.exe"
Start-Process "tor_browser.exe" -Wait

Write-Host "پیش‌نیازها نصب شدند. لطفاً سیستم را ری‌استارت کنید."
