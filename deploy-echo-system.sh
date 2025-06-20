#!/bin/bash

# Echo Task Management System Deployment Script
# This script deploys the complete Echo Task Management System to a new project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
PROJECT_NAME=""
PROJECT_DESCRIPTION=""
TARGET_DIR="."
CURRENT_DATE=$(date +%Y-%m-%d)

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -n, --name <name>           Project name"
    echo "  -d, --description <desc>    Project description"
    echo "  -t, --target <dir>          Target directory (default: current directory)"
    echo "  -h, --help                  Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 --name \"My Awesome App\" --description \"A revolutionary productivity application\""
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -n|--name)
            PROJECT_NAME="$2"
            shift 2
            ;;
        -d|--description)
            PROJECT_DESCRIPTION="$2"
            shift 2
            ;;
        -t|--target)
            TARGET_DIR="$2"
            shift 2
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Interactive prompts if values not provided
if [ -z "$PROJECT_NAME" ]; then
    read -p "Enter project name: " PROJECT_NAME
fi

if [ -z "$PROJECT_DESCRIPTION" ]; then
    read -p "Enter project description: " PROJECT_DESCRIPTION
fi

if [ -z "$PROJECT_NAME" ]; then
    print_error "Project name is required"
    exit 1
fi

# Validate target directory
if [ ! -d "$TARGET_DIR" ]; then
    print_error "Target directory does not exist: $TARGET_DIR"
    exit 1
fi

# Get absolute path
TARGET_DIR=$(cd "$TARGET_DIR" && pwd)
TEMPLATE_DIR="$(dirname "$0")/memory-bank-template"

# Validate template directory exists
if [ ! -d "$TEMPLATE_DIR" ]; then
    print_error "Template directory not found: $TEMPLATE_DIR"
    exit 1
fi

print_header "Echo Task Management System Deployment"
print_status "Project Name: $PROJECT_NAME"
print_status "Project Description: $PROJECT_DESCRIPTION"
print_status "Target Directory: $TARGET_DIR"
print_status "Current Date: $CURRENT_DATE"
echo ""

# Check if target directory has existing Echo system
if [ -f "$TARGET_DIR/tasks/ECHO-TASK-REGISTRY.md" ]; then
    print_warning "Echo Task Management System already exists in target directory"
    read -p "Do you want to overwrite? (y/N): " confirm
    if [[ ! $confirm =~ ^[Yy]$ ]]; then
        print_status "Deployment cancelled"
        exit 0
    fi
fi

print_status "Starting deployment..."

# Create directory structure
print_status "Creating directory structure..."
mkdir -p "$TARGET_DIR/memory-bank/components"
mkdir -p "$TARGET_DIR/memory-bank/cross-cutting"
mkdir -p "$TARGET_DIR/memory-bank/system"
mkdir -p "$TARGET_DIR/memory-bank/task-completion-reports"
mkdir -p "$TARGET_DIR/memory-bank/issues"
mkdir -p "$TARGET_DIR/tasks"
mkdir -p "$TARGET_DIR/.claude/commands"
mkdir -p "$TARGET_DIR/.roo"

# Copy and customize template files
print_status "Deploying template files..."

# Function to replace placeholders in file
replace_placeholders() {
    local file="$1"
    local temp_file="${file}.tmp"
    
    sed -e "s|\[PROJECT_NAME\]|$PROJECT_NAME|g" \
        -e "s|\[PROJECT_DESCRIPTION\]|$PROJECT_DESCRIPTION|g" \
        -e "s|\[CURRENT_DATE\]|$CURRENT_DATE|g" \
        -e "s|\[PROJECT_PATH\]|$TARGET_DIR|g" \
        "$file" > "$temp_file"
    
    mv "$temp_file" "$file"
}

# Deploy and customize CLAUDE.md
if [ -f "$TEMPLATE_DIR/../claude.template.md" ]; then
    cp "$TEMPLATE_DIR/../claude.template.md" "$TARGET_DIR/CLAUDE.md"
    replace_placeholders "$TARGET_DIR/CLAUDE.md"
    print_status "✓ CLAUDE.md deployed"
