Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70153336A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:19:46 +0200 (CEST)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcsS-00033U-Tr
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclF-0001Ir-0r
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclD-0005hX-87
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAI5HKUZ9fd2+726rphB9Xdw85S1moNxdqKZ6262wWY=;
 b=VhUwZIpwp2PDYZN+byxiwJPt0iSonFzmvEzPqX0XYWYmoezIe5+3w1EL64H24+RsCQF3LT
 SvN/2y+07gfJWkd7/FqufJNRLhPgLgibxNmp+P/NfQmtojnn1V3nemxaCiaVs0cebAPdlZ
 /TLbH6VrgS7oisOe9dZKtk/64q+Yyf8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-hM4bIahGMQyIFp5ypVvOeQ-1; Tue, 24 May 2022 18:12:13 -0400
X-MC-Unique: hM4bIahGMQyIFp5ypVvOeQ-1
Received: by mail-il1-f199.google.com with SMTP id
 x1-20020a056e020f0100b002c98fce9c13so11588877ilj.3
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAI5HKUZ9fd2+726rphB9Xdw85S1moNxdqKZ6262wWY=;
 b=R0JTiG4O724NLqqc2SJj/5WEv8GcbkzPeY6fSSHpG0idbXZvtwQrabe1b3d2Eb4p4v
 DUQjVI4zaqH7g7Nv0M2+CdePZgnFRngP7qP9ssvZbMWI0tGHbOa1p/Ur+Lzqjvo0NJ3q
 bMS9GB/y2iL2YCoPCTbVepENc/LSJOkq52zILhwduO4jlCIs1bYtF/pPkvi16eYR9RYr
 6LXCXVSfIVhzzvsHAHuNe11HUgRtbVGV1vnNrMrVGpRZ98GrUXhGnNwqEF5hRPIAeJlU
 Se/mQjfME+wp/4uBNBWBcAAMAXG9KqYWJFQuxypY6hlYkN4KmCXSRkDkPC+/hJ+BA1rN
 81LA==
X-Gm-Message-State: AOAM531zw1RvA3IzrrLyUJX78cPzb90eQbiRRY655eU/gBVxsGAUlUQg
 t7WDvDIy2XLihQiDQcheW8H4xxt19SzjUhft9JysNiOeLzAbMJYcHY5lai6603wwIvTkoPB3l37
 oVPzoylbGnsKA2skh1xStMtlrQmDJnHKcP+F6IKO5h3fD8M2Sq+QNXvDpHIpU6xFK
X-Received: by 2002:a05:6638:1a9a:b0:32e:be42:29ad with SMTP id
 ce26-20020a0566381a9a00b0032ebe4229admr7142037jab.110.1653430332461; 
 Tue, 24 May 2022 15:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAE1mPIjxDnz+HOsrEczBDBSIU1kY1cj91a79DgjJGSXHwqfPo3dqI0J52ct+MRzg2oJrT4w==
X-Received: by 2002:a05:6638:1a9a:b0:32e:be42:29ad with SMTP id
 ce26-20020a0566381a9a00b0032ebe4229admr7142019jab.110.1653430332111; 
 Tue, 24 May 2022 15:12:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:11 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 11/14] tests: Move MigrateCommon upper
Date: Tue, 24 May 2022 18:11:48 -0400
Message-Id: <20220524221151.18225-12-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

So that it can be used in postcopy tests too soon.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 144 +++++++++++++++++------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d33e8060f9..cb53846114 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -485,6 +485,78 @@ typedef struct {
     const char *opts_target;
 } MigrateStart;
 
