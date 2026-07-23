# Mbed TLS for RISC OS

This repository contains the RISC OS AMU `LibExport` port of Mbed TLS 3.6.6.
It is configured for client-side TLS 1.2 and TLS 1.3, SNI, certificate
verification, and the PSA crypto interface used by AcornSSL.

The source is adapted for the Norcroft/RISC OS build environment. The current
32-bit Norcroft toolchain does not provide `uint64_t`, so the modern GCM,
SHA-512, and TLS code requires a toolchain update before a complete module
build can succeed.

The upstream Mbed TLS code is available under the Apache-2.0 or GPL-2.0-or-
later terms. RISC OS port changes retain the upstream licensing notices.
