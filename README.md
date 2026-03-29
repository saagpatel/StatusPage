# StatusPage.sh

[![Rust](https://img.shields.io/badge/Rust-dea584?style=flat-square&logo=rust)](#) [![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](#)

> Self-hosted status page with the monitoring built in — no third-party dependency required

StatusPage.sh is an open-source status page platform with automated HTTP, TCP, DNS, and ICMP monitoring. Run it yourself with Docker, or use the managed paid beta. Incidents update in real time; subscribers get email notifications; webhooks fire on every status change.

## Features

- **Automated monitoring** — HTTP, TCP, DNS, and ICMP health checks with configurable intervals and thresholds, run by a standalone Rust monitor binary
- **Incident management** — manual incident creation with status updates, timeline entries, and service impact tracking
- **Real-time updates** — dashboard and public status page react to incident and service changes without refresh
- **Email subscribers + webhooks** — subscriber verification, SMTP delivery, signed webhook delivery with retry and admin visibility
- **90-day uptime history** — server-rendered public status page with uptime percentage bars per service
- **Self-hostable** — MIT licensed core; local Docker stack included
- **GitHub OAuth auth** — Auth.js v5 with GitHub OAuth; no password management required

## Quick Start

### Prerequisites
- Docker and Docker Compose
- GitHub OAuth app (client ID + secret)

### Installation
```bash
git clone https://github.com/saagpatel/StatusPage
cd StatusPage
cp .env.example .env
# Fill in GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET, DATABASE_URL
docker compose up
```

### Usage
Open `http://localhost:3000`. The monitor binary starts automatically and begins health checks on configured services.

## Tech Stack

| Layer | Technology |
|-------|------------|
| Language | Rust (Axum 0.8) + TypeScript |
| Frontend | Next.js 16 (App Router) + shadcn/ui + Tailwind CSS v4 |
| Database | PostgreSQL 16 |
| Monitor | Standalone Rust binary with cron scheduler |
| Auth | Auth.js v5 + GitHub OAuth |
| Monorepo | Turborepo + pnpm workspaces |

## Architecture

The monorepo contains four packages: the Axum API server, the Next.js web frontend, the standalone monitor binary, and shared Rust types. The monitor runs independently of the API, writing check results directly to Postgres; the API reads those results for the status page and dashboard. Realtime status updates are delivered via Server-Sent Events from the Next.js App Router, avoiding a separate WebSocket server. The webhook delivery system uses a Postgres-backed queue with exponential backoff retries and HMAC-SHA256 signature verification.

## License

MIT