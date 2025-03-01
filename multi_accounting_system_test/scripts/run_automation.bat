@echo off
echo 🔍 بررسی و اجرای سیستم...
powershell -ExecutionPolicy Bypass -File install\setup.ps1
docker-compose up -d
python scripts\run_bot.py
