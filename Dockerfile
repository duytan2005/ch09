FROM tomcat:9.0.108-jdk11

# Xóa webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build vào Tomcat
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]