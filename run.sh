#!/bin/sh

set -e

KIBANA_CONF_FILE="/usr/local/kibana-${KIBANA_VERSION}/config/kibana.yml"

KIBANA_ES_URL=${KIBANA_ES_URL:-http://localost:9200}

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "${KIBANA_CONF_FILE}"

exec /usr/local/kibana-${KIBANA_VERSION}/bin/kibana
