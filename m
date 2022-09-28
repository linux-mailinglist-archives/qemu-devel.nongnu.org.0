Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E355ED846
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:54:56 +0200 (CEST)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSqF-0001aE-1W
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRM7-00018C-NS
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRM4-00005h-IT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zSZoX2Io63krnoBhRHtWcDZ1L8thJgpeD+q7WPJ8WIM=;
 b=VQECap4FOq52OYvLeg7N/h8k1zxNELJfEjYTMl1Em7d8LTbqFfUDII37LID0Ga2e8ehBbu
 sDQrebnI3pmbOW9UtY+jP5pT+Xrf2IJ2NIk1OWuVfv0IKQ5bYEFamWnv64JAhzlOHIOVbT
 sVPq3E2nXAkXvUTA5aRBxiOWvBPhpso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-UGA1zQrjMZuYVBP9Bx5DiQ-1; Wed, 28 Sep 2022 03:19:36 -0400
X-MC-Unique: UGA1zQrjMZuYVBP9Bx5DiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA2C5868A21;
 Wed, 28 Sep 2022 07:19:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC1940C83BB;
 Wed, 28 Sep 2022 07:19:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 26/37] tests/qtest: virtio-net-failover: Disable migration
 tests for win32
Date: Wed, 28 Sep 2022 09:18:32 +0200
Message-Id: <20220928071843.1468323-27-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

These tests use the exec migration protocol, which is unsupported
on Windows as of today. Disable these tests for now.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220925113032.1949844-42-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 443ee56de9..4a809590bf 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -588,6 +588,7 @@ static void test_hotplug_2_reverse(void)
     machine_stop(qts);
 }
 
+#ifndef _WIN32
 static QDict *migrate_status(QTestState *qts)
 {
     QDict *resp, *ret;
@@ -1827,6 +1828,7 @@ static void test_multi_in(gconstpointer opaque)
 
     machine_stop(qts);
 }
+#endif /* _WIN32 */
 
 int main(int argc, char **argv)
 {
@@ -1857,7 +1859,11 @@ int main(int argc, char **argv)
     qtest_add_func("failover-virtio-net/hotplug/2_reverse",
                    test_hotplug_2_reverse);
 
-    /* migration tests */
+#ifndef _WIN32
+    /*
+     * These migration tests cases use the exec migration protocol,
+     * which is unsupported on Windows.
+     */
     qtest_add_data_func("failover-virtio-net/migrate/on/out", tmpfile,
                         test_migrate_out);
     qtest_add_data_func("failover-virtio-net/migrate/on/in", tmpfile,
@@ -1886,6 +1892,7 @@ int main(int argc, char **argv)
                         tmpfile, test_multi_out);
     qtest_add_data_func("failover-virtio-net/migrate/multi/in",
                    tmpfile, test_multi_in);
+#endif /* _WIN32 */
 
     ret = g_test_run();
 
-- 
2.31.1


