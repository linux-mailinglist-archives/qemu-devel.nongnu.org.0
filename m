Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6214EDCC7
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:28:02 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwiP-0007Zu-Nz
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:28:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQN-0002MN-IX
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQK-0001OC-Li
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adScMC+H9c/2TDao3xFbYMKyXHCGuT9u1P39HtUdouo=;
 b=cE8cdQCg+Ckx5bdAVHXUJnXXjimNGjY2xW3Ct5U7tCurLn7Urw5igtxKdl+r1NOD7ORM3z
 Wxu2bKZFN03/m3Hq1SbEaf90PXkxoqAZr8iv9SI0NNFxbSr62cmi94x5QFjqceFc8fWrHS
 BhfGtXaotnqYUTiKbmeoZKi3J16+Scg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-6jTdchTfO2Ob3Dkm6baDJQ-1; Thu, 31 Mar 2022 11:09:18 -0400
X-MC-Unique: 6jTdchTfO2Ob3Dkm6baDJQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 h68-20020a376c47000000b0067e05dade89so15041940qkc.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adScMC+H9c/2TDao3xFbYMKyXHCGuT9u1P39HtUdouo=;
 b=th3pQs57/0q0LQrokbydAsHTtRg110MK/pYUbFOhJSkdCmfXz17YpTZ9hES8Elkboy
 zXdDXJnZY/DoxkD4hHqnXESnlYv6PBPMs+OgkMMbJmqAdMmvtGMJvCyOmvTNAdbfb1EO
 qtXElrsT2e9EEEcsQXOcJONGIkeyA8iwJ7cR4IALlAphIQFDcgx7O7KUMJJa1m1y6fvQ
 s2FMI5YWAVhltIzM/0Ewl1dRdZ1rqRqx0TQcrv9/L3HK+4r1I0hTaqL1aJvlGsid5OXr
 qPxBw8u9186glIQEzN0WRNkPgAb7+hgWGAQaeun6mQB2S8Ls7a44lOES2zMcnk0rlGiK
 b4XQ==
X-Gm-Message-State: AOAM533RIOOBxIoxUakg+iiGzHN2Krz7jb0l5XvJZzNYj93JRIa5OWQI
 nvknmoH2S8+omJPYblMj8wITbTVtBNDQGSHYKbLp6zdMxmkHbF4KEHCfXvZ4zet9ivPzeT80lPQ
 Mb1ky6hl1HKUwqpmuTuD7OMqTnaA0vp8OJ6zdveM7z8z5VjMY6p6bGTmAm+RWuO/G
X-Received: by 2002:a05:620a:4554:b0:67d:6750:6a3 with SMTP id
 u20-20020a05620a455400b0067d675006a3mr3583335qkp.439.1648739358011; 
 Thu, 31 Mar 2022 08:09:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0RtQXAzwSu759paQcZqke1m4OQe/C54UCNcj6fqIoTjylzevUpI8dbjSIfhE5MmuvCLVJFw==
X-Received: by 2002:a05:620a:4554:b0:67d:6750:6a3 with SMTP id
 u20-20020a05620a455400b0067d675006a3mr3583297qkp.439.1648739357610; 
 Thu, 31 Mar 2022 08:09:17 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/19] tests: Add postcopy tls migration test
Date: Thu, 31 Mar 2022 11:08:55 -0400
Message-Id: <20220331150857.74406-18-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
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


