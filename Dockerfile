FROM maven:latest
MAINTAINER Luc M. <luc.marchaud@gmail.com>

RUN apt-get update && apt-get install net-tools less

WORKDIR /opt
RUN git clone -b BLAZEGRAPH_RELEASE_2_1_4 \
              --single-branch \
							https://github.com/blazegraph/database.git \
							blazegraph

ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,address=5005,suspend=n -ea -Xmx4g -server"

WORKDIR /opt/blazegraph
RUN /opt/blazegraph/scripts/mavenInstall.sh

ENTRYPOINT ["/opt/blazegraph/scripts/startBlazegraph.sh"]
