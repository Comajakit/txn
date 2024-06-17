# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17-slim as builder

WORKDIR /app

COPY txn/pom.xml .
COPY txn/src ./src

RUN mvn clean package -DskipTests

# Stage 2: Runtime image
FROM openjdk:17-slim as runtime

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8084

CMD ["java", "-jar", "app.jar"]

# Stage 3: Test image
FROM python:3.9-slim as tester

WORKDIR /app

# Install Robot Framework and RequestsLibrary
RUN pip install robotframework robotframework-requests

COPY --from=runtime /app/app.jar app.jar
COPY txn/integration_tests.robot .

# Run the application and tests
CMD ["sh", "-c", "java -jar app.jar & robot integration_tests.robot"]