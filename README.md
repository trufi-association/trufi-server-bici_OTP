# OTP Bike Safety Server

Is an OpenTripPlanner server that provides a platform for routing and scheduling cycling trips considering a safety factor.

# Getting Started

Run the following command to start the service:

```shell
docker compose up -d
```

# Prerequisites

- Docker installed
- OpenStreetMap file with the safety factor tag set to the required components (routes, stops...) inside the data folder


# Installation

Run the following command to build the docker image:

```
docker compose build
```
