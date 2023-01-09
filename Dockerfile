FROM mcr.microsoft.com/cbl-mariner/base/core:2.0

RUN tdnf install -y \
        gawk \
        glibc-devel \
	git \
	ca-certificates


RUN curl https://aka.ms/install-vscode-server/setup.sh -Lo setup.sh \
	&& chmod +x setup.sh \
	&& ./setup.sh


RUN  tdnf install -y mariner-repos-extended

RUN  rpm --import https://packages.microsoft.com/keys/microsoft.asc \
     && sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' \
     && tdnf check-update \
     && tdnf -y install code

ENV DONT_PROMPT_WSL_INSTALL=OK

ENTRYPOINT [ "code", "tunnel", "--accept-server-license-terms"]

RUN groupadd --gid 1000 vscode \
    && useradd --uid 1000 --gid vscode --shell /bin/bash --create-home vscode

USER vscode

WORKDIR /home/vscode
