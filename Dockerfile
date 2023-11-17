# Dockerfile with conventional Java Application build with Gradle
FROM eclipse-temurin:17-jdk-jammy as build

WORKDIR /app

COPY build.gradle .
COPY gradlew .
COPY settings.gradle .
COPY gradle/ ./gradle
COPY src/ ./src

RUN ./gradlew build


# Expose /target content 
FROM scratch AS binaries
COPY --from=build /app/build /
