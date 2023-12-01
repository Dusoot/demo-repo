FROM maven:3.8.3-openjdk-17 as build

RUN mkdir build
WORKDIR build
COPY pom.xml .
RUN mvn dependency:go-offline

ADD src/ src

RUN mvn package -Dmaven.test.skip=true

FROM openjdk:17-jdk-slim
COPY --from=build /build/target/* .

EXPOSE 8888

CMD [ "java", "-jar", "demo-0.0.1-SNAPSHOT.jar" ]
