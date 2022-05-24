Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CF533378
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:25:57 +0200 (CEST)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcyT-0004VH-0w
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclR-0001l9-OA
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclE-0005hk-Dx
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2E2ZItpWEbIbOH5jj5Vjs7pI3E5ACdf4t0sMUXPZmnI=;
 b=Vhog5IZOu/nNRWBntN0voryGsix/2VCLS9cEXsx7aA9SIy3DSUDIe/gfoBXnSon94o5eyV
 6y55NBqdsUQIqRlUVIVGOp/Qk9rNGH9MZCeTMXi5xF8M/KErL5xkEASv6fPio2U2kaWNRy
 oiRasOXfSyhVNRLXmg/6COkY8Q/3Jik=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-ciSIgTANMDGuqMUSsv5vCA-1; Tue, 24 May 2022 18:12:14 -0400
X-MC-Unique: ciSIgTANMDGuqMUSsv5vCA-1
Received: by mail-io1-f69.google.com with SMTP id
 r10-20020a5edb4a000000b006656e9a2603so3275827iop.6
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2E2ZItpWEbIbOH5jj5Vjs7pI3E5ACdf4t0sMUXPZmnI=;
 b=4+bKaz7vj4ijyw1ZL3/rixFHSyWrzkunYTmKwfFK/tzwQtmlcCOjsUD+SeFdjbGiru
 irbL2OXCLLSwqiLLyAZD7ZazKhGHZdnzNTbfmXaAAs97j2I40yfNsxIGAbr6zfk2e7I9
 dfRyFeXLLWjmNLt9ejVCPBdpvKsY733rlsBICrmGccUvcVcPAFtQb4IaKNz4at1wiBsy
 peawWO2OrnHZmT1qw2MpcsfxlaOq7H9JqMcCYhrc9Mg2gTZowA7Rgpxsgv1Qxc7CdSeN
 feNrHh7kkhZLKQko/RVOf//0Wq1WrJ8Pmx1QJKMIE3K4ETd3dAdj3x+sBSDY/J+ntsMh
 nW7w==
X-Gm-Message-State: AOAM530g42zUnJzq3vyuiGljKCwNIUznC6s78IcfQkvA/qpac73j1dk0
 d8zG4bA7iu5vT3EZCAC7Ru8bzIasW1d1NyUw4qIn2M1RBpNx61p9WG9gSZP345DEa3P2jrccHup
 ze8DuzwnLM+nQm7GM6pZxdVZVJfqXJ6iVoIin3LZYzgiT1zA2HcJWJAsGgdjPDqrb
X-Received: by 2002:a02:270e:0:b0:32e:b615:6476 with SMTP id
 g14-20020a02270e000000b0032eb6156476mr8250952jaa.253.1653430333851; 
 Tue, 24 May 2022 15:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztne6CgTLpVKpSlBZix7vW3ShgpJQmpML3KWjnv9kVI0sdoEfBp4pk4dOSH3HOUiwfX8YTwQ==
X-Received: by 2002:a02:270e:0:b0:32e:b615:6476 with SMTP id
 g14-20020a02270e000000b0032eb6156476mr8250931jaa.253.1653430333616; 
 Tue, 24 May 2022 15:12:13 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:13 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 12/14] tests: Add postcopy tls migration test
Date: Tue, 24 May 2022 18:11:49 -0400
Message-Id: <20220524221151.18225-13-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index cb53846114..03f7bb0d96 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -555,6 +555,9 @@ typedef struct {
 
     /* Optional: set number of migration passes to wait for */
     unsigned int iterations;
+
+    /* Postcopy specific fields */
+    void *postcopy_data;
 } MigrateCommon;
 
 static int test_migrate_start(QTestState **from, QTestState **to,
@@ -1043,15 +1046,19 @@ test_migrate_tls_x509_finish(QTestState *from,
 
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
@@ -1076,7 +1083,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     return 0;
 }
 
-static void migrate_postcopy_complete(QTestState *from, QTestState *to)
+static void migrate_postcopy_complete(QTestState *from, QTestState *to,
+                                      MigrateCommon *args)
 {
     wait_for_migration_complete(from);
 
@@ -1087,25 +1095,48 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
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
@@ -1161,7 +1192,7 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, &args);
 }
 
 static void test_baddest(void)
@@ -2133,7 +2164,15 @@ int main(int argc, char **argv)
 
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


