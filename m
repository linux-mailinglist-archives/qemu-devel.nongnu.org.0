Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923293B19DF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:26:17 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1xQ-0005RX-Ka
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m4-0003re-97
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:32 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m2-0001zq-8q
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:32 -0400
Received: by mail-ej1-x62c.google.com with SMTP id he7so3623094ejc.13
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VArWV/JYlPRB+ITaKgwursWuWO5skwybUaAhhu6OsTQ=;
 b=nK1mXZ+lIhmC4ergM+GsER2cXZJgJxYTH99CgldX/Nfv7ZzZZ+Ovqu3Ss74i0X7tqF
 Nh0V3pkoCr9kMjOFZT2KHMZEIBmqqcYq1pppYKMWxfE/+XswF6OO6Cp54OlaiaQyF2Gs
 Ho8OTDpk+d08OSIzb1zlJWEiKipD7gHGJvcJboKl5/qQfbma3H11T69LHvDD3WigJCPK
 N5buwBXYNe3oS29hQ6UmzHTeQEtwh8wTR7iucr6t96sEuJEuXg3C47P7GPi7JnLA1oju
 Os1lGykQzc2cCXAPP0O9T0h/W8i+4qMwDTImIcYR36Ze4fKywAuadr1aDsDXDMfVbBjV
 mwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VArWV/JYlPRB+ITaKgwursWuWO5skwybUaAhhu6OsTQ=;
 b=JCLtGSUXst9l/DQfxvuAaXNCkIZMhkg+fjUKzh92jp2YlMp9D2ZYjB2p1Z5ViW4a29
 gblWqi6+vjgb6N9NJ/qv+B2q0lq+JnybwDVXo3DNmhBGniZaYmNZser2NpihFiCMXQVm
 FNel6Cdq8ACJRACAeMJvrVg8wZ8FjTcXRfNCXUIdog7vrpEG4aYQ86DkvlHXyytp00Pd
 T2COyqPFB3XyD/CvYzLtxjFJHjtqBexPZAWG0vlJgrbdLR4B+4DqaRPSnmYzQ3X8LDYh
 OhoYusAZF8ODipq/xG1a3iP5TPYroACL8TjZqSTVrPxtRm59bZ8i+FStK9v8G2WNX0Hy
 Po5A==
X-Gm-Message-State: AOAM532YZQm7dSRwNznNg2N1b2BouLhEgR5O+2HF6ScTIArGNf4pQi5P
 HdJ+pvMcFh1d8w++m0UJ4fsJ7wOBjno=
X-Google-Smtp-Source: ABdhPJy47auNVr3d/9DVkaImCMhTQaz04R3VKyPu7Bq2bqR3sqSM8LqjEXvOOIuGCUrY1hrNoK0CqA==
X-Received: by 2002:a17:907:1dd9:: with SMTP id
 og25mr9540782ejc.108.1624450469027; 
 Wed, 23 Jun 2021 05:14:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] tests: remove QCRYPTO_HAVE_TLS_TEST_SUPPORT
Date: Wed, 23 Jun 2021 14:14:17 +0200
Message-Id: <20210623121424.1259496-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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



