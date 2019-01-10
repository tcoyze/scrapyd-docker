FROM python:3-alpine

WORKDIR /code

VOLUME ["/etc/scrapyd/", "/var/lib/scrapyd/", "/var/log/scrapyd/"]

RUN apk add --update \
gcc \
musl-dev \
libffi-dev \
libxml2-dev \
libxslt-dev \
openssl-dev

COPY scrapyd.conf /etc/scrapyd/scrapyd.conf

RUN python3 -m venv venv \
&& . ./venv/bin/activate \
&& pip install scrapyd

EXPOSE 6800

ENTRYPOINT "/code/venv/bin/scrapyd"
