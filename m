Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5D533379
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:26:43 +0200 (CEST)
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntczC-0005TF-H5
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclJ-0001YP-ON
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclH-0005iM-Om
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pl9/y1Ms5HKaK2fRTpzr83bTjAdGrZFDHRalNXpPH5o=;
 b=dnvV/5kRg83HFPY1YpHNrrd4ocyPqsQK8Xzg4QTMyJb6WyusD3MpynUV7s0WMTJkqbhNlG
 Qj2npkaFrRxcr3EtxTGreL0wVIqgM09WrDs5KX/+2dFH4yec2ncOHaPlTe0EAnh+2RzrTm
 iQJdq2LCf0EqCX1FFu0L0GXZHfsEFTo=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-BipL9PqHPryM7E6oYaOzbA-1; Tue, 24 May 2022 18:12:17 -0400
X-MC-Unique: BipL9PqHPryM7E6oYaOzbA-1
Received: by mail-il1-f198.google.com with SMTP id
 p12-20020a056e02144c00b002d196a4d73eso5613013ilo.18
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pl9/y1Ms5HKaK2fRTpzr83bTjAdGrZFDHRalNXpPH5o=;
 b=F7l78U43hWAH2nhgGb68q5FAsEnM3jGuwHIIXpcfXmTfK7f/MJqgZyDU/vQtReuVCm
 U55S8YRnA9R66ZjCLmF/PLCdG1eLzok1RDKYNflcMbC5oY4KWInTW4T0kgHLReNv3iyH
 jdNsSOBEnVLS63UCT/NcpSPCoVs9C9P57G5fmvEtVBKMuBUsjnfdqUV9AAXD2d3Ne+cE
 n1D0+M5TRBvsyAnsqcbs9p4/T6LnI0H3wih2D4t4nlMrAEd8WImVzRnM9wLiiiFxRrvU
 Kpw6/3e2P4/K0nviDhgj7wYvzK/zWNvEu+cqD1AU0KgcT05vQWn1jwKK6ugfJbVEoQN1
 6Uvg==
X-Gm-Message-State: AOAM531GzL5hBiySJYjIzdmc+1VyzPUMq13ZffDnIrAe3D6upfCZ0qQW
 Ox43o80Yud+Oj/slxyvjGpEx+B9rkHWBmw0YQRU3Xh8pfIWV9oibNUGEqF3tPBfmKqFegaDKx2L
 UOqFfCGOSdZjLb6r7HbyPX5AB/VD+zofjmMcgb0pj6C6zFMZW4K7H1aKXr81lvpDv
X-Received: by 2002:a05:6e02:b27:b0:2d1:ceb0:9b99 with SMTP id
 e7-20020a056e020b2700b002d1ceb09b99mr2132452ilu.180.1653430336799; 
 Tue, 24 May 2022 15:12:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy6GXRtYETR+aqZXZahu0rdMcMr451AuhViT9F/LFcsCz7YnCKwviKrMC0JQoKsALCsYRtNw==
X-Received: by 2002:a05:6e02:b27:b0:2d1:ceb0:9b99 with SMTP id
 e7-20020a056e020b2700b002d1ceb09b99mr2132437ilu.180.1653430336517; 
 Tue, 24 May 2022 15:12:16 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 14/14] tests: Add postcopy preempt tests
Date: Tue, 24 May 2022 18:11:51 -0400
Message-Id: <20220524221151.18225-15-peterx@redhat.com>
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

Four tests are added for preempt mode:

  - Postcopy plain
  - Postcopy recovery
  - Postcopy tls
  - Postcopy tls+recovery

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 12f1e3a751..ca2082a7d9 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -558,6 +558,7 @@ typedef struct {
 
     /* Postcopy specific fields */
     void *postcopy_data;
+    bool postcopy_preempt;
 } MigrateCommon;
 
 static int test_migrate_start(QTestState **from, QTestState **to,
@@ -1063,6 +1064,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
+    if (args->postcopy_preempt) {
+        migrate_set_capability(from, "postcopy-preempt", true);
+        migrate_set_capability(to, "postcopy-preempt", true);
+    }
+
     /* We want to pick a speed slow enough that the test completes
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
@@ -1131,6 +1137,26 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
+static void test_postcopy_preempt(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_preempt_tls_psk(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_recovery_common(MigrateCommon *args)
 {
     QTestState *from, *to;
@@ -1210,6 +1236,27 @@ static void test_postcopy_recovery_tls_psk(void)
     test_postcopy_recovery_common(&args);
 }
 
+static void test_postcopy_preempt_recovery(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
+/* This contains preempt+recovery+tls test altogether */
+static void test_postcopy_preempt_all(void)
+{
+    MigrateCommon args = {
+        .postcopy_preempt = true,
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 static void test_baddest(void)
 {
     MigrateStart args = {
@@ -2194,6 +2241,17 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/recovery/tls/psk",
                    test_postcopy_recovery_tls_psk);
 #endif /* CONFIG_GNUTLS */
+
+    qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
+    qtest_add_func("/migration/postcopy/preempt/recovery/plain",
+                   test_postcopy_preempt_recovery);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/postcopy/preempt/tls/psk",
+                   test_postcopy_preempt_tls_psk);
+    qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
+                   test_postcopy_preempt_all);
+#endif /* CONFIG_GNUTLS */
+
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


