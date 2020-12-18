Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127EB2DE384
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:53:23 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGC9-0000fZ-Ua
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFp1-0003WZ-UX; Fri, 18 Dec 2020 08:29:27 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFoq-0002u3-T8; Fri, 18 Dec 2020 08:29:27 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id EFC65917;
 Fri, 18 Dec 2020 08:29:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Dec 2020 08:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vqbhskpWMx7Q0
 iG+nffD6pOJmmg47tfLLChG4xysoUk=; b=e0uODoCOITCP9oLznDbxa4qpWgjwg
 Usyxq+Yq87h7uukcgy9jiEcwuHj2fgT8cdpccxz4pxe8dq9Z+LBTp+0hEesTJGHM
 oXmW9TZSqFT4yRa6aE4o5sFX7+OYhMftTJL4NPKSDc+f5A6iiFAX4Xa49i2aMdJ2
 ecmGEE5l39x8W9m+XYcvSN1oBh+MZ19/CsC6pJht78LeU2aQIsqbHLZJUXCt3Y0n
 WHlQmWSIMfeUntm2boooHPiXOXBw0vhaOcYxzfU+ehyCn0hKrx8lHCGW/+9Au4Lh
 WdId7Fk9WpHr35ynX9qdQ/DV7Z30sVRj9p5FFaLIeRrc0ia/D7tvhs3GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=vqbhskpWMx7Q0iG+nffD6pOJmmg47tfLLChG4xysoUk=; b=LIYhvQGk
 D/Yg43AI0fRA+YzRZqStrNfgMuT0ySC7Z4iH7/xD8NJjHtKVGDML7WQKFM+K3qkq
 8p7PyKtU2jnptDhhSCTFEEMsFrvM5MI0QM3ZDLYz3puwV6DPB1X0Fj5GJrCbfUlP
 akSa8apqX0aIyZ7QOU4A3TH8sWslx2d/X9yn1PWRM/09YcNIGifsxdkojx/wSldQ
 MuPTIzYEOIgaKEmDYFBnyjG/2aH4JsA+G/STaPBp1HZXWLJptvKD9FbFrNW5kBHg
 LJycgH0s1ccgiVDDZYfebbxRAr1oIFARFKds5ge03MY1dM0Dy/m2Hxc8Rls3fpEy
 34FbK36o2rYZow==
X-ME-Sender: <xms:p67cX3vKh6sKFfg89DZLW0t4D9KpFsKnE_HcKZTntkbg8ppHJodTNA>
 <xme:p67cX9pGXoSZ8RtqPAu7VNA26OQyLcSP0RC0NEH8JDJbmtJkH1pMbOl3jSArcq3QP
 yMHFk_3Ld_Q-CmkLAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgvdetkeetudefffefkefhjeefueelveekudeiieeffeevfffhgeeujedvteef
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:p67cX7oEfE0e0G-8mTBZdQDU-PB2HbD_1ZLA3ohTMDV-XR8dB-Q6cg>
 <xmx:p67cX8ZvSJQPCzIJYme2o91Max8-Nfkt6xRIBfXx2_-ssqJHReRvlw>
 <xmx:p67cX59bfyjCQHj3ksp53QszTYn_Fl96LkxvhezU62XCmI7l8NBtRA>
 <xmx:p67cX937gotJ8cMM6NCTzkahMsgYovblBu08BZlUAzB6GcA2CZYk9A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A26624005B;
 Fri, 18 Dec 2020 08:29:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] hw/block/nvme: move msix table and pba to BAR 0
Date: Fri, 18 Dec 2020 14:28:59 +0100
Message-Id: <20201218132905.967326-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218132905.967326-1-its@irrelevant.dk>
References: <20201218132905.967326-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In the interest of supporting both CMB and PMR to be enabled on the same
device, move the MSI-X table and pending bit out of BAR 4 and into BAR
0.

This is a simplified version of the patch contributed by Andrzej
Jakowski (see [1]). Leaving the CMB at offset 0 removes the need for
changes to CMB address mapping code.

  [1]: https://lore.kernel.org/qemu-devel/20200729220107.37758-3-andrzej.jakowski@linux.intel.com/

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |  1 +
 hw/block/nvme.c | 24 ++++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 574333caa3f9..b1b273ce535e 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -118,6 +118,7 @@ typedef struct NvmeFeatureVal {
 
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
+    MemoryRegion bar0;
     MemoryRegion iomem;
     MemoryRegion ctrl_mem;
     NvmeBar      bar;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index fe809195a08a..8a7f682cb3ab 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2952,6 +2952,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    uint64_t bar_size, msix_table_size, msix_pba_size;
+    unsigned msix_table_offset, msix_pba_offset;
 
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
@@ -2967,11 +2969,29 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     pci_config_set_class(pci_conf, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
 
+    bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
+    msix_table_offset = bar_size;
+    msix_table_size = PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
+
+    bar_size += msix_table_size;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
+    msix_pba_offset = bar_size;
+    msix_pba_size = QEMU_ALIGN_UP(n->params.msix_qsize, 64) / 8;
+
+    bar_size += msix_pba_size;
+    bar_size = pow2ceil(bar_size);
+
+    memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme",
                           n->reg_size);
+    memory_region_add_subregion(&n->bar0, 0, &n->iomem);
+
     pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
-                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->iomem);
-    if (msix_init_exclusive_bar(pci_dev, n->params.msix_qsize, 4, errp)) {
+                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
+
+    if (msix_init(pci_dev, n->params.msix_qsize,
+                  &n->bar0, 0, msix_table_offset,
+                  &n->bar0, 0, msix_pba_offset, 0, errp)) {
         return;
     }
 
-- 
2.29.2


