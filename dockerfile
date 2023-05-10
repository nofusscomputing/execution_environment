# docker pull python:3.9.16-slim-bullseye
# docker pull python:3.10.11-slim-bullseye
# docker pull python:3.10-slim-bullseye
# docker pull python:3.11-slim-bullseye
# docker pull python:3.11-bullseye
FROM --platform=$BUILDPLATFORM python:3.11-bullseye as scratchpad


RUN export DEBIAN_FRONTEND=noninteractive \
  && dpkg-reconfigure debconf -f noninteractive \
  && apt update \
  && apt install --reinstall --no-install-recommends -yq \
    git


RUN git clone -b development --depth 1 https://gitlab.com/nofusscomputing/projects/ansible-roles.git /tmp/ansible-roles 



FROM --platform=$TARGETPLATFORM python:3.11-bullseye

# Ansible chucks a wobbler without. see: https://github.com/ansible/ansible/issues/78283
ENV LC_ALL en_US.UTF-8


COPY --from=scratchpad /tmp/ansible-roles/roles /etc/ansible/roles

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
  # && apt-get install --reinstall --no-install-recommends -yq \
  #   build-essential \
  #   libssl-dev \
  #   libffi-dev \
  #   python3-dev \
  #   cargo \
  #   pkg-config \
  # End of Black Magic
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/ansible/roles \
  && mkdir -p /etc/ansible/collections \
  && mkdir -p /workdir


WORKDIR /workdir

COPY ansible.cfg /etc/ansible/ansible.cfg

# # see: https://github.com/pyca/cryptography/blob/998e86659ae750562ecc0bcf0eabd1828fd5c9ed/docs/installation.rst#debianubuntu
# RUN export DEBIAN_FRONTEND=noninteractive \
#   && apt update \
#   && apt-get install --reinstall --no-install-recommends -yq \
#     build-essential \
#     libssl-dev \
#     libffi-dev \
#     python3-dev \
#     cargo \
#     pkg-config


RUN pip install --upgrade pip \
  && pip install --upgrade \
    setuptools \
    wheel
    #setuptools-rust


RUN pip install \
    ansible-core==2.14.5 \
    ansible-lint==6.15.0


RUN ansible-galaxy collection install \
    awx.awx \
    kubernetes.core