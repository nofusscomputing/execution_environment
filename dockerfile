# docker pull python:3.9.16-slim-bullseye
# docker pull python:3.10.11-slim-bullseye

FROM python:3.9.16-slim-bullseye as scratchpad


RUN apt update && \
  apt install --no-install-recommends -y \
    git


RUN git clone -b development --depth 1 https://gitlab.com/nofusscomputing/projects/ansible-roles.git /tmp/ansible-roles 



FROM python:3.9.16-slim-bullseye

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
  org.opencontainers.image.vendor="No Fuss Computing" \
  # org.opencontainers.image.version="{git tag}"


RUN apt update && \
  apt install --no-install-recommends -y \
    git \
    ssh && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir -p /etc/ansible/roles && \
  mkdir -p /etc/ansible/collections && \
  mkdir -p /workdir

WORKDIR /workdir

COPY ansible.cfg /etc/ansible/ansible.cfg


RUN pip install --upgrade pip \
  && pip install \
    ansible \
    ansible-lint

RUN ansible-galaxy collection install \
    awx.awx \
    kubernetes.core