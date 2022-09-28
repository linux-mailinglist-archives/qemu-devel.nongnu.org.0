Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5501F5ED6B1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:49:03 +0200 (CEST)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odRoT-0002tK-NI
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLs-00010u-H2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLr-0008VM-0X
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fS0HFYuay2FaG6jezA4xu47Chtmh+TOfClxLJ6MIUFw=;
 b=H6hBO213QdyvzOvhQFWA3hpmX8EDWsSnOUxLvkNSL293eQXh2dwBUxlk4R3ZOdkDndo4SO
 Fc5B0FxrpeDOqxGzvCDDPbl2+hxIGmWU+vrj53HfxLD4DbsshOsR7xPvswAT9XCp4r0Svi
 4Co7Oo8C69SOVsPN9QZt2V/JNz9ZEeM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-EksNxqiMNGiKDW-GHajsMQ-1; Wed, 28 Sep 2022 03:19:19 -0400
X-MC-Unique: EksNxqiMNGiKDW-GHajsMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B5231C20AEF;
 Wed, 28 Sep 2022 07:19:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D86440C83BB;
 Wed, 28 Sep 2022 07:19:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 19/37] tests/qtest: qmp-test: Skip running test_qmp_oob for
 win32
Date: Wed, 28 Sep 2022 09:18:25 +0200
Message-Id: <20220928071843.1468323-20-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The test_qmp_oob test case calls mkfifo() which does not exist on
win32. Exclude it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220925113032.1949844-31-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/qmp-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index bf7304c7dc..23b2a37942 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -159,6 +159,8 @@ static void test_qmp_protocol(void)
     qtest_quit(qts);
 }
 
+#ifndef _WIN32
+
 /* Out-of-band tests */
 
 char tmpdir[] = "/tmp/qmp-test-XXXXXX";
@@ -277,6 +279,8 @@ static void test_qmp_oob(void)
     qtest_quit(qts);
 }
 
+#endif /* _WIN32 */
+
 /* Preconfig tests */
 
 static void test_qmp_preconfig(void)
@@ -336,7 +340,10 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
 
     qtest_add_func("qmp/protocol", test_qmp_protocol);
+#ifndef _WIN32
+    /* This case calls mkfifo() which does not exist on win32 */
     qtest_add_func("qmp/oob", test_qmp_oob);
+#endif
     qtest_add_func("qmp/preconfig", test_qmp_preconfig);
     qtest_add_func("qmp/missing-any-arg", test_qmp_missing_any_arg);
 
-- 
2.31.1


