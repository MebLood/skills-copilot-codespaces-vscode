import time
import logging
from selenium import webdriver

logging.basicConfig(filename='logs/system.log', level=logging.INFO)

options = webdriver.ChromeOptions()
options.add_argument("--disable-blink-features=AutomationControlled")

driver = webdriver.Chrome(options=options)
logging.info("✅ مرورگر باز شد!")

driver.get("https://example-game.com/login")
time.sleep(3)
driver.find_element("xpath", "//input[@name='username']").send_keys("testuser")
driver.find_element("xpath", "//input[@name='password']").send_keys("testpass")
driver.find_element("xpath", "//button[@type='submit']").click()
logging.info("✅ ورود به سیستم انجام شد!")

for i in range(5):
    driver.get("https://example-game.com/invite")
    time.sleep(2)
    driver.find_element("xpath", "//button[@id='invite']").click()
    logging.info(f"✅ دعوت شماره {i+1} ارسال شد!")

driver.quit()
logging.info("✅ بات به پایان رسید!")
