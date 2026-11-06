
#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${CATALINA_HOME:-}" ]]; then
    echo "Error: CATALINA_HOME is not set."
    exit 1
fi

CATALINA_SCRIPT="${CATALINA_HOME}/bin/catalina.sh"

if [[ ! -x "$CATALINA_SCRIPT" ]]; then
    echo "Error: catalina.sh not found: ${CATALINA_SCRIPT}"
    exit 1
fi

echo "Stopping Tomcat..."

"$CATALINA_SCRIPT" stop

echo "Tomcat shutdown command completed."
