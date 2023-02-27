Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B15D6A4858
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhUr-0002Ub-LP; Mon, 27 Feb 2023 12:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pWhUn-0002KS-2d
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:41:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pWhUj-0001gw-BP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677519659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jw5W4HBh/vvH2xursYNni3NZ/OMdQ/AtY0xGrmCRrYE=;
 b=NMDmxJ/soJsnSlj7gbKKZHz9QkeQ8hfErVzQ6jIOjfSI6suFc1gpOpx4TzwyFAxeSPH6Mf
 YROmICh6jNhjbZg4ibhp6kackGLV4e+AiRxiTxDGbsxznR5qrIBpNYrGOR04oPqlB5pw+K
 9E3wpB9C9+KMpYmyIs1wwmNQuC/0ehQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-AvAz5LzIN2-C2K-DBrXn7A-1; Mon, 27 Feb 2023 12:40:54 -0500
X-MC-Unique: AvAz5LzIN2-C2K-DBrXn7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 304C219705A8;
 Mon, 27 Feb 2023 17:40:24 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.45.224.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54EFB492B0E;
 Mon, 27 Feb 2023 17:40:22 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: alxndr@bu.edu, pbonzini@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 thuth@redhat.com, darren.kenny@oracle.com, Qiuhao.Li@outlook.com,
 fam@euphon.net, lvivier@redhat.com, berrange@redhat.com
Subject: [PATCH] tests: Ensure TAP version is printed before other messages
Date: Mon, 27 Feb 2023 17:40:19 +0000
Message-Id: <20230227174019.1164205-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These two tests were failing with this error:

  stderr:
  TAP parsing error: version number must be on the first line
  [...]
  Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.

This can be fixed by ensuring we always call g_test_init first in the
body of main.

Thanks: Daniel Berrange, for diagnosing the problem
Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
 tests/qtest/rtl8139-test.c         | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index a9254b455d..2012bd54b7 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
 
 int main(int argc, char **argv)
 {
+    g_test_init(&argc, &argv, NULL);
+
     if (!qtest_has_device("lsi53c895a")) {
         return 0;
     }
 
-    g_test_init(&argc, &argv, NULL);
-
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
                    test_lsi_do_dma_empty_queue);
 
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 1beb83805c..4bd240e9ee 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -207,9 +207,10 @@ int main(int argc, char **argv)
         verbosity_level = atoi(v_env);
     }
 
-    qtest_start("-device rtl8139");
-
     g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-device rtl8139");
+
     qtest_add_func("/rtl8139/nop", nop);
     qtest_add_func("/rtl8139/timer", test_init);
 
-- 
2.39.2


