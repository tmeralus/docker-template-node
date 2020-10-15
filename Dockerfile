

FROM tomcat:7.0.104-jdk8-openjdk
LABEL maintainer="Tedley Meralus <tmeralus@gmail.com>"

ARG buildno
ARG gitcommithash

RUN echo "Build number: $buildno"
RUN echo "Based on commit: $gitcommithash"

# create specific folders
RUN mkdir -p /opt/ccda
RUN mkdir -p /opt/ccda/vocab

RUN apt-get update
RUN apt-get install -y git

# Copy all configs from within repo dir
COPY test /opt/test

 
EXPOSE 8080
WORKDIR $CATALINA_HOME
CMD ["catalina.sh", "run"]
