# Use an official Maven + JDK image as base (has Java + Maven pre-installed)
FROM maven:3.9.11-eclipse-temurin-17 AS build
# Set working directory inside container
WORKDIR /app
# Copy all project files into container
CPOY ..
# Build the Spring Boot JAR inside container
RUN mvn clean package -DskipTests
# ------------------------------
# Second stage: runtime image
# ------------------------------
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose Spring Boot port
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
