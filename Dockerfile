# FROM openjdk:17

# WORKDIR /app

# COPY *.jar /app/helloApp.jar

# EXPOSE 8080

# CMD ["java", "-jar", "helloApp.jar"]

FROM openjdk:11-jre
VOLUME /tmp
ADD target/springBootDocker-1.0.0.jar springBootDocker.jar
ENTRYPOINT ["java","-jar","/springBootDocker.jar"]
