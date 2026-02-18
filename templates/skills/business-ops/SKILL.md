---
name: business-ops
description: Generate legal documents, financial models, customer support playbooks, analytics setup, and operational checklists for a startup.
metadata: {"openclaw": {"emoji": "💰"}}
---

# Business Ops Skill

Set up the operational infrastructure for a startup.

## Process

### Step 1: Read Inputs
- `outputs/product/prd.md` — product details
- `outputs/research/customer-personas.md` — users
- Deployed URL (from Engineer)
- Pricing info (from PM / founder)

### Step 2: Terms of Service
Write `outputs/ops/terms-of-service.md`:
- Service description (from PRD)
- Account terms (registration, security)
- Acceptable use policy
- Intellectual property
- User content (if applicable)
- Payment terms (if applicable)
- Termination
- Limitation of liability
- Governing law
- Contact information

**Include:** "Last updated: [DATE]" and "This document was generated with AI assistance. We recommend legal review for your specific jurisdiction."

### Step 3: Privacy Policy
Write `outputs/ops/privacy-policy.md`:
GDPR + CCPA compliant template:
- Information we collect (and why)
- How we use your information
- Information sharing and disclosure
- Data retention
- Your rights (GDPR: access, rectification, erasure, portability, object)
- Your rights (CCPA: know, delete, opt-out, non-discrimination)
- Cookies and tracking
- Security measures
- Children's privacy
- Changes to this policy
- Contact information

### Step 4: Financial Model
Write `outputs/ops/financial-model.md`:

```markdown
# Financial Model: [Product Name]

## Revenue Projections (Monthly)
| Month | Conservative | Base | Optimistic |
|-------|-------------|------|-----------|
| 1 | $X | $X | $X |
| 3 | $X | $X | $X |
| 6 | $X | $X | $X |
| 12 | $X | $X | $X |

## Assumptions
- Conversion rate: X%
- Churn rate: X%/mo
- ARPU: $X
- Traffic growth: X%/mo

## Cost Structure (Monthly)
| Item | Cost | Notes |
|------|------|-------|
| Hosting | $X | Vercel Pro / Railway |
| Database | $X | Supabase / PlanetScale |
| Email | $X | Resend / SendGrid |
| Analytics | $X | PostHog / Plausible |
| Domain | $X/yr | |
| Marketing | $X | Content + ads |
| **Total** | **$X** | |

## Unit Economics
- CAC: $X (estimated)
- LTV: $X (ARPU × avg lifetime)
- LTV/CAC: X:1
- Payback period: X months

## Break-Even
At $X/mo costs and $X ARPU:
Break-even at X paying customers.
```

### Step 5: Support Playbook
Write `outputs/ops/support-playbook.md`:
- Support channels and SLA targets
- 10 response templates (common scenarios)
- Escalation matrix
- Tone guide ("friendly, helpful, honest")

### Step 6: Analytics Setup Guide
Write `outputs/ops/analytics-setup.md`:
- Recommended tool and setup steps
- KPI definitions (AARRR framework)
- Events to track (with implementation code snippets)
- Dashboard template
- Alert thresholds

### Step 7: Launch Checklist
Write `outputs/ops/launch-checklist.md`:
- [ ] Domain and DNS
- [ ] SSL/HTTPS
- [ ] Email deliverability (SPF/DKIM/DMARC)
- [ ] Error monitoring
- [ ] Uptime monitoring
- [ ] Backup strategy
- [ ] Legal pages live
- [ ] Cookie consent
- [ ] Support email
- [ ] Payment tested (if applicable)
- [ ] Analytics verified
- [ ] Social accounts created

### Step 8: Report to CEO
Notify with: legal docs status, financial summary, support readiness, checklist status.
