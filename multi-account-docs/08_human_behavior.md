
# Human-like Behavior Simulation

## Overview
Simulating human behavior helps prevent bot detection.

## Code Implementation
```python
import pyautogui
import random
import time

def move_mouse_randomly():
    x, y = pyautogui.position()
    x_new = x + random.randint(-50, 50)
    y_new = y + random.randint(-50, 50)
    pyautogui.moveTo(x_new, y_new, duration=random.uniform(0.5, 2))
```

## Next Steps
Proceed to AI-Powered Detection Evasion.
