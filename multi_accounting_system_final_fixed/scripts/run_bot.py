import time
import logging
import os
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

# Ensure logs directory exists
log_directory = "logs"
if not os.path.exists(log_directory):
    os.makedirs(log_directory)

logging.basicConfig(filename='logs/system.log', level=logging.INFO)

options = webdriver.ChromeOptions()
options.add_argument("--disable-blink-features=AutomationControlled")

# Fix WebDriver instantiation
driver = webdriver.Chrome(executable_path=ChromeDriverManager().install(), options=options)
logging.info("✅ Browser started!")

driver.get("https://example-game.com/login")
time.sleep(3)
driver.find_element("xpath", "//input[@name='username']").send_keys("testuser")
driver.find_element("xpath", "//input[@name='password']").send_keys("testpass")
driver.find_element("xpath", "//button[@type='submit']").click()
logging.info("✅ Logged in successfully!")

for i in range(5):
    driver.get("https://example-game.com/invite")
    time.sleep(2)
    driver.find_element("xpath", "//button[@id='invite']").click()
    logging.info(f"✅ Invite #{i+1} sent!")

driver.quit()
logging.info("✅ Bot execution completed!")
