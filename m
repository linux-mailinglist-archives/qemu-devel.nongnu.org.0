Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A1761672D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGIH-0002dD-3Q; Wed, 02 Nov 2022 12:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIF-0002cU-Hb
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIC-00023e-Cq
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTMsqZc5rnmkw6aUHSAnbfm/avqMhKXbbaRfLY+ol7o=;
 b=PlSRut2E2+K/XY/K5N0KmHjZItAqOz7YVAFmBvmGenET4SCvzoXJxV8xMd/mbwsm7kDH+s
 vRSftB8hAsTLoXIVo52XraJQx1y0WAcb/nqc4MnMcvhW+71pc5b2Wv39RXq2dVJt+bpZXb
 vkrUZC5sxSRYGrdDxalGW1bLRYCR15w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-tWPiUfnPPjWPS1usZPCqww-1; Wed, 02 Nov 2022 12:08:37 -0400
X-MC-Unique: tWPiUfnPPjWPS1usZPCqww-1
Received: by mail-wm1-f71.google.com with SMTP id
 f62-20020a1c3841000000b003cf6d9aacbbso3885049wma.8
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iTMsqZc5rnmkw6aUHSAnbfm/avqMhKXbbaRfLY+ol7o=;
 b=UL6W8ZOL6s2vqKTURirw+cMOQ8vFl5lTEP7I2VfGOepSWI6TnMz8uHs1AXYgTT08Hc
 d5eBBpXHYsF2H5IZDDjJ1fR7Fw8GGf08eNMrxSkTnew02h7wO2CqxHqNO5yW8U0xN3ht
 crGczlKXQGHo/6ymstVY7H9wRYd757+qrxckns/DTkqdQwCxow8gHK8lcTb1IGUURhTS
 drHxPSkmuSxh3EtfN4TR7vBZ93I3uCW9S7k8plLljDkJpMPZmgisrPU2+D6Pfsx/gh5I
 bgwJdi6Q5AVrLjI+ZRIH5tnyN/k/tyVGe1s9U7Ni1sK8JPFzjnVoRki3z0hQfjhOrOl8
 gXyw==
X-Gm-Message-State: ACrzQf0qSRsK0LbJXRAfsgLeipumKDXVqVppymrbYahb8Xblcx1M+gTL
 xbPgvXUleBbhEbGJz/+/zbahfx+phIbb5mMh6/V8jULJXVwTpYq2tyLgnPL/bOKr3cXjj+TQ/Wl
 m5kawBJ4i3w6emxoCNeyVGVEfN7sBpK58Olj9MXRHvHKhEr/ddBYOCusu3705
X-Received: by 2002:a5d:53cf:0:b0:236:bbc0:236 with SMTP id
 a15-20020a5d53cf000000b00236bbc00236mr13652658wrw.572.1667405315577; 
 Wed, 02 Nov 2022 09:08:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uQL/rgYinZYm+Ni7wUrRgIlCUzBg5KDjn3GFKnXbiTh/ivC1DlJJLGD7lIiNFaMTlkZc5OQ==
X-Received: by 2002:a5d:53cf:0:b0:236:bbc0:236 with SMTP id
 a15-20020a5d53cf000000b00236bbc00236mr13652601wrw.572.1667405315022; 
 Wed, 02 Nov 2022 09:08:35 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b00228a6ce17b4sm14593693wry.37.2022.11.02.09.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:34 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lei He <helei.sig11@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: [PULL v2 08/82] crypto: Support DER encodings
Message-ID: <20221102160336.616599-9-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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

Add encoding interfaces for DER encoding:
1. support decoding of 'bit string', 'octet string', 'object id'
and 'context specific tag' for DER encoder.
2. implemented a simple DER encoder.
3. add more testsuits for DER encoder.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Message-Id: <20221008085030.70212-3-helei.sig11@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/der.h                 | 211 ++++++++++++++++++++++-
 crypto/der.c                 | 313 ++++++++++++++++++++++++++++++++---
 tests/unit/test-crypto-der.c | 126 +++++++++++---
 3 files changed, 600 insertions(+), 50 deletions(-)

