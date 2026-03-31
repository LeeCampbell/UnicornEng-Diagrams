#!/bin/bash

# Script to render C4 diagrams using Structurizr CLI
# Requires Docker to be installed and running

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Rendering C4 diagrams using Structurizr CLI...${NC}"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}Error: Docker is not running. Please start Docker and try again.${NC}"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p output

# Run Structurizr CLI using Docker to generate PlantUML files
echo -e "${YELLOW}Generating PlantUML files...${NC}"

docker run --rm -v "$(pwd)":/usr/local/structurizr structurizr/cli:latest \
    export -workspace /usr/local/structurizr/architecture.dsl \
    -format plantuml \
    -output /usr/local/structurizr/output

# Convert PlantUML files to SVG using PlantUML Docker
echo -e "${YELLOW}Converting to SVG diagrams...${NC}"

docker run --rm -v "$(pwd)":/workspace plantuml/plantuml:latest \
    -tsvg /workspace/output/structurizr-SystemContext.puml /workspace/output/structurizr-Containers.puml

echo -e "${GREEN}✅ C4 diagrams generated successfully in ./output/${NC}"
echo -e "${GREEN}Files created:${NC}"
ls -la output/

echo -e "\n${YELLOW}To view the diagrams:${NC}"
echo "- SystemContext diagram: output/structurizr-SystemContext.svg"
echo "- Container diagram: output/structurizr-Containers.svg"
echo -e "\n${YELLOW}To start live preview (optional):${NC}"
echo "docker run --rm -p 8080:8080 -v \"\$(pwd)\":/usr/local/structurizr structurizr/lite"
echo "Then open: http://localhost:8080"