FROM registry.connect.redhat.com/balabit/syslog-ng-ose:latest
ENV HOME=/tmp/
WORKDIR /tmp/
# install wget
RUN apt-get install wget

USER 1001

wget -O ${BUNDLE_X64} ${GITHUB_RELEASE_X64}${BUNDLE_X64} && $SUDO sh ./${BUNDLE_X64} ${bundleParameters}
RUN wget https://raw.githubusercontent.com/Microsoft/OMS-Agent-for-Linux/master/installer/scripts/onboard_agent.sh -O /tmp/onboard_agent.sh
RUN chmod +x /tmp/onboard_agent.sh
RUN ["/tmp/onboard_agent.sh -w `cat /var/run/secrets/kubernetes.io/sentinel-workspace/workspaceid` -s `cat /var/run/secrets/kubernetes.io/sentinel-workspace/workspacekey` -d opinsights.azure.com"]
CM [""]