Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0450ECC4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:43:26 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8MV-0001kU-Jy
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8II-0006yC-3F
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IG-0007jm-GX
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TaW6msKlcAMMbgF4fLjrd4EFijbFPLZDkGeOUvG8wc=;
 b=MvB0++ZLhdd2tLQfD6UnvFUJZrQDm1eell2jSYCCyYHqB0oilI4ihumBATPMFwUqbn3dxW
 xbPGT/PUXMJdjcVBX9ZvdCqDDKrT0fQtDnUBxhqlnue1W0ImnR3VantDSpN94b9Gr5dANS
 k0Xth5C57rSrA986lnRmyMtVKqf5hp4=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-YF5BHg5JOPGXheG1J17IGQ-1; Mon, 25 Apr 2022 19:38:58 -0400
X-MC-Unique: YF5BHg5JOPGXheG1J17IGQ-1
Received: by mail-il1-f197.google.com with SMTP id
 h28-20020a056e021d9c00b002cc403e851aso6909331ila.12
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TaW6msKlcAMMbgF4fLjrd4EFijbFPLZDkGeOUvG8wc=;
 b=2iSvb36x3jRPop40nnj3jVYShBU2hBDKOAt2bsYBKkiyoD3mNRGB2hDiJ6o+pTnsVH
 pjaEQEpBeyjoYCBnwTSba6p65zA48l24rZgCfqibOaxmjq6RxSwser0AkUcchwl2u0sZ
 mvtK7PjN0zqKx+Ne/0JYHlzG3fm5DnhYGjbxsVbIdAIswS8CxIgsU4qG49rAsHys91hw
 cRXimf0eeguX3cXEWfNrL+DQS+2xxZ0uyLDKoPtF+rtxVOkltQRL68maT6FhnG0XTfU6
 Kct2dmIA0Koi9Sa9djFC3dVJ9mPIoKqPcU2x4qbXF7QJ0Li4tCXV8tVYwMwUb2Df+qrG
 uqzg==
X-Gm-Message-State: AOAM532FVz4ci5KLJov4P+2de3dsSid2k+mzyifC8TDJJZIvEk5ZuWIC
 CnCWqhBzNj71cfH78Sk7G40Divz+nt/ZOIC2W/xQVEFtW9bfCb6gThFMZGKLksNVQxHHWCz8Gpb
 tnFIFboyuMzfQOiaw5tD5V1tKrbpc2oxS75AV1CpsLykQ4BOCCUaS3EmxKyOnknSD
X-Received: by 2002:a05:6e02:12b4:b0:2ca:e755:ee4a with SMTP id
 f20-20020a056e0212b400b002cae755ee4amr8150264ilr.65.1650929937960; 
 Mon, 25 Apr 2022 16:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrMqMJoDlcildnbWjSf83BSaC/mk+SxWdtBOPmM2af6vly+Ooy8dJLHENB0zRN2siBywwYrw==
X-Received: by 2002:a05:6e02:12b4:b0:2ca:e755:ee4a with SMTP id
 f20-20020a056e0212b400b002cae755ee4amr8150250ilr.65.1650929937725; 
 Mon, 25 Apr 2022 16:38:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:57 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/21] tests: add multifd migration tests of TLS with PSK
 credentials
Date: Mon, 25 Apr 2022 19:38:33 -0400
Message-Id: <20220425233847.10393-8-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

This validates that we correctly handle multifd migration success
and failure scenarios when using TLS with pre shared keys.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 60 +++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c1b0b3aca4..f47e4797e2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1815,6 +1815,48 @@ static void test_multifd_tcp_zstd(void)
 }
 #endif
 
+#ifdef CONFIG_GNUTLS
+static void *
+test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
+                                             QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_psk_start_match(from, to);
+}
+
+static void *
+test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
+                                                QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_psk_start_mismatch(from, to);
+}
+
+static void test_multifd_tcp_tls_psk_match(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tcp_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_psk_mismatch(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tcp_tls_psk_start_mismatch,
+        .finish_hook = test_migrate_tls_psk_finish,
+        .result = MIG_TEST_FAIL,
+    };
+    test_precopy_common(&args);
+}
+#endif /* CONFIG_GNUTLS */
+
 /*
  * This test does:
  *  source               target
@@ -2025,12 +2067,22 @@ int main(int argc, char **argv)
                    test_validate_uuid_dst_not_set);
 
     qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
-    qtest_add_func("/migration/multifd/tcp/none", test_multifd_tcp_none);
-    qtest_add_func("/migration/multifd/tcp/cancel", test_multifd_tcp_cancel);
-    qtest_add_func("/migration/multifd/tcp/zlib", test_multifd_tcp_zlib);
+    qtest_add_func("/migration/multifd/tcp/plain/none",
+                   test_multifd_tcp_none);
+    qtest_add_func("/migration/multifd/tcp/plain/cancel",
+                   test_multifd_tcp_cancel);
+    qtest_add_func("/migration/multifd/tcp/plain/zlib",
+                   test_multifd_tcp_zlib);
 #ifdef CONFIG_ZSTD
-    qtest_add_func("/migration/multifd/tcp/zstd", test_multifd_tcp_zstd);
+    qtest_add_func("/migration/multifd/tcp/plain/zstd",
+                   test_multifd_tcp_zstd);
 #endif
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/multifd/tcp/tls/psk/match",
+                   test_multifd_tcp_tls_psk_match);
+    qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
+                   test_multifd_tcp_tls_psk_mismatch);
+#endif /* CONFIG_GNUTLS */
 
     if (kvm_dirty_ring_supported()) {
         qtest_add_func("/migration/dirty_ring",
-- 
2.32.0


