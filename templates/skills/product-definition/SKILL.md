---
name: product-definition
description: Create a Product Requirements Document (PRD), user stories, information architecture, and sprint plan from market research and founder vision.
metadata: {"openclaw": {"emoji": "📋"}}
---

# Product Definition Skill

Transform research findings into a buildable product specification.

## Process

### Step 1: Read Inputs
Read these files from prior phases:
- `outputs/research/market-research-brief.md`
- `outputs/research/competitive-matrix.md`
- `outputs/research/customer-personas.md`
- `outputs/research/validation-scorecard.md`
- `STARTUP.md` (for founder's idea and any preferences)

### Step 2: Create PRD
Write `outputs/product/prd.md` with these sections:

```markdown
# Product Requirements Document: [Product Name]

## 1. Vision
[One sentence: what is this product?]

## 2. Problem Statement
[What pain does it solve? Who experiences it? How big is the pain?]

## 3. Target Users
[Primary and secondary personas — reference Scout's research]

## 4. Goals & Success Metrics
| Metric | Week 1 | Month 1 | Month 3 |
|--------|--------|---------|---------|
| Signups | X | X | X |
| Active Users | X | X | X |
| Revenue | X | X | X |

## 5. MVP Scope

### Must Have (P0)
- [Feature]: [Why it's essential]

### Should Have (P1)
- [Feature]: [Why it's important]

### Won't Have (for now)
- [Feature]: [Why we're deferring]

## 6. User Flows
[Step-by-step for each primary flow]

## 7. Technical Constraints
[Any known technical requirements or limitations]

## 8. Assumptions
[What must be true for this to work]

## 9. Risks
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
```

### Step 3: Create User Stories
Write `outputs/product/user-stories.md`:

For each MVP feature, write stories in this format:
```markdown
### US-001: [Title]
**Priority:** P0 | **Complexity:** S/M/L

As a [persona], I want to [action] so that [benefit].

**Acceptance Criteria:**
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [action], then [result]

**Notes:** [Any additional context]
```

### Step 4: Information Architecture
Write `outputs/product/information-architecture.md`:
- Page/screen inventory with purpose
- Navigation structure
- Core entities and relationships
- Data model (conceptual)

### Step 5: Sprint Plan
Write `outputs/product/sprint-plan.md`:

```markdown
## Sprint 1 (Days 1-3): Foundation
- [ ] US-001: [Title] (S)
- [ ] US-002: [Title] (M)
[Capacity: ~24 story points]

## Sprint 2 (Days 4-6): Core Features
...

## Sprint 3 (Days 7-9): Polish & Launch Prep
...

## Buffer (Day 10): Fixes
...
```

### Step 6: MVP Scope Summary
Write `outputs/product/mvp-scope.md` — a one-page executive summary:
- What we're building (3 sentences)
- Who it's for (primary persona)
- Core features (bullet list)
- What's NOT included (explicit exclusions)
- Recommended tech stack direction
- Timeline (10 days)

### Step 7: Report to CEO
Notify CEO with summary of deliverables, story count, open questions.
