# FROM openjdk:17

# WORKDIR /app

# COPY *.jar /app/helloApp.jar

# EXPOSE 8080

# CMD ["java", "-jar", "helloApp.jar"]

FROM openjdk:11-jre
VOLUME /tmp
ADD target/HelloWorldApp-1.0.0.jar HelloWorldApp.jar
ENTRYPOINT ["java","-jar","/HelloWorldApp.jar"]
