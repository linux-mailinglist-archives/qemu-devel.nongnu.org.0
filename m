Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4929D5FC7A2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:43:28 +0200 (CEST)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicxD-0008PT-Cn
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnb-00054W-Q8
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnY-0006kB-GP
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2jNxOmmoBaUaYLIRBnrgJe/FO422NAqao0k/4BWbMl0=;
 b=UrH/QB9yxbQ/8C9lYW0BLLR2B7oc60XxEjjx687V1byDpjCgE9URViG8sDlqC4N+0LPkZ8
 sGGG/IEMI9wHtr9c04FDZzGAwv+aVe8GcvEl6jcbsy3dabEdgy/tqSzCgwP/Oa6r6/9M1Y
 y3XWGHxIlHMW0v1qj3WEqwprp44k894=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-zlNH5TTpM2KEOZNszxzWKg-1; Wed, 12 Oct 2022 10:33:26 -0400
X-MC-Unique: zlNH5TTpM2KEOZNszxzWKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 638F91C068C9;
 Wed, 12 Oct 2022 14:33:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 923552144B20;
 Wed, 12 Oct 2022 14:33:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 06/16] tests/x86: Add 'q35' machine type to override-tests in
 hd-geo-test
Date: Wed, 12 Oct 2022 16:33:06 +0200
Message-Id: <20221012143316.988561-7-thuth@redhat.com>
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

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-5-michael.labiuk@virtuozzo.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/hd-geo-test.c | 97 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 61f4c24b81..278464c379 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -741,6 +741,27 @@ static void test_override_ide(void)
     test_override(args, "pc", expected);
 }
 
+static void test_override_sata(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@0/disk@0", {10000, 120, 30} },
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@1/disk@0", {9000, 120, 30} },
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@2/disk@0", {0, 1, 1} },
+        {"/pci@i0cf8/pci8086,2922@1f,2/drive@3/disk@0", {1, 0, 0} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_ide_disk(args, 0, 0, 0, 10000, 120, 30);
+    add_ide_disk(args, 1, 1, 0, 9000, 120, 30);
+    add_ide_disk(args, 2, 2, 0, 0, 1, 1);
+    add_ide_disk(args, 3, 3, 0, 1, 0, 0);
+    test_override(args, "q35", expected);
+}
+
 static void test_override_scsi(void)
 {
     TestArgs *args = create_args();
@@ -763,6 +784,42 @@ static void test_override_scsi(void)
     test_override(args, "pc", expected);
 }
 
+static void setup_pci_bridge(TestArgs *args, const char *id, const char *rootid)
+{
+
+    char *root, *br;
+    root = g_strdup_printf("-device pcie-root-port,id=%s", rootid);
+    br = g_strdup_printf("-device pcie-pci-bridge,bus=%s,id=%s", rootid, id);
+
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, root);
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE, br);
+}
+
+static void test_override_scsi_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {   "/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@0,0",
+            {10000, 120, 30}
+        },
+        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@1,0", {9000, 120, 30} },
+        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@2,0", {1, 0, 0} },
+        {"/pci@i0cf8/pci-bridge@1/scsi@3/channel@0/disk@3,0", {0, 1, 0} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    setup_pci_bridge(args, "pcie.0", "br");
+    add_scsi_controller(args, "lsi53c895a", "br", 3);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 9000, 120, 30);
+    add_scsi_disk(args, 2, 0, 0, 2, 0, 1, 0, 0);
+    add_scsi_disk(args, 3, 0, 0, 3, 0, 0, 1, 0);
+    test_override(args, "q35", expected);
+}
+
 static void test_override_scsi_2_controllers(void)
 {
     TestArgs *args = create_args();
@@ -801,6 +858,22 @@ static void test_override_virtio_blk(void)
     test_override(args, "pc", expected);
 }
 
+static void test_override_virtio_blk_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {"/pci@i0cf8/pci-bridge@1/scsi@3/disk@0,0", {10000, 120, 30} },
+        {"/pci@i0cf8/pci-bridge@1/scsi@4/disk@0,0", {9000, 120, 30} },
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    setup_pci_bridge(args, "pcie.0", "br");
+    add_virtio_disk(args, 0, "br", 3, 10000, 120, 30);
+    add_virtio_disk(args, 1, "br", 4, 9000, 120, 30);
+    test_override(args, "q35", expected);
+}
+
 static void test_override_zero_chs(void)
 {
     TestArgs *args = create_args();
@@ -812,6 +885,17 @@ static void test_override_zero_chs(void)
     test_override(args, "pc", expected);
 }
 
+static void test_override_zero_chs_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {NULL, {0, 0, 0} }
+    };
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_ide_disk(args, 0, 0, 0, 0, 0, 0);
+    test_override(args, "q35", expected);
+}
+
 static void test_override_hot_unplug(TestArgs *args, const char *devid,
                                      CHSResult expected[], CHSResult expected2[])
 {
@@ -944,6 +1028,19 @@ int main(int argc, char **argv)
                        test_override_scsi_hot_unplug);
         qtest_add_func("hd-geo/override/virtio_hot_unplug",
                        test_override_virtio_hot_unplug);
+
+        if (qtest_has_machine("q35")) {
+            qtest_add_func("hd-geo/override/sata", test_override_sata);
+            qtest_add_func("hd-geo/override/virtio_blk_q35",
+                           test_override_virtio_blk_q35);
+            qtest_add_func("hd-geo/override/zero_chs_q35",
+                           test_override_zero_chs_q35);
+
+            if (qtest_has_device("lsi53c895a")) {
+                qtest_add_func("hd-geo/override/scsi_q35",
+                               test_override_scsi_q35);
+            }
+        }
     } else {
         g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
                        "skipping hd-geo/override/* tests");
-- 
2.31.1


