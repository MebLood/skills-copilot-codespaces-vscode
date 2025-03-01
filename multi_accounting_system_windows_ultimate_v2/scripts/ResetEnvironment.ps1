# ریست کامل Docker و Minikube
Write-Host "⏳ ریست کامل Docker و Minikube در حال انجام است..."

Stop-Process -Name "Docker Desktop" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "minikube" -Force -ErrorAction SilentlyContinue
Stop-Service docker -Force -ErrorAction SilentlyContinue
taskkill /F /IM dockerd.exe /T
taskkill /F /IM minikube.exe /T

# حذف کش و تنظیمات معیوب
Remove-Item -Recurse -Force "$env:USERPROFILE\.minikube" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:USERPROFILE\.docker" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "C:\ProgramData\DockerDesktop" -ErrorAction SilentlyContinue

# ریست متغیرهای محیطی
[System.Environment]::SetEnvironmentVariable("Path", "$Env:SystemRoot;C:\minikube", [System.EnvironmentVariableTarget]::Machine)

# راه‌اندازی مجدد Docker و Minikube
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Start-Sleep -Seconds 15
minikube delete
minikube start --driver=docker

Write-Host "✅ بازنشانی کامل انجام شد. لطفاً سیستم را ری‌استارت کنید."
