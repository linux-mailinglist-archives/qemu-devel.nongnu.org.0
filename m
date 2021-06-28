Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2B3B6680
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:14:39 +0200 (CEST)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtuA-0001L5-Az
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpZ-0001C4-Kx
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpX-00024I-3z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqLFsVIs5eoXi/VP70H1Pdkb5jHJv3kkDE9nCJoqgbk=;
 b=IsphPJhcccuagRK2DeyfeqK95UYSBaMyfDwRAczd43Z50yyBrb0RiiW8bUcVHL9IWxJMWM
 ka7BssuNwE1nO1CfPH2qzNJC/8RgyVqILcLJXow4c5sT3Y3unF82FY+GfhN0MHgT8mH+Sw
 6ytnofW7Z4Ei2KrueTegqRaKHKhNK2A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-IwIeQd-9N-yysSChuN07WA-1; Mon, 28 Jun 2021 12:09:48 -0400
X-MC-Unique: IwIeQd-9N-yysSChuN07WA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so5319215wmc.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqLFsVIs5eoXi/VP70H1Pdkb5jHJv3kkDE9nCJoqgbk=;
 b=B5evoW/DVi4FB0v9FfE3CWHCrzuzfyXoyn9iwoz9Vg4yg5uW8N08inm5uf/7CGEpVA
 0DGrGPGnvHAfZjIdmjI+y8XP7DK6WuTsPdSsyMtOF5nWKwRNfV8G4Ao5gvzAK8MimHOY
 YgbkqXx5MIPYcKX7lLqQZzgp+KZ8yabch+as8gxPvIvdE6z6EUmagV04w54hGTHHXPzs
 5/LBH3X64YhsnuE2CGf1vVBMpcRylkc9IoZgCMBx64PLxTxgrwFZBowkH39DKqZj/3p4
 OFLLoesTVQOrwrh1As3taQzGf2C2G38E4P8u+qg9faB0EbJM7hiZPu3dsbz6KSnkwlTe
 XekA==
X-Gm-Message-State: AOAM531doWPVaHlKRxVSKFsOylUXquQyDmy94Iah40Sj7WQc/8BcHnbW
 Mhz7HJTN6sEX23Zh84rnaSEz62Z5rb07pCev/nUEg4JrmQZ/Hd07jsoqtQc6+LRsO+hkChk3ui5
 cDw9XFku4xF5wiQgF1o21G4zMU5paqdeVrpsaRYUHQoG5XpattntZmZ3aYcKKoiN7
X-Received: by 2002:a5d:5012:: with SMTP id e18mr28878248wrt.286.1624896587066; 
 Mon, 28 Jun 2021 09:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTZ9Zvd1U0fKPp4BwZ2XFg2kIoxTE0aigFS+GRxIfAHkvzFtaBFaXNaLK0MyJjuxTy8DE/fQ==
X-Received: by 2002:a5d:5012:: with SMTP id e18mr28878206wrt.286.1624896586758; 
 Mon, 28 Jun 2021 09:09:46 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t128sm21408325wma.41.2021.06.28.09.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 7/7] crypto: Make QCryptoTLSCreds* structures private
Date: Mon, 28 Jun 2021 18:09:14 +0200
Message-Id: <20210628160914.2461906-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628160914.2461906-1-philmd@redhat.com>
References: <20210628160914.2461906-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code consuming the "crypto/tlscreds*.h" APIs doesn't need
to access its internals. Move the structure definitions to
the "tlscredspriv.h" private header (only accessible by
implementations). The public headers (in include/) still
forward-declare the structures typedef.

Note, tlscreds.c and 3 of the 5 modified source files already
include "tlscredspriv.h", so only add it to tls-cipher-suites.c
and tlssession.c.

