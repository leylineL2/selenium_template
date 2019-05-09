# SeleniumTemplate
## Description
Selenium on Docker Image Controled python3

## require
- install docker 

## config
- create env.json from env.json.sample
	- `cp env.json.sample env.json`
	- `vim env.json`
	- input username and password

## deploy
- `docker build -t selenium_template .`
- `docker run --rm selenium_template`
