FROM ubuntu:jammy

LABEL version="1.3.0"
LABEL repository="http://github.com/chencaidy/action-megacmd"
LABEL homepage="http://github.com/chencaidy/action-megacmd"
LABEL maintainer="chen@caidy.cc"

LABEL com.github.actions.name="GitHub Action for MEGA"
LABEL com.github.actions.description="Wraps the megacmd CLI to enable interaction with MEGA."
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="red"

RUN apt-get update && apt-get install curl gnupg2 -y && \
curl https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd-xUbuntu_22.04_amd64.deb --output megacmd.deb && \
apt install ./megacmd.deb -y && \
apt-get remove -y curl && \
apt-get clean

ENV USERNAME NOBODY
ENV PASSWORD CHANGEME

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
