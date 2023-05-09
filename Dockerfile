FROM debian:buster AS builder

ARG OUTNAME

WORKDIR /src

RUN apt update && \
    apt install -y \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended

COPY src .

RUN mkdir -p ../build && \
    pdflatex \
    -output-directory=../build \
    -jobname=${OUTNAME} \
    main.tex


FROM scratch AS resume
COPY --from=0 /build/* ./
