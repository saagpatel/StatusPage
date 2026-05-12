# StatusPage.sh — Portfolio Disposition

**Status:** Active (self-hosted service, open-core with managed
paid beta) — **Rust monitor binary** (HTTP / TCP / DNS / ICMP
health checks) + **Docker self-hostable** core + **Auth.js v5
with GitHub OAuth** + email subscribers + signed webhooks + 90-day
uptime history + incident management on `origin/main`. **Fourth
self-hosted service cluster member.** Introduces new sub-shape:
**open-core with managed paid beta** — MIT-licensed core that
operator also offers as a SaaS tier. Distinct commercial-open-source
business model, first in portfolio.

> Disposition uses strict `origin/main` verification.
> **Open-core + managed paid beta is a new commercial sub-shape.**

---

## Verification posture

Only `origin` (`saagpatel/StatusPage`). Clean migration state.

`origin/main`:

- Tip: `47cb40e` chore: add initial CHANGELOG
- Recent commits are OSS scaffolding wave only (CHANGELOG, PR
  template, issue templates, CoC, Makefile, Dependabot,
  contributing, security policy)
- Earlier substantive feat commits are squashed / not visible in
  recent log (the canonical state shows full architectural
  backbone via tree, not via commit history)
- Repo tree (`origin/main`):
  - `Cargo.toml` + `Cargo.lock` (Rust monitor binary)
  - `apps/` (likely monorepo with multiple frontend / backend
    surfaces)
  - `docker/` + Dockerfile referenced in README + `.dockerignore`
  - `.perf-baselines/` (same QA pattern as IncidentReview)
  - `.env.example` + `.env.production.example` (dual env
    posture — dev vs production-self-hosted)
  - Standard scaffolding
- Default branch: `main`

---

## Current state in one paragraph

StatusPage.sh is an **open-source status page platform with the
monitoring built in** — no third-party dependency required. Run
self-hosted with Docker or use the **managed paid beta**.
Architecture: a **standalone Rust monitor binary** runs HTTP /
TCP / DNS / ICMP health checks against configured services on
configurable intervals and thresholds; an incident management UI
handles manual incident creation + status updates + timeline +
service impact tracking; dashboard and public status page update
in real time without refresh; subscribers verify email and
receive notifications; webhooks fire signed deliveries on every
status change with retry + admin visibility; public status page
is server-rendered with 90-day uptime percentage bars per service.
**Auth.js v5 with GitHub OAuth** — no password management.
**MIT-licensed core**. Local Docker stack included
(`docker compose up`).

The recent visible commit history is the OSS scaffolding wave;
the substantive features are in tree but not visible in the
recent commit log (likely squashed in earlier history or
condensed during the open-core release prep).

---

## Why "Active (self-hosted service, open-core)" — fourth cluster member, new sub-shape

The self-hosted service cluster gains a fourth member with a new
sub-shape:

