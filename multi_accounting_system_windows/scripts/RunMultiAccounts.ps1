# اجرای سیستم مولتی‌اکانتینگ
Set-ExecutionPolicy Bypass -Scope Process -Force

# اجرای Minikube
minikube start --driver=docker

# اجرای Docker
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"

# اجرای مرورگر Tor برای مولتی‌اکانتینگ
Start-Process "C:\Users\$env:USERNAME\Desktop\tor_browser\Browser\firefox.exe"

Write-Host "سیستم مولتی‌اکانتینگ در حال اجرا است."