Removing the internals from the public header solves a bug
introduced by commit 7de2e856533 ("yank: Unregister function
when using TLS migration") which made migration/qemu-file-channel.c
include "io/channel-tls.h", itself sometime depends on GNUTLS,
leading to a build failure on OSX:

  [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
  FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
  cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
  In file included from ../migration/qemu-file-channel.c:29:
  In file included from include/io/channel-tls.h:26:
  In file included from include/crypto/tlssession.h:24:
  include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
  #include <gnutls/gnutls.h>
           ^~~~~~~~~~~~~~~~~
  1 error generated.

Reported-by: Stefan Weil <sw@weilnetz.de>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++
 include/crypto/tls-cipher-suites.h |  6 ----
 include/crypto/tlscreds.h          | 16 -----------
 include/crypto/tlscredsanon.h      | 12 --------
 include/crypto/tlscredspsk.h       | 12 --------
 include/crypto/tlscredsx509.h      | 10 -------
 crypto/tls-cipher-suites.c         |  7 +++++
 crypto/tlscredsanon.c              |  2 ++
 crypto/tlscredspsk.c               |  2 ++
 crypto/tlscredsx509.c              |  1 +
 crypto/tlssession.c                |  1 +
 11 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/crypto/tlscredspriv.h b/crypto/tlscredspriv.h
index 39f1a91c413..df9815a2863 100644
--- a/crypto/tlscredspriv.h
+++ b/crypto/tlscredspriv.h
@@ -23,6 +23,51 @@
 
 #include "crypto/tlscreds.h"
 
+#ifdef CONFIG_GNUTLS
+#include <gnutls/gnutls.h>
+#endif
+
+struct QCryptoTLSCreds {
+    Object parent_obj;
+    char *dir;
+    QCryptoTLSCredsEndpoint endpoint;
+#ifdef CONFIG_GNUTLS
+    gnutls_dh_params_t dh_params;
+#endif
+    bool verifyPeer;
+    char *priority;
+};
+
+struct QCryptoTLSCredsAnon {
+    QCryptoTLSCreds parent_obj;
+#ifdef CONFIG_GNUTLS
+    union {
+        gnutls_anon_server_credentials_t server;
+        gnutls_anon_client_credentials_t client;
+    } data;
+#endif
+};
+
+struct QCryptoTLSCredsPSK {
+    QCryptoTLSCreds parent_obj;
+    char *username;
+#ifdef CONFIG_GNUTLS
+    union {
+        gnutls_psk_server_credentials_t server;
+        gnutls_psk_client_credentials_t client;
+    } data;
+#endif
+};
+
+struct QCryptoTLSCredsX509 {
+    QCryptoTLSCreds parent_obj;
+#ifdef CONFIG_GNUTLS
+    gnutls_certificate_credentials_t data;
+#endif
+    bool sanityCheck;
+    char *passwordid;
+};
+
 #ifdef CONFIG_GNUTLS
 
 int qcrypto_tls_creds_get_path(QCryptoTLSCreds *creds,
diff --git a/include/crypto/tls-cipher-suites.h b/include/crypto/tls-cipher-suites.h
index bb9ee53e03a..7eb1b76122d 100644
--- a/include/crypto/tls-cipher-suites.h
+++ b/include/crypto/tls-cipher-suites.h
@@ -19,12 +19,6 @@ typedef struct QCryptoTLSCipherSuites QCryptoTLSCipherSuites;
 DECLARE_INSTANCE_CHECKER(QCryptoTLSCipherSuites, QCRYPTO_TLS_CIPHER_SUITES,
                          TYPE_QCRYPTO_TLS_CIPHER_SUITES)
 
-struct QCryptoTLSCipherSuites {
-    /* <private> */
-    QCryptoTLSCreds parent_obj;
-    /* <public> */
-};
-
 /**
   * qcrypto_tls_cipher_suites_get_data:
   * @obj: pointer to a TLS cipher suites object
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index a14e44fac15..2a8a8570109 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -24,10 +24,6 @@
 #include "qapi/qapi-types-crypto.h"
 #include "qom/object.h"
 
-#ifdef CONFIG_GNUTLS
-#include <gnutls/gnutls.h>
-#endif
-
 #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
 typedef struct QCryptoTLSCreds QCryptoTLSCreds;
 typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
@@ -48,18 +44,6 @@ typedef bool (*CryptoTLSCredsReload)(QCryptoTLSCreds *, Error **);
  * certificate credentials.
  */
 
-struct QCryptoTLSCreds {
-    Object parent_obj;
-    char *dir;
-    QCryptoTLSCredsEndpoint endpoint;
-#ifdef CONFIG_GNUTLS
-    gnutls_dh_params_t dh_params;
-#endif
-    bool verifyPeer;
-    char *priority;
-};
-
-
 struct QCryptoTLSCredsClass {
     ObjectClass parent_class;
     CryptoTLSCredsReload reload;
diff --git a/include/crypto/tlscredsanon.h b/include/crypto/tlscredsanon.h
index 3f464a38095..bd3023f9ea7 100644
--- a/include/crypto/tlscredsanon.h
+++ b/include/crypto/tlscredsanon.h
@@ -92,18 +92,6 @@ typedef struct QCryptoTLSCredsAnonClass QCryptoTLSCredsAnonClass;
  *
  */
 
-
-struct QCryptoTLSCredsAnon {
-    QCryptoTLSCreds parent_obj;
-#ifdef CONFIG_GNUTLS
-    union {
-        gnutls_anon_server_credentials_t server;
-        gnutls_anon_client_credentials_t client;
-    } data;
-#endif
-};
-
-
 struct QCryptoTLSCredsAnonClass {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/include/crypto/tlscredspsk.h b/include/crypto/tlscredspsk.h
index d7e6bdb5edf..bcd07dc4f62 100644
--- a/include/crypto/tlscredspsk.h
+++ b/include/crypto/tlscredspsk.h
@@ -87,18 +87,6 @@ typedef struct QCryptoTLSCredsPSKClass QCryptoTLSCredsPSKClass;
  * The PSK file can be created and managed using psktool.
  */
 
-struct QCryptoTLSCredsPSK {
-    QCryptoTLSCreds parent_obj;
-    char *username;
-#ifdef CONFIG_GNUTLS
-    union {
-        gnutls_psk_server_credentials_t server;
-        gnutls_psk_client_credentials_t client;
-    } data;
-#endif
-};
-
-
 struct QCryptoTLSCredsPSKClass {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/include/crypto/tlscredsx509.h b/include/crypto/tlscredsx509.h
index c6d89b78819..c4daba21a6b 100644
--- a/include/crypto/tlscredsx509.h
+++ b/include/crypto/tlscredsx509.h
@@ -96,16 +96,6 @@ typedef struct QCryptoTLSCredsX509Class QCryptoTLSCredsX509Class;
  *
  */
 
-struct QCryptoTLSCredsX509 {
-    QCryptoTLSCreds parent_obj;
-#ifdef CONFIG_GNUTLS
-    gnutls_certificate_credentials_t data;
-#endif
-    bool sanityCheck;
-    char *passwordid;
-};
-
-
 struct QCryptoTLSCredsX509Class {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/crypto/tls-cipher-suites.c b/crypto/tls-cipher-suites.c
index 55fb5f7c19d..5e4f5974645 100644
--- a/crypto/tls-cipher-suites.c
+++ b/crypto/tls-cipher-suites.c
@@ -14,8 +14,15 @@
 #include "crypto/tlscreds.h"
 #include "crypto/tls-cipher-suites.h"
 #include "hw/nvram/fw_cfg.h"
+#include "tlscredspriv.h"
 #include "trace.h"
 
+struct QCryptoTLSCipherSuites {
+    /* <private> */
+    QCryptoTLSCreds parent_obj;
+    /* <public> */
+};
+
 /*
  * IANA registered TLS ciphers:
  * https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#tls-parameters-4
diff --git a/crypto/tlscredsanon.c b/crypto/tlscredsanon.c
index bea5f76c55d..6fb83639ecd 100644
--- a/crypto/tlscredsanon.c
+++ b/crypto/tlscredsanon.c
@@ -29,6 +29,8 @@
 
 #ifdef CONFIG_GNUTLS
 
+#include <gnutls/gnutls.h>
+
 
 static int
 qcrypto_tls_creds_anon_load(QCryptoTLSCredsAnon *creds,
diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index f5a31108d15..752f2d92bee 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -29,6 +29,8 @@
 
 #ifdef CONFIG_GNUTLS
 
+#include <gnutls/gnutls.h>
+
 static int
 lookup_key(const char *pskfile, const char *username, gnutls_datum_t *key,
            Error **errp)
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index d9d6f4421e5..32948a6bdc4 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -30,6 +30,7 @@
 
 #ifdef CONFIG_GNUTLS
 
+#include <gnutls/gnutls.h>
 #include <gnutls/x509.h>
 
 
diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index 33203e8ca71..a8db8c76d13 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -25,6 +25,7 @@
 #include "crypto/tlscredsx509.h"
 #include "qapi/error.h"
 #include "authz/base.h"
+#include "tlscredspriv.h"
 #include "trace.h"
 
 #ifdef CONFIG_GNUTLS
-- 
2.31.1