+/*
+ * A hook that runs after the src and dst QEMUs have been
+ * created, but before the migration is started. This can
+ * be used to set migration parameters and capabilities.
+ *
+ * Returns: NULL, or a pointer to opaque state to be
+ *          later passed to the TestMigrateFinishHook
+ */
+typedef void * (*TestMigrateStartHook)(QTestState *from,
+                                       QTestState *to);
+
+/*
+ * A hook that runs after the migration has finished,
+ * regardless of whether it succeeded or failed, but
+ * before QEMU has terminated (unless it self-terminated
+ * due to migration error)
+ *
+ * @opaque is a pointer to state previously returned
+ * by the TestMigrateStartHook if any, or NULL.
+ */
+typedef void (*TestMigrateFinishHook)(QTestState *from,
+                                      QTestState *to,
+                                      void *opaque);
+
+typedef struct {
+    /* Optional: fine tune start parameters */
+    MigrateStart start;
+
+    /* Required: the URI for the dst QEMU to listen on */
+    const char *listen_uri;
+
+    /*
+     * Optional: the URI for the src QEMU to connect to
+     * If NULL, then it will query the dst QEMU for its actual
+     * listening address and use that as the connect address.
+     * This allows for dynamically picking a free TCP port.
+     */
+    const char *connect_uri;
+
+    /* Optional: callback to run at start to set migration parameters */
+    TestMigrateStartHook start_hook;
+    /* Optional: callback to run at finish to cleanup */
+    TestMigrateFinishHook finish_hook;
+
+    /*
+     * Optional: normally we expect the migration process to complete.
+     *
+     * There can be a variety of reasons and stages in which failure
+     * can happen during tests.
+     *
+     * If a failure is expected to happen at time of establishing
+     * the connection, then MIG_TEST_FAIL will indicate that the dst
+     * QEMU is expected to stay running and accept future migration
+     * connections.
+     *
+     * If a failure is expected to happen while processing the
+     * migration stream, then MIG_TEST_FAIL_DEST_QUIT_ERR will indicate
+     * that the dst QEMU is expected to quit with non-zero exit status
+     */
+    enum {
+        /* This test should succeed, the default */
+        MIG_TEST_SUCCEED = 0,
+        /* This test should fail, dest qemu should keep alive */
+        MIG_TEST_FAIL,
+        /* This test should fail, dest qemu should fail with abnormal status */
+        MIG_TEST_FAIL_DEST_QUIT_ERR,
+    } result;
+
+    /* Optional: set number of migration passes to wait for */
+    unsigned int iterations;
+} MigrateCommon;
+
 static int test_migrate_start(QTestState **from, QTestState **to,
                               const char *uri, MigrateStart *args)
 {
@@ -1107,78 +1179,6 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
-/*
- * A hook that runs after the src and dst QEMUs have been
- * created, but before the migration is started. This can
- * be used to set migration parameters and capabilities.
- *
- * Returns: NULL, or a pointer to opaque state to be
- *          later passed to the TestMigrateFinishHook
- */
-typedef void * (*TestMigrateStartHook)(QTestState *from,
-                                       QTestState *to);
-
-/*
- * A hook that runs after the migration has finished,
- * regardless of whether it succeeded or failed, but
- * before QEMU has terminated (unless it self-terminated
- * due to migration error)
- *
- * @opaque is a pointer to state previously returned
- * by the TestMigrateStartHook if any, or NULL.
- */
-typedef void (*TestMigrateFinishHook)(QTestState *from,
-                                      QTestState *to,
-                                      void *opaque);
-
-typedef struct {
-    /* Optional: fine tune start parameters */
-    MigrateStart start;
-
-    /* Required: the URI for the dst QEMU to listen on */
-    const char *listen_uri;
-
-    /*
-     * Optional: the URI for the src QEMU to connect to
-     * If NULL, then it will query the dst QEMU for its actual
-     * listening address and use that as the connect address.
-     * This allows for dynamically picking a free TCP port.
-     */
-    const char *connect_uri;
-
-    /* Optional: callback to run at start to set migration parameters */
-    TestMigrateStartHook start_hook;
-    /* Optional: callback to run at finish to cleanup */
-    TestMigrateFinishHook finish_hook;
-
-    /*
-     * Optional: normally we expect the migration process to complete.
-     *
-     * There can be a variety of reasons and stages in which failure
-     * can happen during tests.
-     *
-     * If a failure is expected to happen at time of establishing
-     * the connection, then MIG_TEST_FAIL will indicate that the dst
-     * QEMU is expected to stay running and accept future migration
-     * connections.
-     *
-     * If a failure is expected to happen while processing the
-     * migration stream, then MIG_TEST_FAIL_DEST_QUIT_ERR will indicate
-     * that the dst QEMU is expected to quit with non-zero exit status
-     */
-    enum {
-        /* This test should succeed, the default */
-        MIG_TEST_SUCCEED = 0,
-        /* This test should fail, dest qemu should keep alive */
-        MIG_TEST_FAIL,
-        /* This test should fail, dest qemu should fail with abnormal status */
-        MIG_TEST_FAIL_DEST_QUIT_ERR,
-    } result;
-
-    /* Optional: set number of migration passes to wait for */
-    unsigned int iterations;
-} MigrateCommon;
-
 static void test_precopy_common(MigrateCommon *args)
 {
     QTestState *from, *to;
-- 
2.32.0


