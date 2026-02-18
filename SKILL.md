---
name: startup-factory
description: Deploy a constellation of 7 AI agents that build and operate a startup end-to-end — from market research to launch to ongoing operations. Initialize with one command, approve at phase gates.
user-invocable: true
metadata: {"openclaw": {"emoji": "🏭", "homepage": "https://github.com/appevolve/startup-factory", "requires": {"bins": ["git"]}, "install": [{"id": "git-clone", "kind": "download", "url": "https://github.com/appevolve/startup-factory.git", "label": "Clone Startup Factory repo"}]}}
---

# Startup Factory

Deploy 7 specialized AI agents to build and operate a startup.

## Quick Start

```bash
# Initialize a new startup
{baseDir}/bin/sf init "Your startup idea here"

# Check status
{baseDir}/bin/sf status

# Approve a phase gate
{baseDir}/bin/sf approve
```

## What It Does

When you run `sf init`, Startup Factory creates a complete multi-agent OpenClaw workspace with:

- **🧠 CEO** — Orchestrator that manages the pipeline and communicates with you
- **🔬 Scout** — Market research, competitive analysis, validation scoring
- **📋 PM** — PRD, user stories, sprint planning, MVP scoping
- **🎨 Design** — Design system, wireframes, landing page, brand assets
- **👨‍💻 Engineer** — Full-stack development, testing, deployment, CI/CD
- **📣 Marketing** — GTM strategy, content, email sequences, Product Hunt launch
- **💰 Ops** — Legal docs, financial model, support playbook, analytics

## Pipeline Phases

1. **Discovery** (Day 1-2) — Scout researches → you approve direction
2. **Definition** (Day 2-3) — PM creates PRD → you approve scope
3. **Design** (Day 3-4) — Design creates UI → you approve visuals
4. **Build** (Day 4-10) — Engineer builds MVP → you test and approve
5. **Pre-Launch** (Day 10-12) — Marketing + Ops prepare → you approve materials
6. **Launch** (Day 12-14) — Coordinated launch execution
7. **Operate** (Ongoing) — Cron-driven growth, support, monitoring

## Commands

| Command | Description |
|---------|-------------|
| `sf init <idea>` | Create a new startup project |
| `sf status [dir]` | Show project status and phase progress |
| `sf approve [dir]` | Approve current phase gate |
| `sf list` | List all startup projects |
| `sf agents [dir]` | Show agent roster |
| `sf outputs [dir]` | List generated artifacts |
| `sf log [dir]` | Show recent activity |

## Configuration

The generated `openclaw.json` configures multi-agent routing automatically. Customize:
- **Models**: CEO uses Opus (complex orchestration), others use Sonnet (cost-effective)
- **Engineer model**: Defaults to Codex for coding tasks
- **Heartbeat**: CEO checks in hourly; specialist agents activated on-demand

## Requirements
- OpenClaw installed and configured
- Anthropic API key (or OpenAI for Engineer agent)
- Node.js 22+ and git
