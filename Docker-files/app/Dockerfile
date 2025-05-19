# === Stage 1: Build WAR using Maven ===
FROM maven:3.9.9-eclipse-temurin-21-jammy AS builder

# Set workdir
WORKDIR /build

# Clone vprofile source code and switch branch
RUN apt-get update && apt-get install -y git && \
    git clone -b containers https://github.com/hkhcoder/vprofile-project.git . && \
    mvn clean install -DskipTests

# === Stage 2: Run app on Tomcat ===
FROM tomcat:10-jdk21
LABEL "project"="vprofile"
LABEL "AUTHOR"="bahy"

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from the builder stage
COPY --from=builder /build/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# CMD already defined in base image (catalina.sh run)
CMD ["catalina.sh", "run"]