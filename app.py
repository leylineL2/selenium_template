from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re
import json

# run chrome headless
options = Options()
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-gpu')
options.binary_location = '/usr/bin/google-chrome'
options.add_argument('--window-size=1280,1024')
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-desktop-notifications')
options.add_argument("--disable-extensions")
options.add_argument('--allow-running-insecure-content')
options.add_argument('--disable-web-security')
options.add_argument('--lang=ja')
#options.add_argument('--disable-bundled-ppapi-flash')
options.add_argument("disable-infobars")
options.add_argument("--always-authorize-plugins")
options.add_argument("--disable-flash-sandbox")
options.add_argument("--enable-internal-flash")

try:
	f = open("env.json")
	envDict = json.load(f)
	user = envDict["user"]
	password = envDict["password"]
except FileNotFoundError:
	print("error: require env.json")

driver = webdriver.Chrome('/selenium/chromedriver',chrome_options=options)

# example login form
base_url = "https://codepen.io/miroot/pen/qwIgC"
driver.get(base_url + "")

# example input user and password in form
driver.find_element_by_xpath('/html/body/div/form/p[1]/input').send_keys(user)
driver.find_element_by_xpath('/html/body/div/form/p[2]/input').send_keys(password)
driver.find_element_by_xpath('/html/body/div/form/p[3]/input').click()

driver.quit()
