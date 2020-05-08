FROM ubuntu:18.04
ENV LANG en_US.UTF-8
RUN apt update
RUN apt install -y aspell poppler-utils locales aspell-* language-pack-en*
RUN locale-gen

COPY spellChecker.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
