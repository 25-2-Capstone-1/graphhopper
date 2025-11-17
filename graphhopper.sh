#!/bin/bash

# GraphHopper 프로젝트 루트에서 실행

# 명령어 인자 확인
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <command> [osm_file]"
    echo "Commands: import, web"
    exit 1
fi

COMMAND=$1
OSM_FILE=$2

# Maven 빌드 후 jar 위치
JAR_FILE="web/target/graphhopper-web-*.jar"

# 실행
if [ "$COMMAND" == "import" ]; then
    echo "Importing OSM data..."
    java -Xmx2g -jar $JAR_FILE import $OSM_FILE
elif [ "$COMMAND" == "web" ]; then
    echo "Starting GraphHopper server..."
    java -Xmx2g -jar $JAR_FILE web $OSM_FILE
else
    echo "Unknown command: $COMMAND"
    exit 1
fi
