## 0.2.0 (2023-07-04)

### Bug Fixes

- **locale**: [ed62936d](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/ed62936d697968e7721e130045250f3926e34923) - Tanty thrown by ansibe now fixed [ [!81](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/81) [#12](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/12) ]
- **dockerfile**: [6a108735](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/6a1087350720f46d0d5cec73737a9d05b1e0d3e5) - typo in command
- **container**: [9705f44c](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/9705f44c8ac379268ab3e027b130ee438d0c8c89) - correct the dpkg ldconfig error [ [#12](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/12) ]

### Features

- **collection**: [823c9c79](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/823c9c79494517641301201c213a712021364f81) - install community.mysql collection [ [!81](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/81) ]
- **security**: [1a1dc118](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/1a1dc118bb358eac44faf100a2af655180b329e5) - update system packages during build [ [!81](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/81) ]
- **env_var**: [a430dc64](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/a430dc6400d53f4c494fd8f6ab47484103833168) - new env var of DEBIAN_FRONTEND noninteractive [ [!81](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/81) ]
- **software**: [0c05490b](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/0c05490bd9c11924c16a6341bdaa1f8ed1d83c58) - install sshpass for ssh client usage [ [#12](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/12) ]

## 0.1.1 (2023-06-15)

## 0.1.1rc5 (2023-06-15)

## 0.1.1rc4 (2023-06-12)

## 0.1.1rc3 (2023-06-08)

## 0.1.1rc2 (2023-06-08)

### Continious Integration

- [f5c4b33c](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/f5c4b33c696451629d8f521a47267ce30fee7e91) - mkdocs temp newer image [ [!29](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/29) [#8](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/8) ]

### Documentaton / Guides

- [56b6e304](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/56b6e304bbdaa9a631a18ac95ffdfe95b7fef307) - fix typo [ [!29](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/29) [#8](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/8) ]
- [b8b9348e](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/b8b9348e3061345588c51b75b30d22ece3984c56) - added initial docs [ [!29](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/29) [#8](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/8) ]

## 0.1.1rc1 (2023-06-05)

### Bug Fixes

- **python**: [e82f96a4](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/e82f96a40269b42a5421360724e93768b2958bdb) - linked ansible used python to 3.11 [ [#9](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/9) [!24](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/24) [#22](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/22) [!27](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/27) [#9](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/9) ]
- **git_config**: [318a91ce](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/318a91ce6d7bd08ff7bde514b33a13a01235afc6) - again! ensure cloned ansible-roles has submodules init [ [!9](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/9) ]
- **git_config**: [30797b45](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/30797b4577589c39eed0ae63ce2df37f9920f2a8) - ensure cloned ansible-roles has submodules init [ [!8](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/8) ]

### Code Refactor

- **build**: [e2852ebe](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/e2852ebe292bc838d95048515a8dca0d93ccbc24) - other projects included as git submodule [ [!15](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/15) [#74](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/74) ]
- **playbooks**: [07cdde82](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/07cdde820a6b42e607966257c373239bb1b20ccb) - seperated git clone to own run [ [!11](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/11) [#7](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/7) [!1](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/1) [#1](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/1) ]

### Features

- **ansible**: [a1e3a0c6](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/a1e3a0c656897c28c7d778ead46dac11e9edf5aa) - ansible.cfg added workdir roles [ [!28](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/28) ]
- **ansible**: [369987ea](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/369987eaf5755c193b9d1fd53f614799139acdd4) - add galaxy collection community.docker [ [!24](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/24) [#22](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/22) [!27](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/27) ]
- **ansible**: [e48800bf](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/e48800bf8ea2922a37992770a9b63ea6ca425cd4) - add galaxy collection ansible.posix [ [!24](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/24) [#22](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/22) [!27](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/27) ]
- **ci**: [6b785d0c](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/6b785d0c532d432c4f88387c13d12d3870a71d04) - use project gitlab-ci automagic template [ [!12](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/12) ]
- **playbooks**: [1da35d57](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/1da35d57709480ecde0573a33647f8dcb17ebffb) - add nfc ansible playbooks to image [ [!11](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/11) [#7](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/7) [!1](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/1) [#1](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/issues/1) ]
- **module**: [24a65b4d](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/24a65b4d99876c1bf09da81bab7a1942b32f2dd1) - add collection community.general [ [!10](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/10) ]

## 0.1.1rc0 (2023-05-23)

### Bug Fixes

- **ci**: [f93ef764](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/f93ef764ff07c4c8fa7582553a667eeb6d628de1) - ensure binfmt initialized [ [!7](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/7) ]
- **ci**: [f35259f7](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/f35259f796516e235bd8060c3ccfd058514343aa) - update to new template path [ [!7](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/7) ]
- **readme**: [d9df60e2](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/d9df60e27f75004ce05ccb495d970c32325cb712) - typo in dev branch badge [ [!7](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/7) ]

## 0.1.0 (2023-05-15)

### Bug Fixes

- **ci**: [42d2cb79](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/42d2cb79dfc9d1ecbdab9945b327d819f00631fe) - syntax error [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- **ci**: [53e445d1](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/53e445d15511bb7691acc273d2e0c90c02da30d8) - specify commitezen version [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- **ci**: [e1ffb03c](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/e1ffb03ce4473b4ef8d56a56847fc27390df8bfd) - use specified dind imge [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- **ci**: [cd82c7c3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/cd82c7c3d7a81a27f10c15ec3a6aaedbe2712894) - ensure submodules expanded [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]

### Continious Integration

- [b0f236d9](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/b0f236d93553f1301a8487092e0cb5105b7abccc) - update to current gitlab-ci project dev head [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- **publish**: [0a367146](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/0a367146bfa5b409273c0412fca8f4d33287068d) - default to dev tag for image [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- [f43f265c](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/f43f265c7f1691c58bcdf8bb4ec0a0bf8fb0be6f) - added initial ci jobs [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- [e6ce3f95](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/e6ce3f9581a90f5ce4d11eaf16e89b6956ec39c9) - add dummy job [ [!1](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/1) ]
- **github**: [1c517d41](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/1c517d41575b838e61561f03fcf1d118df163f55) - add github sync job [ [!1](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/1) ]

### Documentaton / Guides

- [fb7db642](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/fb7db64235133aac3ff02331b14ae8131f9da9bf) - todo [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- **readme**: [669689e8](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/669689e8df76bc3d3225081db99918cbd4b51688) - Updated Repository README
- **readme**: [2cbc4e11](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/2cbc4e11d9e4e935db54ae1e3e319b1e4d813299) - Updated Repository README

### Features

- **ci**: [3e7094c2](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/3e7094c243e8a22bf3443bf8db176a4f0b69776c) - use nfc gitlab-ci project for ci [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]
- **python_build**: [3f6e77b0](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/commit/3f6e77b0ed651a1f0418ada7d8849b5f048880f1) - compile and cache pip packages [ [!3](https://gitlab.com/nofusscomputing/projects/ansible/execution_environment/-/merge_requests/3) ]

## 0.0.1 (2023-05-05)
