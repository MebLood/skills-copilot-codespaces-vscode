
# IP Rotation & Proxy Management

## Overview
To avoid detection, the system rotates proxies dynamically, ensuring each session uses a **different IP address**.

## Code Implementation
```python
import requests

class ProxyManager:
    def __init__(self, proxy_list):
        self.proxy_list = proxy_list
        self.current_index = 0

    def get_proxy(self):
        proxy = self.proxy_list[self.current_index]
        self.current_index = (self.current_index + 1) % len(self.proxy_list)
        return proxy

    def test_proxy(self, proxy):
        try:
            response = requests.get("https://httpbin.org/ip", proxies={"http": proxy}, timeout=5)
            return response.json()
        except:
            return None
```
## Next Steps
Proceed to Fingerprint Spoofing module.
