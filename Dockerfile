FROM ubuntu
MAINTAINER youht

WORKDIR /opt

RUN apt-get update -y
RUN apt-get install -y wget git xz-utils curl vim iputils-ping net-tools unzip tmux

#add python3
RUN apt-get install python3 python3-pip -y

#patch1
RUN pip3 install flask requests kafka elasticsearch pymongo
RUN pip3 install numpy pandas
    
#add flutter
ADD flutter_linux_2.0.3-stable.tar.xz /opt/
ENV FLUTTER_HOME=/opt/flutter
ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
ENV PATH=$PATH:FLUTTER_HOME/bin

#add java
ADD jdk-8u211-linux-x64.tar.gz /opt/
ENV JAVA_HOME=/opt/jdk1.8.0_211
ENV PATH=$PATH:JAVA_HOME/bin

ADD code-server-3.2.0-linux-x86_64.tar.gz /opt
RUN mv /opt/code-server-3.2.0-linux-x86_64 /opt/vscode
ENV VSCODE_HOME=/opt/vscode
ENV PATH=$PATH:$VSCODE_HOME

ENV PASSWORD=pytorch
ENV PORT=8080
COPY *.sh /
RUN chmod 700 /*.sh

COPY README.md / 

#ENTRYPOINT /start.sh
