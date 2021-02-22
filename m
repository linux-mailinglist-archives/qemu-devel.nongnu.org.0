Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C7321143
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 08:17:30 +0100 (CET)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE5TF-0002DL-P8
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 02:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J8-0006gA-QO; Mon, 22 Feb 2021 02:07:03 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J4-00032K-8q; Mon, 22 Feb 2021 02:07:02 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F8945C00EB;
 Mon, 22 Feb 2021 02:06:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 02:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bHymLgNytpMdh
 9Ay7SYMWnr1F3ZOMqveNWgqbRk2/FA=; b=NJ8Svy+g1sbzZTCs2edoS+aEwwcWH
 q7b6Tu4cpCf6Wx3SXzl+FvbKd29LxV0inlb+C/F6gIy60o3WGWM/sEHwRDcAmHbi
 XMg3Ej3epHG4559bbWtO5d9xA1cuycgtXhfdImABauTZ79yxYnn13nkS2/5YdE9A
 vEmGVWzjYIDQvpRdJgiKZYKJKpdnqXKQNvddGronbZwh8P2pXCvJekglt/lCd4kW
 wGnYuT2tjGwYxcNhwVtkmw9JxoRzPgwV/aKt6VfJ0az6DxjdcG8frqVXbUw1bbv3
 xIGSVJ9bOW5G05bd+4823OCB6J8vhGgSYYr/bYR2YSLbMf6NGmcSohfMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bHymLgNytpMdh9Ay7SYMWnr1F3ZOMqveNWgqbRk2/FA=; b=FnfLIT/5
 6SYpu2x40/1S0FF0PRUACCm3VYjnHxr8TsDRa+A3mCrkR2y8DvnbZnMbJZh4pz9e
 E8WF3MPUxQBQeiEprCjO+KVJsG7INdoCbDaE9Qft5ne+fvhlcJd+0qpFPyw+xYAw
 eMe6rkIivBFm0RMHD8oNUO96iUEIcWPuvYnDcPl6p9Bc6QjXCXsJac8nvErW0D7k
 M4eb3MrRcMvyHfyKFBEyuOUFhkXsj6qy5CD5NVtzDF/iNnlFeEvQYLFv7gGum/BH
 tLHWq5SOH76KA73q5b9L4wkZb7SNyjvhuE8xWT4yjqgJ4cpAXlCuOZIuGQc0OfP2
 eHkjg0Owyk8LeA==
X-ME-Sender: <xms:EVgzYDPR2IrMxfuZG6A_ym-qBXF7qNiNHVi0h_ScwXEXXQzayo2vyw>
 <xme:EVgzYN8AP0eDMvQubsxxKepRGHlEn4JX7QFi-3xk0xAB9CqCP8sHwbxQEWL7xoSht
 Jxo7Feaugdb083X_4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkedvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:EVgzYCQRkBfzuOyk9K9ugrZLDK9TO-nQXnippoDwySVSu6psLwqLQg>
 <xmx:EVgzYHsQ0cEOpNzT5H6ml7PSdv8SVJIZ9nZmPr5q1wN2WRT4BmsIsQ>
 <xmx:EVgzYLdKenKwOhh4Lr8vrRGu2F83yi-b9Pvfst8zQ8TE45mrXwgYXg>
 <xmx:EVgzYNuAdowk7iNBAfSCeyB5P-MRgpiYSN-LiRzZ11rj_MkCAlduGQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3BC3C24005A;
 Mon, 22 Feb 2021 02:06:55 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: report non-mdts command size limit for dsm
Date: Mon, 22 Feb 2021 08:06:15 +0100
Message-Id: <20210222070615.9177-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222070615.9177-1-its@irrelevant.dk>
References: <20210222070615.9177-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Dataset Management is not subject to MDTS, but exceeded a certain size
per range causes internal looping. Report this limit (DMRSL) in the NVM
command set specific identify controller data structure.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h       |  1 +
 include/block/nvme.h  | 11 +++++++++++
 hw/block/nvme.c       | 30 ++++++++++++++++++++----------
 hw/block/trace-events |  1 +
 4 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cb2b5175f1a1..3046b82b3da1 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -172,6 +172,7 @@ typedef struct NvmeCtrl {
     int         aer_queued;
 
     uint8_t     zasl;
+    uint32_t    dmrsl;
 
     NvmeSubsystem   *subsys;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index b23f3ae2279f..16d8c4c90f7e 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1041,6 +1041,16 @@ typedef struct NvmeIdCtrlZoned {
     uint8_t     rsvd1[4095];
 } NvmeIdCtrlZoned;
 
+typedef struct NvmeIdCtrlNvm {
+    uint8_t     vsl;
+    uint8_t     wzsl;
+    uint8_t     wusl;
+    uint8_t     dmrl;
+    uint32_t    dmrsl;
+    uint64_t    dmsl;
+    uint8_t     rsvd16[4080];
+} NvmeIdCtrlNvm;
+
 enum NvmeIdCtrlOacs {
     NVME_OACS_SECURITY  = 1 << 0,
     NVME_OACS_FORMAT    = 1 << 1,
@@ -1396,6 +1406,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlZoned) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlNvm) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 897b9ff0db91..5d6bba5fcb0d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1777,6 +1777,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
             trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
                                           nlb);
 
+            if (nlb > n->dmrsl) {
+                trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
+            }
+
             offset = nvme_l2b(ns, slba);
             len = nvme_l2b(ns, nlb);
 
@@ -3202,21 +3206,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-    NvmeIdCtrlZoned id = {};
+    uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
     trace_pci_nvme_identify_ctrl_csi(c->csi);
 
-    if (c->csi == NVME_CSI_NVM) {
-        return nvme_rpt_empty_id_struct(n, req);
-    } else if (c->csi == NVME_CSI_ZONED) {
-        if (n->params.zasl_bs) {
-            id.zasl = n->zasl;
-        }
-        return nvme_dma(n, (uint8_t *)&id, sizeof(id),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+    switch (c->csi) {
+    case NVME_CSI_NVM:
+        ((NvmeIdCtrlNvm *)&id)->dmrsl = cpu_to_le32(n->dmrsl);
+        break;
+
+    case NVME_CSI_ZONED:
+        ((NvmeIdCtrlZoned *)&id)->zasl = n->zasl;
+        break;
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return NVME_INVALID_FIELD | NVME_DNR;
+    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -4670,6 +4677,9 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
     n->namespaces[nsid - 1] = ns;
 
+    n->dmrsl = MIN_NON_ZERO(n->dmrsl,
+                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+
     return 0;
 }
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 1f958d09d2a9..27940fe2e98a 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -51,6 +51,7 @@ pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
+pci_nvme_dsm_single_range_limit_exceeded(uint32_t nlb, uint32_t dmrsl) "nlb %"PRIu32" dmrsl %"PRIu32""
 pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
-- 
2.30.1