diff --git a/crypto/der.h b/crypto/der.h
index e3d3aeacdc..0e895bbeec 100644
--- a/crypto/der.h
+++ b/crypto/der.h
@@ -22,6 +22,11 @@
 
 #include "qapi/error.h"
 
+typedef struct QCryptoEncodeContext QCryptoEncodeContext;
+
+/* rsaEncryption: 1.2.840.113549.1.1.1 */
+#define QCRYPTO_OID_rsaEncryption "\x2A\x86\x48\x86\xF7\x0D\x01\x01\x01"
+
 /* Simple decoder used to parse DER encoded rsa keys. */
 
 /**
@@ -47,14 +52,13 @@ typedef int (*QCryptoDERDecodeCb) (void *opaque, const uint8_t *value,
  * will be set to the rest length of data, if cb is not NULL, must
  * return 0 to make decode success, at last, the length of the data
  * part of the decoded INTEGER will be returned. Otherwise, -1 is
- * returned.
+ * returned and the valued of *data and *dlen keep unchanged.
  */
 int qcrypto_der_decode_int(const uint8_t **data,
                            size_t *dlen,
                            QCryptoDERDecodeCb cb,
                            void *opaque,
                            Error **errp);
-
 /**
  * qcrypto_der_decode_seq:
  *
@@ -70,7 +74,7 @@ int qcrypto_der_decode_int(const uint8_t **data,
  * will be set to the rest length of data, if cb is not NULL, must
  * return 0 to make decode success, at last, the length of the data
  * part of the decoded SEQUENCE will be returned. Otherwise, -1 is
- * returned.
+ * returned and the valued of *data and *dlen keep unchanged.
  */
 int qcrypto_der_decode_seq(const uint8_t **data,
                            size_t *dlen,
@@ -78,4 +82,205 @@ int qcrypto_der_decode_seq(const uint8_t **data,
                            void *opaque,
                            Error **errp);
 
+/**
+ * qcrypto_der_decode_oid:
+ *
+ * Decode OID from DER-encoded data, similar with der_decode_int.
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded OID will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_oid(const uint8_t **data,
+                           size_t *dlen,
+                           QCryptoDERDecodeCb cb,
+                           void *opaque,
+                           Error **errp);
+
+/**
+ * qcrypto_der_decode_octet_str:
+ *
+ * Decode OCTET STRING from DER-encoded data, similar with der_decode_int.
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded OCTET STRING will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_octet_str(const uint8_t **data,
+                                 size_t *dlen,
+                                 QCryptoDERDecodeCb cb,
+                                 void *opaque,
+                                 Error **errp);
+
+/**
+ * qcrypto_der_decode_bit_str:
+ *
+ * Decode BIT STRING from DER-encoded data, similar with der_decode_int.
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded BIT STRING will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_bit_str(const uint8_t **data,
+                               size_t *dlen,
+                               QCryptoDERDecodeCb cb,
+                               void *opaque,
+                               Error **errp);
+
+
+/**
+ * qcrypto_der_decode_ctx_tag:
+ *
+ * Decode context specific tag
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @tag: expected value of context specific tag
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded BIT STRING will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_ctx_tag(const uint8_t **data,
+                               size_t *dlen, int tag_id,
+                               QCryptoDERDecodeCb cb,
+                               void *opaque,
+                               Error **errp);
+
+/**
+ * qcrypto_der_encode_ctx_new:
+ *
+ * Allocate a context used for der encoding.
+ */
+QCryptoEncodeContext *qcrypto_der_encode_ctx_new(void);
+
+/**
+ * qcrypto_der_encode_seq_begin:
+ * @ctx: the encode context.
+ *
+ * Start encoding a SEQUENCE for ctx.
+ *
+ */
+void qcrypto_der_encode_seq_begin(QCryptoEncodeContext *ctx);
+
+/**
+ * qcrypto_der_encode_seq_begin:
+ * @ctx: the encode context.
+ *
+ * Finish uencoding a SEQUENCE for ctx.
+ *
+ */
+void qcrypto_der_encode_seq_end(QCryptoEncodeContext *ctx);
+
+
+/**
+ * qcrypto_der_encode_oid:
+ * @ctx: the encode context.
+ * @src: the source data of oid, note it should be already encoded, this
+ * function only add tag and length part for it.
+ *
+ * Encode an oid into ctx.
+ */
+void qcrypto_der_encode_oid(QCryptoEncodeContext *ctx,
+                            const uint8_t *src, size_t src_len);
+
+/**
+ * qcrypto_der_encode_int:
+ * @ctx: the encode context.
+ * @src: the source data of integer, note it should be already encoded, this
+ * function only add tag and length part for it.
+ *
+ * Encode an integer into ctx.
+ */
+void qcrypto_der_encode_int(QCryptoEncodeContext *ctx,
+                            const uint8_t *src, size_t src_len);
+
+/**
+ * qcrypto_der_encode_null:
+ * @ctx: the encode context.
+ *
+ * Encode a null into ctx.
+ */
+void qcrypto_der_encode_null(QCryptoEncodeContext *ctx);
+
+/**
+ * qcrypto_der_encode_octet_str:
+ * @ctx: the encode context.
+ * @src: the source data of the octet string.
+ *
+ * Encode a octet string into ctx.
+ */
+void qcrypto_der_encode_octet_str(QCryptoEncodeContext *ctx,
+                                  const uint8_t *src, size_t src_len);
+
+/**
+ * qcrypto_der_encode_octet_str_begin:
+ * @ctx: the encode context.
+ *
+ * Start encoding a octet string, All fields between
+ * qcrypto_der_encode_octet_str_begin and qcrypto_der_encode_octet_str_end
+ * are encoded as an octet string. This is useful when we need to encode a
+ * encoded SEQUNCE as OCTET STRING.
+ */
+void qcrypto_der_encode_octet_str_begin(QCryptoEncodeContext *ctx);
+
+/**
+ * qcrypto_der_encode_octet_str_end:
+ * @ctx: the encode context.
+ *
+ * Finish encoding a octet string, All fields between
+ * qcrypto_der_encode_octet_str_begin and qcrypto_der_encode_octet_str_end
+ * are encoded as an octet string. This is useful when we need to encode a
+ * encoded SEQUNCE as OCTET STRING.
+ */
+void qcrypto_der_encode_octet_str_end(QCryptoEncodeContext *ctx);
+
+/**
+ * qcrypto_der_encode_ctx_buffer_len:
+ * @ctx: the encode context.
+ *
+ * Compute the expected buffer size to save all encoded things.
+ */
+size_t qcrypto_der_encode_ctx_buffer_len(QCryptoEncodeContext *ctx);
+
+/**
+ * qcrypto_der_encode_ctx_flush_and_free:
+ * @ctx: the encode context.
+ * @dst: the distination to save the encoded data, the length of dst should
+ * not less than qcrypto_der_encode_cxt_buffer_len
+ *
+ * Flush all encoded data into dst, then free ctx.
+ */
+void qcrypto_der_encode_ctx_flush_and_free(QCryptoEncodeContext *ctx,
+                                           uint8_t *dst);
+
 #endif  /* QCRYPTO_ASN1_DECODER_H */
diff --git a/crypto/der.c b/crypto/der.c
index f877390bbb..dab3fe4f24 100644
--- a/crypto/der.c
+++ b/crypto/der.c
@@ -22,20 +22,93 @@
 #include "qemu/osdep.h"
 #include "crypto/der.h"
 
+typedef struct QCryptoDerEncodeNode {
+    uint8_t tag;
+    struct QCryptoDerEncodeNode *parent;
+    struct QCryptoDerEncodeNode *next;
+    /* for constructed type, data is null */
+    const uint8_t *data;
+    size_t dlen;
+} QCryptoDerEncodeNode;
+
+typedef struct QCryptoEncodeContext {
+    QCryptoDerEncodeNode root;
+    QCryptoDerEncodeNode *current_parent;
+    QCryptoDerEncodeNode *tail;
+} QCryptoEncodeContext;
+
 enum QCryptoDERTypeTag {
     QCRYPTO_DER_TYPE_TAG_BOOL = 0x1,
     QCRYPTO_DER_TYPE_TAG_INT = 0x2,
     QCRYPTO_DER_TYPE_TAG_BIT_STR = 0x3,
     QCRYPTO_DER_TYPE_TAG_OCT_STR = 0x4,
-    QCRYPTO_DER_TYPE_TAG_OCT_NULL = 0x5,
-    QCRYPTO_DER_TYPE_TAG_OCT_OID = 0x6,
+    QCRYPTO_DER_TYPE_TAG_NULL = 0x5,
+    QCRYPTO_DER_TYPE_TAG_OID = 0x6,
     QCRYPTO_DER_TYPE_TAG_SEQ = 0x10,
     QCRYPTO_DER_TYPE_TAG_SET = 0x11,
 };
 
-#define QCRYPTO_DER_CONSTRUCTED_MASK 0x20
+enum QCryptoDERTagClass {
+    QCRYPTO_DER_TAG_CLASS_UNIV = 0x0,
+    QCRYPTO_DER_TAG_CLASS_APPL = 0x1,
+    QCRYPTO_DER_TAG_CLASS_CONT = 0x2,
+    QCRYPTO_DER_TAG_CLASS_PRIV = 0x3,
+};
+
+enum QCryptoDERTagEnc {
+    QCRYPTO_DER_TAG_ENC_PRIM = 0x0,
+    QCRYPTO_DER_TAG_ENC_CONS = 0x1,
+};
+
+#define QCRYPTO_DER_TAG_ENC_MASK 0x20
+#define QCRYPTO_DER_TAG_ENC_SHIFT 5
+
+#define QCRYPTO_DER_TAG_CLASS_MASK 0xc0
+#define QCRYPTO_DER_TAG_CLASS_SHIFT 6
+
+#define QCRYPTO_DER_TAG_VAL_MASK 0x1f
 #define QCRYPTO_DER_SHORT_LEN_MASK 0x80
 
+#define QCRYPTO_DER_TAG(class, enc, val)           \
+    (((class) << QCRYPTO_DER_TAG_CLASS_SHIFT) |    \
+     ((enc) << QCRYPTO_DER_TAG_ENC_SHIFT) | (val))
+
+/**
+ * qcrypto_der_encode_length:
+ * @src_len: the length of source data
+ * @dst: distination to save the encoded 'length', if dst is NULL, only compute
+ * the expected buffer size in bytes.
+ * @dst_len: output parameter, indicates how many bytes wrote.
+ *
+ * Encode the 'length' part of TLV tuple.
+ */
+static void qcrypto_der_encode_length(size_t src_len,
+                                      uint8_t *dst, size_t *dst_len)
+{
+    size_t max_length = 0xFF;
+    uint8_t length_bytes = 0, header_byte;
+
+    if (src_len < QCRYPTO_DER_SHORT_LEN_MASK) {
+        header_byte = src_len;
+        *dst_len = 1;
+    } else {
+        for (length_bytes = 1; max_length < src_len; length_bytes++) {
+            max_length = (max_length << 8) + max_length;
+        }
+        header_byte = length_bytes;
+        header_byte |= QCRYPTO_DER_SHORT_LEN_MASK;
+        *dst_len = length_bytes + 1;
+    }
+    if (!dst) {
+        return;
+    }
+    *dst++ = header_byte;
+    /* Bigendian length bytes */
+    for (; length_bytes > 0; length_bytes--) {
+        *dst++ = ((src_len >> (length_bytes - 1) * 8) & 0xFF);
+    }
+}
+
 static uint8_t qcrypto_der_peek_byte(const uint8_t **data, size_t *dlen)
 {
     return **data;
@@ -150,40 +223,230 @@ static int qcrypto_der_extract_data(const uint8_t **data, size_t *dlen,
     return qcrypto_der_extract_definite_data(data, dlen, cb, ctx, errp);
 }
 
-int qcrypto_der_decode_int(const uint8_t **data, size_t *dlen,
-                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+static int qcrypto_der_decode_tlv(const uint8_t expected_tag,
+                                  const uint8_t **data, size_t *dlen,
+                                  QCryptoDERDecodeCb cb,
+                                  void *ctx, Error **errp)
 {
+    const uint8_t *saved_data = *data;
+    size_t saved_dlen = *dlen;
     uint8_t tag;
+    int data_length;
+
     if (*dlen < 1) {
         error_setg(errp, "Need more data");
         return -1;
     }
     tag = qcrypto_der_cut_byte(data, dlen);
-
-    /* INTEGER must encoded in primitive-form */
-    if (tag != QCRYPTO_DER_TYPE_TAG_INT) {
-        error_setg(errp, "Invalid integer type tag: %u", tag);
-        return -1;
+    if (tag != expected_tag) {
+        error_setg(errp, "Unexpected tag: expected: %u, actual: %u",
+                   expected_tag, tag);
+        goto error;
     }
 
-    return qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+    data_length = qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+    if (data_length < 0) {
+        goto error;
+    }
+    return data_length;
+
+error:
+    *data = saved_data;
+    *dlen = saved_dlen;
+    return -1;
+}
+
+int qcrypto_der_decode_int(const uint8_t **data, size_t *dlen,
+                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    const uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                        QCRYPTO_DER_TAG_ENC_PRIM,
+                                        QCRYPTO_DER_TYPE_TAG_INT);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
 }
 
 int qcrypto_der_decode_seq(const uint8_t **data, size_t *dlen,
                            QCryptoDERDecodeCb cb, void *ctx, Error **errp)
 {
-    uint8_t tag;
-    if (*dlen < 1) {
-        error_setg(errp, "Need more data");
-        return -1;
-    }
-    tag = qcrypto_der_cut_byte(data, dlen);
-
-    /* SEQUENCE must use constructed form */
-    if (tag != (QCRYPTO_DER_TYPE_TAG_SEQ | QCRYPTO_DER_CONSTRUCTED_MASK)) {
-        error_setg(errp, "Invalid type sequence tag: %u", tag);
-        return -1;
-    }
-
-    return qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_CONS,
+                                  QCRYPTO_DER_TYPE_TAG_SEQ);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_octet_str(const uint8_t **data, size_t *dlen,
+                                 QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_OCT_STR);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_bit_str(const uint8_t **data, size_t *dlen,
+                               QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_BIT_STR);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_oid(const uint8_t **data, size_t *dlen,
+                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_OID);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_ctx_tag(const uint8_t **data, size_t *dlen, int tag_id,
+                               QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_CONT,
+                                  QCRYPTO_DER_TAG_ENC_CONS,
+                                  tag_id);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+static void qcrypto_der_encode_prim(QCryptoEncodeContext *ctx, uint8_t tag,
+                                    const uint8_t *data, size_t dlen)
+{
+    QCryptoDerEncodeNode *node = g_new0(QCryptoDerEncodeNode, 1);
+    size_t nbytes_len;
+
+    node->tag = tag;
+    node->data = data;
+    node->dlen = dlen;
+    node->parent = ctx->current_parent;
+
+    qcrypto_der_encode_length(dlen, NULL, &nbytes_len);
+    /* 1 byte for Tag, nbyte_len for Length, and dlen for Value */
+    node->parent->dlen += 1 + nbytes_len + dlen;
+
+    ctx->tail->next = node;
+    ctx->tail = node;
+}
+
+QCryptoEncodeContext *qcrypto_der_encode_ctx_new(void)
+{
+    QCryptoEncodeContext *ctx = g_new0(QCryptoEncodeContext, 1);
+    ctx->current_parent = &ctx->root;
+    ctx->tail = &ctx->root;
+    return ctx;
+}
+
+static void qcrypto_der_encode_cons_begin(QCryptoEncodeContext *ctx,
+                                          uint8_t tag)
+{
+    QCryptoDerEncodeNode *node = g_new0(QCryptoDerEncodeNode, 1);
+
+    node->tag = tag;
+    node->parent = ctx->current_parent;
+    ctx->current_parent = node;
+    ctx->tail->next = node;
+    ctx->tail = node;
+}
+
+static void qcrypto_der_encode_cons_end(QCryptoEncodeContext *ctx)
+{
+    QCryptoDerEncodeNode *cons_node = ctx->current_parent;
+    size_t nbytes_len;
+
+    qcrypto_der_encode_length(cons_node->dlen, NULL, &nbytes_len);
+    /* 1 byte for Tag, nbyte_len for Length, and dlen for Value */
+    cons_node->parent->dlen += 1 + nbytes_len + cons_node->dlen;
+    ctx->current_parent = cons_node->parent;
+}
+
+void qcrypto_der_encode_seq_begin(QCryptoEncodeContext *ctx)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_CONS,
+                                  QCRYPTO_DER_TYPE_TAG_SEQ);
+    qcrypto_der_encode_cons_begin(ctx, tag);
+}
+
+void qcrypto_der_encode_seq_end(QCryptoEncodeContext *ctx)
+{
+    qcrypto_der_encode_cons_end(ctx);
+}
+
+void qcrypto_der_encode_oid(QCryptoEncodeContext *ctx,
+                            const uint8_t *src, size_t src_len)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_OID);
+    qcrypto_der_encode_prim(ctx, tag, src, src_len);
+}
+
+void qcrypto_der_encode_int(QCryptoEncodeContext *ctx,
+                            const uint8_t *src, size_t src_len)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_INT);
+    qcrypto_der_encode_prim(ctx, tag, src, src_len);
+}
+
+void qcrypto_der_encode_null(QCryptoEncodeContext *ctx)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_NULL);
+    qcrypto_der_encode_prim(ctx, tag, NULL, 0);
+}
+
+void qcrypto_der_encode_octet_str(QCryptoEncodeContext *ctx,
+                                  const uint8_t *src, size_t src_len)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_OCT_STR);
+    qcrypto_der_encode_prim(ctx, tag, src, src_len);
+}
+
+void qcrypto_der_encode_octet_str_begin(QCryptoEncodeContext *ctx)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_OCT_STR);
+    qcrypto_der_encode_cons_begin(ctx, tag);
+}
+
+void qcrypto_der_encode_octet_str_end(QCryptoEncodeContext *ctx)
+{
+    qcrypto_der_encode_cons_end(ctx);
+}
+
+size_t qcrypto_der_encode_ctx_buffer_len(QCryptoEncodeContext *ctx)
+{
+    return ctx->root.dlen;
+}
+
+void qcrypto_der_encode_ctx_flush_and_free(QCryptoEncodeContext *ctx,
+                                           uint8_t *dst)
+{
+    QCryptoDerEncodeNode *node, *prev;
+    size_t len;
+
+    for (prev = &ctx->root;
+         (node = prev->next) && (prev->next = node->next, 1);) {
+        /* Tag */
+        *dst++ = node->tag;
+
+        /* Length */
+        qcrypto_der_encode_length(node->dlen, dst, &len);
+        dst += len;
+
+        /* Value */
+        if (node->data) {
+            memcpy(dst, node->data, node->dlen);
+            dst += node->dlen;
+        }
+        g_free(node);
+    }
+    g_free(ctx);
 }
