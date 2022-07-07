Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3B56AB9E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:14:55 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Wxi-000823-VQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wf6-00060t-N0
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wf3-0001nj-SC
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZHwydJ2m8+ohqd7YcwCClpdlE51rkDoeWPaLNmT3Kw=;
 b=JNHg6QY3Lo40DkfeVpdxGbxftyvoxBTatLjJSjdSG/7varXEXxFNzkAvqTwsYAnRP1fmvn
 TgeZ+tvjFKkWQactB5P3whMQD2ogjP1/8lf8zKDnSxb9ZNMH7cTTP9AC3RwtFWOuQXARIf
 nd0oSCnVcjlXaYX1vuWiAt0wtxaHKWU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-FEoKrY6mOhOY5cLBRQ0_xw-1; Thu, 07 Jul 2022 14:55:28 -0400
X-MC-Unique: FEoKrY6mOhOY5cLBRQ0_xw-1
Received: by mail-qk1-f199.google.com with SMTP id
 e128-20020a376986000000b006af6adf035cso18554026qkc.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZHwydJ2m8+ohqd7YcwCClpdlE51rkDoeWPaLNmT3Kw=;
 b=qNDLhwIrLu3uXO2Q0XVnbYPEcp2dBOQvRSVdakxM8gp1ypab/wIvlYi3sxck8ZWz4R
 YcscY3FlVJpOjki9qEnDiUst6HSGAed07rv4uC2QaBYOOGAISw7f4+q3MdB4r6iTPO49
 kulgQFR498GF4411pMtjHH23kPPQqtDazxfjVU3t8+zOfvmOSC2hlFrSeWj8jUmW+uAE
 zdKHsYjp+oxtYZq8Zuawa3BnZba6cqKJD1tMTHnphA8UWYeY5wjaYz/Hsu2JWbuyH2pK
 qHkIwR3aziHGNnJLAKAduQ9kDg1sk9in7ptkn+oPT1bhPw/82kSs6nr3CrU8UkNih6TK
 uCtQ==
X-Gm-Message-State: AJIora+OPuRsfFVneAzu6sDs3lCzfLJ7K8+cS/UxYNS5zaUKt7Veb4GD
 gq1Sca8dwbI7uGw1RIK4deoHWw+e5DWnH5b3vmv0Ue7mTNUixnT1msthXzdFiym+vPWG82bJyFn
 CL4be8uoEWGiF4P8LTKKY09eVSUdNVP2Fl6UpQbY/FRZ9X2hg+eCRo2ySJMHSHsro
X-Received: by 2002:a05:622a:209:b0:31e:8253:b3c5 with SMTP id
 b9-20020a05622a020900b0031e8253b3c5mr14030121qtx.436.1657220127994; 
 Thu, 07 Jul 2022 11:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uc6jhvZz1N3/XXnOpOMxhqEXr/sab4cf6WGtFC78wMHndfJTKL6f+jqqHZO+25p57a7idytw==
X-Received: by 2002:a05:622a:209:b0:31e:8253:b3c5 with SMTP id
 b9-20020a05622a020900b0031e8253b3c5mr14030097qtx.436.1657220127636; 
 Thu, 07 Jul 2022 11:55:27 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a05620a16ac00b006a70f581243sm30481126qkj.93.2022.07.07.11.55.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:27 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 12/14] tests: Add postcopy tls migration test
Date: Thu,  7 Jul 2022 14:55:25 -0400
Message-Id: <20220707185525.27692-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
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

We just added TLS tests for precopy but not postcopy.  Add the
corresponding test for vanilla postcopy.

Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
will only use unix sockets as channel.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 61 ++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f15a7517b1..ee37ad6631 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -566,6 +566,9 @@ typedef struct {
 
     /* Optional: set number of migration passes to wait for */
     unsigned int iterations;
+
+    /* Postcopy specific fields */
+    void *postcopy_data;
 } MigrateCommon;
 
 static int test_migrate_start(QTestState **from, QTestState **to,
@@ -1054,15 +1057,19 @@ test_migrate_tls_x509_finish(QTestState *from,
 
 static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     QTestState **to_ptr,
-                                    MigrateStart *args)
+                                    MigrateCommon *args)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args->start)) {
         return -1;
     }
 
+    if (args->start_hook) {
+        args->postcopy_data = args->start_hook(from, to);
+    }
+
     migrate_set_capability(from, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
@@ -1082,7 +1089,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     return 0;
 }
 
-static void migrate_postcopy_complete(QTestState *from, QTestState *to)
+static void migrate_postcopy_complete(QTestState *from, QTestState *to,
+                                      MigrateCommon *args)
 {
     wait_for_migration_complete(from);
 
@@ -1093,25 +1101,48 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
         read_blocktime(to);
     }
 
+    if (args->finish_hook) {
+        args->finish_hook(from, to, args->postcopy_data);
+        args->postcopy_data = NULL;
+    }
+
     test_migrate_end(from, to, true);
 }
 
-static void test_postcopy(void)
+static void test_postcopy_common(MigrateCommon *args)
 {
-    MigrateStart args = {};
     QTestState *from, *to;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
     migrate_postcopy_start(from, to);
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy(void)
+{
+    MigrateCommon args = { };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_tls_psk(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_common(&args);
 }
 
 static void test_postcopy_recovery(void)
 {
-    MigrateStart args = {
-        .hide_stderr = true,
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
     };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
@@ -1167,7 +1198,7 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, &args);
 }
 
 static void test_baddest(void)
@@ -2122,6 +2153,16 @@ int main(int argc, char **argv)
     if (has_uffd) {
         qtest_add_func("/migration/postcopy/unix", test_postcopy);
         qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+        qtest_add_func("/migration/postcopy/plain", test_postcopy);
+#ifdef CONFIG_GNUTLS
+        /*
+         * NOTE: psk test is enough for postcopy, as other types of TLS
+         * channels are tested under precopy.  Here what we want to test is the
+         * general postcopy path that has TLS channel enabled.
+         */
+        qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
+#endif /* CONFIG_GNUTLS */
+        qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     }
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
-- 
2.32.0


