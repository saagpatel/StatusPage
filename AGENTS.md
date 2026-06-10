# AGENTS.md

<!-- comm-contract:start -->

## Communication Contract

- Inherit global Codex communication and reporting rules from `/Users/d/.codex/AGENTS.override.md` and `/Users/d/.codex/policies/communication/BigPictureReportingV1.md`.
- Repo-specific instructions below add project constraints only; do not restate global voice or status-reporting rules here.
<!-- comm-contract:end -->

## Inherited Operating Rules

- Inherit global git, review/fix, testing, docs, skill-use, and reporting gates from `/Users/d/.codex/AGENTS.md` and active session instructions.
- Use `.codex/verify.commands` and `.codex/scripts/run_verify_commands.sh` as this repo's local verification authority when present.
- Keep the project-specific portfolio constraints below as the source of truth for runtime, privacy, and release risks.

<!-- portfolio-context:start -->
# Portfolio Context

## What This Project Is

StatusPage.sh is a self-hostable status page platform with built-in HTTP, TCP, DNS, and ICMP monitoring. It combines a public status page, incident management, subscriber notifications, signed webhooks, and a standalone Rust monitor binary.

## Current State

The repo is active product work. The README frames the product as open-source self-hosted core plus managed paid beta. Current local changes touch PR-template metadata, so portfolio recovery should stay documentation-only.

## Stack

| Layer | Technology |
|-------|------------|
| Language | Rust (Axum 0.8) + TypeScript |
| Frontend | Next.js 16 (App Router) + shadcn/ui + Tailwind CSS v4 |
| Database | PostgreSQL 16 |
| Monitor | Standalone Rust binary with cron scheduler |
| Auth | Auth.js v5 + GitHub OAuth |
| Monorepo | Turborepo + pnpm workspaces |

## How To Run

- Copy `.env.example` to `.env` and fill the GitHub OAuth and database settings.
- Run the local stack with `docker compose up`.
- Open `http://localhost:3000`; the monitor binary starts automatically and begins health checks on configured services.

## Known Risks

- Monitor checks and incident updates write operational state into Postgres; avoid destructive database resets unless explicitly requested.
- Webhook delivery uses HMAC signatures and retry behavior; preserve signature verification when changing delivery code.
- Auth depends on GitHub OAuth; do not commit OAuth secrets or local `.env` values.
- Keep PR-template drift separate from product/runtime changes.

## Next Recommended Move

Resolve the existing PR-template drift separately, then verify the monitor, incident, subscriber, and webhook paths before changing runtime behavior.

<!-- portfolio-context:end -->
