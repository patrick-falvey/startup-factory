---
name: launch-prep
description: Prepare go-to-market materials for product launch — landing page copy, content calendar, email sequences, Product Hunt listing, SEO foundations.
metadata: {"openclaw": {"emoji": "📣"}}
---

# Launch Prep Skill

Prepare all marketing materials for a successful product launch.

## Process

### Step 1: Read Inputs
- `outputs/product/prd.md` — product details
- `outputs/research/customer-personas.md` — target audience
- `outputs/research/competitive-matrix.md` — competitive positioning
- `outputs/research/market-research-brief.md` — market context
- Deployed product URL (from Engineer)

### Step 2: GTM Strategy
Write `outputs/marketing/gtm-strategy.md`:
- Positioning statement (vs competitors)
- Key messaging (3 value props)
- Target channels ranked by potential
- Launch timeline (day-by-day for launch week)
- Growth loop identification

### Step 3: Landing Page Copy
Write `outputs/marketing/landing-page-copy.md`:
```markdown
## Hero
**Headline:** [< 10 words, benefit-focused]
**Subheadline:** [< 20 words, clarifying]
**CTA:** [Specific action verb]

## Problem
[2-3 sentences describing the pain]

## Solution
[2-3 sentences, how we solve it]

## Features
### [Feature 1 Name]
[Benefit-oriented description, 2 sentences]

### [Feature 2 Name]
...

## Social Proof
[Template for testimonials / metrics]

## Pricing
[Copy for pricing section]

## FAQ
Q: [Common question]
A: [Clear answer]
...

## Final CTA
[Urgency-driven closing CTA]
```

### Step 4: Email Sequences
Write to `outputs/marketing/email-sequences/`:

**welcome-sequence.md** (5 emails, 14 days):
```
Subject: [< 50 chars]
Preview: [< 90 chars]
---
[Body — conversational, 150-200 words max]
[CTA button text]
```

**launch-announcement.md** (1 email)
**re-engagement.md** (3 emails, for inactive users)

### Step 5: Content Calendar
Write `outputs/marketing/content-calendar.md`:
30 entries, each with: date, type, channel, title, target persona, funnel stage, status.

### Step 6: Product Hunt Prep
Write `outputs/marketing/product-hunt/`:
- `listing.md` — tagline (60 chars), description (260 chars), topics
- `first-comment.md` — maker story (the "why" behind the product)
- `gallery-guide.md` — what to screenshot for gallery images
- `launch-checklist.md` — day-of checklist

### Step 7: SEO Foundations
Write `outputs/marketing/seo/`:
- `keywords.md` — 10-20 target keywords with estimated volume
- `meta-descriptions.md` — for every page
- `blog-outlines.md` — 5 blog post outlines targeting long-tail keywords

### Step 8: Social Media
Write `outputs/marketing/social/`:
- `launch-day.md` — posts for Twitter/X, LinkedIn, relevant subreddits
- `first-week.md` — daily posts across channels

### Step 9: Report to CEO
Notify with: GTM summary, launch timeline, what's ready vs needs founder input.
