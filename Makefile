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
MBEDTLS_OBJS = aes aesce aesni aria asn1parse \
             asn1write base64 bignum bignum_core bignum_mod \
             bignum_mod_raw block_cipher camellia ccm chacha20 \
             chachapoly cipher cipher_wrap cmac constant_time \
             ctr_drbg debug des dhm ecdh ecdsa ecjpake \
             ecp ecp_curves ecp_curves_new entropy entropy_poll \
             error gcm hkdf hmac_drbg lmots lms md md5 \
             memory_buffer_alloc mps_reader mps_trace net_sockets \
             nist_kw oid padlock pem pk pk_ecc pk_wrap \
             pkcs12 pkcs5 pkcs7 pkparse pkwrite platform \
             platform_util poly1305 psa_crypto psa_crypto_aead \
             psa_crypto_cipher psa_crypto_client \
             psa_crypto_driver_wrappers_no_static psa_crypto_ecp \
             psa_crypto_ffdh psa_crypto_hash psa_crypto_mac \
             psa_crypto_pake psa_crypto_random psa_crypto_rsa \
             psa_crypto_se psa_crypto_slot_management psa_crypto_storage \
             psa_its_file psa_util ripemd160 rsa rsa_alt_helpers \
             sha1 sha256 sha3 sha512 ssl_cache ssl_ciphersuites \
             ssl_client ssl_cookie ssl_debug_helpers_generated ssl_msg \
             ssl_ticket ssl_tls ssl_tls12_client ssl_tls12_server \
             ssl_tls13_client ssl_tls13_generic ssl_tls13_keys \
             ssl_tls13_server threading timing version \
             version_features x509 x509_create x509_crl x509_crt \
             x509_csr x509write x509write_crt x509write_csr
TARGET     = mbedTLS
LIBCOMPONENT = mbedTLS
INCLUDES   = .
HDRS      = ro_config
CDEFINES   = -DMBEDTLS_CONFIG_FILE="\"ro_config.h\"" -DRISCOS
CFLAGS     = ${C_NOWARN_NON_ANSI_INCLUDES}

# DDE32 provides C/C++$Dir and its CLibrary fragment expects bare object
# names. The current RISC OS build system has LibExport and expects o.* names.
DDE_CXX_DIR = ${C/C++$Dir}
ifeq ("${DDE_CXX_DIR}","")
OBJS = $(addprefix o.,${MBEDTLS_OBJS})
include LibExport
else
OBJS = ${MBEDTLS_OBJS}
include CLibrary
endif

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
