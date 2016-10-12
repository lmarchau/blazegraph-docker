FROM maven:latest
MAINTAINER Luc Marchaud <luc.marchaud@gperfect-memory.com>

WORKDIR /opt
RUN git clone -b BLAZEGRAPH_RELEASE_2_1_4 \
              --single-branch \
							https://github.com/blazegraph/database.git \
							blazegraph

RUN export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,address=5005,suspend=n -ea -Xmx4g -server"

WORKDIR /opt/blazegraph
RUN /opt/blazegraph/scripts/mavenInstall.sh

ENTRYPOINT ["/opt/blazegraph/scripts/startBlazegraph.sh"]""]
