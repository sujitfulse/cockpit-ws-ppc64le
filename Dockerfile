FROM jcajka/fedora22-ppc64le

RUN dnf -y update && dnf install -y sed openssl && dnf clean all

# Again see above ... we do our branching in shell script
RUN dnf install -y cockpit-ws && dnf clean all 

# And the stuff that starts the container
RUN mkdir -p /container && ln -s /host/proc/1 /container/target-namespace
ADD atomic-* /container/
RUN chmod -v +x /container/atomic-*

LABEL INSTALL /usr/bin/docker run -ti --rm --privileged -v /:/host IMAGE /container/atomic-install
LABEL UNINSTALL /usr/bin/docker run -ti --rm --privileged -v /:/host IMAGE /cockpit/atomic-uninstall
LABEL RUN /usr/bin/docker run -d --privileged --pid=host -v /:/host IMAGE /container/atomic-run --local-ssh

# Look ma, no EXPOSE

CMD ["/container/atomic-run"]
