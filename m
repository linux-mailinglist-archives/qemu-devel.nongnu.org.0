Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC7528BF5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:27:24 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeV9-0003RI-GA
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5T-0002t2-JG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5Q-0003QE-PP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoMaa+rI8iDUMnDZhyFyCIwDgr6IM/di1/hoIh37aHE=;
 b=W6KkP83XZxHikU7+E19GbfXchyDiEm5QbCXhBk1lnveT/U4qAkY7A4XMLHlXeEV/y9ztyC
 C7wQzgmAgEP5ASujsP024aMxi72HUMz1x3LDjnY7IITBETHS8+E1gdmQFjfokXHZPEHmo4
 todwygwCio7HMGLxRTle4FsQX5miSRc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-lONWGs1MPnGbmjn8WR_loA-1; Mon, 16 May 2022 11:56:35 -0400
X-MC-Unique: lONWGs1MPnGbmjn8WR_loA-1
Received: by mail-ej1-f70.google.com with SMTP id
 l18-20020a1709066b9200b006fe40aaf3bbso1039012ejr.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoMaa+rI8iDUMnDZhyFyCIwDgr6IM/di1/hoIh37aHE=;
 b=bYCntu7oFTor7DSEGa52OTybvhIKJ+1CQgnyrntMWjfhjw8dSKv7txcCjhyDImnfMB
 DqC+WUcE+VG1svXluyZhXl9k9kaxsT01YhhWbt3mjK+evY+1gqgGOlghfDX7ahA+KP46
 YpBeavMtZAyFQ5hdPQVmqGE0JGHQk/BWds91QzEHf8aYR5LFXmnRQIVwZSKEU/WX2YLl
 sJ1gJ4oMa0uEXtjTlHP7nHXhFQDVNFW07hI2wXDh8CKEW2x6ZoONfPkHfmQgMorWSB10
 hGMaNTCDb7bPKxpgT4Fd7M6WjnMN6AJPGdVnbuMGjRjYO8rUlOU4fV22Fe4mPPc4luF9
 +whQ==
X-Gm-Message-State: AOAM530LNJHzJ6NjIDCIiz12DANnF35+VRHRdtgEhiQFr52W1dIKGzej
 Be7mQpF82D/Un9hVpQFy27w2McXFYtNYurUOgEoX8gBLk0LWD7w0bHqjufa1qeWwduF87pduA7Q
 Jnr2QM2/p2R1wBLso7L5yepjz+ys/UGiBKfYbaWEgWTUgvouMO2LXXh3HGYCpjRnUZzI=
X-Received: by 2002:a17:906:8806:b0:6f5:15aa:1f40 with SMTP id
 zh6-20020a170906880600b006f515aa1f40mr16018714ejb.595.1652716593605; 
 Mon, 16 May 2022 08:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbDfazuBFu211z12T3R4F4oG/jTl/4CxH6f8JfBWt4HAEbVb7UQLE5/ULikycZs5b6sVxsQQ==
X-Received: by 2002:a17:906:8806:b0:6f5:15aa:1f40 with SMTP id
 zh6-20020a170906880600b006f515aa1f40mr16018689ejb.595.1652716593157; 
 Mon, 16 May 2022 08:56:33 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 hx25-20020a170906847900b006f3ef214ddasm48644ejc.64.2022.05.16.08.56.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] crypto: make loaded property read-only
Date: Mon, 16 May 2022 17:55:54 +0200
Message-Id: <20220516155603.1234712-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
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
 docs/about/removed-features.rst |  9 ++++
 6 files changed, 56 insertions(+), 107 deletions(-)

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
index 44f52c172d..2a022f2300 100644
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
index ba78bc1a19..81ceeb9000 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -355,6 +355,15 @@ The ``-writeconfig`` option was not able to serialize the entire contents
 of the QEMU command line.  It is thus considered a failed experiment
 and removed without a replacement.
 
+``loaded`` property of ``secret`` and ``secret_keyring`` objects (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``loaded=on`` option in the command line or QMP ``object-add`` either had
+no effect (if ``loaded`` was the last option) or caused options to be
+effectively ignored as if they were not given.  The property is therefore
+useless and should simply be removed.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-- 
2.36.0


