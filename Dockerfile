FROM maven:3.8.3-openjdk-17

COPY . .

RUN mvn clean install -Dmaven.test.skip=true

CMD [ "java", "-jar", "/target/demo-0.0.1-SNAPSHOT.jar" ]
