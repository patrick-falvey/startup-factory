---
name: landing-page
description: Build a complete, deployable landing page from product and design specifications — hero, features, pricing, FAQ, CTA with responsive Tailwind CSS.
metadata: {"openclaw": {"emoji": "🌐"}}
---

# Landing Page Skill

Build a production-ready landing page from scratch.

## Process

### Step 1: Read Inputs
- `outputs/marketing/landing-page-copy.md` — all copy sections
- `outputs/design/design-system.md` — colors, typography, spacing
- `outputs/design/tailwind.config.js` — Tailwind config
- `outputs/product/prd.md` — product details for accuracy
- `outputs/research/customer-personas.md` — who we're speaking to

### Step 2: Build HTML Structure
Create `outputs/design/landing-page/index.html` with these sections:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[Product] — [Tagline]</title>
  <meta name="description" content="[Meta description from SEO]">
  <meta property="og:title" content="[Product] — [Tagline]">
  <meta property="og:description" content="[Description]">
  <meta property="og:image" content="[OG image URL]">
  <script src="https://cdn.tailwindcss.com"></script>
  <script>[Tailwind config inline]</script>
</head>
```

### Step 3: Section Layout

**Navigation:**
- Logo (text or SVG) left
- Nav links center (Features, Pricing, FAQ)
- CTA button right
- Mobile hamburger menu

**Hero:**
- Headline (h1, large, bold)
- Subheadline (h2, lighter weight)
- Primary CTA button
- Optional: hero image/illustration placeholder or product screenshot area

**Social Proof Bar:**
- "Trusted by X users" or partner logos placeholder
- Compact, subtle

**Problem → Solution:**
- Left: pain point description
- Right: how we solve it
- Or: before/after comparison

**Features (3-4):**
- Icon + heading + description grid
- 2-column on desktop, 1-column on mobile
- Each feature links to benefit, not technical detail

**How It Works:**
- 3-step numbered process
- Simple, visual

**Pricing (if applicable):**
- 2-3 tier cards
- Highlighted "recommended" tier
- Feature comparison
- CTA per tier

**Testimonials:**
- Quote + name + role
- Placeholder for real testimonials
- Carousel on mobile, grid on desktop

**FAQ:**
- Accordion-style (CSS-only, no JS framework needed)
- 5-8 questions from marketing copy

**Final CTA:**
- Full-width section
- Compelling closing headline
- CTA button (same as hero)

**Footer:**
- Links: Privacy, Terms, Contact
- Social icons (placeholder)
- Copyright

### Step 4: Responsive Design
- Mobile-first approach
- Breakpoints: sm (640px), md (768px), lg (1024px)
- Test all sections at each breakpoint
- No horizontal scroll at any width

### Step 5: Performance
- No JavaScript frameworks (vanilla JS only for interactions)
- Tailwind via CDN (for MVP; build step can come later)
- Lazy-load images
- System fonts or Google Fonts (max 2 weights)
- Total page weight < 500KB

### Step 6: Interactive Elements (CSS/vanilla JS)
- Smooth scroll for anchor links
- FAQ accordion toggle
- Mobile navigation toggle
- Optional: scroll-triggered fade-in (CSS only, `@keyframes`)

### Step 7: Analytics Ready
Include placeholder for analytics:
```html
<!-- Analytics: Replace with PostHog/Plausible snippet -->
<script>/* analytics placeholder */</script>
```

### Step 8: Email Capture
If the product has a waitlist/signup:
```html
<form action="[endpoint]" method="POST">
  <input type="email" placeholder="Enter your email" required>
  <button type="submit">Get Early Access</button>
</form>
```

### Step 9: Deliverables
- `outputs/design/landing-page/index.html` — complete page
- `outputs/design/landing-page/styles.css` — any custom CSS beyond Tailwind
- `outputs/design/landing-page/script.js` — minimal JS (nav toggle, FAQ accordion)

The page must be deployable as-is by dropping into any static hosting (Vercel, Netlify, GitHub Pages).
