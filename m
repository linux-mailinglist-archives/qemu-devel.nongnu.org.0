Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5A5A6CEE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:16:46 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6j6-0001CN-Uw
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AC-0007ST-Ib
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A8-00056r-P3
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=24uGYpCNJr6h0jnUzVcWePHtkya9TltsdggymPXJfB4=;
 b=f/uwTsR99hzB9V+Fs6gimgUVIWH82uzQ7f8Z2TX/Q2e8o/q1oH35ErK1KUaoyI2BmzKrC5
 InLY9uVYfGVlQG3eFoeakb4LuMbPDh878DsbEURigQW6c+1TscAvc8YLozxwtX+HEVmFqV
 PsG8j8kZnSvar8nH7R1/vDmLTru8PZE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-pLRiX-KWPo2g-tpCF7GSBw-1; Tue, 30 Aug 2022 14:40:32 -0400
X-MC-Unique: pLRiX-KWPo2g-tpCF7GSBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27510811E81;
 Tue, 30 Aug 2022 18:40:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D5C1415117;
 Tue, 30 Aug 2022 18:40:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 10/23] tests/qtest: migration-test: Skip running
 test_migrate_fd_proto on win32
Date: Tue, 30 Aug 2022 20:39:59 +0200
Message-Id: <20220830184012.77978-11-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

The test case 'test_migrate_fd_proto' calls socketpair() which does
not exist on win32. Exclude it. The helper function wait_command_fd()
is not needed anymore, hence exclude it too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220824094029.1634519-22-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-helpers.h | 2 ++
 tests/qtest/migration-helpers.c | 2 ++
 tests/qtest/migration-test.c    | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index 59561898d0..db0684de48 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -17,8 +17,10 @@
 
 extern bool got_stop;
 
+#ifndef _WIN32
 G_GNUC_PRINTF(3, 4)
 QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
+#endif
 
 G_GNUC_PRINTF(2, 3)
 QDict *wait_command(QTestState *who, const char *command, ...);
diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index c6fbeb3974..f6f3c6680f 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -34,6 +34,7 @@ static void check_stop_event(QTestState *who)
     }
 }
 
+#ifndef _WIN32
 /*
  * Events can get in the way of responses we are actually waiting for.
  */
@@ -58,6 +59,7 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...)
 
     return ret;
 }
+#endif
 
 /*
  * Events can get in the way of responses we are actually waiting for.
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 18d30bfc3c..4728d528bb 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1631,6 +1631,7 @@ static void test_precopy_tcp_tls_x509_reject_anon_client(void)
 #endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
+#ifndef _WIN32
 static void *test_migrate_fd_start_hook(QTestState *from,
                                         QTestState *to)
 {
@@ -1699,6 +1700,7 @@ static void test_migrate_fd_proto(void)
     };
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
 {
@@ -2531,7 +2533,9 @@ int main(int argc, char **argv)
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
+#ifndef _WIN32
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
+#endif
     qtest_add_func("/migration/validate_uuid", test_validate_uuid);
     qtest_add_func("/migration/validate_uuid_error", test_validate_uuid_error);
     qtest_add_func("/migration/validate_uuid_src_not_set",
-- 
2.31.1


