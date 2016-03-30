#!/usr/bin/env bash

set -e
set -u
set -o pipefail

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"

check_ecs_cli() {
    which ecs-cli | cat
    ecs-cli configure -c circlecitest -r ap-northeast-1 | cat
    docker images | cat
    pwd | cat
    echo $CIRCLE_SHA1
    ls | cat
    cat ~/.ecs/config
    aws ecr get-login --region us-east-1 | bash
    docker push 418299443513.dkr.ecr.us-east-1.amazonaws.com/rw/circleci:$CIRCLE_SHA1
    cat ./docker-compose.yml
    ecs-cli compose up
}

check_ecs_cli

