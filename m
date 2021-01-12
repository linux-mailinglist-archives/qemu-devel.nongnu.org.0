Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092C2F2F83
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:57:35 +0100 (CET)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJEr-00078b-TQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzJ51-00016B-Dl; Tue, 12 Jan 2021 07:47:23 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzJ4y-0002iw-Rw; Tue, 12 Jan 2021 07:47:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 16F0E1A83;
 Tue, 12 Jan 2021 07:47:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 12 Jan 2021 07:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=GwFNX6vHdud+NWH4setQSvBaz9
 8JQFPV8+ZmgqcWzac=; b=KuOJ6OV+CUFDqz017+NO+dlvKFNuQ10UehKlEv7f6i
 qiZ4XePZuRCLHtv8YSztf3j/BB+sIHIpSuBUVsOzWrBewq+/W6XLC0mMdAe0mEMW
 vedvx72HkevHyQO0E7nXYpTrbNsmevK2uZefr8KkPPxPWtaQnKqASlpRU+8yz/Z2
 Bb4akMYG2OmrBAw2N6fsb8zuuNUk7U3SdBtUu//7/fMnxgdxgjPfhOnfXssvc3Yb
 TyNv1i6zodZQBz7vnIvxeAiAlR7ivfSdmUDsvEmVP85bl7areBSHMpWH4Rj0X1w+
 98xswEjOMNW14VC+xxcD5+sR8B1Y4Vwl29XYn8vmfriA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GwFNX6vHdud+NWH4s
 etQSvBaz98JQFPV8+ZmgqcWzac=; b=XW8Fc7qjjHrWmrgDADitPttfYSxNOBV9S
 Teg87d2/qDS1ODkRVEp8jn0sWuc/J02Sa6VEAggafcec195CHMs8xRlLzeGnGJzF
 1xpLd/r2HgpunMR5vMPa9bfZZ2xsOmebK3HJYKjfjZOX+OQLDAaqFzyYX+Bice/M
 w6SDmva4+Oo4re+XLDeW8NQXJV6lJDCRcX+NEEIs3PV9oUy0uUy1Q9jHYUvvw/9+
 Kv9JnruuFZ2JNINB78no5nolRWqoS0/i3X/PVU7KA0l7C8rqWFqTYt9qH8cnsFXt
 55YvJ64kPJa2s2wgAlr4EE8kfzwotibSAqcidcHx4azG6HiuVYgpA==
X-ME-Sender: <xms:VJr9X7m8bdyVai4c_N_o8kZ76t6Vm2JC6_SXqR2SMaOzqjnAH24r0A>
 <xme:VJr9X-2sySK7kvUCgW_Q_Rfo1tMeGhPqO_oSXiFxZMpPeMalGwH3Fld6OiBbkAWzk
 BRQEcMAVJp46pljPrY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epveeltefgtdevhedtvdduffetvdevjeevueffheeltdfhfeffjeejveethffhjedtnecu
 ffhomhgrihhnpehquggvvhdrihgunecukfhppeektddrudeijedrleekrdduledtnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhr
 rhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VJr9XxrnF-l57KHQPfsWCBdo6vnpGMkgXrZlf6o45M0Qt5bn4cI2Sw>
 <xmx:VJr9XzkuqpXqtaFlcuTTFCfex84p5oL7jHAuZ0ff8-4ol43lQ-UPFA>
 <xmx:VJr9X52ozOU7IlogxokXxBdz7HkSYDWHdhI037Njfr3yukj-QlUo1g>
 <xmx:VZr9Xx-aMHmyOTinhd-gcuLy9ZmJxNKJtlANZz8JnvONEhs2LLtNyw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DCD5C108005F;
 Tue, 12 Jan 2021 07:47:15 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix for non-msix machines
Date: Tue, 12 Jan 2021 13:47:14 +0100
Message-Id: <20210112124714.220657-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Commit 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar()
return value") had the unintended effect of breaking support on
several platforms not supporting MSI-X.

Still check for errors, but only report that MSI-X is unsupported
instead of bailing out.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar() return value")
Fixes: fbf2e5375e33 ("hw/block/nvme: Verify msix_vector_use() returned value")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0854ee307227..cf0fe28fe6eb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2590,7 +2590,9 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
     n->cq[cq->cqid] = NULL;
     timer_del(cq->timer);
     timer_free(cq->timer);
-    msix_vector_unuse(&n->parent_obj, cq->vector);
+    if (msix_enabled(&n->parent_obj)) {
+        msix_vector_unuse(&n->parent_obj, cq->vector);
+    }
     if (cq->cqid) {
         g_free(cq);
     }
@@ -2624,8 +2626,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
 {
     int ret;
 
-    ret = msix_vector_use(&n->parent_obj, vector);
-    assert(ret == 0);
+    if (msix_enabled(&n->parent_obj)) {
+        ret = msix_vector_use(&n->parent_obj, vector);
+        assert(ret == 0);
+    }
     cq->ctrl = n;
     cq->cqid = cqid;
     cq->size = size;
@@ -4159,9 +4163,12 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
 }
 
-static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
+static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    int ret;
+
+    Error *err = NULL;
 
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
@@ -4181,8 +4188,14 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
                           n->reg_size);
     pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64, &n->iomem);
-    if (msix_init_exclusive_bar(pci_dev, n->params.msix_qsize, 4, errp)) {
-        return;
+    ret = msix_init_exclusive_bar(pci_dev, n->params.msix_qsize, 4, &err);
+    if (ret < 0) {
+        if (ret == -ENOTSUP) {
+            warn_report_err(err);
+        } else {
+            error_propagate(errp, err);
+            return ret;
+        }
     }
 
     if (n->params.cmb_size_mb) {
@@ -4190,6 +4203,8 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     } else if (n->pmrdev) {
         nvme_init_pmr(n, pci_dev);
     }
+
+    return 0;
 }
 
 static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -4278,9 +4293,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
                         &pci_dev->qdev, n->parent_obj.qdev.id);
 
     nvme_init_state(n);
-    nvme_init_pci(n, pci_dev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (nvme_init_pci(n, pci_dev, errp)) {
         return;
     }
 
-- 
2.30.0


