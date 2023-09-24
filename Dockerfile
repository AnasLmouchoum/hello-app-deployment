# FROM openjdk:17

# WORKDIR /app

# COPY *.jar /app/helloApp.jar

# EXPOSE 8080

# CMD ["java", "-jar", "helloApp.jar"]

# Use a base image with Java and Maven installed
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and other necessary files
COPY pom.xml ./
COPY src ./src

# Build the application with Maven
RUN mvn clean package -DskipTests

# Use a base image with Java only
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files from the build stage
COPY --from=build /app/target/*.jar ./app.jar

# Expose the desired port(s)
EXPOSE 8080

# Specify the command to run the application
CMD ["java", "-jar", "app.jar"]
