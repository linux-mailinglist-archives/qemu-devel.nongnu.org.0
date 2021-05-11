Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562EF37A7A4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:32:10 +0200 (CEST)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSUb-0004Sr-9A
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQn-0007hQ-P7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQl-0000xw-P5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620739691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0KnWPJrDzGWMQ0ZXwVdXC2lPNFWf60X8jlX8WN0/s4=;
 b=Jo/00PnR0SNC0AfpQr3yJMcKK0HK+3/J3mLvEQyc0DbYNU2zKBMZQ+zq4wNsiI4oD8cjiC
 9s+Rnvq3uSusvbzR/Qzxt3NdY0nUD/cBC6uaimJPT0D65hHX60zybkX5lO9TuzyM6fqcI6
 maEDFqNqBdhsea7ygbRQkdO9fSPGG2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-N17AHTZcMI2gtM6vEmzFUQ-1; Tue, 11 May 2021 09:28:07 -0400
X-MC-Unique: N17AHTZcMI2gtM6vEmzFUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 809B9107B466;
 Tue, 11 May 2021 13:28:06 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 759569CA0;
 Tue, 11 May 2021 13:28:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/12] crypto: drop back compatibility typedefs for nettle
Date: Tue, 11 May 2021 14:26:33 +0100
Message-Id: <20210511132641.1022161-5-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we only support modern nettle, we don't need to have local
typedefs to mask the real nettle types.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-nettle.c.inc | 60 ++++++++++++++++----------------------
 crypto/hash-nettle.c       |  6 ++--
 crypto/hmac-nettle.c       |  8 ++---
 3 files changed, 30 insertions(+), 44 deletions(-)

diff --git a/crypto/cipher-nettle.c.inc b/crypto/cipher-nettle.c.inc
index 490472656c..fc6f40c026 100644
--- a/crypto/cipher-nettle.c.inc
+++ b/crypto/cipher-nettle.c.inc
@@ -34,16 +34,6 @@
 #include <nettle/xts.h>
 #endif
 
-typedef void (*QCryptoCipherNettleFuncWrapper)(const void *ctx,
-                                               size_t length,
-                                               uint8_t *dst,
-                                               const uint8_t *src);
-
-typedef nettle_cipher_func * QCryptoCipherNettleFuncNative;
-typedef const void * cipher_ctx_t;
-typedef size_t       cipher_length_t;
-#define CONST_CTX    const
-
 static inline bool qcrypto_length_check(size_t len, size_t blocksize,
                                         Error **errp)
 {
@@ -166,12 +156,12 @@ static const struct QCryptoCipherDriver NAME##_driver_ctr = {           \
 static void NAME##_xts_wrape(const void *ctx, size_t length,            \
                              uint8_t *dst, const uint8_t *src)          \
 {                                                                       \
-    ENCRYPT((cipher_ctx_t)ctx, length, dst, src);                       \
+    ENCRYPT((const void *)ctx, length, dst, src);                       \
 }                                                                       \
 static void NAME##_xts_wrapd(const void *ctx, size_t length,            \
                              uint8_t *dst, const uint8_t *src)          \
 {                                                                       \
-    DECRYPT((cipher_ctx_t)ctx, length, dst, src);                       \
+    DECRYPT((const void *)ctx, length, dst, src);                       \
 }                                                                       \
 static int NAME##_encrypt_xts(QCryptoCipher *cipher, const void *in,    \
                               void *out, size_t len, Error **errp)      \
@@ -251,13 +241,13 @@ typedef struct QCryptoNettleDESRFB {
     uint8_t iv[DES_BLOCK_SIZE];
 } QCryptoNettleDESRFB;
 
-static void des_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void des_encrypt_native(const void *ctx, size_t length,
                                uint8_t *dst, const uint8_t *src)
 {
     des_encrypt(ctx, length, dst, src);
 }
 
