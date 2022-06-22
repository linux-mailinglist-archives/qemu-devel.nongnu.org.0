Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A315555AE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 23:03:30 +0200 (CEST)
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47VZ-0001Eq-Gx
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 17:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IZ-0003WO-6O
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IX-0004MJ-AM
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655931000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfR5SHJTXqRuuIr1UoNbq78N16WQ4HXIgq4Dnd1A8jw=;
 b=YrvT+BgtbmJCPuo7kEvv2lCNjFDSJpOnBYajqzjMF52QYoPMDUaR8LBTD7e141TArE+t2z
 NMmQR8YSWebVABlwaTsR/j2Uxd/UbU6E+r/aj/haMg/0fPj8Z+sz8AMrSH4RBTBJeilA7h
 Hs/vkUaIfaN3TOBbO1WEHvIHOIEuR+U=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-3Mzm1JloOV6TwHRhcF60cg-1; Wed, 22 Jun 2022 16:49:59 -0400
X-MC-Unique: 3Mzm1JloOV6TwHRhcF60cg-1
Received: by mail-io1-f72.google.com with SMTP id
 y22-20020a056602215600b00673b11a9cd5so58475ioy.7
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SfR5SHJTXqRuuIr1UoNbq78N16WQ4HXIgq4Dnd1A8jw=;
 b=TOCerpLOtjt+X4Q6Ae0w8gsE2OyM68ZxE/aTIwUmkJsBamzA1+8DHsULwTYAuTwVih
 Bztb+VOG0v12XINhaVgZXXYxpemNAwfWI5StbpFCU6ZBAsev8wi3hTTlTwiZCgcGVRor
 SeAk624zViTwc4ikOgCwo4duRgF0pwgei9KqCnj/IBiM+H9U0xAf1YtNIaeQIhpuMLew
 TaKH4FZON6bi8SnE9ZYDgqwJB6IvULKyLm+xSFnHUgjx+K+jrufPIAtxaoQUsuPuWfY8
 fmFiDqzh4Pi2Ap+u9AUZLjyD6737LUWCE7cVqp3Tq9eWW8Ac+EkK6BRul54W0rO2QrYy
 iXDA==
X-Gm-Message-State: AJIora/sK+fxfEhjBC7d6++IdgVg4BTbO5cu9mgVg5fdYlTqGz5Xr9X5
 MepNVWZN560tswB1FWHu7DWqqI2z0RjyXtbMcUW5mD52sX4UHFNXBVOufM0D21i95Sfv0eKPFiK
 SGDbF67qb6uofIQZ4Tmp48YSODTsz70Ca+XNRuYVf/7VJugOEzWBtq/ypsKTFCuHt
X-Received: by 2002:a6b:c34d:0:b0:669:9cc4:e450 with SMTP id
 t74-20020a6bc34d000000b006699cc4e450mr2786929iof.126.1655930998781; 
 Wed, 22 Jun 2022 13:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+OCjV5ERGxyE2jsXDwthSxrA0ehfSVgyRcD4lstSpuHcymCXP0np5IK71FvW/srfRH+mXzw==
X-Received: by 2002:a6b:c34d:0:b0:669:9cc4:e450 with SMTP id
 t74-20020a6bc34d000000b006699cc4e450mr2786914iof.126.1655930998493; 
 Wed, 22 Jun 2022 13:49:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:57 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 13/15] tests: Add postcopy tls migration test
Date: Wed, 22 Jun 2022 16:49:18 -0400
Message-Id: <20220622204920.79061-14-peterx@redhat.com>
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

We just added TLS tests for precopy but not postcopy.  Add the
corresponding test for vanilla postcopy.

Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
will only use unix sockets as channel.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 61 +++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 977f820540..5ca43ba6a0 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -561,6 +561,9 @@ typedef struct {
 
     /* Optional: set number of migration passes to wait for */
     unsigned int iterations;
+
+    /* Postcopy specific fields */
+    void *postcopy_data;
 } MigrateCommon;
 
 static int test_migrate_start(QTestState **from, QTestState **to,
@@ -1049,15 +1052,19 @@ test_migrate_tls_x509_finish(QTestState *from,
 
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
@@ -2386,7 +2417,15 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
+    qtest_add_func("/migration/postcopy/plain", test_postcopy);
+#ifdef CONFIG_GNUTLS
+    /*
+     * NOTE: psk test is enough for postcopy, as other types of TLS
+     * channels are tested under precopy.  Here what we want to test is the
+     * general postcopy path that has TLS channel enabled.
+     */
+    qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
+#endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
-- 
2.32.0


