FROM quay.io/kubealex/image-mode-baseos:rhel10.1

RUN dnf install -y postgresql-server postgresql && dnf clean all

COPY init/ /usr/share/train-tickets/db-init/

COPY usr/ /usr/

RUN systemctl enable train-tickets-db-init.service && \
    systemctl enable train-tickets-db.service
