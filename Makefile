#
# Copyright (c) 2018, RISC OS Open Ltd
# All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Makefile for mbedTLS
#

COMPONENT  = mbedTLS
OBJS       = o.aes o.aesce o.aesni o.aria o.asn1parse \
             o.asn1write o.base64 o.bignum o.bignum_core o.bignum_mod \
             o.bignum_mod_raw o.block_cipher o.camellia o.ccm o.chacha20 \
             o.chachapoly o.cipher o.cipher_wrap o.cmac o.constant_time \
             o.ctr_drbg o.debug o.des o.dhm o.ecdh o.ecdsa o.ecjpake \
             o.ecp o.ecp_curves o.ecp_curves_new o.entropy o.entropy_poll \
             o.error o.gcm o.hkdf o.hmac_drbg o.lmots o.lms o.md o.md5 \
             o.memory_buffer_alloc o.mps_reader o.mps_trace o.net_sockets \
             o.nist_kw o.oid o.padlock o.pem o.pk o.pk_ecc o.pk_wrap \
             o.pkcs12 o.pkcs5 o.pkcs7 o.pkparse o.pkwrite o.platform \
             o.platform_util o.poly1305 o.psa_crypto o.psa_crypto_aead \
             o.psa_crypto_cipher o.psa_crypto_client \
             o.psa_crypto_driver_wrappers_no_static o.psa_crypto_ecp \
             o.psa_crypto_ffdh o.psa_crypto_hash o.psa_crypto_mac \
             o.psa_crypto_pake o.psa_crypto_random o.psa_crypto_rsa \
             o.psa_crypto_se o.psa_crypto_slot_management o.psa_crypto_storage \
             o.psa_its_file o.psa_util o.ripemd160 o.rsa o.rsa_alt_helpers \
             o.sha1 o.sha256 o.sha3 o.sha512 o.ssl_cache o.ssl_ciphersuites \
             o.ssl_client o.ssl_cookie o.ssl_debug_helpers_generated o.ssl_msg \
             o.ssl_ticket o.ssl_tls o.ssl_tls12_client o.ssl_tls12_server \
             o.ssl_tls13_client o.ssl_tls13_generic o.ssl_tls13_keys \
             o.ssl_tls13_server o.threading o.timing o.version \
             o.version_features o.x509 o.x509_create o.x509_crl o.x509_crt \
             o.x509_csr o.x509write o.x509write_crt o.x509write_csr
TARGET     = mbedTLS
LIBCOMPONENT = mbedTLS
INCLUDES   = .
CDEFINES   = -DMBEDTLS_CONFIG_FILE="\"ro_config.h\"" -DRISCOS
CFLAGS     = ${C_NOWARN_NON_ANSI_INCLUDES}

include LibExport

ifeq (,${MAKE_VERSION})

# RISC OS / amu case

exphdr.ro_config:
	${AWK} -f h.ro_configawk h.ro_config > ${EXPDIR}.h.ro_config

else

# Posix / gmake case

ro_config.exphdr:
	${AWK} -f ro_configawk.h ro_config.h > ${EXPDIR}/ro_config.h

endif

# Dynamic dependencies:
