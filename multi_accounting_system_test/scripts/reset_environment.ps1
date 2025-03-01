Set-ExecutionPolicy Bypass -Scope CurrentUser -Force
wsl --shutdown
Restart-Service docker
Restart-Computer -Force
