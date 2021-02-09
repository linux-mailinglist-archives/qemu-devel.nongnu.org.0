Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41942314AF1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:58:16 +0100 (CET)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Oqd-0000mc-8E
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWA-0005bA-51; Tue, 09 Feb 2021 02:33:02 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVx-0005rO-Hl; Tue, 09 Feb 2021 02:33:01 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6B315A57;
 Tue,  9 Feb 2021 02:32:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=T6W9+4+GicdhI
 iPeM70Uc20DCsX+5R2gUqqWn6DkBcA=; b=MQ07ApQty9vwRXKPkqavszjmtWp6O
 c2l6DA0J1woE0KklrUNl5Gd5uLxwj/DLxOQ7e8U1PCTIj+sltkmjczWv+WISCQ4Q
 OjWfNW1TpZVqC0JrCOg9jErmtIaBx0VKcz/QdFQdiQK26Mew3hwEGOUIVhDZti2L
 jBrNX4Mcsrq7jLDLFznsedLK/HxcvMlP4rngyCoixdF5Jc2MBzGBEf7X3QCut7hq
 yyGBBBrwAhdSt0zbi6eqfPCL2QFxYIseWfUyoKejzb3BQRdIbE8/oix3FxNCx427
 IRRZEFJWLe0i0ev/9rgt0NvCIr0H83/WJFapoJd2GuXnwVDmksVwk5bCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=T6W9+4+GicdhIiPeM70Uc20DCsX+5R2gUqqWn6DkBcA=; b=k8w84X3t
 GuorNCgkWqaUGVithR4yavIlCz4V++/JcYRhwKB4LwQ4tO4s4Z7A8JFQI43+/Jqc
 7F/VfvU0np2MCKVGJNQcDCdWIj4ibmHfKa640ITjnvwKxYXVXcnSJduKPbpJMVYK
 nMs0ZPlC9ZDPhPdXr5DlCKAMriiai16AlRP6yOcreMqvRfFm4tnSP1tSgWQGQPdL
 A+XeBLeAr/BDNBJwtlSO03BFYppt4alZMFTwMvq0FaCjLj/xZ7oYFTpGiLBrTk+f
 9Z9mRMSeoVaXb8BkyND1OJ0CnlJJcHppLes9cw/yqwKwW3KSlKXPqp3/N1QqJVOS
 C4XSYcAYb2/OrQ==
X-ME-Sender: <xms:ijoiYGQAFTfNHlpP-jSMFIQ7NfgvcWn-4M1owXrNEr0stReb--jm7A>
 <xme:ijoiYLweca7Oe_4Z37xh4eK0QFfiSOTWhZNhXuYiXwHghj99qzukXs2d-zC94bqoy
 e2pIutLolrKQLkI16U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgvdetkeetudefffefkefhjeefueelveekudeiieeffeevfffhgeeujedvteef
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ijoiYD1WdzxccSJrdftWz0G5smDCAhAjARnkTgFdCujnwuVA34jxHw>
 <xmx:ijoiYCDyaaFp8agMBSQG6JXb4e3Fs4C7fdS6kfAVTcKtccb368x0bg>
 <xmx:ijoiYPibaBubqztiJr2pREkx_ikVP_1ubgBZf6zaAdlOxLOnxhGtUg>
 <xmx:izoiYAVITHTlHSxntaK_FAtXod8jfR9areCV5AtQRoBLLlsAf83qBfr8A7Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 963041080057;
 Tue,  9 Feb 2021 02:32:25 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 41/56] hw/block/nvme: move msix table and pba to BAR 0
Date: Tue,  9 Feb 2021 08:30:46 +0100
Message-Id: <20210209073101.548811-42-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In the interest of supporting both CMB and PMR to be enabled on the same
device, move the MSI-X table and pending bit array out of BAR 4 and into
BAR 0.

This is a simplified version of the patch contributed by Andrzej
Jakowski (see [1]). Leaving the CMB at offset 0 removes the need for
changes to CMB address mapping code.

  [1]: https://lore.kernel.org/qemu-devel/20200729220107.37758-3-andrzej.jakowski@linux.intel.com/

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |  1 +
 hw/block/nvme.c | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b0d5b6409d8e..1cdb360bc549 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -125,6 +125,7 @@ typedef struct NvmeFeatureVal {
 
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
+    MemoryRegion bar0;
     MemoryRegion iomem;
     MemoryRegion ctrl_mem;
     NvmeBar      bar;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5f12ac1200ec..85d3c43c4f74 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4268,6 +4268,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    uint64_t bar_size, msix_table_size, msix_pba_size;
+    unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
     Error *err = NULL;
@@ -4286,11 +4288,28 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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
-    ret = msix_init_exclusive_bar(pci_dev, n->params.msix_qsize, 4, &err);
+                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
+    ret = msix_init(pci_dev, n->params.msix_qsize,
+                    &n->bar0, 0, msix_table_offset,
+                    &n->bar0, 0, msix_pba_offset, 0, &err);
     if (ret < 0) {
         if (ret == -ENOTSUP) {
             warn_report_err(err);
-- 
2.30.0


