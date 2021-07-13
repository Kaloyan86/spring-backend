FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=12345
ENV MYSQL_DATABASE=rest_api_crud_db
ENV MYSQL_PASSWORD=12345

FROM maven:latest as build
COPY src /spring-backend/src
COPY pom.xml /spring-backend/
RUN mvn -f /spring-backend/pom.xml clean package

FROM openjdk:14
COPY --from=build /spring-backend/target/spring-backend-0.0.1-jar app.jar
ENTRYPOINT [ "java", "-jar", "/app.jar" ]