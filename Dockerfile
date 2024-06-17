# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17-slim as builder

WORKDIR /app

COPY txn/pom.xml .
COPY txn/src ./src

RUN mvn clean package -DskipTests

# Stage 2: Runtime image
FROM openjdk:17-slim as runtime

WORKDIR /app

# Install curl
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8084

CMD ["java", "-jar", "app.jar"]