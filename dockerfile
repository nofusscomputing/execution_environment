FROM --platform=$TARGETPLATFORM python:3.11-bullseye

# Ansible chucks a wobbler without. see: https://github.com/ansible/ansible/issues/78283
ENV LC_ALL en_US.UTF-8

ENV ANSIBLE_PLAYBOOK_DIR=/etc/ansible/playbooks


COPY includes /


# Ref: https://github.com/opencontainers/image-spec/blob/d86384efdb8c30770a92415c100f57a9bffbb64e/annotations.md
LABEL \
  # org.opencontainers.image.authors="{contributor url}" \
  org.opencontainers.image.vendor="No Fuss Computing" \
  # org.opencontainers.image.url="{dockerhub url}" \
  # org.opencontainers.image.documentation="{docs url}" \
  # org.opencontainers.image.source="{repo url}" \
  # org.opencontainers.image.revision="{git commit sha at time of build}" \
  org.opencontainers.image.title="No Fuss Computings Ansible Execution Environment" \
  org.opencontainers.image.description="An ansible execution environment for awx/tower and CI/CD pipelines" \
  org.opencontainers.image.vendor="No Fuss Computing"
  # org.opencontainers.image.version="{git tag}"


RUN export DEBIAN_FRONTEND=noninteractive \
  && apt update \
    # SoF fixing dpkg ldconfig not found error
  && cd /tmp \
  && apt-get download \
    libc-bin \
  && dpkg --extract ./libc-bin_*.deb /tmp/deb \
  && cp /tmp/deb/sbin/ldconfig /sbin/ \
  && rm -Rf /tmp/deb \
  && rm libc-bin_*.deb \
  && apt-get install --reinstall \
    libc-bin \
    # EoF fixing dpkg ldconfig not found error
  && apt-get install --no-install-recommends -y \
    openssh-client \
    git \
    sshpass \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/ansible/roles \
  && mkdir -p /etc/ansible/collections \
  && mkdir -p /workdir \
  && apt list --installed \
    # see issue https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/9 for following two lines
  && rm /usr/bin/python3 \
  && ln -s /usr/local/bin/python3.11 /usr/bin/python3


WORKDIR /workdir


COPY requirements.txt /tmp/requirements.txt


RUN pip install --upgrade pip

RUN pip install --index-url https://gitlab.com/api/v4/projects/45741845/packages/pypi/simple -r /tmp/requirements.txt


RUN ansible-galaxy collection install \
    awx.awx \
    kubernetes.core \
    # community.general.gitlab_*
    community.general \
    # ansible.posix.authorized_key for SSH
    ansible.posix \
    # docker managment
    community.docker