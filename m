Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA05FC7A0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:43:20 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicx6-00083a-2X
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicna-00054Q-ET
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnY-0006k9-FH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/TEqUsTuY0VENj3wooLQbArhOf1njBISSItMdJCOVU=;
 b=P4YZeQsBzdbJMo/TD4Poj6KCKWxeXT/1+GgPt9BuyZpqoWb7ocheBLJo87UmWa0ySJXMJc
 K5hc01y/WY8B4EvnAIY888RRYckaO9JKi54O71G8cP/d3nMjAWf2mYUPfMSwyCwq96DJE+
 /QVEioLJFKmg44ihLpchNgUhBbrCUyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-UWzB137iOvitro3BL7sl3A-1; Wed, 12 Oct 2022 10:33:24 -0400
X-MC-Unique: UWzB137iOvitro3BL7sl3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37F85959744;
 Wed, 12 Oct 2022 14:33:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B462144B20;
 Wed, 12 Oct 2022 14:33:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 04/16] tests/x86: Add subtest with 'q35' machine type to
 device-plug-test
Date: Wed, 12 Oct 2022 16:33:04 +0200
Message-Id: <20221012143316.988561-5-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

From: Michael Labiuk <michael.labiuk@virtuozzo.com>

Configure pci bridge setting to plug pci device and unplug.

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-3-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/device-plug-test.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 3841de1b8c..3f44f731d1 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -79,6 +79,19 @@ static void test_pci_unplug_request(void)
     qtest_quit(qtest);
 }
 
+static void test_q35_pci_unplug_request(void)
+{
+
+    QTestState *qtest = qtest_initf("-machine q35 "
+                                    "-device pcie-root-port,id=p1 "
+                                    "-device pcie-pci-bridge,bus=p1,id=b1 "
+                                    "-device virtio-mouse-pci,bus=b1,id=dev0");
+
+    process_device_remove(qtest, "dev0");
+
+    qtest_quit(qtest);
+}
+
 static void test_pci_unplug_json_request(void)
 {
     const char *arch = qtest_get_arch();
@@ -97,6 +110,27 @@ static void test_pci_unplug_json_request(void)
     qtest_quit(qtest);
 }
 
+static void test_q35_pci_unplug_json_request(void)
+{
+    const char *port = "-device '{\"driver\": \"pcie-root-port\", "
+                                      "\"id\": \"p1\"}'";
+
+    const char *bridge = "-device '{\"driver\": \"pcie-pci-bridge\", "
+                                   "\"id\": \"b1\", "
+                                   "\"bus\": \"p1\"}'";
+
+    const char *device = "-device '{\"driver\": \"virtio-mouse-pci\", "
+                                   "\"bus\": \"b1\", "
+                                   "\"id\": \"dev0\"}'";
+
+    QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
+                                    port, bridge, device);
+
+    process_device_remove(qtest, "dev0");
+
+    qtest_quit(qtest);
+}
+
 static void test_ccw_unplug(void)
 {
     QTestState *qtest = qtest_initf("-device virtio-balloon-ccw,id=dev0");
@@ -176,5 +210,12 @@ int main(int argc, char **argv)
                        test_spapr_phb_unplug_request);
     }
 
+    if (!strcmp(arch, "x86_64") && qtest_has_machine("q35")) {
+        qtest_add_func("/device-plug/q35-pci-unplug-request",
+                   test_q35_pci_unplug_request);
+        qtest_add_func("/device-plug/q35-pci-unplug-json-request",
+                   test_q35_pci_unplug_json_request);
+    }
+
     return g_test_run();
 }
-- 
2.31.1


