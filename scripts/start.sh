
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

MODE="${1:-normal}"

case "$MODE" in
    normal)
        echo "Starting Tomcat..."
        "$CATALINA_SCRIPT" start
        ;;
    debug)
        echo "Starting Tomcat in debug mode..."
        "$CATALINA_SCRIPT" jpda start
        ;;
    *)
        echo "Usage: $0 [normal|debug]"
        exit 1
        ;;
esac

echo "Tomcat startup command completed."
