# Dockerized Full Stack Deployment

Production-style Docker deployment setup with Nginx reverse proxy, Docker Compose orchestration, health checks, and operational scripts.

## Overview
This project demonstrates a production-style Docker deployment setup for a sample full-stack web application. It uses Docker for containerization, Docker Compose for service orchestration, and Nginx as a reverse proxy in front of the application container. The repository also includes operational scripts for deployment, restart, log inspection, cleanup, and health verification.

## Objective
The purpose of this repository is to showcase hands-on DevOps deployment practices such as containerized application delivery, reverse proxy configuration, safe environment management, and repeatable operational workflows.

## Architecture
- **Request Flow**: `User Request -> Nginx Reverse Proxy -> Node.js App Container -> Response`
- **Port Mapping**: The reverse proxy is exposed on Host Port `80`. The Node.js application runs internally on Port `3000`.
- **Service Roles**: Nginx handles proxy passing and traffic routing; Node handles actual computing endpoints.

## Project Structure
```text
dockerized-fullstack-deployment/
├── app/                  # Node.js source code
├── nginx/                # Reverse proxy setup
├── scripts/              # Bash operations scripts
├── screenshots/          # Visual validations
├── docs/                 # Documentation references
├── docker-compose.yml    # Service Orchestration file
└── Dockerfile            # Container build instructions
```

## Tech Stack
- Docker
- Docker Compose
- Nginx
- Node.js
- Express.js
- Linux shell scripting

## Features
- Application containerization
- Reverse proxy setup
- Env variable templating
- Deployment, restart, logs, and cleanup scripts
- Automated health validation via bash scripts

## Prerequisites
- Docker installed
- Docker Compose available
- Git installed
- Linux/macOS terminal or compatible shell

## Setup Instructions
1. Clone the repository locally: `git clone <repository_url>`
2. Copy the `.env` template: `cp .env.example .env`
3. Execute the deployment script: `./scripts/deploy.sh`
   (Or run manually: `docker compose up -d --build`)
4. Test in browser by navigating to `http://localhost:80/`
5. Test the application API endpoint via `http://localhost/api/health`

## Deployment Workflow
The deployment starts by pulling the lightweight node image and compiling the application container locally. Docker Compose then spins up the app and nginx network services. Nginx routes traffic on port 80, forwarding it safely out of the public host IP directly into the container stack via an internal virtualized proxy. Validation with the provided scripts lets you check real-time stability.

## Nginx Reverse Proxy Configuration
An Nginx service acts as the primary incoming request handler, masking the underlying execution details of the app server. Using a proxy_pass rule to forward requests on standard HTTP protocol makes this architecture more production-like than exposing the node app ports directly.

## Environment Variables
- `.env.example` acts as a safe template defining parameters like port assignments.
- A real `.env` populated with these configs should never be committed to source-control.
- This codebase explicitly isolates its secrets from version control.

## Operational Scripts
- `deploy.sh`: Builds and starts services sequentially.
- `restart.sh`: Restarts containers gracefully.
- `logs.sh`: Tails real-time server activity output from Nginx and Node.
- `cleanup.sh`: Wipes unused Docker resources to maintain server hygiene.
- `healthcheck.sh`: Hits the health API directly to verify successful boot.

## Useful Docker Commands
You can review the core functionality and raw commands used for this pipeline inside [`docs/commands-reference.md`](docs/commands-reference.md).

## Validation and Testing
- Application loads perfectly in a standard web browser on port 80.
- Health endpoint returns a strict JSON Success object.
- `docker ps` correctly visualizes two active and linked service nodes.

## Troubleshooting
Please look into [`docs/troubleshooting.md`](docs/troubleshooting.md) for regular Docker port-collision, crash loop, and container restart loop fixes.

## Security Considerations
- No direct container ports are physically exposed to the public.
- Secrets stay strictly outside version history.
- The reverse proxy neatly separates architectural access entry points.
- Production equivalents of this setup could securely expand to standard HTTPS domains (e.g. Let's Encrypt).

## Key Learnings
I gained a strong fundamental understanding of composing scalable deployment environments. Working with Bash and Docker orchestration helped me grasp day-to-day DevOps maintenance cycles.

## Future Improvements
- Add structured CI/CD automation logic.
- Add Let's Encrypt HTTPS functionality to the Nginx config.
- Imbue a mult-stage Docker build pipeline mapping to minify container size.
- Include a specific health check probe hook straight into the Compose file.
- Add standard multi-environment overrides (Staging/Production).

## Screenshots
*(Add screenshots of the browser homepage, `docker ps`, `logs-output` under the `/screenshots` directory in the repository here.)*
# dockerized-fullstack-deployment
