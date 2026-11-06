#!/usr/bin/env bash
set -euo pipefail

# Project settings
APP_NAME="todo"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WAR_DIR="${PROJECT_DIR}/target"
WEBAPPS_DIR="${CATALINA_BASE:-${CATALINA_HOME:?CATALINA_HOME is not set}}/webapps"

# Find WAR file
WAR_FILE="${1:-}"

if [[ -z "$WAR_FILE" ]]; then
    shopt -s nullglob
    WAR_FILES=("${WAR_DIR}"/*.war)

    if [[ ${#WAR_FILES[@]} -ne 1 ]]; then
        echo "Error: Expected exactly one WAR file in ${WAR_DIR}"
        echo "Found: ${#WAR_FILES[@]}"
        exit 1
    fi

    WAR_FILE="${WAR_FILES[0]}"
fi

if [[ ! -f "$WAR_FILE" ]]; then
    echo "Error: WAR file not found: ${WAR_FILE}"
    exit 1
fi

mkdir -p "$WEBAPPS_DIR"

echo "Deploying ${WAR_FILE} ..."

cp "$WAR_FILE" "${WEBAPPS_DIR}/${APP_NAME}.war"

echo "Deployment completed."
echo "Context path: /${APP_NAME}"
