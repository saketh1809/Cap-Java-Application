FROM maven:3.9.4-eclipse-temurin-17
FROM openjdk:latest

# RUN apt-get install openjdk-17-jdk -y
RUN mvn clean package
WORKDIR /webapp
COPY --from=builder /app/target/*.jar app.jar
# COPY pom.xml ./



# WORKDIR /src/main/java/com/mt/services

COPY . .

EXPOSE 8080

# CMD ["java", "EmployeeService.java"]
CMD ["java", "-jar", "app.jar"]