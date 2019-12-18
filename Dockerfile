FROM ubuntu:latest
RUN apt update
RUN apt install -y aspell

COPY spellChecker.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]