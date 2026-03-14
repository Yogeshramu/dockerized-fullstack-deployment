# Architecture Overview

The architecture of this project is composed of a lightweight reverse proxy and an application container, set up for a production-style flow.

## Request Flow

1. **User Request**: Incoming HTTP requests land on the host machine.
2. **Nginx Reverse Proxy**: Connects incoming requests to the internal services. Listens on port `80`.
3. **Node.js App Container**: The core Express.js application handling the actual endpoints, running internally on port `3000`.

## Port Mapping

- **Nginx Container**: `Host 80` -> `Container 80`
- **App Container**: Running locally on `3000`, exposed within the Docker network, but not bound to a host port directly (only accessible via Nginx proxy).

## Service Roles

- **Nginx**: Central entry point, handles proxy passing, intercepts requests.
- **App**: Implements endpoints (`/`, `/api/health`, `/api/contact`) returning UI and API JSON responses.
