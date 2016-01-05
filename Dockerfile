# Use latest jboss/base-jdk:7 image as the base
FROM jboss/base-jdk:7

# Set the INFINISPAN_SERVER_HOME env variable
ENV INFINISPAN_SERVER_HOME /opt/jboss/infinispan-server

# Set the INFINISPAN_VERSION env variable
ENV INFINISPAN_VERSION 7.2.5.Final 

# Download and unzip Infinispan server
RUN cd $HOME && curl "http://downloads.jboss.org/infinispan/$INFINISPAN_VERSION/infinispan-server-$INFINISPAN_VERSION-bin.zip" | bsdtar -xf - && mv $HOME/infinispan-server-$INFINISPAN_VERSION $HOME/infinispan-server && chmod +x /opt/jboss/infinispan-server/bin/*.sh

COPY start.sh /opt/jboss/infinispan-server/bin/

USER root

RUN yum -y install telnet && yum clean all

# Expose Infinispan server  ports 
EXPOSE 57600 7600 8080 8181 9990 11211 11222 

CMD ["/opt/jboss/infinispan-server/bin/start.sh"]
