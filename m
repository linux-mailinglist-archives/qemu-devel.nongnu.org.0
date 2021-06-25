Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB63B456E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:20:32 +0200 (CEST)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmh5-0005oj-OH
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfB-0002vS-De
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:33 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf7-00038q-V3
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:33 -0400
Received: by mail-ed1-x533.google.com with SMTP id c7so13612807edn.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VArWV/JYlPRB+ITaKgwursWuWO5skwybUaAhhu6OsTQ=;
 b=TnyiuFapzs2RR6Zl6mz6v/u5As+m85c6fs2InT1X6Y0QiVJRnzwvrulDPmmlsXym89
 v8luZAFQkdjfUZWKSk6Cc5Wh/WDt4dw5LrJ+XG9++oFIXouv7CxxR1kOU6P7l0jUNMet
 qbfTZGIUP+vRjG37CaYwomYkcQaTI/bhiWhL9KgE64QCdRXrM75QwsqFfNfo2GE5JOSN
 oiPonz93LVoVAAbjZoRFpy2CEAQkwkWC2MPS3pB5XfBJAWe5OKRtiRWiYcPj4jp9i/dg
 SYOZbcv0UdOe0scyvEOEmKSoyGJr+zho3ePFiS/1n1tb1Mrxyfc6WDwXGc919wOdKtVV
 femw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VArWV/JYlPRB+ITaKgwursWuWO5skwybUaAhhu6OsTQ=;
 b=Klzko6LyjJRV/IFjhOAewAucYo158oQlci0nJ2Lh/sirjuvqU1iXhApprsaCwq8ijT
 m0SiC4NJSbagVE4TlKb6poKCSXn++3gU7Z0yBJfdfON8tbA+35mz18f0QupjpWkHfs5N
 0JfOrv4P7u3ulUBeV2dA0brz5CgCxukI2z1bFsTgLyXVVLjM+/UqFdljx3Y8cxgKBgEO
 WCDSkv5bazwlFVLkLEntdGq0w9qmxRm5A2JE7zPHLu5Ep6+M4kvZYzRV9RSnwfZI+Z+4
 vI/W1PZF/aAXCpIljHNOfHD+RgB8nVP2eu+8JQmZ7Hp+tpW6oD7zw0ckSnv/4O0ttF3F
 CkSw==
X-Gm-Message-State: AOAM5326Z9UHw6QBqUuvjTPC7rHzPXXEBSDXXc+OLE5ipzuTuQf1Ss3f
 UFJzC1JAWOXaJwzlW+77dmReBMzteiU=
X-Google-Smtp-Source: ABdhPJx8NxGLmRQEQVIlQSqQnSjagM6JAhjw1JCILONWMXbx0OEpQkZKtEZDTfxWLvzR65QJ3TDYNQ==
X-Received: by 2002:a50:9b06:: with SMTP id o6mr15166296edi.284.1624630708613; 
 Fri, 25 Jun 2021 07:18:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] tests: remove QCRYPTO_HAVE_TLS_TEST_SUPPORT
Date: Fri, 25 Jun 2021 16:17:59 +0200
Message-Id: <20210625141822.1368639-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

meson.build already decides whether it is possible to build the TLS
test suite.  There is no need to include that in the source as well.
The dummy tests in fact are broken because they do not produce valid
TAP output (empty output is rejected by scripts/tap-driver.pl).

Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/crypto-tls-psk-helpers.c   |  6 ------
 tests/unit/crypto-tls-psk-helpers.h   |  4 ----
 tests/unit/crypto-tls-x509-helpers.c  |  4 ----
 tests/unit/crypto-tls-x509-helpers.h  | 11 +----------
 tests/unit/pkix_asn1_tab.c            |  3 ---
 tests/unit/test-crypto-tlscredsx509.c | 12 ------------
 tests/unit/test-crypto-tlssession.c   | 12 ------------
 tests/unit/test-io-channel-tls.c      | 12 ------------
 8 files changed, 1 insertion(+), 63 deletions(-)

diff --git a/tests/unit/crypto-tls-psk-helpers.c b/tests/unit/crypto-tls-psk-helpers.c
index a8395477c3..7f8a488961 100644
--- a/tests/unit/crypto-tls-psk-helpers.c
+++ b/tests/unit/crypto-tls-psk-helpers.c
@@ -20,14 +20,10 @@
 
 #include "qemu/osdep.h"
 
-/* Include this first because it defines QCRYPTO_HAVE_TLS_TEST_SUPPORT */
 #include "crypto-tls-x509-helpers.h"
