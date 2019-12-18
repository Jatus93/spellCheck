FROM ubuntu:latest
RUN apt update
RUN apt install -y aspell poppler-utils aspell-*

COPY spellChecker.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]