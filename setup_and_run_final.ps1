# PowerShell Setup Script - نسخه نهایی اصلاح‌شده
# این اسکریپت همه وابستگی‌ها را نصب می‌کند و اینترنت را دور می‌زند

Write-Host "=== Starting setup_and_run_fixed.ps1 ==="

# بررسی و تنظیم مجوز اجرای اسکریپت‌ها
Set-ExecutionPolicy Bypass -Scope Process -Force

# بررسی اینترنت
function Test-InternetConnection {
    try {
        $response = Test-Connection -ComputerName 8.8.8.8 -Count 1 -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

# دور زدن مشکل اینترنت در Git Bash
if (-not (Test-InternetConnection)) {
    Write-Host "No internet connection detected! Trying to bypass..."
    netsh interface set interface "Wi-Fi" admin=enable
    Start-Sleep -Seconds 5
}

# نصب بسته‌های مورد نیاز
function Install-PackageIfMissing($package, $wingetID) {
    if (-not (Get-Command $package -ErrorAction SilentlyContinue)) {
        Write-Host "$package not found. Installing..."
        winget install -e --id $wingetID --accept-package-agreements --accept-source-agreements
    } else {
        Write-Host "$package is already installed."
    }
}

# نصب Python، Git، Docker، kubectl، Minikube
Install-PackageIfMissing "python" "Python.Python.3"
Install-PackageIfMissing "git" "Git.Git"
Install-PackageIfMissing "docker" "Docker.DockerDesktop"
Install-PackageIfMissing "kubectl" "Kubernetes.kubectl"
Install-PackageIfMissing "minikube" "Kubernetes.minikube"

# اضافه کردن مسیرهای لازم به PATH
$env:Path += ";C:\Program Files\Git\bin;C:\Program Files\Docker\Docker;C:\Users\$env:UserName\.minikube"

# بررسی و تنظیم اعتبار GitHub
if (-not (Test-Path "$env:USERPROFILE\.git-credentials")) {
    Write-Host "GitHub credentials not found. Enter your credentials:"
    $username = Read-Host "GitHub Username"
    $password = Read-Host "GitHub Personal Access Token" | ConvertTo-SecureString -AsPlainText -Force
    $cred = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    $gitCred = "https://$username:$cred@github.com"
    Set-Content "$env:USERPROFILE\.git-credentials" $gitCred
    Write-Host "GitHub credentials stored."
}

# اجرای مدیریت خودکار
Write-Host "Launching self-executing manager..."
python self_executing_manager.py
