FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD = 12345
ENV MYSQL_PASSWORD = 12345
ENV MYSQL_DATABASE = rest_api_crud_db

FROM maven:3.8.1-openjdk-15-slim as build
COPY src /app/src
COPY pom.xml /app/
RUN mvn -B -f /app/pom.xml  clean package
FROM openjdk:14
COPY --from=build /app/target/spring-backend-0.0.1.jar app.jar
ENTRYPOINT [ "java", "-jar","/app.jar" ]
