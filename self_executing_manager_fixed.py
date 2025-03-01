#!/usr/bin/env python3
import os, subprocess, time

# مدیریت اجرای خودکار
print("=== Starting self_executing_manager.py ===")

# بررسی و ایجاد فایل‌های گمشده
required_files = ["monitoring.py", "kafka_logger.py", "loki_logger.py", "auto_scaling.sh", "self_healing.py", "ci-cd.yml", "self_debugger.py"]

for filename in required_files:
    if not os.path.exists(filename):
        with open(filename, "w") as f:
            f.write(f"# Placeholder for {filename}\n")
        print(f"Created placeholder for {filename}")

# اجرای مداوم اسکریپت‌های اصلی
while True:
    subprocess.run(["python", "self_healing.py"], check=False)
    subprocess.run(["bash", "auto_scaling.sh"], check=False)
    time.sleep(30)
