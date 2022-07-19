FROM ubuntu:20.04

# Install ca-certificates to use sendgrid.
RUN apt-get update -y
RUN apt-get install -y ca-certificates

# Install curl/wget/git
RUN apt-get update -y
RUN apt-get install -y curl
RUN apt-get update -y
RUN apt-get install -y wget
RUN apt-get update -y
RUN apt-get install -y git


# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.24.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# Install helmfile
RUN wget -O helmfile_linux_amd64 https://github.com/roboll/helmfile/releases/download/v0.135.0/helmfile_linux_amd64
RUN chmod +x helmfile_linux_amd64
RUN mv helmfile_linux_amd64 /usr/local/bin/helmfile

# Install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

RUN helm plugin install https://github.com/databus23/helm-diff

# Install yq
RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
RUN chmod a+x /usr/local/bin/yq

# Install niet
RUN apt-get update -y
RUN apt-get install -y python3-pip
RUN pip3 install niet
