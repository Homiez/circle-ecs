#!/usr/bin/env bash

set -e
set -u
set -o pipefail

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"

check_ecs_cli() {
    which ecs-cli | cat
    ecs-cli configure -c circlecitest -r ap-northeast-1 | cat
    cat pwd
    cat CIRCLE_SHA1
    cat ~/docker-compose.yml
    cat ~/.ecs/config
    ecs-cli compose up
}

check_ecs_cli

