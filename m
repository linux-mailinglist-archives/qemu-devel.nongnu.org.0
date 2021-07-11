Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E193C3F4F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:48:15 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gN4-0003uT-Mz
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3W-0004Nb-M1; Sun, 11 Jul 2021 16:28:02 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:58475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3U-00031B-Sp; Sun, 11 Jul 2021 16:28:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 09D5132008FA;
 Sun, 11 Jul 2021 16:27:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 11 Jul 2021 16:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Zu/rZACoGrJMQ
 vsq5CXXPNYtt/8U/uQ6Gucb6dmydZA=; b=DlW34C9OfDZZbxurt2Q4QQOwhjNcq
 3pLF3xbRwb0OhBA0nNG+6GqtArDXOfdzt2H0G08H4le7CVAu/5XJPfEYIz2ohxB2
 BVF0sSCk29JYS2EYP7EKzIpj80WZKAUat9PVi6AfU7q0lfaKH7PV/l0JZAYvlhW+
 FvvUsz2+emJHLL27rPEed0hSnCCjIhUMdBlP4lgegzQRaCXmm0hak2A1rD4h+3JE
 j2cpCG1YBvvhyacDLq36apsT0JzB2y2ECKaBqtBcD4AmQ53edNFf7KsRL/ns7v0e
 BvVXJvgqY2tnrrGR7SwGbXuzyLpV26c4xfdQLRvxf6qHcHONFOV0+9QTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Zu/rZACoGrJMQvsq5CXXPNYtt/8U/uQ6Gucb6dmydZA=; b=NKHGC0G+
 fO3bFx/bzIngPmf7pT1x1T9+jjJ73D4d1U0KTOiLZd4kX2YMOa9tFGs3E1WItKFm
 Jb+s+1aff3K6oJIZqDfrdmZV0uzM9PocSqPioPi/uW+3ggv9OJ06LRjLuMoymA41
 xrj+/uO0dNps1YTYA10B/9kZEXVrpwAZoSNm4ugwmG/l6oQyeSnKn58jg3GDptsu
 8DEJbKcw6nNqUA6jg2q1a9Lx3WO/qh+t/sQOe0aOIla82wGQszbh33hl8wNVKEYf
 2kJ4qQRx+xNT2anKVWNtZ+H7WQa8zN/hKGPuo3Dz50wn7ACj0O15sztaJxWTtLZx
 NRrDudNuRpik4g==
X-ME-Sender: <xms:TlTrYL4xaGafPoBaITmuZR4OiK3xhE7X50JhKbVSFUDYsBLq2JLxXQ>
 <xme:TlTrYA7-Kx63jMzMQ-QyYbvbWakwuenFV0bVIQA39Z7UimM5Ux1Z3CSq0iqcWNLRg
 dsOZn93wtmdxbMRAo4>
X-ME-Received: <xmr:TlTrYCcYRK-jh4hXqBbX4O9fPFNAk0nNFd6xRbjhGnUQhfxw5dyfiqwRwdDGCjmx0ejRA4LnRJ5OVfvAp-LLw2_X5zzklMl9DpTJRDOo3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:TlTrYMK-iCiGcWOZQGgQqd6mwuxF70DbdY1JfL1FbSMnPax1sTGwxw>
 <xmx:TlTrYPJIt3D9_Oi8VGBqFpeNtPihkSYSv4ljGtdiK9EsVNNFqGFAdw>
 <xmx:TlTrYFwXkkXv7DYGZeo12XXO1YKh-Qbr0X3bEg8wy0oTTZdDXyt8Qg>
 <xmx:TlTrYFiUMQEspmwexxXbP57PScWTrk30d-RrLkeX1qSZy6WcTHI4BQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jul 2021 16:27:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/6] tests/qtest/nvme-test: add persistent memory region test
Date: Sun, 11 Jul 2021 22:27:35 +0200
Message-Id: <20210711202736.591334-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711202736.591334-1-its@irrelevant.dk>
References: <20210711202736.591334-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

This will test the PMR functionality.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
[k.jensen: replaced memory-backend-file with memory-backend-ram]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 tests/qtest/nvme-test.c | 61 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
index d32c953a3824..47e757d7e2af 100644
--- a/tests/qtest/nvme-test.c
+++ b/tests/qtest/nvme-test.c
@@ -13,6 +13,7 @@
 #include "libqos/libqtest.h"
 #include "libqos/qgraph.h"
 #include "libqos/pci.h"
