Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED63AB941
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:11:51 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltucQ-00046z-Jc
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuUk-0004Qx-5x
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:03:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuUi-0007Vg-A2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:03:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b11so4752510edy.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VArWV/JYlPRB+ITaKgwursWuWO5skwybUaAhhu6OsTQ=;
 b=Srt5OfUoh4PwBPlMk+b/NhDJa6eBv4tYl6aHd2HXQRdwKy5sn50KLRmT9YezZrUnhb
 5+eUp4GgRVwDcGYjijsxwBDgeM1q4x07ZuPtXiO4ZKSStvrUWhhpBjCp9oz9HlSDWUDn
 mvhiJfrZgpsXFT3hG5ia9WqoX8UQ6xje4dt8Ed6RfXiJLioX6iMc+rzN8pzTgaq1jUQ0
 GOy2s2TRf7je2gyKVf54kInraan0OuCl9lk+IRKdzvZCDXNzIXbQr8tM2ICFHrPd1b8v
 KdMSRsDPPBhkElJbYFBODqr5CqZNqx2HNVNebHw1MPXTh0v4qkRKEIk6ULc9+cAdGXkS
 7Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VArWV/JYlPRB+ITaKgwursWuWO5skwybUaAhhu6OsTQ=;
 b=TS8qWwNo8pG/GrccqQppo11f7ulKoRUH/0PjF7l1AZJaDMtTOl0Vx57OOB7CcISwwg
 Txxr22Vk89cWIfJL6xr53XjDRW+VBekgaP0NZhLPSdAsJ9RMeJAIQoZWtBMbmfuUfIT+
 mKkdxiqtw9t9lAva9ohLMIkeszMvI5miqwLH4/4q9xbBYSFp/nZBpuq+pb1bBMxaKAEg
 G7tukFLyOgAUuvqdcEAL/wJgPY+M46ubZ9DxjxysYmNAzh7OeAffA0lxcJ2ouP/cXQTW
 /nmo5YQBPjPCJn/SsS+KCZBY42LAzbcS32Td+J7hsnLkUTfS2a4+LfpwPlb/mG3tCRvb
 0c6w==
X-Gm-Message-State: AOAM5302825qscqiZsS4br/y+qytI5jySyZgZV9NtE3QERh1W4Cup4mX
 dp1YS4BC02qZ3fRFiWit42eZXUyiHs0=
X-Google-Smtp-Source: ABdhPJwc5zo79y3r6ZOGJy1FZZmHlbWssIxm2Gw5odWd4Eaw2HOEeOwrZrGrTwrIphuDg8qzQ98+Ow==
X-Received: by 2002:aa7:c40f:: with SMTP id j15mr7456110edq.169.1623945830524; 
 Thu, 17 Jun 2021 09:03:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z3sm4429084edb.58.2021.06.17.09.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 09:03:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: remove QCRYPTO_HAVE_TLS_TEST_SUPPORT
Date: Thu, 17 Jun 2021 18:03:49 +0200
Message-Id: <20210617160349.929577-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: berrange@redhat.com
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


