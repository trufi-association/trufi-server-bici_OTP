#
# Build stage
#
FROM maven:3.9.0 AS build
COPY OpenTripPlanner /home/OpenTripPlanner
WORKDIR /home/OpenTripPlanner
RUN mvn -DskipTests=true package

#
# Package stage
#
FROM openjdk:19
COPY --from=build /home/OpenTripPlanner/target/otp-2.3.0-SNAPSHOT-shaded.jar /usr/local/lib/otp.jar
COPY map /usr/local/lib/data
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/otp.jar","--build","/usr/local/lib/data","--serve"]
