Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC763D6781
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:31:52 +0200 (CEST)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86KN-0005N4-H2
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868Q-0004fK-90; Mon, 26 Jul 2021 15:19:30 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:41785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868N-0007n0-OJ; Mon, 26 Jul 2021 15:19:30 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0045A580411;
 Mon, 26 Jul 2021 15:19:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 26 Jul 2021 15:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Zu/rZACoGrJMQ
 vsq5CXXPNYtt/8U/uQ6Gucb6dmydZA=; b=XuzEI/+wLfztVg5p/EC2y5SPB/Tf+
 EbMMSEDrc6lQYZOMu1yQuQYjV0jlXzuig/xTkIhA5bYRc0EMiHrZ/+0AVFsfCAtJ
 KjuJnYif502smO0pTaYu+Ca1DAOJDZQ1/laqS2xKU1U5xM4FoPnpBC01BWGcIIq8
 DRS74FTA67lguayZB6T1p77tVXP8GkPaJA/Mxaw9IJeL5fBuFPSXUTX+9wC7vD9L
 Gb4mV1QvsP4LNhAlAoSjGo5NRXI/xiVysYJVqQDd3lZJTXN6p1TAXqmUG6O2TzAa
 otHm6FVOLOhQR+LM7TCBH/smYHzCJ+2fp9Xl3flOdSD2ErD0zlAzmzWCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Zu/rZACoGrJMQvsq5CXXPNYtt/8U/uQ6Gucb6dmydZA=; b=CM1KVaLS
 c9BWPMBY3lAJDQ9qOQV0xkPe+TCJuf5qIp2vGk6HsCf3CS7v2EN+VyJz+smxfRvf
 XNiHQXhZNjf4pjBPZfdPqvkN55a2iOn/kw24QSsbo1JxrEB4z2AG/CNvC1e+t9ML
 OprBbWw1j1wC/HS67bfiXaSmoqPr5c26RHbiIjVXwz5i7mb0qhl6I49KHWNiqJTt
 +M7HP4zSlovYpV3iZeXafzORGPeV9IiTL4pRy+CtE3+hUIAqk2Zmm81Gzshlqnbq
 ieN0JIGff0b33ui0L/2lffVQZRjcZLfcawu21HXCVmPN5Zg15SMXmyvCvo4z3+0b
 Jb/R8kbmwD9uvg==
X-ME-Sender: <xms:vgr_YG4nQ-5P2TxxsfcBz0hZXuZdumZ5GzDEto_rc6jQJu9ekWJQ-A>
 <xme:vgr_YP65Ys3dmST9BTEQC_JqYLaJvWaEJE7N1_2QKcU-YnU9MH2D41QgfFuGZJ9D-
 no1kPZg9rSU0N3W3mI>
X-ME-Received: <xmr:vgr_YFe9q9dYYGAhNmFUa038tc1cU0cT52fxNufgehusiqWw_qEplZOA5iPcPbH3mL6MWJsybbPib5qBtNWdi3kqKLcA8huVetZoalhY3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vgr_YDI0U2PRHh8FPzks9YnSwjcaUW7NMCCDnPSsmDpQBAFqHauiwg>
 <xmx:vgr_YKLprcGA5YnMpU67A7nrHrfEDPCwoM8XqsakGu-afpzDa-i95g>
 <xmx:vgr_YEyiMhXTldzyQYsJJsTgrr9PEi5GNhN0c8xEZjRE-zs6Wv_BWQ>
 <xmx:vgr_YMCwRcP7eVOV0lqnIgEUamaEJDTfFEFSemSBRbU1TmD0ttGBSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:24 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 05/11] tests/qtest/nvme-test: add persistent memory
 region test
Date: Mon, 26 Jul 2021 21:18:55 +0200
Message-Id: <20210726191901.4680-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726191901.4680-1-its@irrelevant.dk>
References: <20210726191901.4680-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
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


