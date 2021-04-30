FROM registry.redhat.io/ubi8:latest
ENV HOME=/tmp/

# install wget
RUN yum install wget -y

USER 1001

RUN wget https://raw.githubusercontent.com/Microsoft/OMS-Agent-for-Linux/master/installer/scripts/onboard_agent.sh
RUN chmod +x onboard_agent.sh
CMD ["./onboard_agent.sh -w `cat /var/run/secrets/kubernetes.io/sentinel-workspace/workspaceid/` -s `cat /var/run/secrets/kubernetes.io/sentinel-workspace/workspacekey/` -d opinsights.azure.com"]
