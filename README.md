# Microservices Architecture Components

This project is made because of microservices developers. In microservices development environment make developer difficult to develop thier microservice.

## Environment Details

This project is built microservices components to make developer easy to develop microservice.
There are many components in Microservices Architecture. The main components are:

* Service Discovery
* Service Tracing (Distributed Tracing Systemt)
* Message Broker
* Config Server
* Database Server
* API Gateway (Does not exist yet)
* Identity Provider (Does not exist yet)
* Static Content (Does not exist yet)

## Setup

In order to use this project, you must first include the following in a file named `.env`. I have provided an example environment variable file here [.env-example](https://github.com/seanghai-cheu/ms-components/blob/master/service-tracing/.env-example). It is in service-tracing directory.

> Copy `.env-example` to  `.env` 


## How to run microservices components

Start all components

```bash
ms.sh start
```

Stop all components

```
./ms.sh stop
```

## Authors

* Cheu Seanghai
