Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52E65BEEAC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:41:50 +0200 (CEST)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oak3x-0002nq-2A
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHh-0007fK-42
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHe-0001OO-S1
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663688136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IR14f28GetdvH8MynnyKx7hppyIbhjwI0848vcd0U1c=;
 b=ZVAPxZkbcW6eDyM9susvRmuZrZdJkrNtyvhefWiN8TPIigWx2zYvkMOWvEcKnfkh1LwE2r
 413XTR8Vsd2ux08NBTZkEhI0UeJsEcRE3kcw/rFneo7Y2oIouOZeG/LZOI4p2uBgv4boYx
 v15E21WJZuypo3/pP1kI4WPmoC+h5qA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-7Dec2B-YP62diFadaKnZmQ-1; Tue, 20 Sep 2022 11:35:34 -0400
X-MC-Unique: 7Dec2B-YP62diFadaKnZmQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DB1A185A79C;
 Tue, 20 Sep 2022 15:35:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B400492B04;
 Tue, 20 Sep 2022 15:35:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PULL 11/15] tests: Only run intel-hda-tests if machine type is
 compiled in
Date: Tue, 20 Sep 2022 17:35:08 +0200
Message-Id: <20220920153512.187283-12-thuth@redhat.com>
In-Reply-To: <20220920153512.187283-1-thuth@redhat.com>
References: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220902173452.1904-5-quintela@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/intel-hda-test.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
index a58c98e4d1..d4a8db6fd6 100644
--- a/tests/qtest/intel-hda-test.c
+++ b/tests/qtest/intel-hda-test.c
@@ -18,7 +18,7 @@
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void ich6_test(void)
 {
-    qtest_start("-device intel-hda,id=" HDA_ID CODEC_DEVICES);
+    qtest_start("-machine pc -device intel-hda,id=" HDA_ID CODEC_DEVICES);
     qtest_end();
 }
 
@@ -65,9 +65,12 @@ static void test_issue542_ich6(void)
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
-    qtest_add_func("/intel-hda/ich6", ich6_test);
-    qtest_add_func("/intel-hda/ich9", ich9_test);
-    qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
-
+    if (qtest_has_machine("pc")) {
+        qtest_add_func("/intel-hda/ich6", ich6_test);
+    }
+    if (qtest_has_machine("q35")) {
+        qtest_add_func("/intel-hda/ich9", ich9_test);
+        qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
+    }
     return g_test_run();
 }
-- 
2.31.1


