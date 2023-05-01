# Use an official Tomcat runtime as a parent image
FROM tomcat:latest

# Copy the war file to the webapps directory
COPY gateway.war /usr/local/tomcat/webapps/

# Copy the other directories to the Tomcat installation directory
COPY docs /usr/local/tomcat/webapps/docs
COPY examples /usr/local/tomcat/webapps/examples
COPY host-manager /usr/local/tomcat/webapps/host-manager
COPY manager /usr/local/tomcat/webapps/manager
COPY ROOT /usr/local/tomcat/webapps/ROOT
COPY gateway /usr/local/tomcat/webapps/gateway
# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

