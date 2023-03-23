#
# Package stage
#
FROM openjdk:19
WORKDIR /usr/local/lib
RUN microdnf update && microdnf install --nodocs wget unzip && microdnf clean all && rm -rf /var/cache/yum
RUN wget https://repo1.maven.org/maven2/org/opentripplanner/otp/2.2.0/otp-2.2.0-shaded.jar
COPY map /usr/local/lib/data
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/otp-2.2.0-shaded.jar","--build","/usr/local/lib/data","--serve"]
