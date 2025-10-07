# FROM maven:3.9.4-eclipse-temurin-17
# FROM openjdk:17-jdk-slim

# RUN apt-get install openjdk-17-jdk -y

# WORKDIR /app
# COPY . .
# RUN mvn clean package


# WORKDIR /app
# COPY --from=builder /app/target/*.jar app.jar

# COPY pom.xml ./

# WORKDIR /src/main/java/com/mt/services

# COPY . .

# EXPOSE 8080

# CMD ["java", "EmployeeService.java"]
# CMD ["java", "-jar", "app.jar"]

# Stage 1: Build the application
FROM maven:latest AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
 
# Stage 2: Deploy to Tomcat
FROM tomcat:9.0
COPY --from=build /app/target/maven-web-application.war /usr/local/tomcat/webapps/ROOT.war
 
EXPOSE 8080
 
CMD ["catalina.sh", "run"]
 