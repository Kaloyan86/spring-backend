FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=12345
ENV MYSQL_PASSWORD=12345
ENV MYSQL_DATABASE=rest_api_crud_db
	  
FROM maven:latest as biuld 
COPY src /emo/src
COPY pom.xml /emo/
RUN mvn -f /emo/pom.xml clean package

FROM openjdk:14
COPY --from=build /emo/target/spring-backend-0.0.1.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]	  
