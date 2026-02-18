#!/usr/bin/env zsh
set -euo pipefail

# ============================================================
# Startup Factory — Project Initializer
# Creates a fully configured multi-agent OpenClaw workspace
# for running a startup from idea to operation.
# ============================================================

SCRIPT_DIR="${0:a:h}"
TEMPLATE_DIR="${SCRIPT_DIR}/../templates"
TEMPLATE_DIR="${TEMPLATE_DIR:a}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

print_banner() {
  echo ""
  echo -e "${CYAN}${BOLD}"
  echo "  ╔═══════════════════════════════════════╗"
  echo "  ║     🏭 STARTUP FACTORY                ║"
  echo "  ║     AI-Powered Startup in a Box       ║"
  echo "  ╚═══════════════════════════════════════╝"
  echo -e "${NC}"
}

usage() {
  echo "Usage: sf-init [OPTIONS] \"<startup idea>\""
  echo ""
  echo "Options:"
  echo "  -n, --name NAME       Project name (auto-generated from idea if omitted)"
  echo "  -d, --dir DIR         Parent directory (default: ~/startups)"
  echo "  -b, --brief FILE      Path to a detailed brief file (markdown)"
  echo "  -h, --help            Show this help"
  echo ""
  echo "Examples:"
  echo "  sf-init \"AI-powered pet nutrition recommendations\""
  echo "  sf-init -n petfood-ai \"AI-powered pet nutrition recommendations\""
  echo "  sf-init --brief ~/ideas/pet-nutrition.md"
}

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//' | cut -c1-40
}

# Parse arguments
PROJECT_NAME=""
PARENT_DIR="${HOME}/startups"
BRIEF_FILE=""
IDEA=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -n|--name)
      PROJECT_NAME="$2"
      shift 2
      ;;
    -d|--dir)
      PARENT_DIR="$2"
      shift 2
      ;;
    -b|--brief)
      BRIEF_FILE="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      IDEA="$1"
      shift
      ;;
  esac
done

# Validate input
if [[ -z "$IDEA" && -z "$BRIEF_FILE" ]]; then
  echo -e "${RED}Error: Provide a startup idea or a --brief file${NC}"
  echo ""
  usage
  exit 1
fi

# Read brief file if provided
if [[ -n "$BRIEF_FILE" ]]; then
  if [[ ! -f "$BRIEF_FILE" ]]; then
    echo -e "${RED}Error: Brief file not found: $BRIEF_FILE${NC}"
    exit 1
  fi
  BRIEF_CONTENT=$(cat "$BRIEF_FILE")
  if [[ -z "$IDEA" ]]; then
    IDEA=$(head -1 "$BRIEF_FILE" | sed 's/^#* *//')
  fi
fi

# Generate project name if not provided
if [[ -z "$PROJECT_NAME" ]]; then
  PROJECT_NAME=$(slugify "$IDEA")
fi

PROJECT_DIR="${PARENT_DIR}/${PROJECT_NAME}"
DATE=$(date +%Y-%m-%d)

print_banner

echo -e "${BOLD}Startup Idea:${NC} $IDEA"
echo -e "${BOLD}Project Name:${NC} $PROJECT_NAME"
echo -e "${BOLD}Location:${NC} $PROJECT_DIR"
echo ""

# Check if directory exists
if [[ -d "$PROJECT_DIR" ]]; then
  echo -e "${YELLOW}Warning: Directory already exists: $PROJECT_DIR${NC}"
  read -p "Overwrite? (y/N): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
  fi
fi

# ============================================================
# Create directory structure
# ============================================================
echo -e "${BLUE}Creating project structure...${NC}"

mkdir -p "$PROJECT_DIR"/{agents/{ceo,scout,pm,design,engineer,marketing,ops},outputs/{research,product,design,code,marketing,ops},memory,skills}

# ============================================================
# Copy and template agent files
# ============================================================
echo -e "${BLUE}Configuring agents...${NC}"

AGENTS=("ceo" "scout" "pm" "design" "engineer" "marketing" "ops")

