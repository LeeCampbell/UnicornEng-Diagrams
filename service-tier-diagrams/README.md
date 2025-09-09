# Service Tier Architecture - C4 Model

This directory contains C4 model diagrams for a 6-component service tier architecture using Structurizr DSL.

## Architecture Components

1. **SPA** - Single Page Application (React)
2. **Web API** - REST API service (Golang)
3. **Relational Database** - Data storage (PostgreSQL)
4. **Integration API** - External service integrations (Web API)
5. **Data Pipeline** - Data processing (Kafka with Airflow)
6. **Data Warehouse** - Analytics data storage (Snowflake)

## Files

- `architecture.dsl` - Structurizr DSL definition of the architecture
- `render-c4.sh` - Script to generate SVG diagrams from the DSL
- `output/` - Generated diagram files (SVG format)
- `README.md` - This documentation

## Generating Diagrams

### Prerequisites

- Docker (required for Structurizr CLI and PlantUML)

### Quick Start

```bash
# Make script executable (if needed)
chmod +x render-c4.sh

# Generate diagrams
./render-c4.sh
```

This will create two main diagrams in the `output/` directory:

- `structurizr-SystemContext.svg` - System context view showing external users and systems
- `structurizr-Containers.svg` - Container view showing internal architecture components

### Manual Steps

If you prefer to run the commands manually:

```bash
# 1. Generate PlantUML files from Structurizr DSL
docker run --rm -v "$(pwd)":/usr/local/structurizr structurizr/cli:latest \
    export -workspace /usr/local/structurizr/architecture.dsl \
    -format plantuml \
    -output /usr/local/structurizr/output

# 2. Convert PlantUML to SVG
docker run --rm -v "$(pwd)":/workspace plantuml/plantuml:latest \
    -tsvg /workspace/output/structurizr-SystemContext.puml /workspace/output/structurizr-Containers.puml
```

### Live Preview (Optional)

For interactive editing and preview:

```bash
# Start Structurizr Lite server
docker run --rm -p 8080:8080 -v "$(pwd)":/usr/local/structurizr structurizr/lite

# Open in browser
open http://localhost:8080
```

## Diagram Types

### System Context Diagram
Shows the system boundary and how users and external systems interact with our service tier system.

### Container Diagram  
Shows the internal containers (applications, databases, microservices) and their relationships within the system boundary.

## Color Scheme

The diagrams use a consistent blue color palette (`#4477aa`) matching the existing repository design standards.

## Modifying the Architecture

To update the architecture:

1. Edit `architecture.dsl` to modify components or relationships
2. Run `./render-c4.sh` to regenerate diagrams
3. Check the updated SVG files in the `output/` directory