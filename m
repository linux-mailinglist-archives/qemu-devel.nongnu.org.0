Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC32C0077
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 08:07:57 +0100 (CET)
Received: from localhost ([::1]:44068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5x5-0000OO-Hr
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 02:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p4-0005Lp-TV; Mon, 23 Nov 2020 01:59:39 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p1-00074O-9z; Mon, 23 Nov 2020 01:59:38 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 15C7C5C00ED;
 Mon, 23 Nov 2020 01:59:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Nov 2020 01:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=N3p7b+eaepcdO
 GHyDb1kK5Ul+r8Obs7cktXQq7OuR3Q=; b=LJXskbqqsubQc7BP5mDzwwEfBm43+
 9h5MTaDhCmY0eqgIqpVWh35e9dqvhWBajDlm+JtessHDkYDEuT9T/8beWJ8nk0KQ
 0JOFVmhThlrcS5kJBIViOT0NmGUQCclk6UVT5sx4qSt5LkWgLH7txluXXFrAk6VU
 ysYsywqsK3IdVy5OVCCWbTtPwkO3gkjSIB8WR/bDnGe0l1djDu/m29rSyz3zY4qV
 220Ogg2tRxcHoccbKzpY2l9pk9kGMl8R1llIHLNcTr25GjxukDLSjbRMAxSuPEB1
 1xw54xMqxFTMeQs73+mgXs+P0vLYdc97EN4vDZ+izgtxvqNfFipjbiE7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=N3p7b+eaepcdOGHyDb1kK5Ul+r8Obs7cktXQq7OuR3Q=; b=FeM6H+/o
 Fr+R06F7cU7+915XaqrfISTou9724Czl4RUBjY3ZR8gFqtXmJpvlGS2kvWCRhdmB
 T3bRf1/5Nv6sO9Q4YIwQDDJAapIFHZ3vWF/wH562CV2blA8Zv1M08/59dtgUaOkx
 YIMBZ2z31LG9X4F/IHHi7SzmJfYXsBwReaYUytW93WkYusxXwjc3ZsryHgK3AFjQ
 o91p/bRaOytP0X43ucUVEvhZrXCJRTIQGrkC5GxyXs1YzYNP80wZBFwU4Kp2AblW
 dQqLlMlcGO2hfua5eXzW7uhcSfst9jftrYBjM2dxHylPpnN1Ap5iAoYCdV7vCGUB
 e+7jsFC7WoyHLQ==
X-ME-Sender: <xms:1F27X6IaySOXAihBMo2raqw6IQVG8UeAgopwUv2fAfRJRiuXs5bwSg>
 <xme:1F27XyL_2zs0QwKUKUqqEGqqN2tFZ26r92vVQgQYkRF9vVp80-mxh8XYeDWn4WHAf
 F2dC6UACO5mfee8-Is>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgvdetkeetudefffefkefhjeefueelveekudeiieeffeevfffhgeeujedvteef
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1F27X6uFnMq9Qm6-J2KR7Bn3pLfYb5vc9US0UcTnN3ifnE9Bl5Hfew>
 <xmx:1F27X_b3Q60o_F7_BGWsimaZvMEBOW4JY2gKtGie-e51Vh3CDimu2w>
 <xmx:1F27XxZcw_27_rXSzzg80uSBzsWIWgUaojRqX6QVmgQInsALpM9qWg>
 <xmx:1V27X0zH4Wr8DFyCqyAuLlbaTQFCspvTVeftFXFIUZn_24YeJt53yg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CCDD13280066;
 Mon, 23 Nov 2020 01:59:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: move msix table and pba to BAR 0
Date: Mon, 23 Nov 2020 07:59:26 +0100
Message-Id: <20201123065927.108923-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123065927.108923-1-its@irrelevant.dk>
References: <20201123065927.108923-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Keith Busch <kbusch@kernel.org>
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
index e080a2318a50..b7b42e70f97f 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -116,6 +116,7 @@ typedef struct NvmeFeatureVal {
 
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
+    MemoryRegion bar0;
     MemoryRegion iomem;
     MemoryRegion ctrl_mem;
     NvmeBar      bar;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4c599159f533..db8c5ae2f527 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2660,6 +2660,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    uint64_t bar_size, msix_table_size, msix_pba_size;
+    unsigned msix_table_offset, msix_pba_offset;
 
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
@@ -2675,11 +2677,29 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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


