Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8D51F9B9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:22:14 +0200 (CEST)
Received: from localhost ([::1]:36144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0Wq-0005mr-91
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0U1-0004ML-U9
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0Ty-0000jP-KW
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652091552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9EmxRdjX9XYdFkMictctuV27isiQ9OQ9vd/VvL/0JNw=;
 b=IKeuhYkeZyEVcq63A5kf4JIFvqh2pfJ2OyjFH/XOv7GFpDKoSTjFZytm5wRvTdhBSWPgtK
 dKyHs3Qo9GXiyZPlhXZg67XIh4b5iTD9YlxOxxoV0jEUTYzFY8+tpFovsH3zCi4L1546vy
 gPAIn4Hp6aj1JxD1znpsV6XBw2kT5II=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-B9jDKizXNU6xaRSHhHBxZg-1; Mon, 09 May 2022 06:19:11 -0400
X-MC-Unique: B9jDKizXNU6xaRSHhHBxZg-1
Received: by mail-ej1-f72.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso6478898ejs.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EmxRdjX9XYdFkMictctuV27isiQ9OQ9vd/VvL/0JNw=;
 b=vmGTmLcFA6eh8nMFZKSLNsQluqmIzAky84XnieE2dobdUx95fWCGCtxV3aUpJnbYOP
 oTSMjCHyAjVZAZsLxNNrN17PAybdgDGw5pOBrF3bjzRa4/LvqX5qEVs/8P0FjZty8HH7
 IxlcTuKrdhgSDrWoSG21i6uU0RyObXqhqUgu/J3MipJRrLJAikNEmhhMQym63O6/CO1c
 5f6/A0PaFq83GehO14cu+u1zaVOJ1KcnMwicrHJp3gssX5FP6+mVArjdNHZzonvjQlLC
 O5cNzBefBF3QJoD/26xKztlGL9WnUAKKFUXKy6FAlXjWwcw4IUCyaFqBx/6UMvKNeXhq
 UTdg==
X-Gm-Message-State: AOAM533gjyT99MFV8LCf7J9D4i6e5juv9GH0v8w9bM4b4Duojm1KfjGr
 vA2lpBPW14F9FDEtGSRPXez1QkeSIymfD9Nzol1k/9ZKBgZGhtctpAWP51ogBhLEbRXC7rasnPM
 5j8/U6GSzXjkeqIiYW8OjtT2Cf73GoLK3CoW7nYHqTICaYczyTc9nNNiF98C/gqkN/AM=
X-Received: by 2002:a17:907:3e92:b0:6f4:7ab4:20a5 with SMTP id
 hs18-20020a1709073e9200b006f47ab420a5mr14467452ejc.620.1652091549820; 
 Mon, 09 May 2022 03:19:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRBZaAsrTduT64X1tH01CPQ3oFB6cReKXFl8/QCRXJZBAT0Z5XZKRkqUtO8PsEkCfkjXxqhQ==
X-Received: by 2002:a17:907:3e92:b0:6f4:7ab4:20a5 with SMTP id
 hs18-20020a1709073e9200b006f47ab420a5mr14467425ejc.620.1652091549368; 
 Mon, 09 May 2022 03:19:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a05640200d800b0042617ba63a8sm6239798edu.50.2022.05.09.03.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:19:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com
Subject: [PATCH] crypto: make loaded property read-only
Date: Mon,  9 May 2022 12:19:07 +0200
Message-Id: <20220509101907.212687-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ``loaded=on`` option in the command line or QMP ``object-add`` either had
no effect (if ``loaded`` was the last option) or caused options to be
effectively ignored as if they were not given.  The property is therefore
useless and was deprecated in 6.0; make it read-only now.

The patch is best reviewed with "-b".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 crypto/secret_common.c          | 84 ++++++++++++++-------------------
 crypto/tlscredsanon.c           | 20 ++------
 crypto/tlscredspsk.c            | 20 ++------
 crypto/tlscredsx509.c           | 20 ++------
 docs/about/deprecated.rst       | 10 ----
 docs/about/removed-features.rst |  8 ++++
 6 files changed, 55 insertions(+), 107 deletions(-)

diff --git a/crypto/secret_common.c b/crypto/secret_common.c
index 714a15d5e5..3441c44ca8 100644
--- a/crypto/secret_common.c
+++ b/crypto/secret_common.c
@@ -138,36 +138,44 @@ static void qcrypto_secret_decode(const uint8_t *input,
 
 
 static void
-qcrypto_secret_prop_set_loaded(Object *obj,
-                               bool value,
-                               Error **errp)
+qcrypto_secret_complete(UserCreatable *uc, Error **errp)
 {
-    QCryptoSecretCommon *secret = QCRYPTO_SECRET_COMMON(obj);
+    QCryptoSecretCommon *secret = QCRYPTO_SECRET_COMMON(uc);
     QCryptoSecretCommonClass *sec_class
-                                = QCRYPTO_SECRET_COMMON_GET_CLASS(obj);
+                                = QCRYPTO_SECRET_COMMON_GET_CLASS(uc);
 
-    if (value) {
-        Error *local_err = NULL;
-        uint8_t *input = NULL;
-        size_t inputlen = 0;
-        uint8_t *output = NULL;
-        size_t outputlen = 0;
+    Error *local_err = NULL;
+    uint8_t *input = NULL;
+    size_t inputlen = 0;
+    uint8_t *output = NULL;
+    size_t outputlen = 0;
 
-        if (sec_class->load_data) {
-            sec_class->load_data(secret, &input, &inputlen, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        } else {
-            error_setg(errp, "%s provides no 'load_data' method'",
-                             object_get_typename(obj));
+    if (sec_class->load_data) {
+        sec_class->load_data(secret, &input, &inputlen, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
             return;
         }
+    } else {
+        error_setg(errp, "%s provides no 'load_data' method'",
+                         object_get_typename(OBJECT(uc)));
+        return;
+    }
 
-        if (secret->keyid) {
-            qcrypto_secret_decrypt(secret, input, inputlen,
-                                   &output, &outputlen, &local_err);
+    if (secret->keyid) {
+        qcrypto_secret_decrypt(secret, input, inputlen,
+                               &output, &outputlen, &local_err);
+        g_free(input);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+        input = output;
+        inputlen = outputlen;
+    } else {
+        if (secret->format == QCRYPTO_SECRET_FORMAT_BASE64) {
+            qcrypto_secret_decode(input, inputlen,
+                                  &output, &outputlen, &local_err);
             g_free(input);
             if (local_err) {
                 error_propagate(errp, local_err);
@@ -175,26 +183,11 @@ qcrypto_secret_prop_set_loaded(Object *obj,
             }
             input = output;
             inputlen = outputlen;
-        } else {
-            if (secret->format == QCRYPTO_SECRET_FORMAT_BASE64) {
-                qcrypto_secret_decode(input, inputlen,
-                                      &output, &outputlen, &local_err);
-                g_free(input);
-                if (local_err) {
-                    error_propagate(errp, local_err);
-                    return;
-                }
-                input = output;
-                inputlen = outputlen;
-            }
         }
-
-        secret->rawdata = input;
-        secret->rawlen = inputlen;
-    } else if (secret->rawdata) {
-        error_setg(errp, "Cannot unload secret");
-        return;
     }
+
+    secret->rawdata = input;
+    secret->rawlen = inputlen;
 }
 
 
@@ -268,13 +261,6 @@ qcrypto_secret_prop_get_keyid(Object *obj,
 }
 
 
-static void
-qcrypto_secret_complete(UserCreatable *uc, Error **errp)
-{
-    object_property_set_bool(OBJECT(uc), "loaded", true, errp);
-}
-
-
 static void
 qcrypto_secret_finalize(Object *obj)
 {
@@ -294,7 +280,7 @@ qcrypto_secret_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "loaded",
                                    qcrypto_secret_prop_get_loaded,
-                                   qcrypto_secret_prop_set_loaded);
+                                   NULL);
     object_class_property_add_enum(oc, "format",
                                    "QCryptoSecretFormat",
                                    &QCryptoSecretFormat_lookup,
diff --git a/crypto/tlscredsanon.c b/crypto/tlscredsanon.c
index 6fb83639ec..c0d23a0ef3 100644
--- a/crypto/tlscredsanon.c
+++ b/crypto/tlscredsanon.c
@@ -119,16 +119,11 @@ qcrypto_tls_creds_anon_unload(QCryptoTLSCredsAnon *creds G_GNUC_UNUSED)
 
 
 static void
-qcrypto_tls_creds_anon_prop_set_loaded(Object *obj,
-                                       bool value,
-                                       Error **errp)
+qcrypto_tls_creds_anon_complete(UserCreatable *uc, Error **errp)
 {
-    QCryptoTLSCredsAnon *creds = QCRYPTO_TLS_CREDS_ANON(obj);
+    QCryptoTLSCredsAnon *creds = QCRYPTO_TLS_CREDS_ANON(uc);
 
-    qcrypto_tls_creds_anon_unload(creds);
-    if (value) {
-        qcrypto_tls_creds_anon_load(creds, errp);
-    }
+    qcrypto_tls_creds_anon_load(creds, errp);
 }
 
 
@@ -163,13 +158,6 @@ qcrypto_tls_creds_anon_prop_get_loaded(Object *obj G_GNUC_UNUSED,
 #endif /* ! CONFIG_GNUTLS */
 
 
-static void
-qcrypto_tls_creds_anon_complete(UserCreatable *uc, Error **errp)
-{
-    object_property_set_bool(OBJECT(uc), "loaded", true, errp);
-}
-
-
 static void
 qcrypto_tls_creds_anon_finalize(Object *obj)
 {
@@ -188,7 +176,7 @@ qcrypto_tls_creds_anon_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "loaded",
                                    qcrypto_tls_creds_anon_prop_get_loaded,
-                                   qcrypto_tls_creds_anon_prop_set_loaded);
+                                   NULL);
 }
 
 
diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index 752f2d92be..a4f9891274 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -188,16 +188,11 @@ qcrypto_tls_creds_psk_unload(QCryptoTLSCredsPSK *creds G_GNUC_UNUSED)
 
 
 static void
-qcrypto_tls_creds_psk_prop_set_loaded(Object *obj,
-                                      bool value,
-                                      Error **errp)
+qcrypto_tls_creds_psk_complete(UserCreatable *uc, Error **errp)
 {
-    QCryptoTLSCredsPSK *creds = QCRYPTO_TLS_CREDS_PSK(obj);
+    QCryptoTLSCredsPSK *creds = QCRYPTO_TLS_CREDS_PSK(uc);
 
-    qcrypto_tls_creds_psk_unload(creds);
-    if (value) {
-        qcrypto_tls_creds_psk_load(creds, errp);
-    }
+    qcrypto_tls_creds_psk_load(creds, errp);
 }
 
 
@@ -232,13 +227,6 @@ qcrypto_tls_creds_psk_prop_get_loaded(Object *obj G_GNUC_UNUSED,
 #endif /* ! CONFIG_GNUTLS */
 
 
-static void
-qcrypto_tls_creds_psk_complete(UserCreatable *uc, Error **errp)
-{
-    object_property_set_bool(OBJECT(uc), "loaded", true, errp);
-}
-
-
 static void
 qcrypto_tls_creds_psk_finalize(Object *obj)
 {
@@ -276,7 +264,7 @@ qcrypto_tls_creds_psk_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "loaded",
                                    qcrypto_tls_creds_psk_prop_get_loaded,
-                                   qcrypto_tls_creds_psk_prop_set_loaded);
+                                   NULL);
     object_class_property_add_str(oc, "username",
                                   qcrypto_tls_creds_psk_prop_get_username,
                                   qcrypto_tls_creds_psk_prop_set_username);
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index 32948a6bdc..d14313925d 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -687,16 +687,11 @@ qcrypto_tls_creds_x509_unload(QCryptoTLSCredsX509 *creds G_GNUC_UNUSED)
 
 
 static void
-qcrypto_tls_creds_x509_prop_set_loaded(Object *obj,
-                                       bool value,
-                                       Error **errp)
+qcrypto_tls_creds_x509_complete(UserCreatable *uc, Error **errp)
 {
-    QCryptoTLSCredsX509 *creds = QCRYPTO_TLS_CREDS_X509(obj);
+    QCryptoTLSCredsX509 *creds = QCRYPTO_TLS_CREDS_X509(uc);
 
-    qcrypto_tls_creds_x509_unload(creds);
-    if (value) {
-        qcrypto_tls_creds_x509_load(creds, errp);
-    }
+    qcrypto_tls_creds_x509_load(creds, errp);
 }
 
 
@@ -814,13 +809,6 @@ qcrypto_tls_creds_x509_reload(QCryptoTLSCreds *creds, Error **errp)
 #endif /* ! CONFIG_GNUTLS */
 
 
-static void
-qcrypto_tls_creds_x509_complete(UserCreatable *uc, Error **errp)
-{
-    object_property_set_bool(OBJECT(uc), "loaded", true, errp);
-}
-
-
 static void
 qcrypto_tls_creds_x509_init(Object *obj)
 {
@@ -852,7 +840,7 @@ qcrypto_tls_creds_x509_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "loaded",
                                    qcrypto_tls_creds_x509_prop_get_loaded,
-                                   qcrypto_tls_creds_x509_prop_set_loaded);
+                                   NULL);
     object_class_property_add_bool(oc, "sanity-check",
                                    qcrypto_tls_creds_x509_prop_get_sanity,
                                    qcrypto_tls_creds_x509_prop_set_sanity);
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 896e5a97ab..2feb0c506c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -99,16 +99,6 @@ other options have been processed.  This will either have no effect (if
 ``opened`` was the last option) or cause errors.  The property is therefore
 useless and should not be specified.
 
-``loaded`` property of ``secret`` and ``secret_keyring`` objects (since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The only effect of specifying ``loaded=on`` in the command line or QMP
-``object-add`` is that the secret is loaded immediately, possibly before all
-other options have been processed.  This will either have no effect (if
-``loaded`` was the last option) or cause options to be effectively ignored as
-if they were not given.  The property is therefore useless and should not be
-specified.
-
 ``-display sdl,window_close=...`` (since 6.1)
 '''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4a0b270296..2032608314 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -741,6 +741,14 @@ aware that there are already potential security risks to blindly using
 ``qemu-img info`` to probe the format of an untrusted backing image,
 when deciding what format to add into an existing image.
 
+``loaded`` property of ``secret`` and ``secret_keyring`` objects (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``loaded=on`` option in the command line or QMP ``object-add`` either had
+no effect (if ``loaded`` was the last option) or caused options to be
+effectively ignored as if they were not given.  The property is therefore
+useless and should simply be removed.
+
 Block devices
 -------------
 
-- 
2.35.1


