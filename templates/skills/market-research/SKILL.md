---
name: market-research
description: Conduct comprehensive market research for a startup idea — competitive analysis, market sizing, customer personas, and validation scoring.
metadata: {"openclaw": {"emoji": "🔬"}}
---

# Market Research Skill

You are conducting market research for a startup. Follow this structured process.

## Process

### Step 1: Market Overview
Use `web_search` to research:
- Industry size and growth rate
- Key trends and drivers
- Recent funding activity in the space
- Regulatory landscape

Search queries to run:
- `"[industry] market size 2025 2026"`
- `"[industry] startups funding"`
- `"[industry] trends"`
- `"[problem space] solutions"`

### Step 2: Competitive Analysis
For each competitor found:
1. `web_fetch` their homepage — extract positioning, pricing, features
2. `web_search` for `"[competitor] review"` and `"[competitor] alternative"`
3. Document: name, URL, positioning, pricing, strengths, weaknesses

Create a competitive matrix as a markdown table:
```
| Feature | Us | Competitor A | Competitor B | Competitor C |
```

### Step 3: Customer Personas
Based on research, create 2-3 personas:
```markdown
### Persona: [Name]
- **Role:** [Job title / description]
- **Demographics:** [Age range, location, income]
- **Pain Points:** [Top 3]
- **Current Solutions:** [What they use today]
- **Willingness to Pay:** [Estimate]
- **Where They Are:** [Online communities, social platforms]
```

### Step 4: Validation Scorecard
Score 1-10 on each dimension with reasoning:

| Dimension | Score | Reasoning |
|-----------|-------|-----------|
| Market Size | X/10 | [Why] |
| Timing | X/10 | [Why] |
| Competition | X/10 | [Why] |
| Demand Signal | X/10 | [Why] |
| Feasibility | X/10 | [Why] |
| Monetization | X/10 | [Why] |
| **Overall** | **X/10** | **GO / PIVOT / STOP** |

### Step 5: Save Outputs
Save all files to `outputs/research/`:
- `market-research-brief.md`
- `competitive-matrix.md`
- `customer-personas.md`
- `validation-scorecard.md`

### Step 6: Report to CEO
Send a summary to the CEO agent with:
- 3-5 key findings
- Validation score and recommendation
- Top risk
- Suggested positioning
