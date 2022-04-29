#!/bin/bash

start_config_server()
{
    printf "\n\n::::::::::::::::::: STARTING CONFIG SERVER \n";
    docker-compose -f config-server/docker-compose.yml up -d
    printf "::::::::::::::::::: STARTED CONFIG SERVER \n";
}

start_service_discovery()
{
    printf "\n\n::::::::::::::::::: STARTING SERVICE DISCOVERY \n";
    docker-compose -f service-discovery/docker-compose.yml up -d
    printf "::::::::::::::::::: STARTED SERVICE DISCOVERY \n";
}

start_database_server()
{
    printf "\n\n::::::::::::::::::: STARTING DATABASE SERVER \n";
    docker-compose -f database-server/docker-compose.yml up -d
    printf "::::::::::::::::::: STARTED DATABASE SERVER \n";
}

start_service_tracing()
{
    if [ ! -f "service-tracing/secrets/elasticsearch.keystore" ] ; then
        printf "\n\n::::::::::::::::::: STARTING GENERATE CERTIFICATES \n";
        docker-compose -f service-tracing/docker-compose-certs-elk.yml run --rm certs-elk
    fi

    printf "\n\n::::::::::::::::::: STARTING SERVICE TRACING \n";
    docker-compose -f service-tracing/docker-compose.yml up -d
    printf "::::::::::::::::::: STARTED SERVICE TRACING \n";
}

start_message_broker()
{
    printf "\n\n::::::::::::::::::: STARTING MESSAGE BROKER \n";
    docker-compose -f message-broker/docker-compose.yml up -d
    printf "::::::::::::::::::: STARTED MESSAGE BROKER \n";
}

stop_config_server()
{
    printf "\n\n::::::::::::::::::: STOPPING CONFIG SERVER \n";
    docker-compose -f config-server/docker-compose.yml down --remove-orphans
    printf "::::::::::::::::::: STOPPED CONFIG SERVER \n";
}

stop_service_discovery()
{
    printf "\n\n::::::::::::::::::: STOPPING SERVICE DISCOVERY \n";
    docker-compose -f service-discovery/docker-compose.yml down --remove-orphans
    printf "::::::::::::::::::: STOPPED SERVICE DISCOVERY \n";
}

stop_database_server()
{
    printf "\n\n::::::::::::::::::: STOPPING DATABASE SERVER \n";
    docker-compose -f database-server/docker-compose.yml down --remove-orphans
    printf "::::::::::::::::::: STOPPED DATABASE SERVER \n";
}

stop_message_broker()
{
    printf "\n\n::::::::::::::::::: STOPPING MESSAGE BROKER \n";
    docker-compose -f message-broker/docker-compose.yml down --remove-orphans
    printf "::::::::::::::::::: STOPPED MESSAGE BROKER \n";
}

stop_service_tracing()
{
    printf "\n\n::::::::::::::::::: STOPPING SERVICE TRACING \n";
    docker-compose -f service-tracing/docker-compose.yml down --remove-orphans
    printf "::::::::::::::::::: STOPPED SERVICE TRACING \n";
}

stop_all()
{
    stop_config_server
    stop_service_discovery
    stop_database_server
    stop_message_broker
    stop_service_tracing
}

start_all()
{
    start_config_server
    start_service_discovery
    start_database_server
    start_message_broker
    start_service_tracing
}

help()
{
    printf "start   : start all services. \n";
    printf "stop    : stop all services. \n";
}

if [ $# = 1 ] ; then
    if [ $1 = "start" ] ; then
        start_all
    elif [ $1 = "stop" ] ; then
        stop_all
    else
        help
    fi
else
    help
fi