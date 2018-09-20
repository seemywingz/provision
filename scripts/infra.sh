#!/bin/bash
# 'alias' script for ../docker_infra/infra
 
SCRIPT_NAME=${BASH_SOURCE[0]##*/}
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
 
function die() {
    echo "${SCRIPT_NAME:-} ERROR $1"
    exit 1
}
 
INFRA_DIR="${SCRIPT_DIR}/../redt-docker-infra"
 
[ -d "${INFRA_DIR}" ] || die "${INFRA_DIR} not found!"
 
INFRA_DIR=$( cd  ${INFRA_DIR} && pwd )
INFRA_SCRIPT="${INFRA_DIR}/infra"
 
[ -x "${INFRA_SCRIPT}" ] || die "${INFRA_SCRIPT} not found!"
 
# Set the services we need for platform
 
export SERVICES="mysql"
 
${INFRA_SCRIPT} "$@"