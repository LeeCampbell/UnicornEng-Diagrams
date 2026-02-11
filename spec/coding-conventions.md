# Coding Conventions

Structural patterns, naming rules, and tooling standards for diagram source files.

## SVG Structure

Hand-crafted SVGs follow this template:

```xml
<svg width="..." height="..." xmlns="http://www.w3.org/2000/svg">
  <defs>
    <style>
      /* CSS classes here */
    </style>
    <marker id="arrowhead" markerWidth="10" markerHeight="7"
            refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#4477aa" />
    </marker>
  </defs>

  <!-- Diagram content in grouped <g> elements -->
</svg>
```

Key points:
- Embed styles in `<defs><style>` rather than inline where practical
- Define reusable markers in `<defs>`
- Group related elements with `<g>` and comment each section

## CSS Class Naming

Use descriptive, hyphenated prefixes:

| Prefix        | Purpose                                | Example                    |
|---------------|----------------------------------------|----------------------------|
| `.box-*`      | 3D box faces and text                  | `.box-face`, `.box-top`, `.box-text` |
| `.node-*`     | Network/tree diagram nodes             | `.node-primary`, `.node-secondary`   |
| `.quadrant-*` | Matrix quadrant fills and labels       | `.quadrant1`, `.quadrant-label`      |
| `.axis-*`     | Axis lines, labels, arrows             | `.axis-label`, `.axis-arrow`         |
| `.text-*`     | Text color overrides                   | `.text-white`, `.text-black`         |
| `.grid-line`  | Divider lines in matrices              |                                      |
| `.level-*`    | Level backgrounds and labels in trees  | `.level-label`, `.level-bg`          |

## Standard Values

| Property            | Value              | Usage                         |
|---------------------|--------------------|-------------------------------|
| `rx` / `ry`         | `8`                | Rounded corners on rectangles |
| `stroke-width`      | `2`                | Primary element borders       |
| `stroke-width`      | `3`                | Grid separators, stock boxes  |
| `stroke-dasharray`  | `5,5`              | Dashed lines (percentiles)    |

## Arrow Markers

Standard arrow marker definition:

```xml
<marker id="arrowhead" markerWidth="10" markerHeight="7"
        refX="9" refY="3.5" orient="auto">
  <polygon points="0 0, 10 3.5, 0 7" fill="#4477aa" />
</marker>
```

Reference with `marker-end="url(#arrowhead)"`.

## File Organization

```
<concept-name>/
  diagram-name.svg          # Hand-crafted SVG source
  source-file.dot           # Graphviz DOT source (if applicable)
  notebooks/
    notebook.ipynb           # Jupyter notebook (if applicable)
    output/
      generated-diagram.svg  # Generated SVG output
  output/
    generated-diagram.svg    # Generated SVG output (alternative layout)
```

- One folder per diagram concept (e.g., `geometric-shapes/`, `stocks-and-flows/`)
- Source files live alongside generated outputs
- Generated content goes in `output/` subdirectories

## Naming Conventions

- **Files and folders:** kebab-case (`bug-flows.svg`, `decision-tree.dot`)
- **SVG IDs:** camelCase or descriptive names (`arrowhead`, `blueArrow`)
- **CSS classes:** hyphenated lowercase (`box-face`, `node-primary`)

## Tooling

| Tool                 | When to use                                          |
|----------------------|------------------------------------------------------|
| Hand-crafted SVG     | Matrices, box diagrams, flow diagrams, custom layouts|
| Graphviz DOT         | Network graphs, decision trees, dependency graphs    |
| Jupyter / Matplotlib | Statistical charts, long-tail distributions          |

Output format is always SVG.

## Commit Messages

- Imperative mood, action-driven
- Examples: `Add`, `Optimize`, `Update`, `Improve`, `Fix`
- Describe the change, not the file: "Add stocks and flows diagram for bug backlog analysis"