| Member | Audience | Hosting | Commercial model |
|---|---|---|---|
| RedditSentimentAnalyzer (R10) | External users | launchd + nginx (operator's machine) | Personal hobby |
| IT Service Health (R17.4) | Box IT (employer) | launchd + Caddy + Cloudflare Tunnel | Internal corporate tool |
| DNSWatcher (R18.5) | Public | Container (Render / Fly / Koyeb) | Public-facing free service |
| **StatusPage.sh** | **Public** | **Docker self-host OR managed paid beta** | **Open-core MIT + paid SaaS tier** |

This is the first portfolio repo with a **commercial
open-source business model**:
- **MIT-licensed core** → self-hosters can run it free
- **Managed paid beta** → operator offers a SaaS tier (run the
  hosting + monitoring + subscriber emails for users who don't
  want to self-host)

Future operator projects following this open-core pattern batch
here. The commercial framing is genuinely different from prior
self-hosted-service members:
- Hobby (RSA): no commercial expectation
- Internal (ITSH): employer-funded, no public tier
- Public free (DNSWatcher): no commercial tier yet (operator-funded
  alpha)
- **Open-core + paid SaaS (StatusPage.sh)**: dual distribution
  with clear commercial intent

State is Active because:
- Operator hasn't declared the paid beta out of beta
- Recent commits are scaffolding (release readiness), not features
- No production deployment URL declared
- `.env.production.example` suggests production env template is
  pending operator hardening

---

## Cluster taxonomy update

| Cluster | Count | Sub-shapes |
|---|---|---|
| **Self-hosted service** | **4** | personal-for-external (RSA) / corporate-context-internal (ITSH) / public-facing-container (DNSWatcher) / **open-core-with-paid-beta (StatusPage.sh)** |
| (others unchanged) | | |

Self-hosted service cluster reaches 4 with 4 distinct sub-shapes
— matches operator-tool cluster's maturity pattern. **Most
business-model-diverse cluster in portfolio.**

---

## Unblock trigger (operator)

Two parallel paths — self-host vs managed beta:

### Self-host path
1. Verify `docker compose up` from a fresh clone produces a
   working status page.
2. **GitHub OAuth app onboarding UX** — self-hosters need to
   create their own OAuth app; document clearly.
3. **SMTP delivery** — self-hosters need SMTP credentials for
   subscriber emails; document common providers (SendGrid,
   Postmark, AWS SES).
4. **Webhook signing key rotation** for users adopting webhooks.
5. **Database migration strategy** for v1.1+ schema changes
   (DATABASE_URL implied — Postgres).

### Managed paid beta path
1. **Pick managed hosting infrastructure** — multi-tenant or
   single-tenant per customer?
2. **Pricing model** — flat tier vs per-service-monitored.
3. **Billing integration** — Stripe / LemonSqueezy?
4. **SLA + uptime guarantees** for paying customers.
5. **Data segregation** between self-hosters and managed
   customers (no shared infrastructure).

Estimated operator time:
- Self-host release-readiness: ~4-6 hours
- Managed beta launch: ~30-60 hours (full SaaS infrastructure)

---

## Portfolio operating system instructions

| Aspect | Posture |
|---|---|
| Portfolio status | `Active (self-hosted service, open-core + managed paid beta)` |
| Distribution channel | **Docker self-host (free, MIT) OR managed paid beta (operator-run SaaS)** |
| Audience | **Public users + paying SaaS customers** |
| Review cadence | Active — driven by self-host release readiness + managed beta launch decision |
| Resurface conditions | (a) Self-host release readiness (docker compose works on fresh clone), (b) managed beta launch decision, (c) GitHub OAuth API change, (d) DNS / HTTP / TCP / ICMP monitor protocol changes, (e) v1.1 scope |
| Co-batch with | Self-hosted service cluster — **now 4 repos with 4 sub-shapes** |
| Sub-shape | **Open-core with managed paid beta** (first commercial open-source in portfolio) |
| Special concern | **Open-core licensing discipline.** MIT core must be cleanly separated from any paid-tier-only features. Avoid "open-core but not really" situations where core is crippled. |
| Special concern | **Managed beta commercial commitment.** Operator should decide whether to ship the SaaS tier or just maintain open-core. |
| Special concern | **Multi-tenant SaaS infrastructure complexity** if managed beta proceeds. Data segregation + billing + SLA are real costs. |
| Special concern | **GitHub OAuth dependency** — Auth.js v5 + GitHub OAuth requires self-hosters to create OAuth apps. Friction for non-technical users. |

---

## Reactivation procedure

1. Verify branch tracking.
2. Review stash `r18-sp-stash` (just `.github/PULL_REQUEST_TEMPLATE.md`
   mod — minor).
3. Verify `docker compose up` from a fresh clone (real fresh,
   not the operator's working clone) produces a working status
   page accessible at `http://localhost:3000`.
4. Test Rust monitor binary against a real HTTP / TCP / DNS /
   ICMP target.
5. Verify GitHub OAuth flow end-to-end.
6. Decide self-host vs managed paid beta priority for next
   work session.
7. Run `cargo test` for the monitor binary.

---

## Last known reference

| Field | Value |
|---|---|
| `origin/main` tip | `47cb40e` chore: add initial CHANGELOG |
| Default branch | `main` |
| Build system | **Rust (Cargo workspace) monitor binary** + Node.js apps (monorepo `apps/`) + Auth.js v5 + Docker Compose + Postgres (implied via DATABASE_URL) |
| Distribution | **Docker self-host (MIT) OR managed paid beta** |
| Audience | **Public users + paying SaaS customers** |
| Distinguishing tech | **Self-hosted status page with monitoring built in** + Rust monitor binary (HTTP / TCP / DNS / ICMP) + Auth.js v5 GitHub OAuth + signed webhooks + email subscribers + 90-day uptime history + real-time updates |
| Business model | **Open-core (MIT) + managed paid beta (operator-run SaaS)** — first commercial open-source in portfolio |
| Migration state | No `legacy-origin` remote |
| Distinguishing feature | **Fourth self-hosted service cluster member; introduces open-core-with-paid-beta sub-shape (first commercial open-source in portfolio).** Self-hosted service cluster reaches 4 with 4 sub-shapes — most business-model-diverse cluster in portfolio. |
