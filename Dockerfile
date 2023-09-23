# FROM openjdk:17

# WORKDIR /app

# COPY *.jar /app/helloApp.jar

# EXPOSE 8080

# CMD ["java", "-jar", "helloApp.jar"]

FROM maven:3.8.4-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and other necessary files
COPY pom.xml ./
COPY src ./src

# Build the application with Maven
RUN mvn clean package -DskipTests

# Use a smaller base image for the runtime environment
FROM openjdk:17-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage to the runtime stage
COPY --from=build /app/target/your-application.jar ./your-application.jar

# Expose the desired port(s)
EXPOSE 8080

# Specify the command to run the application
CMD ["java", "-jar", "your-application.jar"]
