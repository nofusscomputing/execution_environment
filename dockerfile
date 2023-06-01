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



# This Black Magic exists as libc-bin was being a turd and returning errors when trying to install git, ssh.
# see: https://askubuntu.com/questions/1339558/cant-build-dockerfile-for-arm64-due-to-libc-bin-segmentation-fault
# see: https://github.com/dcycle/prepare-docker-buildx/blob/09057fe4879e31ee780b9e69b87f41327ca8cd8e/example/Dockerfile#L8-L10
RUN export DEBIAN_FRONTEND=noninteractive \
  && apt update \
  && apt --fix-broken install \
  && apt install -y libc-bin locales-all \
  && apt update \
  && apt install --reinstall --no-install-recommends -yq \
    openssh-client \
    git || true \
  && dpkg --purge --force-all libc-bin \
  && apt-get install --no-install-recommends -y \
    openssh-client \
    git \
  # End of Black Magic
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/ansible/roles \
  && mkdir -p /etc/ansible/collections \
  && mkdir -p /workdir \
  && apt list --installed


WORKDIR /workdir


COPY requirements.txt /tmp/requirements.txt


RUN pip install --upgrade pip

RUN pip install --index-url https://gitlab.com/api/v4/projects/45741845/packages/pypi/simple -r /tmp/requirements.txt


RUN ansible-galaxy collection install \
    awx.awx \
    kubernetes.core \
    # community.general.gitlab_*
    community.general