FROM cp.icr.io/cp/icp4i/ace/ibm-ace-mqclient-server-prod:11.0.0.6.1-amd64
ADD Mayo_Receiver.bar /home/aceuser/initial-config/bars/
EXPOSE 5000 7600 7800 7843 9483 10100
ENV LICENSE accept


