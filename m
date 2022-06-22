Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969EA55558E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:56:46 +0200 (CEST)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47P3-0007sE-Mn
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IY-0003V7-RI
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IW-0004LA-Pj
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655931000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiLGJZdjiWL31PIzjZg5Vjjzx9c0Vy6zu6eoNiWFLEg=;
 b=gUey2OXPT3A0zfRo2WG0vlxiPkTI/pUEUFOIYBEVGTrwJFfEX2zwkTFx6FRfzu8hof502Z
 bx1l88nlcrnJpmWMjI54SQlB0kyI5VqIGpCinhw8ZIIATuEboDp1zSi4yGFmiO9ZgrH/zY
 zjjV4WiOCNRJg9lQrKVZ/DF743L3hI4=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-wJWUnocGOSC7-8zm6BWlHw-1; Wed, 22 Jun 2022 16:49:57 -0400
X-MC-Unique: wJWUnocGOSC7-8zm6BWlHw-1
Received: by mail-il1-f198.google.com with SMTP id
 s15-20020a056e02216f00b002d3d5e41565so11710131ilv.10
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IiLGJZdjiWL31PIzjZg5Vjjzx9c0Vy6zu6eoNiWFLEg=;
 b=B3rwCM+SgyqNAeEltdBBRcbNPWb9/mv5hYHkvy3iNJ3NDdG87Qvv/+8HNGwRILoNSW
 CT2+QrqaoECSt7czAvz9C1WH9rSrhBH0Tx8fmfGNDS8MNRkJpJeslIck/Hsydd/kogBi
 XEyeZVTuyTWbymIG8CHzseR9ueZTB/o2ZAKulna74XVRfqZtIE5gDKQXfItHyFEm//kD
 1AcUDbZdXb4gM9v2lZS4zL4xibNvsejV9LC6eBYKSUfI9x/K0RaeDtoq2S4aPvJKiUA3
 +6mxtZwHEIjoh77n5bj1qneZydPOtAE/+e1C+XeBUZ+OaYLRICkaVRbY3jrZNSVj8bhE
 awkA==
X-Gm-Message-State: AJIora/ILxlFbrEIw65/Ek4CWxW1hmruWi8mnrMGYv6woc3fJKDr/MPZ
 q0R1+mlW4KrngM7PZW0gdjlza7aWrEw8aP7UspJ26VxYjJtCHlaIHPruvxhBfc4/oca5RNC6LvM
 NLc1Z6+iLIZS5voOb4j+ecSVgBgJe8yHb5/Bvzww2v5fB69fjWIYETGFuEEChxVri
X-Received: by 2002:a05:6e02:508:b0:2d8:e729:5e3b with SMTP id
 d8-20020a056e02050800b002d8e7295e3bmr3166884ils.67.1655930996004; 
 Wed, 22 Jun 2022 13:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/lyPnM0+SQJVoi8TMIypk6WFJDGCd7PmM39wbnxjQYYQJ9sWMEsnMEA/pxktuoFGvsIfmpQ==
X-Received: by 2002:a05:6e02:508:b0:2d8:e729:5e3b with SMTP id
 d8-20020a056e02050800b002d8e7295e3bmr3166860ils.67.1655930995656; 
 Wed, 22 Jun 2022 13:49:55 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:54 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 12/15] tests: Move MigrateCommon upper
Date: Wed, 22 Jun 2022 16:49:17 -0400
Message-Id: <20220622204920.79061-13-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 144 +++++++++++++++++------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f59d31b2ef..977f820540 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -491,6 +491,78 @@ typedef struct {
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


