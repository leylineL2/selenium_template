FROM python:3-alpine3.8
LABEL  maintainer "leyla <leyla@astralfield.blue>"
RUN  apk add --update chromium
RUN apk add --update \
	udev \
	ttf-freefont \
	chromium \
	openssl \
	chromium-chromedriver \
	gfortran \
	gcc \
	g++

RUN mkdir /noto
ADD https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip /noto 
WORKDIR /noto
RUN unzip NotoSansCJKjp-hinted.zip && \
	mkdir -p /usr/share/fonts/noto && \
	cp *.otf /usr/share/fonts/noto && \
	chmod 644 -R /usr/share/fonts/noto/ && \
	fc-cache -fv
WORKDIR /
#RUN rm -rf /noto/
RUN pip install selenium
RUN mkdir /selenium
WORKDIR /selenium
ADD app.py /selenium/app.py
ADD env.json /selenium/env.json

CMD python3 app.py
