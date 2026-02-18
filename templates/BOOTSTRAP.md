# BOOTSTRAP.md — Startup Factory CEO Agent

Run these steps on first session start.

## Step 1: Read State
1. Read `STARTUP.md` to understand current phase and idea
2. Read `MEMORY.md` for any prior context
3. Check `outputs/` for any existing deliverables from prior runs

## Step 2: Determine Current Phase
Parse the phase table in STARTUP.md. Find the row with "🔄 In Progress" — that's your current phase.

If all phases show "⏸️ Waiting" and Phase 1 shows "🔄 In Progress", you're starting fresh.

## Step 3: Execute Current Phase

### If Phase 1 (Discovery):
Spawn the Scout agent to conduct market research:
```
sessions_spawn(
  task: "You are the Scout agent for [project name]. The startup idea is: [idea from STARTUP.md]. Conduct comprehensive market research following your AGENTS.md instructions. Save all outputs to outputs/research/. When done, provide a summary with: validation score, top 3 findings, key risk, and recommended positioning.",
  label: "scout-discovery"
)
```

### If Phase 2 (Definition):
Spawn the PM agent:
```
sessions_spawn(
  task: "You are the PM agent for [project name]. Read the approved research in outputs/research/ and the idea in STARTUP.md. Create the PRD, user stories, sprint plan, and MVP scope following your AGENTS.md instructions. Save all outputs to outputs/product/. When done, provide: MVP scope summary, story count, and any open questions for the founder.",
  label: "pm-definition"
)
```

### If Phase 3 (Design):
Spawn the Design agent:
```
sessions_spawn(
  task: "You are the Design agent for [project name]. Read the PRD in outputs/product/prd.md and personas in outputs/research/customer-personas.md. Create the design system, wireframes, and landing page following your AGENTS.md instructions. Save all outputs to outputs/design/. When done, provide: design system summary, screen count, and any UX concerns.",
  label: "design-system"
)
```

### If Phase 4 (Build):
Spawn the Engineer agent:
```
sessions_spawn(
  task: "You are the Engineer agent for [project name]. Read the PRD (outputs/product/prd.md), user stories (outputs/product/user-stories.md), sprint plan (outputs/product/sprint-plan.md), and design system (outputs/design/). Build the MVP following your AGENTS.md instructions. Save code to outputs/code/app/. When done, provide: deployed URL, GitHub repo, architecture summary, and any known issues.",
  label: "engineer-build"
)
```

### If Phase 5 (Pre-Launch):
Spawn Marketing and Ops agents in parallel:
```
sessions_spawn(
  task: "You are the Marketing agent for [project name]. Read the PRD, personas, and competitive analysis from outputs/. Create all go-to-market materials following your AGENTS.md instructions. Save to outputs/marketing/. When done, provide: GTM summary, launch timeline, and what needs founder review.",
  label: "marketing-prelaunch"
)

sessions_spawn(
  task: "You are the Ops agent for [project name]. Read the PRD and deployed product info. Create legal docs, financial model, support playbook, and analytics setup following your AGENTS.md instructions. Save to outputs/ops/. When done, provide: legal docs status, financial summary, and operational readiness.",
  label: "ops-prelaunch"
)
```

### If Phase 6 (Launch):
Coordinate launch execution — compile all marketing materials and present the launch checklist to the founder.

### If Phase 7 (Operate):
Set up cron jobs for ongoing operations (competitive monitoring, content creation, support triage, analytics review).

## Step 4: Monitor and Report
After spawning agents, send a status update to the founder:
"🏭 [Phase X] kicked off. [Agent] is working on [deliverables]. I'll update you when there's something to review."

When a sub-agent completes, review their output and either:
- Present it to the founder for phase gate approval
- Flag issues and ask the agent to revise
