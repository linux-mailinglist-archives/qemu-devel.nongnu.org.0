Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE38E5FC7B2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:49:20 +0200 (CEST)
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oid2t-00056s-TI
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnh-0005Bd-9e
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnc-0006ko-GI
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KE+OpO5TzqhZFqpiZi61TdmcpeDGy+ILkKGYTY//A0=;
 b=KXnAvPYyXjdY/+O6tZwE9F2mHaBwsn52f75uIaq7I9yElbzMQ8bbhZ29oLUxJxgPrtF9Ie
 yhVltMmT/TaWNlP+gTIEUd8BlA7WAOoisNKrEuNBVO5A9ONhiR2a/TcXj84p5LEUNzVlIf
 WryafYuTaj6jQDsdnQwA7QLo5mu0nco=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-0GJveknlNDeUOoJQOwqGIA-1; Wed, 12 Oct 2022 10:33:27 -0400
X-MC-Unique: 0GJveknlNDeUOoJQOwqGIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D291833AEC;
 Wed, 12 Oct 2022 14:33:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAD732144B20;
 Wed, 12 Oct 2022 14:33:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 07/16] tests/x86: Add 'q35' machine type to hotplug hd-geo-test
Date: Wed, 12 Oct 2022 16:33:07 +0200
Message-Id: <20221012143316.988561-8-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add pci bridge setting to test hotplug.
Duplicate tests for plugging scsi and virtio devices for q35 machine type.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-6-michael.labiuk@virtuozzo.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/hd-geo-test.c | 76 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 278464c379..4a7628077b 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -963,6 +963,42 @@ static void test_override_scsi_hot_unplug(void)
     test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
 }
 
+static void test_override_scsi_hot_unplug_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@0,0",
+            {10000, 120, 30}
+        },
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/channel@0/disk@1,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-device pcie-root-port,id=p0 "
+                                     "-device pcie-pci-bridge,bus=p0,id=b1 "
+                                     "-machine q35"));
+
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_scsi_controller(args, "virtio-scsi-pci", "b1", 2);
+    add_scsi_disk(args, 0, 0, 0, 0, 0, 10000, 120, 30);
+    add_scsi_disk(args, 1, 0, 0, 1, 0, 20, 20, 20);
+
+    test_override_hot_unplug(args, "scsi-disk0", expected, expected2);
+}
+
 static void test_override_virtio_hot_unplug(void)
 {
     TestArgs *args = create_args();
@@ -986,6 +1022,41 @@ static void test_override_virtio_hot_unplug(void)
     test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
 }
 
+static void test_override_virtio_hot_unplug_q35(void)
+{
+    TestArgs *args = create_args();
+    CHSResult expected[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@2/disk@0,0",
+            {10000, 120, 30}
+        },
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+    CHSResult expected2[] = {
+        {
+            "/pci@i0cf8/pci-bridge@1/pci-bridge@0/scsi@3/disk@0,0",
+            {20, 20, 20}
+        },
+        {NULL, {0, 0, 0} }
+    };
+
+    args->argc = append_arg(args->argc, args->argv, ARGV_SIZE,
+                            g_strdup("-device pcie-root-port,id=p0 "
+                                     "-device pcie-pci-bridge,bus=p0,id=b1 "
+                                     "-machine q35"));
+
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_drive_with_mbr(args, empty_mbr, 1);
+    add_virtio_disk(args, 0, "b1", 2, 10000, 120, 30);
+    add_virtio_disk(args, 1, "b1", 3, 20, 20, 20);
+
+    test_override_hot_unplug(args, "virtio-disk0", expected, expected2);
+}
+
 int main(int argc, char **argv)
 {
     Backend i;
@@ -1035,11 +1106,14 @@ int main(int argc, char **argv)
                            test_override_virtio_blk_q35);
             qtest_add_func("hd-geo/override/zero_chs_q35",
                            test_override_zero_chs_q35);
-
             if (qtest_has_device("lsi53c895a")) {
                 qtest_add_func("hd-geo/override/scsi_q35",
                                test_override_scsi_q35);
             }
+            qtest_add_func("hd-geo/override/scsi_hot_unplug_q35",
+                           test_override_scsi_hot_unplug_q35);
+            qtest_add_func("hd-geo/override/virtio_hot_unplug_q35",
+                           test_override_virtio_hot_unplug_q35);
         }
     } else {
         g_test_message("QTEST_QEMU_IMG not set or qemu-img missing; "
-- 
2.31.1


