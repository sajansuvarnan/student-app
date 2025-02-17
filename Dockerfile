# Use the official OpenJDK 23 slim image as the base image
FROM openjdk:23-slim

# Set the working directory to /app
WORKDIR /app

# Copy only the generated JAR file to the container (assuming it's built outside the container)
COPY target/student-app.jar student-app.jar

# Copy the schema.sql and data.sql files to /docker-entrypoint-initdb.d/
COPY src/main/resources/schema.sql /docker-entrypoint-initdb.d/
COPY src/main/resources/data.sql /docker-entrypoint-initdb.d/

# Set the entry point to run the JAR file using Java
ENTRYPOINT ["java", "-jar", "/app/student-app.jar"]

##commands for docker compose execution(2 or more container)
#docker-compose up --build#
#docker-compose down

##commands for execution
#docker build -t rest-demo .
#docker run -p 8080:8080 rest-demo