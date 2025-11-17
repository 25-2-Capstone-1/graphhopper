FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

RUN apt-get update && apt-get install -y git maven bash wget unzip && rm -rf /var/lib/apt/lists/*

# GraphHopper 소스 복사
COPY . /app/

# Build GraphHopper 11
RUN mvn -q -DskipTests=true package

EXPOSE 8989

# entrypoint
ENTRYPOINT ["./graphhopper.sh"]
