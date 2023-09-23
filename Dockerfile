FROM openjdk:17

WORKDIR /app

COPY *.jar /app/helloApp.jar

EXPOSE 8080

CMD ["java", "-jar", "helloApp.jar"]