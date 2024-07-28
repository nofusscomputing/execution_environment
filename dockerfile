ARG release_name=bookworm

ARG kubernetes_version=1.29


FROM --platform=$TARGETPLATFORM quay.io/ansible/receptor:v1.4.4 as receptor


FROM --platform=$TARGETPLATFORM python:3.11-slim-${release_name} as prep


ARG kubernetes_version


ENV DEBIAN_FRONTEND noninteractive


RUN apt update; \
  apt install -y \
    curl \
    gpg


RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null; \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" > /etc/apt/sources.list.d/helm.list; \
  cat /etc/apt/sources.list.d/helm.list;


RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v${kubernetes_version}/deb/Release.key | gpg --dearmor | tee /usr/share/keyrings/kubernetes.gpg > /dev/null; \
  echo "deb [signed-by=/usr/share/keyrings/kubernetes.gpg] https://pkgs.k8s.io/core:/stable:/v${kubernetes_version}/deb/ /" > /etc/apt/sources.list.d/kubernetes.list; \
  cat /etc/apt/sources.list.d/kubernetes.list;


FROM --platform=$TARGETPLATFORM python:3.11-slim-${release_name}


# Ansible chucks a wobbler without. see: https://github.com/ansible/ansible/issues/78283
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

ENV ANSIBLE_PLAYBOOK_DIR=/etc/ansible/playbooks

ENV ANSIBLE_COLLECTIONS_PATH=/etc/ansible/collections


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


RUN apt update \
    # SoF fixing dpkg ldconfig not found error
  && cd /tmp \
  && apt-get download \
    libc-bin \
  && dpkg --extract $(ls | grep libc-bin_ | grep -a '.deb') /tmp/deb \
  && cp /tmp/deb/sbin/ldconfig /sbin/ \
  && rm -Rf /tmp/deb \
  && rm $(ls | grep libc-bin_ | grep -a '.deb') \
  && apt-get install -y --reinstall \
    libc-bin \
    # EoF fixing dpkg ldconfig not found error
    # Set Locale to en_US as ansible requires a locale for it to function without chucking a tantrum!!
  && apt install -y \
    locales \
    apt-transport-https \
  && sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
  && locale-gen;


COPY --from=prep --chmod=644 /etc/apt/sources.list.d/helm.list /etc/apt/sources.list.d/helm.list

COPY --from=prep --chmod=644 /usr/share/keyrings/helm.gpg /usr/share/keyrings/helm.gpg

COPY --from=prep --chmod=644 /etc/apt/sources.list.d/kubernetes.list /etc/apt/sources.list.d/kubernetes.list

COPY --from=prep --chmod=644 /usr/share/keyrings/kubernetes.gpg /usr/share/keyrings/kubernetes.gpg


RUN apt update; \
  apt list --upgradable \
  && apt upgrade --no-install-recommends -y \
  && apt-get install --no-install-recommends -y \
    openssh-client \
    git \
    helm \
    kubectl \
    sshpass \
    postgresql-common \
    postgresql-client \
    mariadb-client \
    mariadb-client-core \
  && mkdir -p /etc/ansible/roles \
  && mkdir -p /etc/ansible/collections \
  && mkdir -p /workdir \
  && apt list --installed \
    # see issue https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/9 for following two lines
  && apt remove -y \
    python3* \
    libpython3*; \
  helm plugin install https://github.com/databus23/helm-diff; \
  rm -rf /var/lib/apt/lists/*


WORKDIR /workdir


COPY requirements.txt /tmp/requirements.txt

COPY --from=receptor /usr/bin/receptor /usr/bin/receptor

RUN pip install --upgrade pip; \
  mkdir -p /var/run/receptor; \
  mkdir -p /etc/receptor; \
  chmod 777 /etc/receptor; \
  git config --global --add safe.directory '*'

RUN pip install --index-url https://gitlab.com/api/v4/projects/45741845/packages/pypi/simple -r /tmp/requirements.txt


RUN ansible-galaxy collection install \
    awx.awx==24.0.0 \
    # ansible.posix.authorized_key for SSH
    ansible.posix==1.5.4 \
    ansible.utils==3.1.0 \
    community.crypto==2.18.0 \
    community.dns==2.8.1 \
    # docker managment
    community.docker==3.8.0 \
    # community.general.gitlab_*
    community.general==8.4.0 \
    community.mysql==3.9.0 \
    community.postgresql==3.4.0 \
    netbox.netbox==3.17.0 \
    theforeman.foreman==4.0.0; \
  ansible-galaxy collection install --pre \
    nofusscomputing.glpi==0.1.0-a1 \
    nofusscomputing.kubernetes==1.13.0 \
    nofusscomputing.netbox==0.4.0