-static void des_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void des_decrypt_native(const void *ctx, size_t length,
                                uint8_t *dst, const uint8_t *src)
 {
     des_decrypt(ctx, length, dst, src);
@@ -273,13 +263,13 @@ typedef struct QCryptoNettleDES3 {
     uint8_t iv[DES3_BLOCK_SIZE];
 } QCryptoNettleDES3;
 
-static void des3_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void des3_encrypt_native(const void *ctx, size_t length,
                                 uint8_t *dst, const uint8_t *src)
 {
     des3_encrypt(ctx, length, dst, src);
 }
 
-static void des3_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void des3_decrypt_native(const void *ctx, size_t length,
                                 uint8_t *dst, const uint8_t *src)
 {
     des3_decrypt(ctx, length, dst, src);
@@ -296,17 +286,17 @@ typedef struct QCryptoNettleAES128 {
     struct aes128_ctx key[2], key_xts[2];
 } QCryptoNettleAES128;
 
-static void aes128_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void aes128_encrypt_native(const void *ctx, size_t length,
                                   uint8_t *dst, const uint8_t *src)
 {
-    CONST_CTX struct aes128_ctx *keys = ctx;
+    const struct aes128_ctx *keys = ctx;
     aes128_encrypt(&keys[0], length, dst, src);
 }
 
-static void aes128_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void aes128_decrypt_native(const void *ctx, size_t length,
                                   uint8_t *dst, const uint8_t *src)
 {
-    CONST_CTX struct aes128_ctx *keys = ctx;
+    const struct aes128_ctx *keys = ctx;
     aes128_decrypt(&keys[1], length, dst, src);
 }
 
@@ -322,17 +312,17 @@ typedef struct QCryptoNettleAES192 {
     struct aes192_ctx key[2], key_xts[2];
 } QCryptoNettleAES192;
 
-static void aes192_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void aes192_encrypt_native(const void *ctx, size_t length,
                                   uint8_t *dst, const uint8_t *src)
 {
-    CONST_CTX struct aes192_ctx *keys = ctx;
+    const struct aes192_ctx *keys = ctx;
     aes192_encrypt(&keys[0], length, dst, src);
 }
 
-static void aes192_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void aes192_decrypt_native(const void *ctx, size_t length,
                                   uint8_t *dst, const uint8_t *src)
 {
-    CONST_CTX struct aes192_ctx *keys = ctx;
+    const struct aes192_ctx *keys = ctx;
     aes192_decrypt(&keys[1], length, dst, src);
 }
 
@@ -348,17 +338,17 @@ typedef struct QCryptoNettleAES256 {
     struct aes256_ctx key[2], key_xts[2];
 } QCryptoNettleAES256;
 
-static void aes256_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void aes256_encrypt_native(const void *ctx, size_t length,
                                   uint8_t *dst, const uint8_t *src)
 {
-    CONST_CTX struct aes256_ctx *keys = ctx;
+    const struct aes256_ctx *keys = ctx;
     aes256_encrypt(&keys[0], length, dst, src);
 }
 
-static void aes256_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
-                               uint8_t *dst, const uint8_t *src)
+static void aes256_decrypt_native(const void *ctx, size_t length,
+                                  uint8_t *dst, const uint8_t *src)
 {
-    CONST_CTX struct aes256_ctx *keys = ctx;
+    const struct aes256_ctx *keys = ctx;
     aes256_decrypt(&keys[1], length, dst, src);
 }
 
@@ -373,13 +363,13 @@ typedef struct QCryptoNettleCAST128 {
     struct cast128_ctx key, key_xts;
 } QCryptoNettleCAST128;
 
-static void cast128_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void cast128_encrypt_native(const void *ctx, size_t length,
                                    uint8_t *dst, const uint8_t *src)
 {
     cast128_encrypt(ctx, length, dst, src);
 }
 
-static void cast128_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void cast128_decrypt_native(const void *ctx, size_t length,
                                    uint8_t *dst, const uint8_t *src)
 {
     cast128_decrypt(ctx, length, dst, src);
@@ -397,13 +387,13 @@ typedef struct QCryptoNettleSerpent {
 } QCryptoNettleSerpent;
 
 
-static void serpent_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void serpent_encrypt_native(const void *ctx, size_t length,
                                    uint8_t *dst, const uint8_t *src)
 {
     serpent_encrypt(ctx, length, dst, src);
 }
 
-static void serpent_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void serpent_decrypt_native(const void *ctx, size_t length,
                                    uint8_t *dst, const uint8_t *src)
 {
     serpent_decrypt(ctx, length, dst, src);
@@ -420,13 +410,13 @@ typedef struct QCryptoNettleTwofish {
     struct twofish_ctx key, key_xts;
 } QCryptoNettleTwofish;
 
-static void twofish_encrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void twofish_encrypt_native(const void *ctx, size_t length,
                                    uint8_t *dst, const uint8_t *src)
 {
     twofish_encrypt(ctx, length, dst, src);
 }
 
-static void twofish_decrypt_native(cipher_ctx_t ctx, cipher_length_t length,
+static void twofish_decrypt_native(const void *ctx, size_t length,
                                    uint8_t *dst, const uint8_t *src)
 {
     twofish_decrypt(ctx, length, dst, src);
diff --git a/crypto/hash-nettle.c b/crypto/hash-nettle.c
index 5c8977fb80..1ca1a41062 100644
--- a/crypto/hash-nettle.c
+++ b/crypto/hash-nettle.c
@@ -26,14 +26,12 @@
 #include <nettle/sha.h>
 #include <nettle/ripemd160.h>
 
-typedef size_t       hash_length_t;
-
 typedef void (*qcrypto_nettle_init)(void *ctx);
 typedef void (*qcrypto_nettle_write)(void *ctx,
-                                     hash_length_t len,
+                                     size_t len,
                                      const uint8_t *buf);
 typedef void (*qcrypto_nettle_result)(void *ctx,
-                                      hash_length_t len,
+                                      size_t len,
                                       uint8_t *buf);
 
 union qcrypto_hash_ctx {
diff --git a/crypto/hmac-nettle.c b/crypto/hmac-nettle.c
index da6b6fa014..1ad6c4f253 100644
--- a/crypto/hmac-nettle.c
+++ b/crypto/hmac-nettle.c
@@ -18,18 +18,16 @@
 #include "hmacpriv.h"
 #include <nettle/hmac.h>
 
-typedef size_t hmac_length_t;
-
 typedef void (*qcrypto_nettle_hmac_setkey)(void *ctx,
-                                           hmac_length_t key_length,
+                                           size_t key_length,
                                            const uint8_t *key);
 
 typedef void (*qcrypto_nettle_hmac_update)(void *ctx,
-                                           hmac_length_t length,
+                                           size_t length,
                                            const uint8_t *data);
 
 typedef void (*qcrypto_nettle_hmac_digest)(void *ctx,
-                                           hmac_length_t length,
+                                           size_t length,
                                            uint8_t *digest);
 
 typedef struct QCryptoHmacNettle QCryptoHmacNettle;
-- 
2.31.1


