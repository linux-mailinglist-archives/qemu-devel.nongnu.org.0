Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E661DC66
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMm6-0006Gq-O2; Sat, 05 Nov 2022 13:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMm0-000601-3c
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlw-0007HU-HL
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPZHQzhfHMWUz5Qjgx793q/Gt+Rmc4j05x1TMLreu9M=;
 b=Q49qwD+yKhbY47hjZXmQostuXRPrqtdP4biM4jd6tP41V0Kq+trLuLQUIHx8qiHcP1WmmV
 +S1pg6HTBXzWhoo9d/BkOooULlz0XXKTAyy/8glBhD+cm6p2kt1WKxHsZb/eoBsGNcIP1P
 OEyA29A55DkCtZD/eZEpTbiPzgpUPkM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-tahBixH8NpmPxsPiqBQhSg-1; Sat, 05 Nov 2022 13:15:53 -0400
X-MC-Unique: tahBixH8NpmPxsPiqBQhSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so4772432wmb.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SPZHQzhfHMWUz5Qjgx793q/Gt+Rmc4j05x1TMLreu9M=;
 b=XoMgThGOEKWbaq7ska227/IP14OhKiTQOMm3aKIfitHm6pH7P+95nQwjC7V/IXHUCw
 P/8h3wKnMg79uRLqpk50yl1DISdZZse9mwHoqWFemwHA+nh0I8Eu6DOug3KAulKB/gvo
 osi2wxVzT2JG1BQGpArtQIrsu5PXWDR5jXGogf/sgK5vldYmkBqcu3hi7V/lLFJI0akY
 69SQv1KvCATJ1CUtPF5Zh2tR53DZ/s+/8f6ZxGpQUfPAOUVBDKYcuGB38iAf4+g3Juqh
 kd4mVCiuA483Fy7dYlBr1ceUsbolVZlmNPRGw5oK/30/fIwjhSO+7FTvhvNwTB9RnZbo
 qXwg==
X-Gm-Message-State: ACrzQf1uIr4wjC7h85HfQRSYqLYFq0wc0Q0XIyz/UMcPpONP4GLwibT/
 rkSv2xiF5fAk7vw43ysQv4sUIYf+nkADrLEm8qT8xmovUR9/7F+UcpfKLJK2mzFEcf8ojrHf/E+
 XaBXQFAyyboiBFxf4sSfElIv2fEHdS0K6Dv7wT76bGkAFqke7RloIxLvr1yU3
X-Received: by 2002:a05:600c:2044:b0:3cf:570f:db5e with SMTP id
 p4-20020a05600c204400b003cf570fdb5emr33034844wmg.57.1667668552224; 
 Sat, 05 Nov 2022 10:15:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Gc8cIjE0IKwT91QPr1O6LDTYx7I3bYXD++ylIXfEwi2pM0RiZUV8rO8y0beBsIIMUvxbT5g==
X-Received: by 2002:a05:600c:2044:b0:3cf:570f:db5e with SMTP id
 p4-20020a05600c204400b003cf570fdb5emr33034829wmg.57.1667668551872; 
 Sat, 05 Nov 2022 10:15:51 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 bn9-20020a056000060900b00228cd9f6349sm2593572wrb.106.2022.11.05.10.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:15:51 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:15:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lei He <helei.sig11@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: [PULL v3 09/81] crypto: Support export akcipher to pkcs8
Message-ID: <20221105171116.432921-10-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lei He <helei.sig11@bytedance.com>

crypto: support export RSA private keys with PKCS#8 standard.
So that users can upload this private key to linux kernel.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Message-Id: <20221008085030.70212-4-helei.sig11@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/rsakey.h           | 11 +++++++++-
 include/crypto/akcipher.h | 21 ++++++++++++++++++++
 crypto/akcipher.c         | 18 +++++++++++++++++
 crypto/rsakey.c           | 42 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/crypto/rsakey.h b/crypto/rsakey.h
index 974b76f659..00b3eccec7 100644
--- a/crypto/rsakey.h
+++ b/crypto/rsakey.h
@@ -22,7 +22,6 @@
 #ifndef QCRYPTO_RSAKEY_H
 #define QCRYPTO_RSAKEY_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "crypto/akcipher.h"
 
@@ -84,6 +83,16 @@ QCryptoAkCipherRSAKey *qcrypto_akcipher_rsakey_parse(
     QCryptoAkCipherKeyType type,
     const uint8_t *key, size_t keylen, Error **errp);
 
