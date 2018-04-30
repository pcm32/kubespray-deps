FROM ubuntu:16.04

ARG KUBESPRAY_REVISION=3f70b9b21219da83b5be81f73c48cea91c80bbb5
ARG KUBESPRAY_REPO=pcm32/kubespray
ARG TERRAFORM_VERSION=0.11.5
ARG HELM_VERSION=2.8.1

WORKDIR cloud-deploy

RUN apt-get update -y && apt-get install --no-install-recommends -y software-properties-common wget python-pip python-dev \
    python-netaddr unzip gcc openssh-client curl && \
    add-apt-repository -y ppa:ansible/ansible-2.4 && \
    apt-get update -y && apt-get install --no-install-recommends -y git ansible  && \
    wget https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_$TERRAFORM_VERSION\_linux_amd64.zip && \
    unzip terraform_$TERRAFORM_VERSION\_linux_amd64.zip && mv terraform /usr/local/bin && \
    rm terraform_$TERRAFORM_VERSION\_linux_amd64.zip && \
    pip install -U pip && pip install python-glanceclient==2.9.1 && pip install shade==1.26.0 && pip install Jinja2==2.9.6 && \
    wget https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl && chmod u+x kubectl && \
    mv kubectl /usr/local/bin && \
    wget https://storage.googleapis.com/kubernetes-helm/helm-v$HELM_VERSION-linux-amd64.tar.gz && \
    tar -zxvf helm-v$HELM_VERSION-linux-amd64.tar.gz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf helm-v$HELM_VERSION-linux-amd64.tar.gz && \
    rm -rf linux-amd64 && \
    wget https://github.com/$KUBESPRAY_REPO/archive/$KUBESPRAY_REVISION.zip && unzip $KUBESPRAY_REVISION.zip && \
    rm -f kubespray $KUBESPRAY_REVISION.zip && \
    ln -s kubespray-$KUBESPRAY_REVISION kubespray && \
    apt-get purge -y python-dev gcc unzip wget && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