diff --git a/tests/unit/test-crypto-der.c b/tests/unit/test-crypto-der.c
index aed0f28d68..d218a7f170 100644
--- a/tests/unit/test-crypto-der.c
+++ b/tests/unit/test-crypto-der.c
@@ -147,13 +147,58 @@ static const uint8_t test_rsa2048_priv_key[] =
     "\x4e\x2f\x4c\xf9\xab\x97\x38\xe4\x20\x32\x32\x96\xc8\x9e\x79\xd3"
     "\x12";
 
+static const uint8_t test_ecdsa_p192_priv_key[] =
+    "\x30\x53"               /* SEQUENCE, offset 0, length 83 */
+    "\x02\x01\x01"           /* INTEGER, offset 2, length 1 */
+    "\x04\x18"               /* OCTET STRING, offset 5, length 24 */
+    "\xcb\xc8\x86\x0e\x66\x3c\xf7\x5a\x44\x13\xb8\xef\xea\x1d\x7b\xa6"
+    "\x1c\xda\xf4\x1b\xc7\x67\x6b\x35"
+    "\xa1\x34"               /* CONTEXT SPECIFIC 1, offset 31, length 52 */
+    "\x03\x32"               /* BIT STRING, offset 33, length 50 */
+    "\x00\x04\xc4\x16\xb3\xff\xac\xd5\x87\x98\xf7\xd9\x45\xfe\xd3\x5c"
+    "\x17\x9d\xb2\x36\x22\xcc\x07\xb3\x6d\x3c\x4e\x04\x5f\xeb\xb6\x52"
+    "\x58\xfb\x36\x10\x52\xb7\x01\x62\x0e\x94\x51\x1d\xe2\xef\x10\x82"
+    "\x88\x78";
+
+static const uint8_t test_ecdsa_p256_priv_key[] =
+    "\x30\x77"              /* SEQUENCE, offset 0, length 119 */
+    "\x02\x01\x01"          /* INTEGER, offset 2, length 1 */
+    "\x04\x20"              /* OCTET STRING, offset 5, length 32 */
+    "\xf6\x92\xdd\x29\x1c\x6e\xef\xb6\xb2\x73\x9f\x40\x1b\xb3\x2a\x28"
+    "\xd2\x37\xd6\x4a\x5b\xe4\x40\x4c\x6a\x95\x99\xfa\xf7\x92\x49\xbe"
+    "\xa0\x0a"              /* CONTEXT SPECIFIC 0, offset 39, length 10 */
+    "\x06\x08"              /* OID, offset 41, length 8 */
+    "\x2a\x86\x48\xce\x3d\x03\x01\x07"
+    "\xa1\x44"              /* CONTEXT SPECIFIC 1, offset 51, length 68 */
+    "\x03\x42"              /* BIT STRING, offset 53, length 66 */
+    "\x00\x04\xed\x42\x9c\x67\x79\xbe\x46\x83\x88\x3e\x8c\xc1\x33\xf3"
+    "\xc3\xf6\x2c\xf3\x13\x6a\x00\xc2\xc9\x3e\x87\x7f\x86\x39\xe6\xae"
+    "\xe3\xb9\xba\x2f\x58\x63\x32\x62\x62\x54\x07\x27\xf9\x5a\x3a\xc7"
+    "\x3a\x6b\x5b\xbc\x0d\x33\xba\xbb\xd4\xa3\xff\x4f\x9e\xdd\xf5\x59"
+    "\xc0\xf6";
+
 #define MAX_CHECKER_COUNT 32
 
