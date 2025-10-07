FROM openjdk:latest

# RUN apt-get install openjdk-17-jdk -y

COPY pom.xml ./

RUN mvn install

WORKDIR /src/main/java/com/mt/services

COPY . .

EXPOSE 8080

CMD ["java", "EmployeeService.java"]