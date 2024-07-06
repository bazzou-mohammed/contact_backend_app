# Use an official OpenJDK runtime as a parent image
FROM openjdk:17

# Set the working directory in the container
WORKDIR /usr/app/

# Copy all files
COPY target/contact-backend-service-0.0.1-SNAPSHOT.jar /usr/app/

# Make port 9090 available to the world outside this container
EXPOSE 9090

# Run the .jar file
ENTRYPOINT ["java", "-jar", "contact-backend-service-0.0.1-SNAPSHOT.jar"]