+/**
+ * qcrypto_akcipher_rsakey_export_as_p8info:
+ *
+ * Export RSA private key to PKCS#8 private key info.
+ */
+void qcrypto_akcipher_rsakey_export_p8info(const uint8_t *key,
+                                           size_t keylen,
+                                           uint8_t **dst,
+                                           size_t *dlen);
+
 void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *key);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipherRSAKey,
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index 51f5fa2774..214e58ca47 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -153,6 +153,27 @@ int qcrypto_akcipher_max_dgst_len(QCryptoAkCipher *akcipher);
  */
 void qcrypto_akcipher_free(QCryptoAkCipher *akcipher);
 
+/**
+ * qcrypto_akcipher_export_p8info:
+ * @opts: the options of the akcipher to be exported.
+ * @key: the original key of the akcipher to be exported.
+ * @keylen: length of the 'key'
+ * @dst: output parameter, if export succeed, *dst is set to the
+ * PKCS#8 encoded private key, caller MUST free this key with
+ * g_free after use.
+ * @dst_len: output parameter, indicates the length of PKCS#8 encoded
+ * key.
+ *
+ * Export the akcipher into DER encoded pkcs#8 private key info, expects
+ * |key| stores a valid asymmetric PRIVATE key.
+ *
+ * Returns: 0 for succeed, otherwise -1 is returned.
+ */
+int qcrypto_akcipher_export_p8info(const QCryptoAkCipherOptions *opts,
+                                   uint8_t *key, size_t keylen,
+                                   uint8_t **dst, size_t *dst_len,
+                                   Error **errp);
+
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipher, qcrypto_akcipher_free)
 
 #endif /* QCRYPTO_AKCIPHER_H */
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index ad88379c1e..e4bbc6e5f1 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -22,6 +22,8 @@
 #include "qemu/osdep.h"
 #include "crypto/akcipher.h"
 #include "akcipherpriv.h"
+#include "der.h"
+#include "rsakey.h"
 
 #if defined(CONFIG_GCRYPT)
 #include "akcipher-gcrypt.c.inc"
@@ -106,3 +108,19 @@ void qcrypto_akcipher_free(QCryptoAkCipher *akcipher)
 
     drv->free(akcipher);
 }
+
+int qcrypto_akcipher_export_p8info(const QCryptoAkCipherOptions *opts,
+                                   uint8_t *key, size_t keylen,
+                                   uint8_t **dst, size_t *dst_len,
+                                   Error **errp)
+{
+    switch (opts->alg) {
+    case QCRYPTO_AKCIPHER_ALG_RSA:
+        qcrypto_akcipher_rsakey_export_p8info(key, keylen, dst, dst_len);
+        return 0;
+
+    default:
+        error_setg(errp, "Unsupported algorithm: %u", opts->alg);
+        return -1;
+    }
+}
diff --git a/crypto/rsakey.c b/crypto/rsakey.c
index cc40e072f0..7d6f273aef 100644
--- a/crypto/rsakey.c
+++ b/crypto/rsakey.c
@@ -19,6 +19,8 @@
  *
  */
 
+#include "qemu/osdep.h"
+#include "der.h"
 #include "rsakey.h"
 
 void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
@@ -37,6 +39,46 @@ void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
     g_free(rsa_key);
 }
 
+/**
+ * PKCS#8 private key info for RSA
+ *
+ * PrivateKeyInfo ::= SEQUENCE {
+ * version         INTEGER,
+ * privateKeyAlgorithm PrivateKeyAlgorithmIdentifier,
+ * privateKey      OCTET STRING,
+ * attributes      [0] IMPLICIT Attributes OPTIONAL
+ * }
+ */
+void qcrypto_akcipher_rsakey_export_p8info(const uint8_t *key,
+                                           size_t keylen,
+                                           uint8_t **dst,
+                                           size_t *dlen)
+{
+    QCryptoEncodeContext *ctx = qcrypto_der_encode_ctx_new();
+    uint8_t version = 0;
+
+    qcrypto_der_encode_seq_begin(ctx);
+
+    /* version */
+    qcrypto_der_encode_int(ctx, &version, sizeof(version));
+
+    /* algorithm identifier */
+    qcrypto_der_encode_seq_begin(ctx);
+    qcrypto_der_encode_oid(ctx, (uint8_t *)QCRYPTO_OID_rsaEncryption,
+                           sizeof(QCRYPTO_OID_rsaEncryption) - 1);
+    qcrypto_der_encode_null(ctx);
+    qcrypto_der_encode_seq_end(ctx);
+
+    /* RSA private key */
+    qcrypto_der_encode_octet_str(ctx, key, keylen);
+
+    qcrypto_der_encode_seq_end(ctx);
+
+    *dlen = qcrypto_der_encode_ctx_buffer_len(ctx);
+    *dst = g_malloc(*dlen);
+    qcrypto_der_encode_ctx_flush_and_free(ctx, *dst);
+}
+
 #if defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
 #include "rsakey-nettle.c.inc"
 #else
-- 
MST


