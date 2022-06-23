Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F9558AAC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:23:11 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UIA-0004Ua-7y
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDi-0005bx-Eu; Thu, 23 Jun 2022 17:18:34 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:60823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDg-00044G-RE; Thu, 23 Jun 2022 17:18:34 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DF0BF3200957;
 Thu, 23 Jun 2022 17:18:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 17:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019110; x=
 1656105510; bh=haKouNLSIfcSpTUsKMFT6Uc7HnGv5ffpazcJpUu6o3E=; b=I
 T730y557sgHX8IciVGC9itGQm/A1M5OCNlP3FrI8/HqrKnO/UXDpmIc3bd+Mk05J
 6tL+7UWv4WLX2l8GOL1/Ok1MTUPXUch2WR/1kEEpCfZ6eYbpKqhtjBAqKTejEUtq
 ZOs2RyhSy0BvUno0AGI3MphfLiFzHMXniGhWYAapZg/3taqnzjDQyRPL1QSic3zB
 h6h7Z/J0mnfavPDsEQdTKmVwi4nY4LsBSJoXSFACuyLjBYymrkCwqt91VcFiKjTG
 bQj3jDvFzQOn3yn4g7uoKFWAHXWJSFy+whGyufklvLKV6gbU5YdXnAqY2N0gGnUH
 mieIrlMwri6I1ZziX/4aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019110; x=1656105510; bh=haKouNLSIfcSp
 TUsKMFT6Uc7HnGv5ffpazcJpUu6o3E=; b=Q0JCVFcbd/QnJkx8NFkCituxrrLbr
 RgC6uB4P5bIyyb47soRfq5wwov1IRsl8c2nycbylzmf4WLcyoLzXnk/U41Skymfe
 UEkVd8MTSBGdH8SJ0eDO23M+i/wYX5filWMNqmX6DZAYX7iV9ybBO6Sf/fnSbwBf
 iDojIk7RNKf4gWbBh/f/8LhEVf7Z67H1DkKqFAY8TagpkmqKPw5u8hA3HOh1+oCt
 xTE4UkDet9Lf4pokHw3fZlWTtjLRqgdmNDTwEuuzrWDdWYyZr1WgmIYSFKkbQC1/
 eYoTIVR1DZZ3iiCx6uvqYkpA+OuW70i2U7i39Jkmr5N2KteAt0JYQs2zg==
X-ME-Sender: <xms:pdi0YuPuRZPQOdVAsjcyXPG7VekEdYRJ-vwPSLsWU9OU5yrRRVIyeg>
 <xme:pdi0Ys_EoORlIJVSwcrMcJItuQG429FYK56dWkZxF4Py7BIsoGKFF-O5n1tGgnwIm
 xYH9iLvGvUWn2ReK94>
X-ME-Received: <xmr:pdi0YlQeerGowQglSMHymzQgzqAeMSctAtfy94aLzonE9CzBZS6P_ycRfEllLHrd5U0V7VBmBqdZQwzOUy3o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pdi0YuvNkVqt1wkNMP27CcrsMULJKKBiZQZGRDYpRMPxzN-0dSpsMA>
 <xmx:pdi0YmeT_WnQymXnCYt5gCXQT7r-LVwb_ABJS4v_EPtanTTeuQNfEA>
 <xmx:pdi0Yi3pQKmzhexDgDBJQKo2bF5GG5VQaNeAO_rAEmShpDgkt36vDg>
 <xmx:pti0Ym5nWq4L8-P5djVMrOP0CV6iOQ9hC6yXigW5vP2P12F7CARxCg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:28 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 02/12] hw/nvme: remove redundant passing of PCIDevice
Date: Thu, 23 Jun 2022 23:18:11 +0200
Message-Id: <20220623211821.50534-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
References: <20220623211821.50534-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Klaus Jensen <k.jensen@samsung.com>

The NvmeCtrl is a PCIDevice, so remove the redundant passing of the
PCIDevice parameter.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index c8c4a0718fc4..b688afccbe5a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7007,8 +7007,9 @@ static void nvme_init_state(NvmeCtrl *n)
     }
 }
 
-static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_cmb(NvmeCtrl *n)
 {
+    PCIDevice *pci_dev = PCI_DEVICE(n);
     uint64_t cmb_size = n->params.cmb_size_mb * MiB;
     uint64_t cap = ldq_le_p(&n->bar.cap);
 
@@ -7029,8 +7030,9 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
     }
 }
 
-static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_pmr(NvmeCtrl *n)
 {
+    PCIDevice *pci_dev = PCI_DEVICE(n);
     uint32_t pmrcap = ldl_le_p(&n->bar.pmrcap);
 
     NVME_PMRCAP_SET_RDS(pmrcap, 1);
@@ -7116,8 +7118,9 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
     return 0;
 }
 
-static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
+static int nvme_init_pci(NvmeCtrl *n, Error **errp)
 {
+    PCIDevice *pci_dev = PCI_DEVICE(n);
     uint8_t *pci_conf = pci_dev->config;
     uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
@@ -7174,11 +7177,11 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
 
     if (n->params.cmb_size_mb) {
-        nvme_init_cmb(n, pci_dev);
+        nvme_init_cmb(n);
     }
 
     if (n->pmr.dev) {
-        nvme_init_pmr(n, pci_dev);
+        nvme_init_pmr(n);
     }
 
     if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
@@ -7201,8 +7204,9 @@ static void nvme_init_subnqn(NvmeCtrl *n)
     }
 }
 
-static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_ctrl(NvmeCtrl *n)
 {
+    PCIDevice *pci_dev = PCI_DEVICE(n);
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
@@ -7360,10 +7364,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
     nvme_init_state(n);
-    if (nvme_init_pci(n, pci_dev, errp)) {
+    if (nvme_init_pci(n, errp)) {
         return;
     }
-    nvme_init_ctrl(n, pci_dev);
+
+    nvme_init_ctrl(n);
 
     /* setup a namespace if the controller drive property was given */
     if (n->namespace.blkconf.blk) {
-- 
2.36.1


