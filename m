Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209050ECCA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:46:08 +0200 (CEST)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8P9-0007Tc-Iz
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IG-0006uM-H3
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IE-0007jP-8h
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWLaqbfdjriZjFTSAHj1/ZnERyPkrPEVGBxqmeZ10yU=;
 b=H/jbteG/tui3eGQ9m1zS8iloD54uZiB6t6hOn/HkfJxt1mrOhu2sMNq4fz+nEziV8898tY
 qlglDRtmHpsgn4k7iVBaPUbL3kfi/9nj4ISryNxluHFtcta2HnvbRQMGGRw6dK96qKA4oL
 d0b/kBm81YaDFXeUFDa+8RZb6bJUkZU=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-bLYNoeGvN8WFqaH70vt4Fg-1; Mon, 25 Apr 2022 19:38:56 -0400
X-MC-Unique: bLYNoeGvN8WFqaH70vt4Fg-1
Received: by mail-io1-f69.google.com with SMTP id
 b1-20020a05660214c100b006572ddc92f7so11384278iow.2
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dWLaqbfdjriZjFTSAHj1/ZnERyPkrPEVGBxqmeZ10yU=;
 b=3XTeVndIRhYtOfG8tUQ2mjkxpsFcxRmEQgSen90cvJKYi/gz/or1RgHT53Mneh9UBO
 G3A+oYFLuFxYtUVgc0/O9bj7Pl+hOdfjQtAIE3t8p+GVZ7Z0ShHtyOutZu9SAxr7okGS
 FcPxAintf68CpSnG0a7+Z4xAS/SiiJTYX3OB6TnfwKMqC1ewNzh0kpXop2Vx0Tw4BdM2
 XFqeSvgMIXrfk03WwRiR9z7tveOW9Jx4mSooT+6pkHVWJ1uwD0YmmURB+xX2RRh5USib
 2gnHpnz52XrmsDHRP0hAzb/g41GvECqXgn7hcm52hXwi9ZSNpM6+uFn9iFqC3gDzjbwL
 SW6A==
X-Gm-Message-State: AOAM533f3oWJpV+HCfa9UkC1zi5RGhwjEfFXRAM8zxToQgcgn3XdL77W
 nmd8FvBUBzmMDKUZe5PaKPwuAoA/6OOXImn9o5rv4VPv6S1i7dhaf5o8EmuH6rIp+XeN4bDeoW+
 5B1Kjg2GUbouU6qsCuft1eUroUri7vAtUQtSZF7axPcTsJ8ojwt48Ft7XWWTC4I8z
X-Received: by 2002:a05:6638:4605:b0:32a:dd1f:7e4f with SMTP id
 bw5-20020a056638460500b0032add1f7e4fmr5138157jab.217.1650929935796; 
 Mon, 25 Apr 2022 16:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytp6648Hzvue55DU7vgFoA06lTYDzoQ4+6/LPi5MqnfIbZdcnvAQB+/vPj6la1h53ga4a/rg==
X-Received: by 2002:a05:6638:4605:b0:32a:dd1f:7e4f with SMTP id
 bw5-20020a056638460500b0032add1f7e4fmr5138144jab.217.1650929935526; 
 Mon, 25 Apr 2022 16:38:55 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/21] tests: convert XBZRLE migration test to use common
 helper
Date: Mon, 25 Apr 2022 19:38:31 -0400
Message-Id: <20220425233847.10393-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Most of the XBZRLE migration test logic is common with the rest of the
precopy tests, so it can use the helper with just one small tweak.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 67 ++++++++++++++----------------------
 1 file changed, 25 insertions(+), 42 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c730697f74..043ae94089 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1174,6 +1174,9 @@ typedef struct {
         /* This test should fail, dest qemu should fail with abnormal status */
         MIG_TEST_FAIL_DEST_QUIT_ERR,
     } result;
+
+    /* Optional: set number of migration passes to wait for */
+    unsigned int iterations;
 } MigrateCommon;
 
 static void test_precopy_common(MigrateCommon *args)
@@ -1219,7 +1222,13 @@ static void test_precopy_common(MigrateCommon *args)
             qtest_set_expected_status(to, 1);
         }
     } else {
-        wait_for_migration_pass(from);
+        if (args->iterations) {
+            while (args->iterations--) {
+                wait_for_migration_pass(from);
+            }
+        } else {
+            wait_for_migration_pass(from);
+        }
 
         migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
@@ -1349,57 +1358,31 @@ static void test_ignore_shared(void)
 }
 #endif
 
-static void test_xbzrle(const char *uri)
+static void *
+test_migrate_xbzrle_start(QTestState *from,
+                          QTestState *to)
 {
-    MigrateStart args = {};
-    QTestState *from, *to;
-
-    if (test_migrate_start(&from, &to, uri, &args)) {
-        return;
-    }
-
-    /*
-     * We want to pick a speed slow enough that the test completes
-     * quickly, but that it doesn't complete precopy even on a slow
-     * machine, so also set the downtime.
-     */
-    /* 1 ms should make it not converge*/
-    migrate_set_parameter_int(from, "downtime-limit", 1);
-    /* 1GB/s */
-    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
-
     migrate_set_parameter_int(from, "xbzrle-cache-size", 33554432);
 
     migrate_set_capability(from, "xbzrle", true);
     migrate_set_capability(to, "xbzrle", true);
-    /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
 
-    migrate_qmp(from, uri, "{}");
-
-    wait_for_migration_pass(from);
-    /* Make sure we have 2 passes, so the xbzrle cache gets a workout */
-    wait_for_migration_pass(from);
-
-    /* 1000ms should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 1000);
-
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
-    qtest_qmp_eventwait(to, "RESUME");
-
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
-
-    test_migrate_end(from, to, true);
+    return NULL;
 }
 
-static void test_xbzrle_unix(void)
+static void test_precopy_unix_xbzrle(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = uri,
+
+        .start_hook = test_migrate_xbzrle_start,
 
-    test_xbzrle(uri);
+        .iterations = 2,
+    };
+
+    test_precopy_common(&args);
 }
 
 static void test_precopy_tcp_plain(void)
@@ -1993,6 +1976,7 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
+    qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
@@ -2029,7 +2013,6 @@ int main(int argc, char **argv)
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
-    qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
     qtest_add_func("/migration/validate_uuid", test_validate_uuid);
     qtest_add_func("/migration/validate_uuid_error", test_validate_uuid_error);
-- 
2.32.0


