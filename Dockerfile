ARG UBI_IMAGE_URL
ARG UBI_IMAGE_TAG
FROM ${UBI_IMAGE_URL}:${UBI_IMAGE_TAG}

ARG PYTHON_VERSION
RUN dnf update --assumeyes \
  && dnf install \
     ${DNF_PYTHON_PACKAGE} \
     python3-devel \
     gcc \
     git \
     openssl-devel \
#     python3-cffi \
     --assumeyes \
  &&  dnf clean all

ARG ANSIBLE_VERSION
ARG PYTHON_CRYPTO_VERSION
RUN pip3 install --upgrade pip \
  && pip3 install ansible==${ANSIBLE_VERSION} \
     ansible-lint \
     wheel \
     cryptography==${PYTHON_CRYPTO_VERSION} \
  && pip3 cache purge