+static int qcrypto_wrapped_decode_ctx_tag0(const uint8_t **data, size_t *dlen,
+                                           QCryptoDERDecodeCb cb, void *opaque,
+                                           Error **errp)
+{
+   return qcrypto_der_decode_ctx_tag(data, dlen, 0, cb, opaque, errp);
+}
+
+static int qcrypto_wrapped_decode_ctx_tag1(const uint8_t **data, size_t *dlen,
+                                           QCryptoDERDecodeCb cb, void *opaque,
+                                           Error **errp)
+{
+   return qcrypto_der_decode_ctx_tag(data, dlen, 1, cb, opaque, errp);
+}
+
 typedef struct QCryptoAns1DecoderResultChecker QCryptoAns1DecoderResultChecker;
 struct QCryptoAns1DecoderResultChecker {
     int (*action) (const uint8_t **data, size_t *dlen,
                    QCryptoDERDecodeCb cb, void *opaque, Error **errp);
     QCryptoDERDecodeCb cb;
+    bool constructed;
     const uint8_t *exp_value;
     size_t exp_vlen;
 };
@@ -204,7 +249,7 @@ static void test_ans1(const void *opaque)
         g_assert(checker->action(&c->data, &c->dlen, checker_callback,
                                  (void *)checker, &error_abort)
             == checker->exp_vlen);
