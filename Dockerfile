FROM alpine:3.5
ENV AWSCLI_VERSION "1.11.84"
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        zip \
        && \
    pip install --upgrade awscli==${AWSCLI_VERSION} && \
    pip install --upgrade boto3 && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
