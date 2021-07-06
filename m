Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF33BC910
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:09:40 +0200 (CEST)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i1L-0008Id-NB
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs6-0005ZY-4t
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hry-00015S-G6
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8C4WIYJdBNQ827lSO0LRXxhpq0HdtkZdFLET5D/NEvg=;
 b=OLEDUJdyTAzzYEmS+2+7bq1/ISayuzt3MiYt6ko9Eno7pn2MtbX2G1TtfCJMjfxldhFhWe
 m77Vy430+d+CErT1kqn6VC722CONqVTZ03TLZo9KYjaK9lCO8Un4Ybp+6QtmiXbcJjOxJB
 ws9RFf/GFMSQ59UbmHKIOvC+ISQlOiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-9XRrH2XMMkuQAhu9x8-D-w-1; Tue, 06 Jul 2021 05:59:56 -0400
X-MC-Unique: 9XRrH2XMMkuQAhu9x8-D-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C77B5106B7D5
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:55 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456E85D6A1;
 Tue,  6 Jul 2021 09:59:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/18] crypto: rename des-rfb cipher to just des
Date: Tue,  6 Jul 2021 10:59:17 +0100
Message-Id: <20210706095924.764117-12-berrange@redhat.com>
In-Reply-To: <20210706095924.764117-1-berrange@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the crypto layer exposes support for a 'des-rfb'
algorithm which is just normal single-DES, with the bits
in each key byte reversed. This special key munging is
required by the RFB protocol password authentication
mechanism.

Since the crypto layer is generic shared code, it makes
more sense to do the key byte munging in the VNC server
code, and expose normal single-DES support.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-gcrypt.c.inc      | 16 +++-------------
 crypto/cipher-nettle.c.inc      | 26 +++++++++++---------------
 crypto/cipher.c                 | 28 +++++-----------------------
 qapi/crypto.json                |  4 ++--
 tests/unit/test-crypto-cipher.c | 18 +++++++++---------
 ui/vnc.c                        | 20 +++++++++++++++++---
 6 files changed, 47 insertions(+), 65 deletions(-)