-        if (checker->action == qcrypto_der_decode_seq) {
+        if (checker->constructed) {
             ++seq_depth;
             ctx[seq_depth].data = checker->exp_value;
             ctx[seq_depth].dlen = checker->exp_vlen;
@@ -225,25 +270,25 @@ static QCryptoAns1DecoderTestData test_data[] = {
     .test_data = test_rsa512_priv_key,
     .test_data_len = sizeof(test_rsa512_priv_key) - 1,
     .checker = {
-        { qcrypto_der_decode_seq, checker_callback,
+        { qcrypto_der_decode_seq, checker_callback, true,
           test_rsa512_priv_key + 4, 313 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 4 + 2, 1 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 7 + 2, 65 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 74 + 2, 3 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 79 + 2, 64 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 145 + 2, 33 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 180 + 2, 33 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 215 + 2, 32 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 249 + 2, 32 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 283 + 2, 32 },
     },
 },
@@ -252,29 +297,66 @@ static QCryptoAns1DecoderTestData test_data[] = {
     .test_data = test_rsa2048_priv_key,
     .test_data_len = sizeof(test_rsa2048_priv_key) - 1,
     .checker = {
-        { qcrypto_der_decode_seq, checker_callback,
+        { qcrypto_der_decode_seq, checker_callback, true,
           test_rsa2048_priv_key + 4, 1190 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 4 + 2, 1 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 7 + 4, 257 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 268 + 2, 3 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 273 + 4, 257 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 534 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 666 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 798 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 930 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 1062 + 3, 129 },
     },
 },
-
+{
+    .path = "/crypto/der/parse-ecdsa-p192-priv-key",
+    .test_data = test_ecdsa_p192_priv_key,
+    .test_data_len = sizeof(test_ecdsa_p192_priv_key) - 1,
+    .checker = {
+        { qcrypto_der_decode_seq, checker_callback, true,
+          test_ecdsa_p192_priv_key + 2, 83 },
+        { qcrypto_der_decode_int, checker_callback, false,
+          test_ecdsa_p192_priv_key + 2 + 2, 1 },
+        { qcrypto_der_decode_octet_str, checker_callback, false,
+          test_ecdsa_p192_priv_key + 5 + 2, 24 },
+        { qcrypto_wrapped_decode_ctx_tag1, checker_callback, true,
+          test_ecdsa_p192_priv_key + 31 + 2, 52 },
+        { qcrypto_der_decode_bit_str , checker_callback, false,
+          test_ecdsa_p192_priv_key + 33 + 2, 50 },
+    },
+},
+{
+    .path = "/crypto/der/parse-ecdsa-p256-priv-key",
+    .test_data = test_ecdsa_p256_priv_key,
+    .test_data_len = sizeof(test_ecdsa_p256_priv_key) - 1,
+    .checker = {
+        { qcrypto_der_decode_seq, checker_callback, true,
+          test_ecdsa_p256_priv_key + 2, 119 },
+        { qcrypto_der_decode_int, checker_callback, false,
+          test_ecdsa_p256_priv_key + 2 + 2, 1 },
+        { qcrypto_der_decode_octet_str, checker_callback, false,
+          test_ecdsa_p256_priv_key + 5 + 2, 32 },
+        { qcrypto_wrapped_decode_ctx_tag0, checker_callback, true,
+          test_ecdsa_p256_priv_key + 39 + 2, 10 },
+        { qcrypto_der_decode_oid, checker_callback, false,
+          test_ecdsa_p256_priv_key + 41 + 2, 8 },
+        { qcrypto_wrapped_decode_ctx_tag1, checker_callback, true,
+          test_ecdsa_p256_priv_key + 51 + 2, 68 },
+        { qcrypto_der_decode_bit_str , checker_callback, false,
+          test_ecdsa_p256_priv_key + 53 + 2, 66 },
+    },
+},
 };
 
 int main(int argc, char **argv)
-- 
MST


