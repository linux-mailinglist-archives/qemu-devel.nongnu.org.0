Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242AD330F27
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:31:02 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFyP-0003gw-18
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvx-0003mF-Aj; Mon, 08 Mar 2021 07:24:29 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:41407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvo-00073y-Lu; Mon, 08 Mar 2021 07:24:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 6992536CD;
 Mon,  8 Mar 2021 07:23:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=f2tCwh0pseTVu
 K8SjaTwOaMNeEj6lHzZ9q1TvGMh9B4=; b=Krd8yWvYjDghZNHAsSFmpDco4GexG
 pADwVr3WBL5Xqqr8WOyLwsVWQxzfSTB3rmCDlLjgD+JL3A4Qu+RdM3vmuEJw+9YM
 tT8RIVzmkbcUG6btWntgT6GXf8RR9iqvanBC/hYOoV/conCZf8cPdrZ30dtbKHp7
 S5oTLRnvJ2OkGOZnDhkNc1Zb3RYSS6nJ3TEHQPu1/rqQeeI2E74TvH5VNikTd+Sl
 HVfQs4/h9IoO/CBIipjHwdxdsYBZDm8ubRB6JxZXd22Wn4wzurDta+8HqK2Bir/e
 J/lERl5FTbYURQeGrN5krGwfsnhSBC3LnOQMWxZgA8j5ZOzuhutLtHvxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=f2tCwh0pseTVuK8SjaTwOaMNeEj6lHzZ9q1TvGMh9B4=; b=kmpn5nAs
 89ruq3Z10flcyDpNkvwM1eR14VeEHki1OBEKrQDchf2i+rlIBrhCAJC479c6JVLe
 P6er1w4pe4ZT9pF82GJDb5SsOYoktO9+svR6BDmFV9R4A0ie4ydYVRhDJnLhaEe0
 Mp5BaY6u9zs4vDXj20urV43THgIzs7r5Bii1PTsXmLDl4qme6dCwqyLyaj4zWzp+
 vUxiKNGiFOBh30UWg/bubA5OR9g00o88DEYJwqydDZbULaZPWC6yUrc/mVEvTQJX
 iZezSyOTuBkGfjanLUfCeVL9FGEDstpqVy/EkrdUsj9w2J2pA64bi6mPdZiF9MHd
 n/Nx3Q3p9pdS3Q==
X-ME-Sender: <xms:WRdGYCUEW94XckGKBgJdOS4QdEeJ35aYkGbfJhqs_uYtRMGDAIeaow>
 <xme:WRdGYOkdjKKzb7x2Pma-ZlcM0lq29cF8EzHsf-tpgzgs1sVLEZfFowRmqBQ3xRW8L
 M05LKFmPdB5uzyoe5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WRdGYGZqtLCrzvqa8yShPhF6Gm6TLCEAr78InCkQ78lDDjx2TLPHRw>
 <xmx:WRdGYJVdVCO6hktkDKkb24Ll00qLJJ8u0OWK3r6tosu0jU779p3Ayw>
 <xmx:WRdGYMl6n44cbS3VrHGMZjikhTeG4RvwsEmyseAAswTmeJcVezhmog>
 <xmx:WhdGYG64ivQno-RDdsjkazx9zvAGT4gUDAF3dvDQoUTZdN2G7M2FQk5j4eE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8EA181080063;
 Mon,  8 Mar 2021 07:23:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 24/38] hw/block/nvme: report non-mdts command size limit for dsm
Date: Mon,  8 Mar 2021 13:22:59 +0100
Message-Id: <20210308122313.286938-25-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h       |  2 ++
 include/block/nvme.h  | 11 +++++++++++
 hw/block/nvme.c       | 27 +++++++++++++++++++--------
 hw/block/trace-events |  1 +
 4 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index f45ace0cff5b..294fac1defe3 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -171,6 +171,8 @@ typedef struct NvmeCtrl {
     QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
     int         aer_queued;
 
+    uint32_t    dmrsl;
+
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
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
index 961507cae28a..0f6400cd7274 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1780,6 +1780,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
             trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
                                           nlb);
 
+            if (nlb > n->dmrsl) {
+                trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
+            }
+
             offset = nvme_l2b(ns, slba);
             len = nvme_l2b(ns, nlb);
 
@@ -3199,20 +3203,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-    NvmeIdCtrlZoned id = {};
+    uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
     trace_pci_nvme_identify_ctrl_csi(c->csi);
 
-    if (c->csi == NVME_CSI_NVM) {
-        return nvme_rpt_empty_id_struct(n, req);
-    } else if (c->csi == NVME_CSI_ZONED) {
-        id.zasl = n->params.zasl;
+    switch (c->csi) {
+    case NVME_CSI_NVM:
+        ((NvmeIdCtrlNvm *)&id)->dmrsl = cpu_to_le32(n->dmrsl);
+        break;
 
-        return nvme_dma(n, (uint8_t *)&id, sizeof(id),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+    case NVME_CSI_ZONED:
+        ((NvmeIdCtrlZoned *)&id)->zasl = n->params.zasl;
+        break;
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return NVME_INVALID_FIELD | NVME_DNR;
+    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -4646,6 +4654,9 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
     n->namespaces[nsid - 1] = ns;
 
+    n->dmrsl = MIN_NON_ZERO(n->dmrsl,
+                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+
     return 0;
 }
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index c165ee2a97c3..8deeacc8c35c 100644
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


