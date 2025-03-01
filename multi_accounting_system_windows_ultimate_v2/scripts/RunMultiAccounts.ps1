# اجرای سیستم مولتی‌اکانتینگ
Set-ExecutionPolicy Bypass -Scope Process -Force

# اجرای Docker
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Start-Sleep -Seconds 15

# اجرای Minikube
minikube delete
minikube start --driver=docker

# اجرای مرورگر Tor برای مولتی‌اکانتینگ
Start-Process "C:\Users\$env:USERNAME\Desktop\tor_browser\Browser\firefox.exe"

Write-Host "✅ سیستم مولتی‌اکانتینگ در حال اجرا است."
