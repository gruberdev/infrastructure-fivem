FROM ich777/fivemserver
LABEL org.opencontainers.image.source = "https://github.com/gruberdev/infrastructure-fivem"
ARG FILES_URL=https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
ENV SVR_ADR $FILES_URL
ENV SERVER_KEY $SERVER_KEY
