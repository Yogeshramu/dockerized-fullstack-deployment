# Deployment Guide

This document outlines the workflow required to successfully deploy this application using the provided operational scripts.

## Prerequisites

- **Docker** and **Docker Compose** installed on your server or local machine.
- Git or access to this codebase.
- A compatible Linux/macOS terminal or compatible shell.

## Setup Steps

1. Clone the repository to your host instance.
2. Copy the example environment variable file:
   ```bash
   cp .env.example .env
   ```
3. Update any secrets inside `.env` as required (ensure this file is kept private).

## Build and Run Steps

To automate the build and startup, use the provided deployment script:
```bash
./scripts/deploy.sh
```

Alternatively, manually execute:
```bash
docker compose up -d --build
```

## Verification

After the services start, verify their active state:
- Using Docker output: `docker ps`
- Using the provided health script: `./scripts/healthcheck.sh`
- By verifying the browser responds at `http://localhost/`

## Stop and Restart Workflow

To safely restart the services to pick up recent configuration changes or resolve transient issues:
```bash
./scripts/restart.sh
```
