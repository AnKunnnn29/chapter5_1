# Sử dụng Tomcat 10 (Jakarta EE 9+)
FROM tomcat:10.1-jdk17

# Xóa webapps mặc định để tránh ROOT/index.jsp default của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR của bạn và đổi tên thành ROOT.war
COPY target/mavenproject1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Mở port 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
