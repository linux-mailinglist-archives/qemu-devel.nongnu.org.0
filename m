Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E2E2F9C29
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:04:55 +0100 (CET)
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RP4-0001vf-5s
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R82-0000ia-1n; Mon, 18 Jan 2021 04:47:18 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7z-00012t-CC; Mon, 18 Jan 2021 04:47:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9ECBA5C0127;
 Mon, 18 Jan 2021 04:47:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=M+nCutViCTsgO
 oWxdS9kDkP6sQwRI0r8lct6X28FAog=; b=dbX5pE3neo5bgyGLheY/BDACl+kAZ
 jDljEZ9DKxk9YXPBrBE18HE6+u83Ku15oXZLniINFWMbzBbVCAJWrADzqlzwwMF8
 n1eCYRBlcwuxWRnT9XrniwFnhxL1CYFe0GLag79NshZBMnK/ugOK/6Zes2Towayf
 hmxqVy3mgjY8a+1KcNdmBR2oXkVen6skoUR5ssMtbDWLVGGR/WnmRGyvDfve/Jz9
 FAX2PpGBu4TbXLB3Xet9spr06nKi0p0h80eyykMo1WTBOg3ss299Kvh3fsVSNjYs
 5DpDN40EOmZuZruBwMRd5DrUgpPL0Pr8olQFikJl7yEiQc0B9BVXrOV6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=M+nCutViCTsgOoWxdS9kDkP6sQwRI0r8lct6X28FAog=; b=oYXE9ou6
 QOBuwCySNBSjinExwD5XfbJCCZOPVRi+4xGcHKFU2MVJsl7f431jELjmdHTy9Q9Q
 HVjsoZl0XKNg8LKJYGFi+9AyJt48pfSo2RAyYA2o5u+gzsXWOxzzvF8qWLR8X6Gs
 hqTrxcRQdiFqSLMxPcK8SUildVR7HvJTXrjG/JaCcQ7SJzefzU7rNSeY/rl7KZZm
 Y/OZ3SFy01We5pFfkqls1OlaKqLrPfohKTQycH7OwY+1mfyBL9wEjwRXYO8JKWlW
 2dYkn03jEItPpaJolPjFp+lgyAulkEMG8i8HW7ibmTvKSaXDvKj1jKjuC1nPQLsJ
 ztVaKlRrB6f44g==
X-ME-Sender: <xms:IlkFYMakSCZylkhp1xZ6ePpbc6rNwpXxnH0FTFFTQrng7c7FJIUvrQ>
 <xme:IlkFYHYodnObhmnaVb13IW7mBdpu2oIPu8IBx0tyk-KTx4ovBNwdljAJx8TcdidoF
 9OpMU9GG3HKjuCzOpU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepgfdvteektedufefffeekhfejfeeuleevkeduieeifeefveffhfegueejvdetfedu
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:IlkFYG-W0ektKaW5j3bebCHp3UngwI309EGgiprQZ1YuStrcNUmoyQ>
 <xmx:IlkFYGoznBDibmH54AsDwH4oa47vvrk2moOjc55feC6FKsTzbwGKlA>
 <xmx:IlkFYHrkrvbMoTsNcfWlwOUaRN4EId5zznY6FjhCQmDgGPxVfB0bJA>
 <xmx:IlkFYIfH4N6tdgf2f_n3aqKd26hatFkylBtK2KmrLKDciPCDA7MDtQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E98D24005A;
 Mon, 18 Jan 2021 04:47:13 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] hw/block/nvme: move msix table and pba to BAR 0
Date: Mon, 18 Jan 2021 10:46:57 +0100
Message-Id: <20210118094705.56772-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |  1 +
 hw/block/nvme.c | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 65540b650e1d..2a25bc84f3f9 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -126,6 +126,7 @@ typedef struct NvmeFeatureVal {
 
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
+    MemoryRegion bar0;
     MemoryRegion iomem;
     MemoryRegion ctrl_mem;
     NvmeBar      bar;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 606006c549bc..ec2104fcf3b6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4230,6 +4230,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    uint64_t bar_size, msix_table_size, msix_pba_size;
+    unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
     Error *err = NULL;
@@ -4248,11 +4250,28 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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


