Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0856AB8F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:13:54 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Wwj-0006b8-JC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wev-0005xM-PR
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wet-0001lG-Q4
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtecWgzH7OXupLs27SiQ75Nm8BIzOYW6ZPbGjQf2aXE=;
 b=jNRQfmke6Ahv+2bxYynrmKaemUOWOcHHRM4EAttzCP/Nix9qmxlE8N1ghhcUroEOZjc3ks
 SHS5w97s7R1Bl0q5ZIEg1xJXpiufCl4iq+G8gvtKtZvZsxihclFHcLV+hnwtAUdDElo9OI
 jhEgpPcstGRuGV/A256XuhvnC7wroAM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-cPPqjYJwN-eVD4BvrSN5xg-1; Thu, 07 Jul 2022 14:55:26 -0400
X-MC-Unique: cPPqjYJwN-eVD4BvrSN5xg-1
Received: by mail-qt1-f199.google.com with SMTP id
 o17-20020ac84291000000b003170097ad3bso16240399qtl.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtecWgzH7OXupLs27SiQ75Nm8BIzOYW6ZPbGjQf2aXE=;
 b=1VaWGEsq6RWIsJiLkVgdOx+shJeo2zkGULUivXDKBvPy1TQ1hmvOZ3ZYmPZfALU9dX
 Vn+csYjNusIQU4jUxRhdKHJesRMZmdmfUW/xVE9oxpST5oA21qPNQCQ/yHuhZspXdyQ+
 12ATGja2kxVbEOeLvtCEheg39JS/fU3MzpQ5rWD4Ilt5rCEdqQcckIFJBgjYTyJcmkp8
 mDpTdVStUZSj+duFrzXfxySnBSGiyO0Wwmg3yAqePgsPJ8Wwhy6PTNlvheZnZ94iuaQV
 dPc3d/peB3W1ZggKi1X9oHR0VdBd3tNp6zKmyxyMy9c3RuYfp2wNWJIHAIT23ZjYf4r2
 Bo4Q==
X-Gm-Message-State: AJIora/j8V8UzDnR/Pxu0Y5jhKjaax58dtz3Fiwm/bOT0z64eF+ZfivC
 62IrBveiIGDzAmviMnELDFPGpnMw/4MjgLNh8r5+C7qZv9JAthvAyU+zB9bWr6RElzKj8ccw0ab
 6vdzcKW3xMX2EgLa0JO+O4t6A66cenQCIkYGX+okUDuCRNqhs8YUutMbz2AX9GtaY
X-Received: by 2002:ae9:c213:0:b0:6b2:7945:ec85 with SMTP id
 j19-20020ae9c213000000b006b27945ec85mr19454027qkg.543.1657220125381; 
 Thu, 07 Jul 2022 11:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfI8xv26Ck0VdgTMRSc0LuAQICNsSl1doeoqfvUxwK/NTZLyCyRgl58Qp0zY2jliATy8ihYQ==
X-Received: by 2002:ae9:c213:0:b0:6b2:7945:ec85 with SMTP id
 j19-20020ae9c213000000b006b27945ec85mr19453999qkg.543.1657220125013; 
 Thu, 07 Jul 2022 11:55:25 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 a13-20020ac8610d000000b0031e9b496cd4sm1480062qtm.11.2022.07.07.11.55.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:24 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 11/14] tests: Move MigrateCommon upper
Date: Thu,  7 Jul 2022 14:55:22 -0400
Message-Id: <20220707185522.27638-1-peterx@redhat.com>
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

So that it can be used in postcopy tests too soon.

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 144 +++++++++++++++++------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 55acf9612c..f15a7517b1 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -496,6 +496,78 @@ typedef struct {
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
@@ -1113,78 +1185,6 @@ static void test_baddest(void)
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


