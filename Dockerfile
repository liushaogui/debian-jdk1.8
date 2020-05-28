FROM centos:7.8.2003

MAINTAINER runcare<larrygui@foxmail.com>

ARG JDK_VERSION="jdk-8u251-linux-x64.tar.gz"
#ENV	JDK_DOWNLOAD_URL  http://cdn01.qikesh.com/jdk/$JDK_VERSION
ENV 	JDK_DOWNLOAD_URL  https://darensh.oss-cn-shanghai.aliyuncs.com/jdk/$JDK_VERSION

RUN mkdir -p /tmp/dependencies  \
    mkdir -p /usr/local/java  \
	&& curl -L --silent $JDK_DOWNLOAD_URL >  /tmp/dependencies/$JDK_VERSION  \
	&& tar -xzf /tmp/dependencies/$JDK_VERSION -C /usr/local/java  \
	&& rm -rf /tmp/dependencies

#如果修改JDK_VERSION中的版本号，需要对应修改JAVA_HOME路径中的版本
ENV JAVA_HOME /usr/local/java/jdk1.8.0_251
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
#设置时区为上海
ENV TZ Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
