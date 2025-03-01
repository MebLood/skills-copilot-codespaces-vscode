
# Fingerprint & Device Spoofing

## Overview
Websites track users based on **browser fingerprints, MAC addresses, and system properties**.
This module helps randomize these values to avoid detection.

## Techniques Used
- **User-Agent Randomization**
- **Canvas Fingerprinting Spoofing**
- **WebGL & Audio Fingerprint Obfuscation**

## Code Implementation
```python
from selenium import webdriver

options = webdriver.ChromeOptions()
options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64)")

driver = webdriver.Chrome(options=options)
driver.get("https://www.whatismybrowser.com/")
```

## Next Steps
Proceed to Automated Authentication module.
