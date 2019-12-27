FROM python:3.7-slim-buster as firststage

LABEL maintainer="Shawn Friedel <emailshawnf@gmail.com>"

ENV PATH="/root/.local/bin:$PATH"
ENV PYTHONIOENCODING=UTF-8

RUN apt-get update && apt-get install -y \
curl \
wget \
groff \
zsh \
git \
jq \
docker.io \
&& rm -rf /var/lib/apt/lists/* 

RUN curl --location \
"https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" \
| tar xz -C /tmp \
&& mv /tmp/eksctl /usr/local/bin

RUN curl -LO \
https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl \
&& chmod u+x kubectl && mv kubectl /usr/local/bin/kubectl

RUN pip install awscli --upgrade --prefix /usr/local

RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

RUN sed -i "/^plugins=/c\plugins=(aws kubectl)" /root/.zshrc

RUN git clone https://github.com/denysdovhan/spaceship-prompt.git "/usr/local/bin/themes/spaceship-prompt"

RUN ln -s "/usr/local/bin/themes/spaceship-prompt/spaceship.zsh-theme" "/root/.oh-my-zsh/themes/spaceship.zsh-theme"

RUN sed -i "/^ZSH_THEME=/c\ZSH_THEME=spaceship" /root/.zshrc

RUN apt-get remove -y \
curl \
wget \
git \
&& apt autoremove -y \
&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/zsh" ]
