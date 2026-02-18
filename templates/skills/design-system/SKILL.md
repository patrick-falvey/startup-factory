---
name: design-system
description: Create a complete design system, wireframes, and landing page from product requirements — colors, typography, components, responsive layouts.
metadata: {"openclaw": {"emoji": "🎨"}}
---

# Design System Skill

Create the visual identity and all UI specifications for the product.

## Process

### Step 1: Read Inputs
- `outputs/product/prd.md` — what the product does
- `outputs/product/information-architecture.md` — screens and flows
- `outputs/research/customer-personas.md` — who uses this
- `outputs/research/competitive-matrix.md` — what competitors look like
- `STARTUP.md` — any founder brand preferences

### Step 2: Design System
Write `outputs/design/design-system.md`:

```markdown
# Design System: [Product Name]

## Brand Personality
[2-3 adjectives: e.g., "Professional, Approachable, Modern"]

## Color Palette
| Token | Hex | Usage |
|-------|-----|-------|
| primary | #XXXX | Buttons, links, primary actions |
| primary-hover | #XXXX | Hover states |
| secondary | #XXXX | Secondary buttons, accents |
| background | #XXXX | Page background |
| surface | #XXXX | Cards, modals |
| text-primary | #XXXX | Headlines, body |
| text-secondary | #XXXX | Captions, hints |
| border | #XXXX | Dividers, input borders |
| success | #XXXX | Success states |
| warning | #XXXX | Warning states |
| error | #XXXX | Error states |

## Typography
- **Headings:** [Font] (Google Fonts)
- **Body:** [Font] (Google Fonts)
- **Mono:** [Font] (for code, if needed)

| Element | Size | Weight | Line Height |
|---------|------|--------|-------------|
| h1 | 2.5rem | 700 | 1.2 |
| h2 | 2rem | 600 | 1.3 |
| h3 | 1.5rem | 600 | 1.4 |
| body | 1rem | 400 | 1.6 |
| small | 0.875rem | 400 | 1.5 |

## Spacing Scale
4px base: 1(4px), 2(8px), 3(12px), 4(16px), 6(24px), 8(32px), 12(48px), 16(64px)

## Border Radius
- sm: 4px (inputs)
- md: 8px (cards, buttons)
- lg: 16px (modals, large cards)
- full: 9999px (avatars, pills)

## Shadows
- sm: 0 1px 2px rgba(0,0,0,0.05)
- md: 0 4px 6px rgba(0,0,0,0.07)
- lg: 0 10px 15px rgba(0,0,0,0.1)
```

### Step 3: Tailwind Config
Write `outputs/design/tailwind.config.js` implementing the design system tokens.

### Step 4: Global CSS
Write `outputs/design/global.css` with:
- CSS custom properties for all tokens
- Base element styles
- Utility classes for common patterns
- Dark mode (optional, founder preference)

### Step 5: Wireframes
For each screen in the IA, create `outputs/design/wireframes/[screen-name].html`:
- Built with actual HTML + Tailwind CSS
- Mobile-responsive (mobile-first)
- Include all states: default, loading, empty, error
- Use realistic placeholder content (not "Lorem ipsum")
- Annotate interactive elements

### Step 6: Landing Page
Create `outputs/design/landing-page/index.html`:
- Complete, deployable HTML page
- Sections: Hero, Features, How It Works, Pricing (if applicable), FAQ, CTA, Footer
- Responsive (mobile, tablet, desktop)
- Fast loading (no heavy JS frameworks)
- Include CSS inline or in a single stylesheet
- Placeholder for analytics script

### Step 7: Brand Assets
Create in `outputs/design/brand/`:
- `logo.svg` — Simple text-based logo as SVG
- `favicon.svg` — Favicon
- `og-image.html` — OG image template (can be screenshotted)

### Step 8: Report to CEO
Notify with: design system summary, screen count, landing page status, any UX concerns.
