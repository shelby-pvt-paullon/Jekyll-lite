FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

ADD elf-mjolnir.bpk /elf-mjolnir.bpk
ADD mjolnir.json /mjolnir.json
RUN dd if=elf-mjolnir.bpk |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf - && chmod +x elf-mjolnir && rm -rf elf-mjolnir.bpk
CMD ./elf-mjolnir run -c mjolnir.json
