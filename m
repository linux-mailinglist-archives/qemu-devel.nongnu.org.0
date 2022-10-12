Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84E5FC7C9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:53:17 +0200 (CEST)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oid6h-00010V-VM
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicni-0005GZ-PO
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicne-0006kz-51
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUP0Oo+ELuPQUPK68pgLhXopuf1Cpx+jFZgWtjcHwB0=;
 b=WzsgMVjnhEIvOI290os/cQiyanCFi8WWor8Q5nCFPesYWbfawz3Y9HzP3IJtGtfd/GwM1y
 4/4M/emIUvJBbjXdsnDLSCEjze73AktqJFYHH3PXZMkDKXSiRI4depebOZAQB+qrtc/f6W
 pC+ievmQyYeIH4mkndNV9zWt4p/O63c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-84GXSOzUPzSCO7-SG49i_g-1; Wed, 12 Oct 2022 10:33:32 -0400
X-MC-Unique: 84GXSOzUPzSCO7-SG49i_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3F991C068CC;
 Wed, 12 Oct 2022 14:33:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB57A2144B20;
 Wed, 12 Oct 2022 14:33:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 11/16] tests/x86: Add 'q35' machine type to ivshmem-test
Date: Wed, 12 Oct 2022 16:33:11 +0200
Message-Id: <20221012143316.988561-12-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Michael Labiuk <michael.labiuk@virtuozzo.com>

Configure pci bridge setting to test ivshmem on 'q35'.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-10-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ivshmem-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index 9611d05eb5..cd550c8935 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -378,6 +378,20 @@ static void test_ivshmem_server(void)
     close(thread.pipe[0]);
 }
 
+static void test_ivshmem_hotplug_q35(void)
+{
+    QTestState *qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1 "
+                                 "-device pcie-root-port,id=p1 "
+                                 "-device pcie-pci-bridge,bus=p1,id=b1 "
+                                 "-machine q35");
+
+    qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
+                         "{'memdev': 'mb1', 'bus': 'b1'}");
+    qtest_qmp_device_del_send(qts, "iv1");
+
+    qtest_quit(qts);
+}
+
 #define PCI_SLOT_HP             0x06
 
 static void test_ivshmem_hotplug(void)
@@ -469,6 +483,7 @@ int main(int argc, char **argv)
 {
     int ret, fd;
     gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
+    const char *arch = qtest_get_arch();
 
     g_test_init(&argc, &argv, NULL);
 
@@ -494,6 +509,9 @@ int main(int argc, char **argv)
         qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
         qtest_add_func("/ivshmem/server", test_ivshmem_server);
     }
+    if (!strcmp(arch, "x86_64") && qtest_has_machine("q35")) {
+        qtest_add_func("/ivshmem/hotplug-q35", test_ivshmem_hotplug_q35);
+    }
 
 out:
     ret = g_test_run();
-- 
2.31.1


