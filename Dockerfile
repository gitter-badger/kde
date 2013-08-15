FROM ubuntu
RUN apt-get install -y python-software-properties python
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise-updates main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs rubygems
RUN npm install -g grunt-cli
RUN gem install rdoc
RUN gem install jekyll
ADD . /src
RUN cd /src;npm install
RUN cd /src;grunt
EXPOSE  4000
CMD ["jekyll", "-w", "server", "-s", "src", "-d", "src/_site"]
