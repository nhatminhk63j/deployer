FROM ubuntu:20.04

# Install ca-certificates to use sendgrid.
RUN apt-get update -y
RUN apt-get install -y ca-certificates

# Install curl/wget
RUN apt-get install curl
RUN apt-get install wget


# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.24.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN kubectl version

# Install helmfile
RUN wget -O helmfile_linux_amd64 https://github.com/roboll/helmfile/releases/download/v0.135.0/helmfile_linux_amd64
RUN chmod +x helmfile_linux_amd64
RUN mv helmfile_linux_amd64 ~/.local/bin/helmfile

# Install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

RUN helm plugin install https://github.com/databus23/helm-diff

# Install yq
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CC86BB64
RUN add-apt-repository ppa:rmescandon/yq
RUN apt update
RUN apt install yq -y

# Install niet
RUN pip install niet
