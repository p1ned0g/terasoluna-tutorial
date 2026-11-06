
#!/bin/bash
set -e
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "You are in ${PROJECT_DIR}"

cd "${PROJECT_DIR}"

echo "===== 1. Maven Build ====="
mvn clean package

echo "===== 2. Stop Application ====="
./scripts/stop.sh

echo "===== 3. Deploy Application ====="
./scripts/deploy.sh

echo "===== 4. Start Application ====="
./scripts/start.sh

echo "===== Deployment Completed ====="