fi

# Deploy memory bank files
for template_file in "$TEMPLATE_DIR"/memory-bank/*.template; do
    if [ -f "$template_file" ]; then
        base_name=$(basename "$template_file" .template)
        target_file="$TARGET_DIR/memory-bank/$base_name"
        cp "$template_file" "$target_file"
        replace_placeholders "$target_file"
        print_status "✓ memory-bank/$base_name deployed"
    fi
done

# Deploy task files
for template_file in "$TEMPLATE_DIR"/tasks/*.template; do
    if [ -f "$template_file" ]; then
        base_name=$(basename "$template_file" .template)
        target_file="$TARGET_DIR/tasks/$base_name"
        cp "$template_file" "$target_file"
        replace_placeholders "$target_file"
        print_status "✓ tasks/$base_name deployed"
    fi
done

# Deploy claude commands
for template_file in "$TEMPLATE_DIR"/.claude/commands/*.md*; do
    if [ -f "$template_file" ]; then
        base_name=$(basename "$template_file")
        # Remove .template extension if present
        base_name=${base_name%.template}
        target_file="$TARGET_DIR/.claude/commands/$base_name"
        cp "$template_file" "$target_file"
        if [[ "$template_file" == *.template ]]; then
            replace_placeholders "$target_file"
        fi
        print_status "✓ .claude/commands/$base_name deployed"
    fi
done

# Deploy roo files
if [ -f "$TEMPLATE_DIR/.roo/echo-prompt.md.template" ]; then
    cp "$TEMPLATE_DIR/.roo/echo-prompt.md.template" "$TARGET_DIR/.roo/echo-prompt.md"
    replace_placeholders "$TARGET_DIR/.roo/echo-prompt.md"
    print_status "✓ .roo/echo-prompt.md deployed"
fi

# Deploy issue template
if [ -f "$TEMPLATE_DIR/memory-bank/issues/TEMPLATE.md" ]; then
    cp "$TEMPLATE_DIR/memory-bank/issues/TEMPLATE.md" "$TARGET_DIR/memory-bank/issues/"
    print_status "✓ memory-bank/issues/TEMPLATE.md deployed"
fi

print_header "Deployment Complete!"

print_status "Echo Task Management System successfully deployed to: $TARGET_DIR"
echo ""
print_status "Files created:"
echo "  ✓ CLAUDE.md - Main guidance file for Claude Code"
echo "  ✓ memory-bank/ - Complete documentation structure"
echo "  ✓ tasks/ - Echo Task Management System"
echo "  ✓ .claude/commands/ - Custom slash commands"
echo "  ✓ .roo/ - Echo prompt for cross-system coordination"
echo ""

print_header "Next Steps"
echo "1. Review and customize the generated files for your specific project"
echo "2. Update technology stack placeholders in techContext.md"
echo "3. Complete project requirements in productContext.md"
echo "4. Define your first task using the Echo Task Template"
echo "5. Initialize git repository and commit the Echo system"
echo ""

print_status "Git commands to get started:"
echo "  cd $TARGET_DIR"
echo "  git init"
echo "  git add ."
echo "  git commit -m \"feat: Initialize Echo Task Management System"
echo ""
echo "  Echo Task Management System deployed for $PROJECT_NAME"
echo ""
echo "  - Complete memory bank structure with documentation templates"
echo "  - Echo task registry and templates for production-ready development"
echo "  - Cross-system coordination between Claude Code and Echo (.roo)"
echo "  - Quality gates and validation framework"
echo "  - Comprehensive testing standards and TDD approach"
echo ""
echo "  🤖 Generated with Echo Task Management System"
echo "  \""
echo ""

print_header "Echo Task Management System Ready!"
print_status "Your project is now equipped with the production-ready Echo system."
print_status "Happy coding! 🚀"