for agent in "${AGENTS[@]}"; do
  src="$TEMPLATE_DIR/agents/$agent"
  dst="$PROJECT_DIR/agents/$agent"
  
  if [[ -d "$src" ]]; then
    for file in "$src"/*; do
      filename=$(basename "$file")
      # Template substitution
      sed \
        -e "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" \
        -e "s|{{PROJECT_DIR}}|$PROJECT_DIR|g" \
        -e "s|{{IDEA}}|$IDEA|g" \
        -e "s|{{DATE}}|$DATE|g" \
        "$file" > "$dst/$filename"
    done
    
    # Create MEMORY.md for each agent
    agent_upper="$(echo "$agent" | tr '[:lower:]' '[:upper:]' | cut -c1)$(echo "$agent" | cut -c2-)"
    cat > "$dst/MEMORY.md" <<EOF
# Memory — $agent_upper Agent

## Project: $PROJECT_NAME
## Idea: $IDEA
## Started: $DATE

---
EOF
  fi
done

# ============================================================
# Create STARTUP.md (master state)
# ============================================================
echo -e "${BLUE}Initializing startup state...${NC}"

sed \
  -e "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" \
  -e "s|{{PROJECT_DIR}}|$PROJECT_DIR|g" \
  -e "s|{{IDEA}}|$IDEA|g" \
  -e "s|{{DATE}}|$DATE|g" \
  "$TEMPLATE_DIR/STARTUP.md" > "$PROJECT_DIR/STARTUP.md"

# Add brief content if provided
if [[ -n "${BRIEF_CONTENT:-}" ]]; then
  cat >> "$PROJECT_DIR/STARTUP.md" <<EOF

## Detailed Brief
$BRIEF_CONTENT
EOF
fi

# ============================================================
# Create root AGENTS.md (CEO workspace)
# ============================================================
cp "$PROJECT_DIR/agents/ceo/AGENTS.md" "$PROJECT_DIR/AGENTS.md"

# ============================================================
# Create root SOUL.md
# ============================================================
cp "$PROJECT_DIR/agents/ceo/SOUL.md" "$PROJECT_DIR/SOUL.md"

# ============================================================
# Copy BOOTSTRAP.md and ORCHESTRATION.md
# ============================================================
sed \
  -e "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" \
  -e "s|{{PROJECT_DIR}}|$PROJECT_DIR|g" \
  -e "s|{{IDEA}}|$IDEA|g" \
  -e "s|{{DATE}}|$DATE|g" \
  "$TEMPLATE_DIR/BOOTSTRAP.md" > "$PROJECT_DIR/BOOTSTRAP.md"

if [[ -f "$TEMPLATE_DIR/agents/ceo/ORCHESTRATION.md" ]]; then
  cp "$TEMPLATE_DIR/agents/ceo/ORCHESTRATION.md" "$PROJECT_DIR/ORCHESTRATION.md"
fi

# ============================================================
# Create root MEMORY.md
# ============================================================
cat > "$PROJECT_DIR/MEMORY.md" <<EOF
# Startup Factory — $PROJECT_NAME

## Idea
$IDEA

## Created
$DATE

## Agent Roster
- CEO (Orchestrator): $PROJECT_DIR/agents/ceo
- Scout (Research): $PROJECT_DIR/agents/scout
- PM (Product): $PROJECT_DIR/agents/pm
- Design (UI/UX): $PROJECT_DIR/agents/design
- Engineer (Builder): $PROJECT_DIR/agents/engineer
- Marketing (Growth): $PROJECT_DIR/agents/marketing
- Ops (Finance/Support): $PROJECT_DIR/agents/ops

## Phase History
<!-- Updated by CEO agent as phases progress -->

## Key Decisions
<!-- Human decisions logged with timestamps -->
EOF

# ============================================================
# Create OpenClaw config
# ============================================================
echo -e "${BLUE}Generating OpenClaw configuration...${NC}"

mkdir -p "$PROJECT_DIR/.openclaw"
sed \
  -e "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" \
  -e "s|{{PROJECT_DIR}}|$PROJECT_DIR|g" \
  -e "s|{{IDEA}}|$IDEA|g" \
  -e "s|{{DATE}}|$DATE|g" \
  "$TEMPLATE_DIR/openclaw.json" > "$PROJECT_DIR/.openclaw/openclaw.json"

# ============================================================
# Create HEARTBEAT.md for CEO agent
# ============================================================
cat > "$PROJECT_DIR/HEARTBEAT.md" <<'EOF'
# HEARTBEAT.md — Startup Factory CEO

## Every Heartbeat Cycle

### 1. Phase Status Check
- Read STARTUP.md for current phase
- Check if any agent has completed their deliverables
- If deliverables ready, compile for founder review

### 2. Agent Health
- Check if any sub-agent sessions are stalled (no activity in 2+ hours during a phase)
- If stalled, check agent memory for errors or blockers
- Escalate to founder if an agent is stuck

### 3. Timeline Check
- Compare actual progress vs sprint plan
- If behind by >1 day, flag to founder with options:
  a) Cut scope
  b) Extend timeline
  c) Parallelize more work

### 4. Pending Approvals
- Check if there are any phase gate approvals waiting for the founder
- Send a gentle reminder if waiting >4 hours during business hours

### 5. Status Update
- If meaningful progress since last update, send brief status to founder
- Format: "🏭 [Phase X] — [1-line summary]. [Action needed/no action needed]."
EOF

# ============================================================
# Install dashboard
# ============================================================
echo -e "${BLUE}Installing dashboard...${NC}"

mkdir -p "$PROJECT_DIR/dashboard"
if [[ -d "$TEMPLATE_DIR/dashboard" ]]; then
  for file in "$TEMPLATE_DIR/dashboard/"*; do
    filename=$(basename "$file")
    sed \
      -e "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" \
      -e "s|{{PROJECT_DIR}}|$PROJECT_DIR|g" \
      -e "s|{{IDEA}}|$IDEA|g" \
      -e "s|{{DATE}}|$DATE|g" \
      "$file" > "$PROJECT_DIR/dashboard/$filename"
  done
fi

# ============================================================
# Copy skills into project
# ============================================================
echo -e "${BLUE}Installing skills...${NC}"

if [[ -d "$TEMPLATE_DIR/skills" ]]; then
  cp -r "$TEMPLATE_DIR/skills/"* "$PROJECT_DIR/skills/" 2>/dev/null || true
fi

# ============================================================
# Create USER.md with project context
# ============================================================
cat > "$PROJECT_DIR/USER.md" <<EOF
# USER.md — Startup Factory Project

## Project
- **Name:** $PROJECT_NAME
- **Idea:** $IDEA
- **Created:** $DATE

## Agent Team
This project is managed by 7 AI agents coordinated through OpenClaw.
The CEO agent orchestrates the others through a phased pipeline.

## Founder
The founder interacts through their preferred OpenClaw channel.
All phase gates require explicit founder approval before advancing.

## Model Routing
Using ClawRouter (blockrun/auto) for smart model selection.
Each request is routed to the most cost-effective model for the task.
EOF

# ============================================================
# Create .gitignore
# ============================================================
cat > "$PROJECT_DIR/.gitignore" <<'EOF'
# OpenClaw
.openclaw/
node_modules/

# OS
.DS_Store
Thumbs.db

# Env
.env
.env.local
*.env

# Output artifacts that are regenerable
outputs/code/app/node_modules/
outputs/code/app/.next/
EOF

# ============================================================
# Initialize git repo
# ============================================================
echo -e "${BLUE}Initializing git repository...${NC}"
(cd "$PROJECT_DIR" && git init -q && git add -A && git commit -q -m "🏭 Initialize Startup Factory: $PROJECT_NAME" 2>/dev/null || true)

# ============================================================
# Summary
# ============================================================
echo ""
echo -e "${GREEN}${BOLD}✅ Startup Factory initialized!${NC}"
echo ""
echo -e "  ${BOLD}Project:${NC}  $PROJECT_NAME"
echo -e "  ${BOLD}Location:${NC} $PROJECT_DIR"
echo -e "  ${BOLD}Agents:${NC}   7 (CEO, Scout, PM, Design, Engineer, Marketing, Ops)"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo ""
echo "  1. Review the agent configs:"
echo "     cat $PROJECT_DIR/AGENTS.md"
echo ""
echo "  2. Start the factory (via OpenClaw):"
echo "     openclaw agent --workspace $PROJECT_DIR \\"
echo "       --message \"Begin Phase 1: Discovery. The startup idea is: $IDEA\""
echo ""
echo "  3. Or send via your preferred channel:"
echo "     Message your OpenClaw bot: \"@ceo Begin Phase 1 for $PROJECT_NAME\""
echo ""
echo -e "${CYAN}The CEO agent will orchestrate all 7 agents through the full${NC}"
echo -e "${CYAN}startup pipeline. Sit back and approve phase gates as they come.${NC}"
echo ""
