FROM centos:7
LABEL  maintainer "leyla <leyla@astralfield.blue>"
RUN mkdir /selenium
WORKDIR /selenium
RUN curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install selenium
RUN echo -e "[google-chrome]\nname=google-chrome\nbaseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\ngpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" > /etc/yum.repos.d/google.chrome.repo
RUN yum -y update
RUN yum install -y unzip
RUN yum -y install libX11
RUN yum -y install google-chrome-stable
RUN curl -o chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/2.36/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
ADD app.py /selenium/app.py
ADD env.json /selenium/env.json
CMD python app.py
