# ---- Stage 1: Build WAR với Maven ----
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Build WAR (bỏ qua test cho nhanh)
RUN mvn -B -DskipTests clean package

# ---- Stage 2: Runtime với Tomcat 11 ----
FROM tomcat:11-jdk17
WORKDIR /usr/local/tomcat

# Xóa webapps mặc định (ROOT, examples, docs...)
RUN rm -rf webapps/*

# Copy WAR đã build thành ROOT.war (để app chạy ở "/")
COPY --from=build /app/target/ltweb6-fixed-*.war webapps/ROOT.war

EXPOSE 8080
 