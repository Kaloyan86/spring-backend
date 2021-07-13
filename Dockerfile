FROM openjdk:14-jdk-alpine
RUN wget http://apache.cbox.biz/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar xzvf apache-maven-3.6.3-bin.tar.gz
ENV PATH="/apache-maven-3.6.3/bin/:${PATH}"
COPY . .
RUN mvn package
ENTRYPOINT ["java","-jar","./target/spring-backend.0.0.1.jar"]
