# Use an official OpenJDK runtime as a parent image
FROM openjdk:8

# Set the working directory in the container
WORKDIR /app

# Copy all files
COPY target/contact-backend-app.jar /app

# Make port 9090 available to the world outside this container
EXPOSE 9090

# Run the .jar file
ENTRYPOINT ["java", "-jar", "contact-backend-app.jar"]



