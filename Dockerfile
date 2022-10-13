FROM ghcr.io/graalvm/graalvm-ce:22.2.0

RUN gu install native-image
RUN curl https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz --output /tmp/maven.tar.gz
RUN tar -xf /tmp/maven.tar.gz -C /usr/
RUN mv /usr/apache-maven-3.8.6 /usr/maven

ENV MAVEN_HOME=/usr/maven

WORKDIR /code

COPY pom.xml /code/pom.xml
COPY src /code/src

RUN /usr/maven/bin/mvn package -P native
RUN chmod +x /code/target/module-sample

CMD /code/target/module-sample