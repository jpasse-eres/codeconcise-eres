# CodeConcise Eres

This repository contains a Docker wrapper for the CodeConcise application, it is designed to create docker images containing a Neo4j instance prepopulated by using the CodeConcise tool, as well as the CodeConcise web frontend application.

## Prerequisites

- Docker installed on your machine.
- Docker buildx plugin installed. You can find the installation instructions [here](https://github.com/docker/buildx).
- just command runner installed. You can find the installation instructions [here](https://github.com/casey/just).

## Configure Environment Variables

Before running the build commands, you need to set up some environment variables. You can do this in the [config.env](./config.env) file.

You will have to set the NEO4J_PASSWORD value to a secure password of your choice, and set the OS_TYPE variable to either `linux` (linux is valid for mac) or `windows` depending on your operating system.

## Run Docker image from tar file

- Using script:

```bash
./start_db.sh
```

## Update Dump

- You will need to [reset the neo4j dump file](#set-neo4jdump-file) whenever you want to update the data in the database.
- You will need to rebuild tar file for linux and windoss using the [commands below](#build-docker-image-tar-file).

## Set neo4j.dump file

The repository expects a `neo4j.dump` file to be present in the root directory. This file is used to populate the Neo4j database in the Docker image. You can generate this dump file using the CodeConcise tool.
Desktop instructions to create dump file can be found [here](https://neo4j.com/docs/desktop/current/operations/database-management/).
CLI instructions to create dump file can be found [here](https://neo4j.com/docs/operations-manual/current/kubernetes/operations/dump-load/).

## Commands

### Build docker image tar file

- macOS / Linux

```bash
just build-db-tar-linux
```

- windows

```bash
just build-db-tar-windows
```
