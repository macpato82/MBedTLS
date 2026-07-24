# Mbed TLS for RISC OS

This repository contains the RISC OS AMU port of Mbed TLS 4.1.0. It is
configured for client-side TLS 1.2 and TLS 1.3, SNI, certificate verification,
and the PSA crypto interface used by AcornSSL. The makefile selects the
`CLibrary` rules under DDE32 and the `LibExport` rules under the current RISC OS
build system.

The RISC OS configuration disables the optional Unix/Windows timing module;
DTLS is not enabled, so AcornSSL's TLS 1.2/1.3 operation does not require it.
Elapsed time is supplied by `OS_ReadMonotonicTime`. Entropy is supplied by the
RISC OS `CryptRandom_Block` SWI, so the CryptRandom module must be present at
runtime. The socket wrapper uses DDE's TCPIPLibs headers and libraries.

The RISC OS package metadata is version 4.10, matching the Mbed TLS 4.1.0
source release. This directory is the working source tree for DDE/AMU builds:

```text
riscos-amu
riscos-amu export
```

The source is adapted for the Norcroft/RISC OS build environment, including its
32-bit fixed-width integer and TCP/IP interfaces.

## CA certificate bundle

`Certificates/ca-certificates.crt` is the PEM trust store for clients built with this
port. It is the Mozilla CA root bundle published by the curl project, fetched
on 24 July 2026; its embedded Mozilla data date is 16 July 2026. The file
contains 119 root certificates and has SHA-256:

```text
3ff344e30b9b1ed2971044eabb438a08f2e2245ddb5f8ab1a3ad8b63ab4eaf91
```

Applications must load this file with their Mbed TLS X.509 trust-store setup.
Refresh it periodically from <https://curl.se/ca/cacert.pem>; it is runtime
data and does not require rebuilding the Mbed TLS libraries.

The upstream Mbed TLS code is available under the Apache-2.0 or GPL-2.0-or-
later terms. RISC OS port changes retain the upstream licensing notices.
