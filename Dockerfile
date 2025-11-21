# Base Image
FROM eclipse-temurin:21-jre-alpine

# Work Directory 설정
WORKDIR /app

# JAR 파일 복사 (실제 파일 이름으로 수정 필요)
# COPY graphhopper-web/target/graphhopper-web-12.0-SNAPSHOT-shaded.jar /app/app.jar
COPY graphhopper/web/target/graphhopper-web-12.0-SNAPSHOT.jar /app/app.jar

# 설정 파일 복사
COPY config.yml /app/config.yml

# 포트 노출
EXPOSE 8989

# 실행 명령
ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["server", "config.yml"]
