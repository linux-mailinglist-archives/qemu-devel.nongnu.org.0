Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA615555AF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 23:03:57 +0200 (CEST)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47Vz-0002CE-Qr
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 17:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47Ig-0003j4-7n
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47Ic-0004Z0-RZ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655931006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXinBpdPf15f9aDB0THGC3s57V6oQR+QVk5PQyvEjQE=;
 b=gIWPFBjSbQ3yuLMJLIlsJgfnmfO2sfs00rG3FZsTvQqxphMWYqAVB0q8ItkDNrCi8LXpqX
 9GwWcOQnVZWp73SGw3lHh8zlz5z9/jTivLTB0i6xK4HUCdwA52uGXHCFyy1RFWV+TvJlVM
 Kr6lPvPUbACM8SlDfJvcs/Zu/Kn61m8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-C_1cR0LaOR636tmGnA1nuA-1; Wed, 22 Jun 2022 16:50:03 -0400
X-MC-Unique: C_1cR0LaOR636tmGnA1nuA-1
Received: by mail-io1-f71.google.com with SMTP id
 206-20020a6b14d7000000b006727756373cso845890iou.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXinBpdPf15f9aDB0THGC3s57V6oQR+QVk5PQyvEjQE=;
 b=BZHa55Yk1T6o6QfGVnVk5hQGP78ayrfim2Ulf0P7GG7jJbZaT+V0XWEG65y5+GuHsT
 X9B5/Tsij+uK76W+6Mi8GkLZSc3Io9Dq6/BrHf1pFQz44QcvJLw2moA4J5c5YxlwsssN
 IKZnhFtXsU7/udaiyBn1eRfuajUMFLY53GdDMLA7TKiBfd2i39eZg7K/5Ri1+VLUqmk5
 o1knrX2QDceU/UxwsLf96n3RaxfJ1EqfRafD9qVTxUzQeRw1fuOBpTRhRZNAWeU4NxIG
 RdKuM5S/i1OfhpCRAmsRbtFG8aZBNJuadRco2SmJZEct5xbChqo7dAxig+4a2WfSIR7i
 jNNQ==
X-Gm-Message-State: AJIora/gY/WisBfgK4eiUH+Zkl8m1O0idKIosPi2DCCqYAlUmd4A8Tur
 bPPFwgbPrOLkUMnswqII31o5d4XNjjIoZJTE/AHTKqfp+kM1fULAgtyfwzEEeP92nLv6nLgkzmd
 gkwGS4GtR6zJuOuZ2o14ipu/Io0PIafgG6tcL9mCFWKaKJT4O4WQsY8FNY3AOxs53
X-Received: by 2002:a6b:b846:0:b0:669:b394:1943 with SMTP id
 i67-20020a6bb846000000b00669b3941943mr2793397iof.147.1655931002331; 
 Wed, 22 Jun 2022 13:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1CImRE0LkDcWiy6WYCgbaPb7iU6VxmQeqi2vtdwK0ra+UcX05sSJr994NpAzv/excxZ4pSA==
X-Received: by 2002:a6b:b846:0:b0:669:b394:1943 with SMTP id
 i67-20020a6bb846000000b00669b3941943mr2793375iof.147.1655931002062; 
 Wed, 22 Jun 2022 13:50:02 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.50.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:50:01 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 15/15] tests: Add postcopy preempt tests
Date: Wed, 22 Jun 2022 16:49:20 -0400
Message-Id: <20220622204920.79061-16-peterx@redhat.com>
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
index 00b7b7072c..1f2dc57d8f 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -564,6 +564,7 @@ typedef struct {
 
     /* Postcopy specific fields */
     void *postcopy_data;
+    bool postcopy_preempt;
 } MigrateCommon;
 
 static int test_migrate_start(QTestState **from, QTestState **to,
@@ -1069,6 +1070,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
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
@@ -1137,6 +1143,26 @@ static void test_postcopy_tls_psk(void)
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
@@ -1216,6 +1242,27 @@ static void test_postcopy_recovery_tls_psk(void)
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
@@ -2447,6 +2494,17 @@ int main(int argc, char **argv)
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


