FROM centos:7
LABEL  maintainer "leyla <leyla@astralfield.blue>"
ENV PYTHON_VERSION 3.7.3
WORKDIR /usr/src
RUN yum -y update && yum install -y gcc openssl-devel bzip2-devel libffi-devel make
RUN curl -o Python-`echo $PYTHON_VERSION`.tgz https://www.python.org/ftp/python/`echo $PYTHON_VERSION`/Python-`echo $PYTHON_VERSION`.tgz
RUN tar xzf Python-`echo $PYTHON_VERSION`.tgz
RUN cd Python-`echo $PYTHON_VERSION` && ./configure --enable-optimizations && make altinstall
RUN pip3.7 install selenium
RUN echo -e "[google-chrome]\nname=google-chrome\nbaseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\ngpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" > /etc/yum.repos.d/google.chrome.repo
RUN yum -y update
RUN yum install -y unzip
RUN yum -y install libX11
RUN yum -y install google-chrome-stable
WORKDIR /selenium
RUN curl -o chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/2.36/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
ADD app.py /selenium/app.py
ADD env.json /selenium/env.json
CMD python3.7 app.py
