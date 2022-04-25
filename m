Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919950ED10
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:57:43 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8aM-0005kJ-9t
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8Ie-0007nG-3t
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8Ia-0007ml-RQ
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbdXbPV/yHeCCxJoGKJzal9ZTZudP9VhG+RawmxDOkM=;
 b=GuySpFm7mN6upGsrF1WaIFQ+qead9Dg5H/cgmJjZuCZmR53qK0oDwj3mh2gK9lEJP/qzKD
 AucWz/ZoEoBWPJfEAWGxu+qjClrA92EhJNc82d9Ro2um0gCnwOPmhj+vONKBwFzwgx7XFC
 K8s1fuYQJCzuWxLyL1+lskMe3ctr6o8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-Vzrp2tvxPSamAaUy5bqhDg-1; Mon, 25 Apr 2022 19:39:15 -0400
X-MC-Unique: Vzrp2tvxPSamAaUy5bqhDg-1
Received: by mail-il1-f198.google.com with SMTP id
 o17-20020a92c691000000b002c2c04aebe7so6917415ilg.8
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbdXbPV/yHeCCxJoGKJzal9ZTZudP9VhG+RawmxDOkM=;
 b=vBzYd8jRnYSgWBY3HKFyDMQ12wjcwx2aPxafm1+lfAicPlBKl3NSH3cZNOpWX+cmbK
 XXJS+J5GupkBcyTlnphoob8j4eQ7hED7DhWLsuRxhSsmtGVDG+N3a6ped8Xs0wEoqodC
 f4gciKen6LSNOXa02odnWEIzDC1Iqs+5y+Ko+47JeeOybOy+6Q6v486nBILsOgh9ndXp
 C9A1vWQS5mMYERzzNBAlxqooYJa5MLlQFP2q002hvKG7Y0AzCBpURvdnOu5xyDD1pSxV
 2YtlRfqPc/idAeLrMinqm4d6FsvYXxizukI8UqL+Y8FcYhjuWOLe/lpkKDzo8AvMrqBs
 7WSw==
X-Gm-Message-State: AOAM531A38yr6OI3qQyCqrcZa5eqNm9gt0V2SVHdHR1k9xpOcIuy0MTx
 x7L4QGomEbrWevASmdJ/BJLsB4P/R0yjaOkyu3QGIgoMrM39mC1TgFseeLVZWjXz8XIH7ixDVFg
 VIuknOuD0HUYywnXwHoLeylfHXnqsij/FhxuqIyRHBtGmxBgIz9Dug24Iy8/mOvzj
X-Received: by 2002:a92:c548:0:b0:2cc:47f1:815 with SMTP id
 a8-20020a92c548000000b002cc47f10815mr7892929ilj.257.1650929954384; 
 Mon, 25 Apr 2022 16:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoCMMULNLVsVMgTdFSqqy/0zuibb91VTKZ4d/s4OGMpQ4cE7yaxccsxl6cDfNBXe14qO8bGg==
X-Received: by 2002:a92:c548:0:b0:2cc:47f1:815 with SMTP id
 a8-20020a92c548000000b002cc47f10815mr7892912ilj.257.1650929954093; 
 Mon, 25 Apr 2022 16:39:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:13 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/21] tests: Add postcopy preempt tests
Date: Mon, 25 Apr 2022 19:38:47 -0400
Message-Id: <20220425233847.10393-22-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Four tests are added for preempt mode:

  - Postcopy plain
  - Postcopy recovery
  - Postcopy tls
  - Postcopy tls+recovery

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cbcf3f73a4..af8d33c898 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -477,6 +477,7 @@ typedef struct {
      */
     bool hide_stderr;
     bool use_shmem;
+    bool postcopy_preempt;
     /* only launch the target process */
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
@@ -992,6 +993,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
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
@@ -1058,6 +1064,25 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
+static void test_postcopy_preempt(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_preempt_tls_psk(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_recovery_common(MigrateStart *args)
 {
     QTestState *from, *to;
@@ -1134,6 +1159,24 @@ static void test_postcopy_recovery_tls_psk(void)
     test_postcopy_recovery_common(&args);
 }
 
+static void test_postcopy_preempt_recovery(void)
+{
+    MigrateStart args = { .postcopy_preempt = true };
+
+    test_postcopy_recovery_common(&args);
+}
+
+/* This contains preempt+recovery+tls test altogether */
+static void test_postcopy_preempt_all(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 static void test_baddest(void)
 {
     MigrateStart args = {
@@ -2189,6 +2232,17 @@ int main(int argc, char **argv)
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


