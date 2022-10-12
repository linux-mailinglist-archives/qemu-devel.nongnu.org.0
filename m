Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370635FC7D7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:56:56 +0200 (CEST)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidAF-0005aW-AS
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnj-0005HK-02
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicne-0006l7-LO
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSwYv3S4Tc7PADzy4Vq5p15+BomgFJxywYVJhHZa0r0=;
 b=HHPyp9QmHI1HODIRxQEUevA6PuDjI2qt37XvDB/oMLLXnlYrPcs6jUeEjb5iacAx/WVuSq
 +qGF3T91Nk3RmLvx+R1Jrw6dXUWFT+DY8LY/VxgvFoyWiB9de/INc33NSbX2YMQa1WYWMx
 dLR1qRWZGZAn9NoSJD/pajX2zg2aihk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-rP0W09ypO-OVRhH6gDKLlg-1; Wed, 12 Oct 2022 10:33:30 -0400
X-MC-Unique: rP0W09ypO-OVRhH6gDKLlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6AEF800B30;
 Wed, 12 Oct 2022 14:33:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E19EC2144B20;
 Wed, 12 Oct 2022 14:33:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 10/16] tests/x86: Add 'q35' machine type to drive_del-test
Date: Wed, 12 Oct 2022 16:33:10 +0200
Message-Id: <20221012143316.988561-11-thuth@redhat.com>
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

Configure pci bridge setting to run tests on 'q35' machine type.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-9-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/drive_del-test.c | 107 +++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 106c613f4f..9a750395a9 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -252,6 +252,27 @@ static void test_cli_device_del(void)
     qtest_quit(qts);
 }
 
+static void test_cli_device_del_q35(void)
+{
+    QTestState *qts;
+
+    /*
+     * -drive/-device and device_del.  Start with a drive used by a
+     * device that unplugs after reset.
+     */
+    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
+                      "file.read-zeroes=on,format=raw "
+                      "-machine q35 -device pcie-root-port,id=p1 "
+                      "-device pcie-pci-bridge,bus=p1,id=b1 "
+                      "-device virtio-blk-%s,drive=drive0,bus=b1,id=dev0",
+                      qvirtio_get_dev_type());
+
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
 static void test_empty_device_del(void)
 {
     QTestState *qts;
@@ -288,6 +309,43 @@ static void test_device_add_and_del(void)
     qtest_quit(qts);
 }
 
+static void device_add_q35(QTestState *qts)
+{
+    g_autofree char *driver = g_strdup_printf("virtio-blk-%s",
+                                              qvirtio_get_dev_type());
+    QDict *response =
+               qtest_qmp(qts, "{'execute': 'device_add',"
+                              " 'arguments': {"
+                              "   'driver': %s,"
+                              "   'drive': 'drive0',"
+                              "   'id': 'dev0',"
+                              "   'bus': 'b1'"
+                              "}}", driver);
+    g_assert(response);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+static void test_device_add_and_del_q35(void)
+{
+    QTestState *qts;
+
+    /*
+     * -drive/device_add and device_del.  Start with a drive used by a
+     * device that unplugs after reset.
+     */
+    qts = qtest_initf("-machine q35 -device pcie-root-port,id=p1 "
+                     "-device pcie-pci-bridge,bus=p1,id=b1 "
+                     "-drive if=none,id=drive0,file=null-co://,"
+                     "file.read-zeroes=on,format=raw");
+
+    device_add_q35(qts);
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
 static void test_drive_add_device_add_and_del(void)
 {
     QTestState *qts;
@@ -312,6 +370,25 @@ static void test_drive_add_device_add_and_del(void)
     qtest_quit(qts);
 }
 
+static void test_drive_add_device_add_and_del_q35(void)
+{
+    QTestState *qts;
+
+    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
+                     "-device pcie-pci-bridge,bus=p1,id=b1");
+
+    /*
+     * drive_add/device_add and device_del.  The drive is used by a
+     * device that unplugs after reset.
+     */
+    drive_add_with_media(qts);
+    device_add_q35(qts);
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
 static void test_blockdev_add_device_add_and_del(void)
 {
     QTestState *qts;
@@ -336,6 +413,25 @@ static void test_blockdev_add_device_add_and_del(void)
     qtest_quit(qts);
 }
 
+static void test_blockdev_add_device_add_and_del_q35(void)
+{
+    QTestState *qts;
+
+    qts = qtest_init("-machine q35 -device pcie-root-port,id=p1 "
+                     "-device pcie-pci-bridge,bus=p1,id=b1");
+
+    /*
+     * blockdev_add/device_add and device_del. The drive is used by a
+     * device that unplugs after reset, but it doesn't go away.
+     */
+    blockdev_add_with_media(qts);
+    device_add_q35(qts);
+    device_del(qts, true);
+    g_assert(has_blockdev(qts));
+
+    qtest_quit(qts);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -357,6 +453,17 @@ int main(int argc, char **argv)
                        test_empty_device_del);
         qtest_add_func("/device_del/blockdev",
                        test_blockdev_add_device_add_and_del);
+
+        if (qtest_has_machine("q35")) {
+            qtest_add_func("/device_del/drive/cli_device_q35",
+                           test_cli_device_del_q35);
+            qtest_add_func("/device_del/drive/device_add_q35",
+                           test_device_add_and_del_q35);
+            qtest_add_func("/device_del/drive/drive_add_device_add_q35",
+                           test_drive_add_device_add_and_del_q35);
+            qtest_add_func("/device_del/blockdev_q35",
+                           test_blockdev_add_device_add_and_del_q35);
+        }
     }
 
     return g_test_run();
-- 
2.31.1


