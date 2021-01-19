Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CA2FB556
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:27:56 +0100 (CET)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oEt-000835-Q5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2g-000229-Ii; Tue, 19 Jan 2021 05:15:18 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2d-0004Gx-Vg; Tue, 19 Jan 2021 05:15:18 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id D3B65F5C;
 Tue, 19 Jan 2021 05:15:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 Jan 2021 05:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ynurTCYdiZZ+D
 1wPIWGL2NzMoOmewCdrrXbPLvA7ACg=; b=J+xzkVrFy3Xdeg0znLbL+t8tGN/9C
 lSwFRBUuq/X1BWH/+AqLKoM01FazJsxpPxVLFUKIHW+BFguuMo4IysfckQ962SoW
 pFREsS+ouGvpIvs5C2Sq5aCrWVI7QLqEOhRDqAauUBVVzQ6zofGyYJXyTKmyH8e8
 CGcpqaf1Qw13WNr0nv798peBasDKe61R+mSvZ1w7bN5fEBwXg1W617pmIMXmGKn3
 +sHIEG9wGJcvSpWcG2wLnxfK76kSu7v4uMVxYtl4T+Uuiu01mPBKcSlNeqQumP/Y
 pj5qkgP15955O/jZ9Rk6jfzNQ7V6HqDD1UQIaAjeT7pqDfFi6LaNVj7aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ynurTCYdiZZ+D1wPIWGL2NzMoOmewCdrrXbPLvA7ACg=; b=ct1IFGt6
 ToUtoXwujMj62GtWyAE/FtXkZQKeR0ICfIDRx+iQ70FiCLOfD8FNxtB/+EzNtNSY
 XezPBc7AaSDyBXRy+LU4NJfYmgx0zCcMyp0uRK57BkqgRXz9J24nWXv6G7+uopXt
 ZG0ME70l8JXI2MofskxPFFJcTfZGJuP6fgRFg0gBkXA9N+2QzLbXjaUctrHOJMeI
 JALBmn2yk+uSQSom6ag0W9qdvlT6pKLCNA5Vax1K0uu1ehKsozPic0aahbXylcRY
 mEPJkhouZesEw+Hu7cLfwRP89/y+ACAGO0HuIFfQzkbJ/YsuU5Z9E2h3M9jS7zlz
 kuxzIpXIoRQJ8g==
X-ME-Sender: <xms:MbEGYKoac0-lvFGrn_vm1x4dajzQ7Yoz6SZORQBk5kLzowHfCXzDqQ>
 <xme:MbEGYBRa_TXEcGTsQ7J36_uDLoPyDOBO8o4O5_hoSBW1xbQ08XHBM2ekHNhhRn0SV
 YBECiMmkv7HCbT3IeE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepgfdvteektedufefffeekhfejfeeuleevkeduieeifeefveffhfegueejvdetfedu
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MbEGYGolIvVMhlpdhyl3ClRRnsHY54nSv2R1uq5WbX_x2ZoHXzoyLw>
 <xmx:MbEGYD1FqkbFdwbi-2iROFsYR5lAfErK6UmFckx9Mtc40N04ZEpzmg>
 <xmx:MbEGYN6zIYirJ2mZmnZ8iyDUxft3YOeXkYW0MYK2xrTWVYlLFxoKXQ>
 <xmx:MbEGYGqKcw2k6wtZ3LvG1B3HfKQK3lSn58dNBBy0NPkNnypB9bhWMw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B5C224005A;
 Tue, 19 Jan 2021 05:15:12 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/12] hw/block/nvme: move msix table and pba to BAR 0
Date: Tue, 19 Jan 2021 11:14:56 +0100
Message-Id: <20210119101504.231259-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
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
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |  1 +
 hw/block/nvme.c | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 347c149e7905..e5d2cce207f4 100644
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
index 3168ba5114ed..65813f6461cf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4239,6 +4239,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    uint64_t bar_size, msix_table_size, msix_pba_size;
+    unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
     Error *err = NULL;
@@ -4257,11 +4259,28 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
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


