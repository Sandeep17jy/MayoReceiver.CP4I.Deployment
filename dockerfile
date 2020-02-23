
ARG TRANS_QM_NAME=hercules
ARG TRANS_QM_HOSTNAME=hercules-service
ARG TRANS_QM_PORT=1414
ARG TRANS_QM_CHANNEL=DEV.ADMIN.SVRCONN

FROM cp.icr.io/cp/icp4i/ace/ibm-ace-mqclient-server-prod:11.0.0.6.1-amd64
ADD *.bar /home/aceuser/initial-config/bars/
EXPOSE 5000 7600 7800 7843 9483 10100
ENV LICENSE accept

COPY initial-config/ /home/aceuser/initial-config/
COPY scripts/ /tmp/

USER root
RUN chown -R aceuser:aceuser /home/aceuser/initial-config/*
RUN yum install -y net-tools
USER aceuser
COPY bars_aceonly/* /home/aceuser/bars/
RUN ace_compile_bars.sh

