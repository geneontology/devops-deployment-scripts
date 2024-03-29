ARG base_image=ubuntu:22.04

FROM ${base_image}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -u -y install lsb-release python3 binutils python3-venv python3-pip wget git emacs-nox bash-completion vim
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
        | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install terraform

RUN apt-get install -y awscli mg
RUN apt-get -qq purge && apt-get -qq clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible s3cmd

ENV GEN_SSH_KEYS=0
ENV AWS_ACCESS_KEY=""
ENV AWS_ACCESS_SECRET=""
ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV AWS_SHARED_CREDENTIALS_FILE=/tmp/go-aws-credentials

ADD setup.py README.md /build_dir/
ADD go /build_dir/go

RUN pip install --no-cache-dir /build_dir && rm -rf /build_dir

COPY ./docker/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