+#include "include/block/nvme.h"
 
 typedef struct QNvme QNvme;
 
@@ -66,12 +67,65 @@ static void nvmetest_oob_cmb_test(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpint(qpci_io_readl(pdev, bar, cmb_bar_size - 1), !=, 0x44332211);
 }
 
+static void nvmetest_pmr_reg_test(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QNvme *nvme = obj;
+    QPCIDevice *pdev = &nvme->dev;
+    QPCIBar pmr_bar, nvme_bar;
+    uint32_t pmrcap, pmrsts;
+
+    qpci_device_enable(pdev);
+    pmr_bar = qpci_iomap(pdev, 4, NULL);
+
+    /* Without Enabling PMRCTL check bar enablemet */
+    qpci_io_writel(pdev, pmr_bar, 0, 0xccbbaa99);
+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), !=, 0x99);
+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), !=, 0xaa99);
+
+    /* Map NVMe Bar Register to Enable the Mem Region */
+    nvme_bar = qpci_iomap(pdev, 0, NULL);
+
+    pmrcap = qpci_io_readl(pdev, nvme_bar, 0xe00);
+    g_assert_cmpint(NVME_PMRCAP_RDS(pmrcap), ==, 0x1);
+    g_assert_cmpint(NVME_PMRCAP_WDS(pmrcap), ==, 0x1);
+    g_assert_cmpint(NVME_PMRCAP_BIR(pmrcap), ==, 0x4);
+    g_assert_cmpint(NVME_PMRCAP_PMRWBM(pmrcap), ==, 0x2);
+    g_assert_cmpint(NVME_PMRCAP_CMSS(pmrcap), ==, 0x1);
+
+    /* Enable PMRCTRL */
+    qpci_io_writel(pdev, nvme_bar, 0xe04, 0x1);
+
+    qpci_io_writel(pdev, pmr_bar, 0, 0x44332211);
+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), ==, 0x11);
+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), ==, 0x2211);
+    g_assert_cmpint(qpci_io_readl(pdev, pmr_bar, 0), ==, 0x44332211);
+
+    pmrsts = qpci_io_readl(pdev, nvme_bar, 0xe08);
+    g_assert_cmpint(NVME_PMRSTS_NRDY(pmrsts), ==, 0x0);
+
+    /* Disable PMRCTRL */
+    qpci_io_writel(pdev, nvme_bar, 0xe04, 0x0);
+
+    qpci_io_writel(pdev, pmr_bar, 0, 0x88776655);
+    g_assert_cmpint(qpci_io_readb(pdev, pmr_bar, 0), !=, 0x55);
+    g_assert_cmpint(qpci_io_readw(pdev, pmr_bar, 0), !=, 0x6655);
+    g_assert_cmpint(qpci_io_readl(pdev, pmr_bar, 0), !=, 0x88776655);
+
+    pmrsts = qpci_io_readl(pdev, nvme_bar, 0xe08);
+    g_assert_cmpint(NVME_PMRSTS_NRDY(pmrsts), ==, 0x1);
+
+    qpci_iounmap(pdev, nvme_bar);
+    qpci_iounmap(pdev, pmr_bar);
+}
+
 static void nvme_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
         .extra_device_opts = "addr=04.0,drive=drv0,serial=foo",
         .before_cmd_line = "-drive id=drv0,if=none,file=null-co://,"
-                           "file.read-zeroes=on,format=raw",
+                           "file.read-zeroes=on,format=raw "
+                           "-object memory-backend-ram,id=pmr0,"
+                           "share=on,size=8",
     };
 
     add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
@@ -83,6 +137,11 @@ static void nvme_register_nodes(void)
     qos_add_test("oob-cmb-access", "nvme", nvmetest_oob_cmb_test, &(QOSGraphTestOptions) {
         .edge.extra_device_opts = "cmb_size_mb=2"
     });
+
+    qos_add_test("pmr-test-access", "nvme", nvmetest_pmr_reg_test,
+                 &(QOSGraphTestOptions) {
+        .edge.extra_device_opts = "pmrdev=pmr0"
+    });
 }
 
 libqos_init(nvme_register_nodes);
-- 
2.32.0


