Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC3C556D5D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 23:07:13 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47ZA-0005kv-Pj
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 17:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47Ig-0003j5-8w
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47Ic-0004Yq-DG
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655931005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDVtEAf56hWf4TfRonUyS00+OOL1oT15cA/jh97mNdc=;
 b=V3EYPtblj41Zp7veB8U5bZx2CKILF3LQllJqyU6iJbKSgtVnboKr71n1vYnAVbd15pi15P
 PL8ccNNTGXNOydKSM+z2TRDcg6rLpChA6xk/V1AFKNtUVjbhnig80pcvsl+8LO1RWHnpvU
 tC2/U5DURIUhB/u0gI3mBT7qSeRVWAY=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-SxhfEcZTNXemabrOnhP8QA-1; Wed, 22 Jun 2022 16:50:01 -0400
X-MC-Unique: SxhfEcZTNXemabrOnhP8QA-1
Received: by mail-il1-f197.google.com with SMTP id
 l2-20020a056e0212e200b002d9258029c4so4254570iln.22
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDVtEAf56hWf4TfRonUyS00+OOL1oT15cA/jh97mNdc=;
 b=xoK1UdBZIjuiteZYWnPxfZyAMQUffxsDA9BDy+itxLbQiIJIR5w7MuFOYBCXSE89X3
 TSozU0nibmsYHauDanlw7TeJPfH/PShkd80Ut5sPRemTp9tFz8O5boQ24bdZs+oj1JyF
 NcMwU04ItDcut4UEHlzZG9BnNEzN/2Zo7/PzPSASUs47qUJ7eRQAf7FsrDUuHHfVyyJE
 JbQpcW9GUSQ9q7oAOV9l3PhnX8c8djHf9OB4j6LM8uMZCp9/OXI9x7wDzPrDEV84uAC8
 mr2pdLT4ESqlsDcQKBNoh53WJTipz1zW3UVo4lnq39SK1p3ltvh/A95nT4B98SD14aVh
 YoXg==
X-Gm-Message-State: AJIora+HF2z+PEb6QEICW2g0dO6Md0bftVUmjEmtNdCfRUopPDabePq9
 VkdUeK4Q9a1GHfOkHoZMC/qjqIUFnqtQcVJLCzmmPNEG1lqzEuU0BWp9VeWKiOcSOCoF4QqztVb
 zNnLd8+ahLhZgo7nx/HCVyx7SLdIPpmImcN50bxTB3vN6bLbzq0wdGP9d2ahBPEI5
X-Received: by 2002:a05:6638:4889:b0:331:b103:a74c with SMTP id
 ct9-20020a056638488900b00331b103a74cmr3508590jab.66.1655931000692; 
 Wed, 22 Jun 2022 13:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzo+/iXQu1KGUK0VJ3gWzyXXKSRjZuhLpqIkwNsE9r5c/WWjWiiMC+i7fJfzA/sVbdFo9wRg==
X-Received: by 2002:a05:6638:4889:b0:331:b103:a74c with SMTP id
 ct9-20020a056638488900b00331b103a74cmr3508571jab.66.1655931000474; 
 Wed, 22 Jun 2022 13:50:00 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 14/15] tests: Add postcopy tls recovery migration test
Date: Wed, 22 Jun 2022 16:49:19 -0400
Message-Id: <20220622204920.79061-15-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
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

It's easy to build this upon the postcopy tls test.  Rename the old
postcopy recovery test to postcopy/recovery/plain.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 38 +++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5ca43ba6a0..00b7b7072c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1137,17 +1137,15 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_recovery_common(MigrateCommon *args)
 {
-    MigrateCommon args = {
-        .start = {
-            .hide_stderr = true,
-        },
-    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    /* Always hide errors for postcopy recover tests since they're expected */
+    args->start.hide_stderr = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
 
@@ -1198,7 +1196,24 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to, &args);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy_recovery(void)
+{
+    MigrateCommon args = { };
+
+    test_postcopy_recovery_common(&args);
+}
+
+static void test_postcopy_recovery_tls_psk(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2426,7 +2441,12 @@ int main(int argc, char **argv)
      */
     qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
 #endif /* CONFIG_GNUTLS */
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/recovery/plain",
+                   test_postcopy_recovery);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                   test_postcopy_recovery_tls_psk);
+#endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


