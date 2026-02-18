---
name: growth-engine
description: Post-launch growth automation — competitive monitoring, content creation, SEO tracking, user feedback triage, and analytics review.
metadata: {"openclaw": {"emoji": "🚀"}}
---

# Growth Engine Skill

Ongoing growth operations for a launched startup. Designed to run on cron.

## Periodic Tasks

### Weekly: Competitive Pulse (Scout Agent)
1. `web_search` for each competitor + "news", "update", "launch"
2. Check competitor pricing pages for changes
3. Check Product Hunt and Hacker News for new entrants
4. Write `memory/competitive-pulse-[date].md`
5. Alert CEO only if material changes found

### Weekly: Content Creation (Marketing Agent)
1. Read `outputs/marketing/content-calendar.md` for this week's planned content
2. Draft blog posts / social posts per calendar
3. Save drafts to `outputs/marketing/drafts/[date]/`
4. Queue for founder review

### Weekly: Analytics Review (Ops Agent)
1. Check KPI dashboard for anomalies
2. Compare metrics to goals in PRD
3. Write `memory/analytics-review-[date].md`
4. Alert CEO if any metric is off-track by >20%

### Daily: Support Triage (Ops Agent)
1. Check configured support channels for new messages
2. Draft responses using support playbook templates
3. Queue for founder approval before sending
4. Track common issues for PM (feature request patterns)

### Bi-Weekly: Feature Triage (PM Agent)
1. Review support tickets and user feedback
2. Categorize: bug / feature request / improvement / churn risk
3. Update backlog with prioritized items
4. Write `memory/feature-triage-[date].md`
5. Present top 3 recommendations to founder

### Monthly: Status Report (CEO Agent)
Compile and send comprehensive monthly report:
- Revenue vs projections
- User metrics (signups, active, churn)
- Competitive changes
- Top feature requests
- Content performance
- Support volume and satisfaction
- Recommendations for next month
