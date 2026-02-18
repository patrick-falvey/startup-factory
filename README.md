# 🏭 Startup Factory

**An autodeployable constellation of AI agents that build and operate a startup end-to-end.**

Built on [OpenClaw](https://openclaw.ai) — the personal AI assistant platform.

## What It Does

Give it a startup idea. It gives you a business.

Startup Factory deploys **7 specialized AI agents** that work together through a structured pipeline:

```
💡 Idea → 🔬 Research → 📋 Product → 🎨 Design → 👨‍💻 Code → 📣 Launch → 💰 Operate
```

Each agent has a distinct role, its own workspace, memory, and skills. The CEO agent orchestrates everything, and you approve at each phase gate.

## Quick Start

```bash
# Initialize a new startup
./bin/sf init "AI-powered pet nutrition recommendations"

# Open the visual management dashboard
./bin/sf dashboard

# Start the agent pipeline
./bin/sf run
```

## The Team

| Agent | Role | Emoji | Phase |
|-------|------|-------|-------|
| **CEO** | Orchestrator, decision aggregator, your liaison | 🧠 | All |
| **Scout** | Market research, competitive analysis, validation | 🔬 | Discovery |
| **PM** | Product definition, PRD, user stories, sprint planning | 📋 | Definition |
| **Design** | UI/UX, design system, wireframes, landing page | 🎨 | Design |
| **Engineer** | Full-stack development, deployment, CI/CD | 👨‍💻 | Build |
| **Marketing** | Go-to-market, content, SEO, launch materials | 📣 | Pre-Launch & Launch |
| **Ops** | Legal, finance, support, analytics | 💰 | Pre-Launch & Operate |

## Pipeline Phases

### Phase 1: Discovery (Day 1-2)
Scout researches the market, analyzes competitors, creates customer personas, and scores the idea's viability. **You review and confirm direction.**

### Phase 2: Definition (Day 2-3)
PM creates a PRD with user stories, feature prioritization, and sprint plan. **You approve the MVP scope.**

### Phase 3: Design (Day 3-4)
Design creates the visual identity, wireframes, and landing page. **You approve the look and feel.**

### Phase 4: Build (Day 4-10)
Engineer builds the MVP following the sprint plan. Full-stack, tested, deployed. **You test and approve.**

### Phase 5: Pre-Launch (Day 10-12)
Marketing and Ops work in parallel — marketing materials, legal docs, support playbook, analytics setup. **You approve launch materials.**

### Phase 6: Launch (Day 12-14)
Coordinated launch across Product Hunt, social media, email, and PR. **You watch the numbers roll in.**

### Phase 7: Operate (Ongoing)
All agents shift to cron-driven operations — competitive monitoring, content creation, support triage, analytics review. **You get weekly reports.**

## Project Structure

```
~/startups/<project>/
├── STARTUP.md              # Master state tracker
├── AGENTS.md               # CEO agent instructions
├── SOUL.md                 # CEO personality
├── MEMORY.md               # Shared memory
├── HEARTBEAT.md            # Cron-driven check-ins
├── dashboard/
│   ├── index.html          # Visual management dashboard
│   └── state.json          # Live project state (auto-generated)
├── .openclaw/
│   └── openclaw.json       # Multi-agent routing config
├── agents/
│   ├── ceo/                # Orchestrator
│   ├── scout/              # Market research
│   ├── pm/                 # Product management
│   ├── design/             # UI/UX design
│   ├── engineer/           # Full-stack engineering
│   ├── marketing/          # Growth & GTM
│   └── ops/                # Finance, legal, support
├── skills/                 # Startup Factory skills
├── outputs/                # All generated artifacts
│   ├── research/           # Market research, personas
│   ├── product/            # PRD, user stories, sprints
│   ├── design/             # Design system, wireframes
│   ├── code/               # The actual application
│   ├── marketing/          # Content, emails, social
│   └── ops/                # Legal, financial, support
├── dashboard/              # Visual management UI
│   ├── index.html          # Dashboard (Tailwind, zero build step)
│   └── state.json          # Live project state
└── memory/                 # Agent activity logs
```

## Dashboard

Every project ships with a visual management dashboard. Launch it with:

```bash
sf dashboard              # serves on localhost + opens browser
```

**Features:**
- 🔵 **Pipeline visualization** — 7-phase track with animated progress
- 📊 **Stats cards** — current phase, artifacts, days active, agents
- 🤖 **Agent roster** — real-time status (active/working/idle)
- 📋 **Phase detail** — deliverables checklist, approval buttons
- 📁 **Artifact grid** — per-category file counts
- 📜 **Activity timeline** — color-coded agent actions

The dashboard reads `state.json` which is auto-generated on init and refreshed by `sf dashboard`. Phase gate approvals and revisions can be triggered from the UI.

**Live demo:** [patrick-falvey.github.io/startup-factory](https://patrick-falvey.github.io/startup-factory/)

## Requirements

- [OpenClaw](https://openclaw.ai) installed and configured
- [ClawRouter](https://github.com/BlockRunAI/ClawRouter) installed (`blockrun/auto` is the default model)
- Node.js 22+ (for engineering agent)
- Git

### Why ClawRouter?

Instead of hardcoding models per agent (Opus for CEO, Codex for Engineer, etc.), Startup Factory uses ClawRouter's smart routing. It automatically picks the right model for each task:

- Simple tasks (checklists, templates) → cheap models (~$0.001/M)
- Medium tasks (copy, research synthesis) → mid-tier models (~$1.50/M)  
- Complex tasks (architecture, PRD, code) → premium models (~$10/M)
- Reasoning tasks (validation, scoring) → reasoning models (~$0.50/M)

**Result:** ~92% cost savings vs hardcoding Opus, with no quality loss where it matters. One wallet, 30+ models, zero API key management.

## How It's Different

| | Startup Factory | Atoms/MGX | AutoGPT | Bolt/v0 |
|---|---|---|---|---|
| **Full lifecycle** | ✅ Research → Operate | App + SEO | Workflows | Code only |
| **Self-hosted** | ✅ Your infra | ❌ SaaS | ✅ | ❌ SaaS |
| **Persistent ops** | ✅ Cron-driven | ❌ | ❌ | ❌ |
| **Multi-channel** | ✅ Slack, Telegram, etc | ❌ | ❌ | ❌ |
| **Human gates** | ✅ Per-phase | Minimal | ✅ | ❌ |
| **Open source** | ✅ | ❌ | Partial | ❌ |

## License

MIT

---

Built by [AppEvolve](https://appevolve.com) on [OpenClaw](https://openclaw.ai).
