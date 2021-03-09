Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED23325A8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:45:27 +0100 (CET)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbjq-0002tB-TM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:45:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoi-0000YA-En; Tue, 09 Mar 2021 06:46:24 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoa-0000af-CO; Tue, 09 Mar 2021 06:46:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1AE142711;
 Tue,  9 Mar 2021 06:45:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=am3vOXA9jlaXt
 iQ3D6Wb3XYRAyi1RgWZq6qd7jkTtd8=; b=J6D1NfwEVwZvyp7sW1SmxOQo3m0xt
 w3CqboyzUD/YlM/K8peh9ZpgiDliJcqR15ThY3BmkzbrkWi72mKJt4LnK94eorpO
 k25iG8Xo4LawoS6tEMH1OAt3mBZxvupJmmr9kyliL5RWkh5XR4pB/E6x6VOu7Q0e
 4t+3hNdiDZ7SVxfyOqAGE9pbaDBDQ1EmZvzkzqAS4pPxLsAW1Il66lIBKT+sihqa
 OtJQWSQ+2QfV+Toz0+68bwncBwNDagE34zZ+CIuXwrTbpyPkOXwYLq0T6NCMQBLS
 SVu4/TikskysRgqncIXb0NlFhr7xxXijP/9npPtBTgtVTa05DTo5zCh8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=am3vOXA9jlaXtiQ3D6Wb3XYRAyi1RgWZq6qd7jkTtd8=; b=B46N4HX1
 T4KuwtQnMSPw6b2o4iAfIGCPCVg1/yLAyp56FYLiFofQ5q7m7dY2egg1JYek/ZOj
 1TimsmzqTGC6LeqEktWfOEP79TYS3of+BWONZ8/kHiQ1YEGxBTPH5ATmpt7GLYP8
 0Wda7hK89GTDH8PZFbqHb3fFbEDxhqt7q875HpIeqXfe49Spe6eyV7eGezdDbSSa
 EhQTvSfX6hgni6hWA6lLjv0U9XtEol8gJn0spgSF4mY6rHc3O0LvS0hjmqCCJHvA
 PIZ8zUfCnLrEvzASm93azlvOZjGdDquNTRvn5H42VFN693cDTkifBahW5Ly5BQfF
 qkqI3DsGAUm3jg==
X-ME-Sender: <xms:8V9HYKF9VkjmJnyhGM-93CpPaaD3lI3RUlhHQWpDIYAgl-Vzth8n_g>
 <xme:8V9HYLU_FDisBgDxTs5LlP2p5i5UyAGzIq3VnOKS9uaBXRqob5ukVwYDRMsvhVN3v
 NlzO-fS4yULaMdbQaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduhe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:8V9HYEIWGLoZ92xTc3tRVidlzcyshERm-XRX7LZP7MrnbR84dnvDkw>
 <xmx:8V9HYEEy_OU0nGBirB74UM8FtT7GsFZxKq6febYNSrbJRshSderw9g>
 <xmx:8V9HYAWQt2-XtLLRSMEAHPJMr-egedzLr8wh15VenUGme9nxJLnUCQ>
 <xmx:8V9HYEoT4X32CfMnLeoggk0uh0o34p40tYE6qQPor2ii4T12b5qIhG18q98>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D8DF24005A;
 Tue,  9 Mar 2021 06:45:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 24/38] hw/block/nvme: report non-mdts command size limit for
 dsm
Date: Tue,  9 Mar 2021 12:44:58 +0100
Message-Id: <20210309114512.536489-25-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
index b81c4c3705f1..30aef5b09ef4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1789,6 +1789,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
             trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
                                           nlb);
 
+            if (nlb > n->dmrsl) {
+                trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n->dmrsl);
+            }
+
             offset = nvme_l2b(ns, slba);
             len = nvme_l2b(ns, nlb);
 
@@ -3208,20 +3212,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
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
@@ -4655,6 +4663,9 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
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


