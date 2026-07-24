#
# Mbed TLS 4.1.0 RISC OS library build
#

COMPONENT  = mbedTLS
MBEDTLS_OBJS = aes aria bignum bignum_core bignum_mod \
             bignum_mod_raw block_cipher camellia ccm cipher cipher_wrap cmac \
             ctr_drbg debug ecdsa ecjpake \
             ecp ecp_curves ecp_curves_new entropy entropy_poll error gcm \
             hmac_drbg md md5 \
             pk pk_ecc pk_rsa pk_wrap pkparse pkwrite \
             psa_crypto psa_crypto_aead psa_crypto_cipher psa_crypto_client \
             psa_crypto_driver_wrappers_no_static psa_crypto_ecp psa_crypto_ffdh \
             psa_crypto_hash psa_crypto_mac psa_crypto_pake psa_crypto_random \
             psa_crypto_rsa psa_crypto_slot_management psa_crypto_storage \
             psa_crypto_xof psa_its_file psa_util psa_util_internal ripemd160 rsa \
             rsa_alt_helpers sha1 sha256 sha3 sha512 ssl_cache ssl_ciphersuites \
             ssl_client ssl_cookie ssl_debug_helpers_generated ssl_msg ssl_ticket \
             ssl_tls ssl_tls12_client ssl_tls12_server ssl_tls13_client \
             ssl_tls13_generic ssl_tls13_keys ssl_tls13_server tf_psa_crypto_config \
             tf_psa_crypto_version timing version version_features x509 \
             x509_crl x509_crt x509_oid
TARGET     = mbedTLS
LIBCOMPONENT = mbedTLS
INCLUDES   = .
HDRS       = ro_config
CDEFINES   = -DMBEDTLS_CONFIG_FILE="\"ro_config.h\"" -DRISCOS
CFLAGS     = ${C_NOWARN_NON_ANSI_INCLUDES} ${TCPIPINC}

ifeq ("${C/C++$Dir}","")
OBJS = $(addprefix o.,${MBEDTLS_OBJS})
include LibExport
else
OBJS = ${MBEDTLS_OBJS}
include CLibrary
endif
