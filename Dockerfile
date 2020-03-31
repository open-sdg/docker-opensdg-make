FROM ubuntu
RUN apt-get update

##########################
# INSTALL PACKAGES
##########################

# Install sudo
RUN apt install -y sudo

# Install NodeJS
RUN apt install -y nodejs
RUN apt install -y npm
RUN npm install -g npx

# Install Python
RUN apt-get install -y python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 2

# Install Ruby
RUN apt-get install -y ruby-full build-essential zlib1g-dev
RUN gem install jekyll bundler

# Install Git
RUN apt install -y git

# Install headless Chrome
RUN sudo apt-get update 
RUN sudo apt-get -y install software-properties-common 
RUN sudo add-apt-repository ppa:canonical-chromium-builds/stage 
RUN sudo apt-get update 
RUN sudo apt-get -y install chromium-browser

# Other packages
RUN apt -y install locales
RUN locale-gen en_US.UTF-8
RUN apt install -y libcurl3

RUN apt-get -y install xvfb gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 \
      libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
      libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
      libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
      libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget

# Add sudo user

RUN adduser --disabled-password --gecos '' makeuser
RUN adduser makeuser sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN export GEM_HOME="$HOME/gems"
RUN export PATH="$HOME/gems/bin:$PATH"

USER makeuser

##########################
# CONFIGURATIONS
##########################

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
COPY ./.bashrc /home/makeuser
WORKDIR /repo