-
 #include "crypto-tls-psk-helpers.h"
 #include "qemu/sockets.h"
 
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-
 void test_tls_psk_init(const char *pskfile)
 {
     FILE *fp;
@@ -46,5 +42,3 @@ void test_tls_psk_cleanup(const char *pskfile)
 {
     unlink(pskfile);
 }
-
-#endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
diff --git a/tests/unit/crypto-tls-psk-helpers.h b/tests/unit/crypto-tls-psk-helpers.h
index 5aa9951cb6..faa645c629 100644
--- a/tests/unit/crypto-tls-psk-helpers.h
+++ b/tests/unit/crypto-tls-psk-helpers.h
@@ -23,11 +23,7 @@
 
 #include <gnutls/gnutls.h>
 
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-
 void test_tls_psk_init(const char *keyfile);
 void test_tls_psk_cleanup(const char *keyfile);
 
-#endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
-
 #endif
diff --git a/tests/unit/crypto-tls-x509-helpers.c b/tests/unit/crypto-tls-x509-helpers.c
index 97658592a2..fc609b3fd4 100644
--- a/tests/unit/crypto-tls-x509-helpers.c
+++ b/tests/unit/crypto-tls-x509-helpers.c
@@ -24,8 +24,6 @@
 #include "crypto/init.h"
 #include "qemu/sockets.h"
 
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-
 /*
  * This stores some static data that is needed when
  * encoding extensions in the x509 certs
@@ -504,5 +502,3 @@ void test_tls_discard_cert(QCryptoTLSTestCertReq *req)
         unlink(req->filename);
     }
 }
-
-#endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
diff --git a/tests/unit/crypto-tls-x509-helpers.h b/tests/unit/crypto-tls-x509-helpers.h
index 8fcd7785ab..cf6329e653 100644
--- a/tests/unit/crypto-tls-x509-helpers.h
+++ b/tests/unit/crypto-tls-x509-helpers.h
@@ -23,14 +23,7 @@
 
 #include <gnutls/gnutls.h>
 #include <gnutls/x509.h>
-
-#if !(defined WIN32) && \
-    defined(CONFIG_TASN1)
-# define QCRYPTO_HAVE_TLS_TEST_SUPPORT
-#endif
-
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-# include <libtasn1.h>
+#include <libtasn1.h>
 
 
 /*
@@ -127,6 +120,4 @@ void test_tls_cleanup(const char *keyfile);
 
 extern const asn1_static_node pkix_asn1_tab[];
 
-#endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
-
 #endif
diff --git a/tests/unit/pkix_asn1_tab.c b/tests/unit/pkix_asn1_tab.c
index 15397cf77a..89521408a1 100644
--- a/tests/unit/pkix_asn1_tab.c
+++ b/tests/unit/pkix_asn1_tab.c
@@ -6,8 +6,6 @@
 #include "qemu/osdep.h"
 #include "crypto-tls-x509-helpers.h"
 
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-
 const asn1_static_node pkix_asn1_tab[] = {
   {"PKIX1", 536875024, 0},
   {0, 1073741836, 0},
@@ -1105,4 +1103,3 @@ const asn1_static_node pkix_asn1_tab[] = {
   {0, 1048586, "2"},
   {0, 0, 0}
 };
-#endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto-tlscredsx509.c
index f487349c32..aab4149b56 100644
--- a/tests/unit/test-crypto-tlscredsx509.c
+++ b/tests/unit/test-crypto-tlscredsx509.c
@@ -25,8 +25,6 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-
 #define WORKDIR "tests/test-crypto-tlscredsx509-work/"
 #define KEYFILE WORKDIR "key-ctx.pem"
 
@@ -706,13 +704,3 @@ int main(int argc, char **argv)
 
     return ret == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
 }
-
-#else /* ! QCRYPTO_HAVE_TLS_TEST_SUPPORT */
-
-int
-main(void)
-{
-    return EXIT_SUCCESS;
-}
-
-#endif /* ! QCRYPTO_HAVE_TLS_TEST_SUPPORT */
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
index 8b2453fa79..5f0da9192c 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -31,8 +31,6 @@
 #include "qemu/sockets.h"
 #include "authz/list.h"
 
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-
 #define WORKDIR "tests/test-crypto-tlssession-work/"
 #define PSKFILE WORKDIR "keys.psk"
 #define KEYFILE WORKDIR "key-ctx.pem"
@@ -648,13 +646,3 @@ int main(int argc, char **argv)
 
     return ret == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
 }
-
-#else /* ! QCRYPTO_HAVE_TLS_TEST_SUPPORT */
-
-int
-main(void)
-{
-    return EXIT_SUCCESS;
-}
-
-#endif /* ! QCRYPTO_HAVE_TLS_TEST_SUPPORT */
diff --git a/tests/unit/test-io-channel-tls.c b/tests/unit/test-io-channel-tls.c
index ad7554c534..f6fb988c01 100644
--- a/tests/unit/test-io-channel-tls.c
+++ b/tests/unit/test-io-channel-tls.c
@@ -34,8 +34,6 @@
 #include "authz/list.h"
 #include "qom/object_interfaces.h"
 
-#ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
-
 #define WORKDIR "tests/test-io-channel-tls-work/"
 #define KEYFILE WORKDIR "key-ctx.pem"
 
@@ -334,13 +332,3 @@ int main(int argc, char **argv)
 
     return ret == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
 }
-
-#else /* ! QCRYPTO_HAVE_TLS_TEST_SUPPORT */
-
-int
-main(void)
-{
-    return EXIT_SUCCESS;
-}
-
-#endif /* ! QCRYPTO_HAVE_TLS_TEST_SUPPORT */
-- 
2.31.1



