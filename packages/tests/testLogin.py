#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.common.by import By
import json
import time

driverOptionsChrome = webdriver.ChromeOptions()
driverOptionsChrome.add_argument("--enable-logging")
driverOptionsChrome.add_argument("--ignore-ssl-errors=yes") # TODO: Toggle off when INDIGO_ENV="prod"
driverOptionsChrome.add_argument("--ignore-certificate-errors") # TODO: Toggle off when INDIGO_ENV="prod"
driverOptionsChrome.set_capability("goog:loggingPrefs", {"performance": "ALL"})
driverOptionsChrome.add_experimental_option("detach", True)

def getPeformanceLogs(driver: webdriver.chrome.webdriver.WebDriver):
    log = driver.get_log("performance")
    status = 200
    for entry in log:
        entry = json.loads(entry.get("message"))["message"]
        try:
            status = entry["params"]["response"]["status"]
        except KeyError:
            continue
        if status != 200 and status is not None:
            break
    return status

def testLogin(username: str = "john.doe", password: str = "correct-horse-battery-staple"):
    driver = webdriver.Chrome(options=driverOptionsChrome)
    driver.get("https://localhost:443/login")
    driver.find_element(by=By.CSS_SELECTOR, value="[formControlName=email]").send_keys(username)
    driver.find_element(by=By.CSS_SELECTOR, value="[formControlName=password]").send_keys(password)
    driver.find_element(by=By.CSS_SELECTOR, value="[type=submit]").click()
    time.sleep(3) # TODO: Replace with a more proper wait strategy for Selenium
    status = getPeformanceLogs(driver)
    assert status == 200

if __name__ == "__main__":
    testLogin()
