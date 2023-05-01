# Build stage
FROM maven:3.9.0 AS build
WORKDIR /home
RUN git clone https://github.com/trufi-association/OpenTripPlanner.git
WORKDIR /home/OpenTripPlanner
RUN git checkout bici-otp
RUN mvn -DskipTests=true package

# Package stage
FROM openjdk:19
COPY --from=build /home/OpenTripPlanner/target/otp-2.3.0-SNAPSHOT-shaded.jar /usr/local/lib/otp.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/otp.jar","--build","/usr/local/lib/data","--serve"]
