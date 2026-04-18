#!/bin/bash
set -e

# Substitute environment variables in config.yaml
# Postgres
sed -i "s|REPLACE_WITH_POSTGRES_HOST|${POSTGRES_HOST:-postgres}|g" config.yaml
sed -i "s|REPLACE_WITH_POSTGRES_USER|${POSTGRES_USER:-postgres}|g" config.yaml
sed -i "s|REPLACE_WITH_POSTGRES_PASSWORD|${POSTGRES_PASSWORD:-postgres}|g" config.yaml
sed -i "s|REPLACE_WITH_POSTGRES_DB|${POSTGRES_DB:-postgres}|g" config.yaml
sed -i "s|REPLACE_WITH_POSTGRES_COLLECTION|${POSTGRES_COLLECTION_NAME:-memories}|g" config.yaml

# Neo4j
sed -i "s|REPLACE_WITH_NEO4J_URI|${NEO4J_URI:-bolt://neo4j:7687}|g" config.yaml
sed -i "s|REPLACE_WITH_NEO4J_USERNAME|${NEO4J_USERNAME:-neo4j}|g" config.yaml
sed -i "s|REPLACE_WITH_NEO4J_PASSWORD|${NEO4J_PASSWORD:-neo4j}|g" config.yaml

# LLM
sed -i "s|REPLACE_WITH_OPENROUTER_API_KEY|${OPENROUTER_API_KEY}|g" config.yaml

echo "=== Resolved config.yaml ==="
cat config.yaml
echo "=== Starting mem0 API ==="

# Start the application
exec uvicorn main:app --host 0.0.0.0 --port 8000
