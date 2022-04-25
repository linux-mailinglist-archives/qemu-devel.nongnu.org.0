Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961C50ECCB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:46:08 +0200 (CEST)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8P9-0007Ui-If
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IH-0006xV-RO
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IG-0007je-6I
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Fv6RBBdjH1ilfW+mVsC6jnSqV2KdI0wkPM5+dS84Yk=;
 b=cKz7wVManjfX3D5RnBu0CxHGNJyA9sUAdjDMaa4UsM+37K3uzqYBw3siqqqI7jeWStvXl5
 nA/QdIfFFPy25ajb4y5L2tdZ4ZaCo2A8hUjOkw2YeL8+gYUCR/PDWK3Z6M/i8oLsaWhLj5
 0qI2dgFrysjinByDcssITPmfm3GgUto=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-pKCoLr8ZNHCg7jck_n4SCw-1; Mon, 25 Apr 2022 19:38:57 -0400
X-MC-Unique: pKCoLr8ZNHCg7jck_n4SCw-1
Received: by mail-io1-f69.google.com with SMTP id
 o9-20020a0566022e0900b00654b599b1eeso12490845iow.21
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Fv6RBBdjH1ilfW+mVsC6jnSqV2KdI0wkPM5+dS84Yk=;
 b=62t7ZGHGKBwrnjkQTFlB8zAtCHegI3mBzU4va3cS3T7TgobwwiSwBbjpzn4jeGe5wo
 9fAzD9gLhVHKwve4grNCQvPhxfpbMIINzkfk0+9pAyWlnnqGvPXumbccZ8inopNywS0y
 71QbuGTvukAkzeWYWCOtk4DkZ4apIHhpsZAVkI7eoeEb5lU89aipGlJ2zpO8owxfYzhu
 fWfIqGcYDrn/LbdpsimB+GlqaYQ1MT1dLdza1WhYBeHzliuh0xeCkz90mZWoJSJQ7ftS
 acrPczIw7HYrMzUAwliVtSkV8FNF9U8WG9ieqVnKOP3QN0cB+VJdM8tTPODSg9Fp8kTk
 tS9A==
X-Gm-Message-State: AOAM5335mGj7gfFPVAZsLjDzwDsvd4zmNYxgCvT1irbbTYR6rNkFWyFr
 mjsT8UgrnHrp2ILRuYkUXG0mkpPP/BX6PpiDJwuQ/ffuBjCJm29+ceqJx36SrfO3RHDDluB9HwG
 KXUzx2MabMdu30gOMDh0DXY1ITu2Nrc/RkMr+0pAZi4Gf+lNDiDgs1DJjfvDF6yox
X-Received: by 2002:a05:6e02:20c8:b0:2cd:95fd:7336 with SMTP id
 8-20020a056e0220c800b002cd95fd7336mr3174636ilq.261.1650929936904; 
 Mon, 25 Apr 2022 16:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxtUMh3oeyNptP3NsLTRI8Pig5lOB63Km6adCL15GOmfcJBkYp1mbu8/QzyCjKfBHwP2jkFw==
X-Received: by 2002:a05:6e02:20c8:b0:2cd:95fd:7336 with SMTP id
 8-20020a056e0220c800b002cd95fd7336mr3174622ilq.261.1650929936640; 
 Mon, 25 Apr 2022 16:38:56 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/21] tests: convert multifd migration tests to use common
 helper
Date: Mon, 25 Apr 2022 19:38:32 -0400
Message-Id: <20220425233847.10393-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Most of the multifd migration test logic is common with the rest of the
precopy tests, so it can use the helper without difficulty. The only
exception of the multifd cancellation test which tries to run multiple
migrations in a row.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 77 +++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 043ae94089..c1b0b3aca4 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1739,26 +1739,12 @@ static void test_migrate_auto_converge(void)
     test_migrate_end(from, to, true);
 }
 
-static void test_multifd_tcp(const char *method)
+static void *
+test_migrate_precopy_tcp_multifd_start_common(QTestState *from,
+                                              QTestState *to,
+                                              const char *method)
 {
-    MigrateStart args = {};
-    QTestState *from, *to;
     QDict *rsp;
-    g_autofree char *uri = NULL;
-
-    if (test_migrate_start(&from, &to, "defer", &args)) {
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
 
     migrate_set_parameter_int(from, "multifd-channels", 16);
     migrate_set_parameter_int(to, "multifd-channels", 16);
@@ -1774,41 +1760,58 @@ static void test_multifd_tcp(const char *method)
                            "  'arguments': { 'uri': 'tcp:127.0.0.1:0' }}");
     qobject_unref(rsp);
 
-    /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
-
-    uri = migrate_get_socket_address(to, "socket-address");
-
-    migrate_qmp(from, uri, "{}");
-
-    wait_for_migration_pass(from);
+    return NULL;
+}
 
-    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
+static void *
+test_migrate_precopy_tcp_multifd_start(QTestState *from,
+                                       QTestState *to)
+{
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+}
 
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
-    qtest_qmp_eventwait(to, "RESUME");
+static void *
+test_migrate_precopy_tcp_multifd_zlib_start(QTestState *from,
+                                            QTestState *to)
+{
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "zlib");
+}
 
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
-    test_migrate_end(from, to, true);
+#ifdef CONFIG_ZSTD
+static void *
+test_migrate_precopy_tcp_multifd_zstd_start(QTestState *from,
+                                            QTestState *to)
+{
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "zstd");
 }
+#endif /* CONFIG_ZSTD */
 
 static void test_multifd_tcp_none(void)
 {
-    test_multifd_tcp("none");
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_precopy_tcp_multifd_start,
+    };
+    test_precopy_common(&args);
 }
 
 static void test_multifd_tcp_zlib(void)
 {
-    test_multifd_tcp("zlib");
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_precopy_tcp_multifd_zlib_start,
+    };
+    test_precopy_common(&args);
 }
 
 #ifdef CONFIG_ZSTD
 static void test_multifd_tcp_zstd(void)
 {
-    test_multifd_tcp("zstd");
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_precopy_tcp_multifd_zstd_start,
+    };
+    test_precopy_common(&args);
 }
 #endif
 
-- 
2.32.0


