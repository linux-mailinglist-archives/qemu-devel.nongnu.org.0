Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53F321F68
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:53:59 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGLG-0000JV-AK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFq-0004vX-Ny; Mon, 22 Feb 2021 13:48:22 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFi-0003kG-4v; Mon, 22 Feb 2021 13:48:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8243D5C01C2;
 Mon, 22 Feb 2021 13:48:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 13:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Elp1DaAZ//mIB
 6soorNHdUeQvH9uADiV5AFP9sZsiOc=; b=nz5hzFZhFv4xZOK8Q2RPTaGkj3dc4
 BCD1/1RdK85TUvpbqshUduGOj1MkeLt1HfKaDo71OSVYwcO5Fq5jerVl85luIDLz
 XF5yW7tuvPPtffByuAdCkHO95FRmHxzXt8swi8UWlz0FEqDSZ3HQlgWY3REGeXLC
 ctPzD/pzBAD2kwuuJq8YjNdFeaPX7DR6GRtyvHQ4LRBnw9OFBAs4WdMC0qaaT3rs
 be+hU94vR6HAxGkQl27Y/e1AyAa56LHVXh6T0rJXp3fhNuxlpN9mH5d/pQIQqmSY
 fJSrbBDlfW5iTCyBau0i8pmLf27q9lTvP/9aL+cjeqPXz50C5ZNIJqKqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Elp1DaAZ//mIB6soorNHdUeQvH9uADiV5AFP9sZsiOc=; b=tBG1zU/0
 tiKOm4ivgMQ4aXKKbX9wgY2poh/ShirDZ/Um++PomHgLFcdF67q2c+ql0wokODXw
 nnwAV/tkfZHIQQwtXLYjnukoW+h3Mj8lRReeJNv1Z1y2Jc8yWXkZ9Wm4xP9OOHfg
 JfCrmJ9Qone/Nd9svzcC5Gm99ANPABT4mcmNEV+MdFhieWAIecImiLPyqxD00o16
 4bYFydukneHoetxt5VSRzi1qkOXWd1mzcnO9aVC0mBMSPNAd1QYRFF4DfJGc11cB
 6CfZX2Pe9etu6l3Y0DwxILdUPWipZbrv5nAEk4i++WV7IjBaiPzWPObS2k5SCqFv
 4AAmt7ThmYyYMw==
X-ME-Sender: <xms:avwzYI2_1vZrbe5u666NKwU7Wc1w7Vxggo-mNWSHXIe1ZriCZ42aKg>
 <xme:avwzYJBedGIFk9HlIUfaC0bpzCil5kGJfpuhe-MLR5J18qvUO9si2H0DmnuAmS6l-
 4hqC3oqtRy-rL_6wtI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:avwzYOBCr-oRJypwzD7tk_LWBfD4gbnAX_0opD74YRV7dnsQo5gy8w>
 <xmx:avwzYCnEHuL4v36asedT642wPY4y_i2L5skdgee6zUXzU-EozE67Ew>
 <xmx:avwzYGinzFyNmOdG20RZrBys8u0mYvMEDN-yCUCNg6ItrdaJfdCI3Q>
 <xmx:avwzYF1zbJPbqTIwpCKwOYpGrE58tt4qZ-Ff8hV5nm6HiHRRU0t2WQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F338240062;
 Mon, 22 Feb 2021 13:48:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] hw/block/nvme: report non-mdts command size limit for
 dsm
Date: Mon, 22 Feb 2021 19:47:59 +0100
Message-Id: <20210222184759.65041-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222184759.65041-1-its@irrelevant.dk>
References: <20210222184759.65041-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
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
 hw/block/nvme.c       | 29 +++++++++++++++++++++--------
 hw/block/trace-events |  1 +
 4 files changed, 34 insertions(+), 8 deletions(-)

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
index b641c7a45a2f..4013bf53d4ff 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1775,6 +1775,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
             trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
                                           nlb);
 
+            if (nlb > n->dmrsl) {
+                trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
+            }
+
             offset = nvme_l2b(ns, slba);
             len = nvme_l2b(ns, nlb);
 
@@ -3200,21 +3204,27 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-    NvmeIdCtrlZoned id = {};
+    uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
     trace_pci_nvme_identify_ctrl_csi(c->csi);
 
-    if (c->csi == NVME_CSI_NVM) {
-        return nvme_rpt_empty_id_struct(n, req);
-    } else if (c->csi == NVME_CSI_ZONED) {
+    switch (c->csi) {
+    case NVME_CSI_NVM:
+        ((NvmeIdCtrlNvm *)&id)->dmrsl = cpu_to_le32(n->dmrsl);
+        break;
+
+    case NVME_CSI_ZONED:
         if (n->params.zasl_bs) {
-            id.zasl = n->zasl;
+            ((NvmeIdCtrlZoned *)&id)->zasl = n->zasl;
         }
-        return nvme_dma(n, (uint8_t *)&id, sizeof(id),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+
+        break;
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return NVME_INVALID_FIELD | NVME_DNR;
+    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -4668,6 +4678,9 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
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


