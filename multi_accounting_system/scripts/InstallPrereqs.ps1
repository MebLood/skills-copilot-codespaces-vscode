# اسکریپت نصب پیش‌نیازها
Set-ExecutionPolicy Bypass -Scope Process -Force

# نصب ابزارها از طریق Winget
winget install -e --id Git.Git --silent
winget install -e --id Docker.DockerDesktop --silent
winget install -e --id Python.Python.3 --silent
winget install -e --id Kubernetes.Minikube --silent

Write-Host "پیش‌نیازها نصب شدند."
