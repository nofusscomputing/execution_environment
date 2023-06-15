---
title: Ansible Execution Environment
description: How to use No Fuss Computings Ansible Execution Environment Docker Container.
date: 2023-06-05
template: project.html
about: https://gitlab.com/nofusscomputing/projects/ansible/execution_environment
---

This docker container is designed to be used with Ansible AWX/Tower or from within the Gitlab CI/CD Environment. Included in the container are the following projects from us:

- [Ansible Playbooks](../ansible_playbooks/index.md)

- [Ansible Roles](../ansible-roles/index.md)

This container can be found at dockerhub at <https://hub.docker.com/r/nofusscomputing/ansible-ee> and for use from docker with `docker pull nofusscomputing/ansible-ee`. versioning and git tags are in accordance with semver.

The docker container is built from the python-slim image with a few extra items added to suit the containers intent. Please refer to the [dockerfile](#Dockerfile). we currently build containers for amd64, armv7 and aarch640.


## Features

Included features are only included if a role that we create requires it. Currently we use the pythonx.xx-{debian release} as abase image which makes available the debian packages should you require additional features/sofware not specified below.

- custom [ansible.cfg](#ansible%20config%20file)

- environmental variable `ANSIBLE_PLAYBOOK_DIR` set pointing to `/etc/ansible/playbooks`.

- Galaxy Collections included

    - Any collection installed with ansible-core

    - awx.awx

    - kubernetes.core

    - community.general

    - ansible.posix

    - community.docker

- Additional Software within container

    - git

    - openssh-client

    - obviously, since its a python container, python.


## Docker Tags

We use the following tags for our docker containers

- `latest` This is the latest stable code from the master branch, and will always match the newest non `rc` git and dockerhub tag. Built on merge from development to master branch.

- `\d.\d\.d` i.e. `1.0.0` This layout of tag is the latest git tag from the master branch. Built on merge from development to master branch after the gitlab release job runs.

- `dev` This tag is from the latet build from the development branch, this is considered unstable. on every merge to this branch, the container is built and pushed to this tag on dockerhub.

    !!! Info
        We use this tag within our gitlab-ci roles. Eventhough it's considered unstable, using it for our CI jobs enables an extra gate in our release cycle to find and fix issues prior to releaseing to stable.

- `\d.\d.\drc\d` i.e. `1.0.0.rc0` This tag is used on the development branch as a means to take a snapshot of the code. Built on the gitlab release job being triggered on the development branch.


## Dockerfile

``` dockerfile title="dockerfile" linenums="1"

--8<-- "dockerfile"

```

This dockerfile is only used to build the python packages for cross platform compilation.

``` dockerfile title="dockerfile-build_cache" linenums="1"

--8<-- "dockerfile-build_cache"

```


## ansible config file

This ansible config file is included within this docker container.

``` ini title="/etc/ansible/ansible.cfg" linenums="1"

--8<-- "includes/etc/ansible/ansible.cfg"

```
