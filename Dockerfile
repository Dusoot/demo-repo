FROM maven:3.8.3-openjdk-17 as build

RUN mkdir build
WORKDIR build
COPY pom.xml .
RUN mvn dependency:go-offline

RUN mkdir src
COPY src src
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:17-jdk-slim
COPY --from=build /build/target/* .

CMD [ "java", "-jar", "demo-0.0.1-SNAPSHOT.jar" ]
