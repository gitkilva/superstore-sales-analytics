# Project Notes

## Data Grain
- Dataset is at order-line level
- All aggregations handled via measures to prevent inflated metrics

## Modeling Decisions
- Separate date table created to support time intelligence
- Relationships built using date keys

## Validation
- Revenue and profit validated against Excel pivots
- Distinct counts used for orders and customers

## Design Choices
- Line charts used for trends
- Bar charts for category comparison
- Pareto analysis to highlight concentration risk
