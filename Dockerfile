FROM debian:buster AS builder

ARG OUTNAME

WORKDIR /src
COPY src .

RUN apt update && \
    apt install -y \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended

RUN mkdir -p ../build && \
    pdflatex \
    -output-directory=../build \
    -jobname=${OUTNAME} \
    main.tex


FROM scratch AS resume
COPY --from=0 /build/* .
