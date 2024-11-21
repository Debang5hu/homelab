FROM kalilinux/kali-rolling


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nmap \
    curl \
    wget \
    python3 \
    python3-pip \
    tmux \
    netcat-traditional \
    ffuf \
    hydra \
    hashcat \
    smbclient \
    crackmapexec \
    ldap-utils \
    git \
    gcc \
    ftp \
    enum4linux \
    rlwrap \
    sudo \
    golang \
    net-tools \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean


RUN go install github.com/lc/gau/v2/cmd/gau@latest && \
    go install github.com/tomnomnom/gf@latest && \
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest && \
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && \
    git clone https://github.com/ropnop/kerbrute.git /opt/kerbrute


RUN cd /opt/kerbrute && go build -o /opt/kerbrute/kerbrute

# user privs
RUN useradd -ms /bin/bash 2yuk && \
    echo '2yuk:2yuk!' | chpasswd && \
    usermod -aG sudo 2yuk && \
    echo "2yuk ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/2yuk

# permission
RUN mkdir -p /home/2yuk/workspace && \
    chown -R 2yuk:2yuk /home/2yuk/workspace


WORKDIR /home/2yuk/workspace

USER 2yuk

CMD ["tmux"]
