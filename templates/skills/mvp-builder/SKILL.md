---
name: mvp-builder
description: Build a full-stack MVP from PRD and design specs — architecture, database, frontend, backend, testing, deployment, CI/CD.
metadata: {"openclaw": {"emoji": "👨‍💻", "requires": {"anyBins": ["codex", "claude", "node"]}}}
---

# MVP Builder Skill

Build and deploy a working MVP from product and design specifications.

## Process

### Step 1: Read Inputs
Load these artifacts from prior phases:
- `outputs/product/prd.md` — requirements
- `outputs/product/user-stories.md` — stories with acceptance criteria
- `outputs/product/sprint-plan.md` — sprint breakdown
- `outputs/product/information-architecture.md` — data model, pages, flows
- `outputs/design/design-system.md` — tokens, colors, typography
- `outputs/design/tailwind.config.js` — Tailwind config
- `outputs/design/wireframes/` — screen layouts
- `outputs/design/landing-page/` — landing page HTML

### Step 2: Architecture Decision
Document in `outputs/code/architecture.md`:
- Framework choice with justification
- Database choice with justification
- Auth strategy
- Hosting target
- Key libraries
- API design (REST vs tRPC vs GraphQL)

Default stack (override based on PRD):
```
Next.js 15 (App Router) + TypeScript
Tailwind CSS + shadcn/ui
PostgreSQL + Prisma ORM
NextAuth.js v5
Vercel hosting
Stripe (if payments needed)
Resend (if email needed)
PostHog (analytics)
```

### Step 3: Scaffold Project
```bash
# Initialize project
cd outputs/code
npx create-next-app@latest app --typescript --tailwind --eslint --app --src-dir
cd app

# Install core dependencies
npm install prisma @prisma/client next-auth@beta
npm install -D @types/node

# Apply design system
# Copy tailwind.config.js from design outputs
# Copy global.css from design outputs
```

### Step 4: Build (Follow Sprint Plan)

**Sprint 1 — Foundation:**
1. Database schema from IA (`prisma/schema.prisma`)
2. Auth setup (if required)
3. Layout and navigation
4. Primary user flow (the core thing)

**Sprint 2 — Features:**
1. Secondary user flows
2. API routes for data operations
3. Payment integration (if needed)
4. Email notifications (if needed)

**Sprint 3 — Polish:**
1. Integrate landing page from Design
2. Error handling (error.tsx, not-found.tsx)
3. Loading states (loading.tsx)
4. SEO (metadata, sitemap, robots.txt)
5. Performance (images, lazy loading)

### Step 5: Testing
- Core business logic: unit tests with Vitest
- API endpoints: integration tests
- Primary flow: basic E2E test
- Accessibility: automated audit

### Step 6: Deploy
1. Create GitHub repository
2. Push code with proper .gitignore
3. Connect to Vercel (or Railway)
4. Configure environment variables
5. Verify deployment works
6. Set up CI (GitHub Actions: lint + test + build on PR)

### Step 7: Documentation
Create `outputs/code/app/README.md`:
- Project overview
- Getting started (local dev)
- Environment variables reference
- Deployment guide
- Architecture overview
- API documentation (if applicable)

### Step 8: Report to CEO
Notify with:
- Deployed URL
- GitHub repo URL
- Architecture summary (1 paragraph)
- Test results
- Known issues / tech debt
- Admin access instructions
