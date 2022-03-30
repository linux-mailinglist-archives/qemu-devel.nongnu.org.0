Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FEB4ECF33
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:56:06 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgIP-0003Pu-7q
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:56:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2R-00066M-4O
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2P-0005Ic-Dl
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adScMC+H9c/2TDao3xFbYMKyXHCGuT9u1P39HtUdouo=;
 b=Pe04S1Chm4PelPKw/5L1TCE/bey1652pbbPC+lP0QaNGyVIQuMtPrH896GqFHm0XBe2OvK
 SWMq2TBEt/RbHGDEnL8ZSPz/0/qEc9HrjXvpIMcB4sAxfL0IIl9XyZTM2siYyWT8SzAZ/G
 AnWCaFjLXolRnJOhaxNADTNRfqrBG0Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-VJMves3LNTWJRgjuEaCepA-1; Wed, 30 Mar 2022 17:39:31 -0400
X-MC-Unique: VJMves3LNTWJRgjuEaCepA-1
Received: by mail-qv1-f70.google.com with SMTP id
 94-20020a0c8167000000b004411702e935so17063330qvc.7
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adScMC+H9c/2TDao3xFbYMKyXHCGuT9u1P39HtUdouo=;
 b=uF/2ABA4+FO1fnGe+50AdveQ6auWxxcSnoFc20XLrg+EZx8X8soCaTdAl9AWIYf9kN
 FcsHenV4GHApTauCcwu9dtS2dxmZsZQjzsTuy19L2YZCnU9uc2+Y3fR6w2hnQYucqNhE
 LEeOJNo+7uMahVSnZJVEfhzWi2TTdNGnMRWFOR14krUkqNJNsHuFl5I7jc2Mb2eWK2YB
 YD+DO+EBr3vWV6xjkp6f+pL1zQ3YGBU3GCro2FgbKsi85SL7HCur4zAhkSDvd05TRs7H
 guvhELmqCi5x+Llt1zZ92vFtNYlt8ruxvmaUIj92EvnLusTUZYSOW7eOiWZojOjMDr9X
 bsFA==
X-Gm-Message-State: AOAM5336d6Janj9jYE9SpQa8oxssHXJtFFLOp07SKiGTJ+d3bLmXyVeq
 FtVXcobCZk6Os+fYfFni/0zoTnhcONh34hz4Sv0g8GIxWoSE+szEmwJUWCbAbDEFU4CT79/PpmJ
 a3czxdaxEUg4unOY7C2X6AF1V0ysI2y8Pfz4tFdzfJEKngmV+6bKRGQkG1c88GSRJ
X-Received: by 2002:a05:622a:13d0:b0:2e1:cb3e:bb8a with SMTP id
 p16-20020a05622a13d000b002e1cb3ebb8amr1600124qtk.16.1648676370205; 
 Wed, 30 Mar 2022 14:39:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzfz/3sa7o7q8sExm8Q6EU+XMSKBCXqXdl9eyA8d+FagC5ekiYYV6zCp3B0MZF4rEXLPA5KA==
X-Received: by 2002:a05:622a:13d0:b0:2e1:cb3e:bb8a with SMTP id
 p16-20020a05622a13d000b002e1cb3ebb8amr1600034qtk.16.1648676368457; 
 Wed, 30 Mar 2022 14:39:28 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:28 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/19] tests: Add postcopy tls migration test
Date: Wed, 30 Mar 2022 17:39:06 -0400
Message-Id: <20220330213908.26608-18-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We just added TLS tests for precopy but not postcopy.  Add the
corresponding test for vanilla postcopy.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 43 +++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d9f444ea14..80c4244871 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -481,6 +481,10 @@ typedef struct {
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
     bool use_dirty_ring;
+    /* Whether use TLS channels for postcopy test? */
+    bool postcopy_tls;
+    /* Used only if postcopy_tls==true, to cache the data object */
+    void *postcopy_tls_data;
     const char *opts_source;
     const char *opts_target;
 } MigrateStart;
@@ -980,6 +984,10 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
         return -1;
     }
 
+    if (args->postcopy_tls) {
+        args->postcopy_tls_data = test_migrate_tls_psk_start_match(from, to);
+    }
+
     migrate_set_capability(from, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
@@ -1004,7 +1012,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     return 0;
 }
 
-static void migrate_postcopy_complete(QTestState *from, QTestState *to)
+static void migrate_postcopy_complete(QTestState *from, QTestState *to,
+                                      MigrateStart *args)
 {
     wait_for_migration_complete(from);
 
@@ -1015,19 +1024,38 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
         read_blocktime(to);
     }
 
+    if (args->postcopy_tls) {
+        assert(args->postcopy_tls_data);
+        test_migrate_tls_psk_finish(from, to, args->postcopy_tls_data);
+        args->postcopy_tls_data = NULL;
+    }
+
     test_migrate_end(from, to, true);
 }
 
-static void test_postcopy(void)
+static void test_postcopy_common(MigrateStart *args)
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
+    MigrateStart args = { };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_tls(void)
+{
+    MigrateStart args = { .postcopy_tls = true };
+
+    test_postcopy_common(&args);
 }
 
 static void test_postcopy_recovery(void)
@@ -1089,7 +1117,7 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, &args);
 }
 
 static void test_baddest(void)
@@ -2134,6 +2162,9 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
+#endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