diff --git a/crypto/cipher-gcrypt.c.inc b/crypto/cipher-gcrypt.c.inc
index 3aab08a1a9..a6a0117717 100644
--- a/crypto/cipher-gcrypt.c.inc
+++ b/crypto/cipher-gcrypt.c.inc
@@ -24,7 +24,7 @@ bool qcrypto_cipher_supports(QCryptoCipherAlgorithm alg,
                              QCryptoCipherMode mode)
 {
     switch (alg) {
-    case QCRYPTO_CIPHER_ALG_DES_RFB:
+    case QCRYPTO_CIPHER_ALG_DES:
     case QCRYPTO_CIPHER_ALG_3DES:
     case QCRYPTO_CIPHER_ALG_AES_128:
     case QCRYPTO_CIPHER_ALG_AES_192:
@@ -186,7 +186,7 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
     }
 
     switch (alg) {
-    case QCRYPTO_CIPHER_ALG_DES_RFB:
+    case QCRYPTO_CIPHER_ALG_DES:
         gcryalg = GCRY_CIPHER_DES;
         break;
     case QCRYPTO_CIPHER_ALG_3DES:
@@ -257,17 +257,7 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
     }
     ctx->blocksize = gcry_cipher_get_algo_blklen(gcryalg);
 
-    if (alg == QCRYPTO_CIPHER_ALG_DES_RFB) {
-        /* We're using standard DES cipher from gcrypt, so we need
-         * to munge the key so that the results are the same as the
-         * bizarre RFB variant of DES :-)
-         */
-        uint8_t *rfbkey = qcrypto_cipher_munge_des_rfb_key(key, nkey);
-        err = gcry_cipher_setkey(ctx->handle, rfbkey, nkey);
-        g_free(rfbkey);
-    } else {
-        err = gcry_cipher_setkey(ctx->handle, key, nkey);
-    }
+    err = gcry_cipher_setkey(ctx->handle, key, nkey);
     if (err != 0) {
         error_setg(errp, "Cannot set key: %s", gcry_strerror(err));
         goto error;
diff --git a/crypto/cipher-nettle.c.inc b/crypto/cipher-nettle.c.inc
index fc6f40c026..24cc61f87b 100644
--- a/crypto/cipher-nettle.c.inc
+++ b/crypto/cipher-nettle.c.inc
@@ -235,11 +235,11 @@ static const struct QCryptoCipherDriver NAME##_driver_xts = {   \
     DEFINE_XTS(NAME, TYPE, BLEN, ENCRYPT, DECRYPT)
 
 
-typedef struct QCryptoNettleDESRFB {
+typedef struct QCryptoNettleDES {
     QCryptoCipher base;
     struct des_ctx key;
     uint8_t iv[DES_BLOCK_SIZE];
-} QCryptoNettleDESRFB;
+} QCryptoNettleDES;
 
 static void des_encrypt_native(const void *ctx, size_t length,
                                uint8_t *dst, const uint8_t *src)
@@ -253,7 +253,7 @@ static void des_decrypt_native(const void *ctx, size_t length,
     des_decrypt(ctx, length, dst, src);
 }
 
-DEFINE_ECB_CBC_CTR(qcrypto_nettle_des_rfb, QCryptoNettleDESRFB,
+DEFINE_ECB_CBC_CTR(qcrypto_nettle_des, QCryptoNettleDES,
                    DES_BLOCK_SIZE, des_encrypt_native, des_decrypt_native)
 
 
@@ -431,7 +431,7 @@ bool qcrypto_cipher_supports(QCryptoCipherAlgorithm alg,
                              QCryptoCipherMode mode)
 {
     switch (alg) {
-    case QCRYPTO_CIPHER_ALG_DES_RFB:
+    case QCRYPTO_CIPHER_ALG_DES:
     case QCRYPTO_CIPHER_ALG_3DES:
     case QCRYPTO_CIPHER_ALG_AES_128:
     case QCRYPTO_CIPHER_ALG_AES_192:
@@ -480,32 +480,28 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
     }
 
     switch (alg) {
-    case QCRYPTO_CIPHER_ALG_DES_RFB:
+    case QCRYPTO_CIPHER_ALG_DES:
         {
-            QCryptoNettleDESRFB *ctx;
+            QCryptoNettleDES *ctx;
             const QCryptoCipherDriver *drv;
-            uint8_t *rfbkey;
 
             switch (mode) {
             case QCRYPTO_CIPHER_MODE_ECB:
-                drv = &qcrypto_nettle_des_rfb_driver_ecb;
+                drv = &qcrypto_nettle_des_driver_ecb;
                 break;
             case QCRYPTO_CIPHER_MODE_CBC:
-                drv = &qcrypto_nettle_des_rfb_driver_cbc;
+                drv = &qcrypto_nettle_des_driver_cbc;
                 break;
             case QCRYPTO_CIPHER_MODE_CTR:
-                drv = &qcrypto_nettle_des_rfb_driver_ctr;
+                drv = &qcrypto_nettle_des_driver_ctr;
                 break;
             default:
                 goto bad_cipher_mode;
             }
 
-            ctx = g_new0(QCryptoNettleDESRFB, 1);
+            ctx = g_new0(QCryptoNettleDES, 1);
             ctx->base.driver = drv;
-
-            rfbkey = qcrypto_cipher_munge_des_rfb_key(key, nkey);
-            des_set_key(&ctx->key, rfbkey);
-            g_free(rfbkey);
+            des_set_key(&ctx->key, key);
 
             return &ctx->base;
         }
diff --git a/crypto/cipher.c b/crypto/cipher.c
index 068b2fb867..1f5528be49 100644
--- a/crypto/cipher.c
+++ b/crypto/cipher.c
@@ -29,7 +29,7 @@ static const size_t alg_key_len[QCRYPTO_CIPHER_ALG__MAX] = {
     [QCRYPTO_CIPHER_ALG_AES_128] = 16,
     [QCRYPTO_CIPHER_ALG_AES_192] = 24,
     [QCRYPTO_CIPHER_ALG_AES_256] = 32,
-    [QCRYPTO_CIPHER_ALG_DES_RFB] = 8,
+    [QCRYPTO_CIPHER_ALG_DES] = 8,
     [QCRYPTO_CIPHER_ALG_3DES] = 24,
     [QCRYPTO_CIPHER_ALG_CAST5_128] = 16,
     [QCRYPTO_CIPHER_ALG_SERPENT_128] = 16,
@@ -44,7 +44,7 @@ static const size_t alg_block_len[QCRYPTO_CIPHER_ALG__MAX] = {
     [QCRYPTO_CIPHER_ALG_AES_128] = 16,
     [QCRYPTO_CIPHER_ALG_AES_192] = 16,
     [QCRYPTO_CIPHER_ALG_AES_256] = 16,
-    [QCRYPTO_CIPHER_ALG_DES_RFB] = 8,
+    [QCRYPTO_CIPHER_ALG_DES] = 8,
     [QCRYPTO_CIPHER_ALG_3DES] = 8,
     [QCRYPTO_CIPHER_ALG_CAST5_128] = 8,
     [QCRYPTO_CIPHER_ALG_SERPENT_128] = 16,
@@ -107,9 +107,9 @@ qcrypto_cipher_validate_key_length(QCryptoCipherAlgorithm alg,
     }
 
     if (mode == QCRYPTO_CIPHER_MODE_XTS) {
-        if (alg == QCRYPTO_CIPHER_ALG_DES_RFB
-                || alg == QCRYPTO_CIPHER_ALG_3DES) {
-            error_setg(errp, "XTS mode not compatible with DES-RFB/3DES");
+        if (alg == QCRYPTO_CIPHER_ALG_DES ||
+            alg == QCRYPTO_CIPHER_ALG_3DES) {
+            error_setg(errp, "XTS mode not compatible with DES/3DES");
             return false;
         }
         if (nkey % 2) {
@@ -132,24 +132,6 @@ qcrypto_cipher_validate_key_length(QCryptoCipherAlgorithm alg,
     return true;
 }
 
-#if defined(CONFIG_GCRYPT) || defined(CONFIG_NETTLE)
-static uint8_t *
-qcrypto_cipher_munge_des_rfb_key(const uint8_t *key,
-                                 size_t nkey)
-{
-    uint8_t *ret = g_new0(uint8_t, nkey);
-    size_t i;
-    for (i = 0; i < nkey; i++) {
-        uint8_t r = key[i];
-        r = (r & 0xf0) >> 4 | (r & 0x0f) << 4;
-        r = (r & 0xcc) >> 2 | (r & 0x33) << 2;
-        r = (r & 0xaa) >> 1 | (r & 0x55) << 1;
-        ret[i] = r;
-    }
-    return ret;
-}
-#endif /* CONFIG_GCRYPT || CONFIG_NETTLE */
-
 #ifdef CONFIG_GCRYPT
 #include "cipher-gcrypt.c.inc"
 #elif defined CONFIG_NETTLE
diff --git a/qapi/crypto.json b/qapi/crypto.json
index 7116ae9a46..6b3fadabac 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -66,7 +66,7 @@
 # @aes-128: AES with 128 bit / 16 byte keys
 # @aes-192: AES with 192 bit / 24 byte keys
 # @aes-256: AES with 256 bit / 32 byte keys
-# @des-rfb: RFB specific variant of single DES. Do not use except in VNC.
+# @des: DES with 56 bit / 8 byte keys. Do not use except in VNC.
 # @3des: 3DES(EDE) with 192 bit / 24 byte keys (since 2.9)
 # @cast5-128: Cast5 with 128 bit / 16 byte keys
 # @serpent-128: Serpent with 128 bit / 16 byte keys
@@ -80,7 +80,7 @@
 { 'enum': 'QCryptoCipherAlgorithm',
   'prefix': 'QCRYPTO_CIPHER_ALG',
   'data': ['aes-128', 'aes-192', 'aes-256',
-           'des-rfb', '3des',
+           'des', '3des',
            'cast5-128',
            'serpent-128', 'serpent-192', 'serpent-256',
            'twofish-128', 'twofish-192', 'twofish-256']}
diff --git a/tests/unit/test-crypto-cipher.c b/tests/unit/test-crypto-cipher.c
index 7dca7b26e4..d9d9d078ff 100644
--- a/tests/unit/test-crypto-cipher.c
+++ b/tests/unit/test-crypto-cipher.c
@@ -155,28 +155,28 @@ static QCryptoCipherTestData test_data[] = {
          * in single AES block, and gives identical
          * ciphertext in ECB and CBC modes
          */
-        .path = "/crypto/cipher/des-rfb-ecb-56-one-block",
-        .alg = QCRYPTO_CIPHER_ALG_DES_RFB,
+        .path = "/crypto/cipher/des-ecb-56-one-block",
+        .alg = QCRYPTO_CIPHER_ALG_DES,
         .mode = QCRYPTO_CIPHER_MODE_ECB,
-        .key = "0123456789abcdef",
+        .key = "80c4a2e691d5b3f7",
         .plaintext = "70617373776f7264",
         .ciphertext = "73fa80b66134e403",
     },
     {
         /* See previous comment */
-        .path = "/crypto/cipher/des-rfb-cbc-56-one-block",
-        .alg = QCRYPTO_CIPHER_ALG_DES_RFB,
+        .path = "/crypto/cipher/des-cbc-56-one-block",
+        .alg = QCRYPTO_CIPHER_ALG_DES,
         .mode = QCRYPTO_CIPHER_MODE_CBC,
-        .key = "0123456789abcdef",
+        .key = "80c4a2e691d5b3f7",
         .iv = "0000000000000000",
         .plaintext = "70617373776f7264",
         .ciphertext = "73fa80b66134e403",
     },
     {
-        .path = "/crypto/cipher/des-rfb-ecb-56",
-        .alg = QCRYPTO_CIPHER_ALG_DES_RFB,
+        .path = "/crypto/cipher/des-ecb-56",
+        .alg = QCRYPTO_CIPHER_ALG_DES,
         .mode = QCRYPTO_CIPHER_MODE_ECB,
-        .key = "0123456789abcdef",
+        .key = "80c4a2e691d5b3f7",
         .plaintext =
             "6bc1bee22e409f96e93d7e117393172a"
             "ae2d8a571e03ac9c9eb76fac45af8e51"
diff --git a/ui/vnc.c b/ui/vnc.c
index 0e5fcb278f..af02522e84 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2733,6 +2733,19 @@ static void authentication_failed(VncState *vs)
     vnc_client_error(vs);
 }
 
+static void
+vnc_munge_des_rfb_key(unsigned char *key, size_t nkey)
+{
+    size_t i;
+    for (i = 0; i < nkey; i++) {
+        uint8_t r = key[i];
+        r = (r & 0xf0) >> 4 | (r & 0x0f) << 4;
+        r = (r & 0xcc) >> 2 | (r & 0x33) << 2;
+        r = (r & 0xaa) >> 1 | (r & 0x55) << 1;
+        key[i] = r;
+    }
+}
+
 static int protocol_client_auth_vnc(VncState *vs, uint8_t *data, size_t len)
 {
     unsigned char response[VNC_AUTH_CHALLENGE_SIZE];
@@ -2757,9 +2770,10 @@ static int protocol_client_auth_vnc(VncState *vs, uint8_t *data, size_t len)
     pwlen = strlen(vs->vd->password);
     for (i=0; i<sizeof(key); i++)
         key[i] = i<pwlen ? vs->vd->password[i] : 0;
+    vnc_munge_des_rfb_key(key, sizeof(key));
 
     cipher = qcrypto_cipher_new(
-        QCRYPTO_CIPHER_ALG_DES_RFB,
+        QCRYPTO_CIPHER_ALG_DES,
         QCRYPTO_CIPHER_MODE_ECB,
         key, G_N_ELEMENTS(key),
         &err);
@@ -4045,9 +4059,9 @@ void vnc_display_open(const char *id, Error **errp)
             goto fail;
         }
         if (!qcrypto_cipher_supports(
-                QCRYPTO_CIPHER_ALG_DES_RFB, QCRYPTO_CIPHER_MODE_ECB)) {
+                QCRYPTO_CIPHER_ALG_DES, QCRYPTO_CIPHER_MODE_ECB)) {
             error_setg(errp,
-                       "Cipher backend does not support DES RFB algorithm");
+                       "Cipher backend does not support DES algorithm");
             goto fail;
         }
     }
-- 
2.31.1


