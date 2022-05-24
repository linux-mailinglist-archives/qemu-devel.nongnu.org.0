Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2B533370
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:22:00 +0200 (CEST)
Received: from localhost ([::1]:44038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcud-0007V8-5r
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclK-0001Zv-4L
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclI-0005iT-CH
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWvtluDTHTda7i1JABdc0yC5TspBJoqki+juGdhrnBY=;
 b=VifwKrSwgaOUODifXAGIn6qSRVJM1fCGqzFTN2OXIA3SoUT8/ur+FF30PjYCjd0IwwPZTo
 dO7on8d/+UlKtekKyXweHbgC6Uk9mNrzU2Xin6ZkmURXfpHBUuZOfWl54D38AYEeZH960i
 Kg8/uLWZgrVAT39vQVrI2nSFb6sI5Z4=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-Ef48MMF4MuiYv9K1TeN-EA-1; Tue, 24 May 2022 18:12:16 -0400
X-MC-Unique: Ef48MMF4MuiYv9K1TeN-EA-1
Received: by mail-il1-f197.google.com with SMTP id
 x1-20020a056e020f0100b002c98fce9c13so11588935ilj.3
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hWvtluDTHTda7i1JABdc0yC5TspBJoqki+juGdhrnBY=;
 b=OVe6PPzkzhpZcXDg2/0H9KIb8jqJfwgaROkIzENdmD49HHHmSV2Z88WyAbgoVngpwv
 Hoz4bDl5tvw+E1FYe/NHxpKAMrbYGSxYMG9RvNnWTrdQGU9fYWl1oZNP7/DCYmgjpub7
 SIhnxUBSSBQtP85iqmtBc5+GxxUXu4XC6Ld0FDRdU4exaNYKH6MoNgWfdOAh9N9i3vKw
 QIYxwE4VV8p96JbFNEeSfFjLJpB51tWzZrbkfEcDesIei16I302pA8rpCug4oCrrotqi
 85L0vdcQQH5J7Uw8GKBxwJOnWLNigNYCufWu5FWhBtq6hTX2b04dhT+IsgxGZ6uQ6ZDD
 5qLg==
X-Gm-Message-State: AOAM532rBGdWL0ar7uJPye4ZiAmBmZ7PMABpNbrJk4iuJ5ufFxtwuNx6
 zYopBM+zD9ySCEDtWDYlXygsWlBiMhz6ApNHMg40Kpz+Twp5fcUuqqXOeNMRfTt5GJI3GXxed1m
 +JoHWwTvcfeZxbdEcKsQoYE6dd2xO/OoHnkpd4HENIrv/PxXAaR0OWlItcFOtktdG
X-Received: by 2002:a5e:991a:0:b0:65e:5155:911c with SMTP id
 t26-20020a5e991a000000b0065e5155911cmr11141579ioj.124.1653430335344; 
 Tue, 24 May 2022 15:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs6YVy4JmmZB+0q8ze2vZxqj49+82AoCSzw8MvvonmCGsgze2lsc1Q5i0+VNLWkPq3Qsm+3A==
X-Received: by 2002:a5e:991a:0:b0:65e:5155:911c with SMTP id
 t26-20020a5e991a000000b0065e5155911cmr11141565ioj.124.1653430335116; 
 Tue, 24 May 2022 15:12:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 13/14] tests: Add postcopy tls recovery migration test
Date: Tue, 24 May 2022 18:11:50 -0400
Message-Id: <20220524221151.18225-14-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

It's easy to build this upon the postcopy tls test.  Rename the old
postcopy recovery test to postcopy/recovery/plain.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 38 +++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 03f7bb0d96..12f1e3a751 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1131,17 +1131,15 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_recovery_common(MigrateCommon *args)
 {
-    MigrateCommon args = {
-        .start = {
-            .hide_stderr = true,
-        },
-    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    /* Always hide errors for postcopy recover tests since they're expected */
+    args->start.hide_stderr = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
 
@@ -1192,7 +1190,24 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to, &args);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy_recovery(void)
+{
+    MigrateCommon args = { };
+
+    test_postcopy_recovery_common(&args);
+}
+
+static void test_postcopy_recovery_tls_psk(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2173,7 +2188,12 @@ int main(int argc, char **argv)
      */
     qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
 #endif /* CONFIG_GNUTLS */
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/recovery/plain",
+                   test_postcopy_recovery);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                   test_postcopy_recovery_tls_psk);
+#endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


