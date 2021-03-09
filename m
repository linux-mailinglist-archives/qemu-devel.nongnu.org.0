Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B65332580
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:31:11 +0100 (CET)
Received: from localhost ([::1]:60542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbW2-00023Q-Mg
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoV-0000Q5-HP; Tue, 09 Mar 2021 06:46:13 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:49907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoT-0000hp-2X; Tue, 09 Mar 2021 06:46:11 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A4327278C;
 Tue,  9 Mar 2021 06:46:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YcBdy6KQUHYE2
 xrN0ASgv0WNNdITOo80xNPhD0N6Ptc=; b=q+36/o6B8+7b8jYtH+dG3wq/83Y7m
 s/uoSnDEomkObkCnc7lUcn13ESRxQi0tFHRGpVVnaEcMvBRiBJcFhqlVGsA988+9
 zjb5USnV/iDEFfn4lyR6Jz/+7BS8kNsGBI4IWAGjy4LrlnsHIYEggRB6SGTXu4Pa
 nDaEfm/vuQ7f31Vqb5ljVlt5OSY5Gc2ltIS/mL7kfVXZtlSi8iL4hZ9RfmgOrhuX
 9pFdytWl/ux2CVOVtV1RopEw2SP3LUcEPmxRcAB2F/bGLNR0fu5TRA+hiTGhTPxk
 yYfsLKNmA6f/uR0Y1K0AEbmf9gZ7SqD6hlD4z4xKAVnV/DKavswe+38/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YcBdy6KQUHYE2xrN0ASgv0WNNdITOo80xNPhD0N6Ptc=; b=BDh+2jM0
 PB2ziNRID7oHhFNJmQoo3uBVhuJb5q4FvZ5Vw1u+0MNhyp5ntkAZbut2tRaPqqsR
 /+IDkYGPMwKUzM456PXU53WS4LkbxNnPF+QkfzsXkTK707EOXfMryk57cocPTSr1
 Lve+cu0TUhWcfNhjipqRZzmiiFQENrpMF5ultdx205Iet+KO5N+0AqeZRPS0/rKj
 B+LEXxcsptNH6xHfyvZED3EB/q+eGLZ63Cx5+dVlHpCa163hm5voW8LwZb3W2i9o
 wDFmC5JBPwpyLKDVMiI5xF8DI/W6dfrMqw1QAe4BCoUSbuYO32iZDhf2Av8VIvUK
 NCse2OsMBZHj4A==
X-ME-Sender: <xms:-19HYOR-RASk_vGAjFdbQ23edRBJldadFgllJ7akiOBr756vZcLqlA>
 <xme:-19HYDz7UFVO8YGaNfcg1eNxC-xV8wwbf-DMCT7mgtZqVebmq1JzqeUASdrsw5Ela
 bdrEK5HGpPK2YqRGJo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduke
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-19HYL04468ZxkmTibPfqcU2pGNBzySw52WzcKdq9T4Ao6NpfSE_Fw>
 <xmx:-19HYKBi2IGMeUHq3HBlr5bxIYitV6LcDbZU0HquiGMtMjb5Zik77Q>
 <xmx:-19HYHiCgZkz8L8WVMuppEgQ6jp2JdA46XZYYydSMniSMR2sTtMJnQ>
 <xmx:-19HYHjMH5UNxKTQGhuzB7EQ-cPLWdU5unWyktjhAy1RqS-v0Cladg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E2DF1240054;
 Tue,  9 Mar 2021 06:46:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 30/38] hw/block/nvme: refactor nvme_dma
Date: Tue,  9 Mar 2021 12:45:04 +0100
Message-Id: <20210309114512.536489-31-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The nvme_dma function doesn't just do DMA (QEMUSGList-based) memory transfers;
it also handles QEMUIOVector copies.

Introduce the NvmeTxDirection enum and rename to nvme_tx. Remove mapping
of PRPs/SGLs from nvme_tx and instead assert that they have been mapped
previously. This allows more fine-grained use in subsequent patches.

Add new (better named) helpers, nvme_{c2h,h2c}, that does both PRP/SGL
mapping and transfer.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 138 ++++++++++++++++++++++++++----------------------
 1 file changed, 76 insertions(+), 62 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 59942f88113f..bfab80c45789 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -871,45 +871,71 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
     }
 }
 
-static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
-                         DMADirection dir, NvmeRequest *req)
+typedef enum NvmeTxDirection {
+    NVME_TX_DIRECTION_TO_DEVICE   = 0,
+    NVME_TX_DIRECTION_FROM_DEVICE = 1,
+} NvmeTxDirection;
+
+static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
+                        NvmeTxDirection dir)
 {
-    uint16_t status = NVME_SUCCESS;
+    assert(sg->flags & NVME_SG_ALLOC);
+
+    if (sg->flags & NVME_SG_DMA) {
+        uint64_t residual;
+
+        if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
+            residual = dma_buf_write(ptr, len, &sg->qsg);
+        } else {
+            residual = dma_buf_read(ptr, len, &sg->qsg);
+        }
+
+        if (unlikely(residual)) {
+            trace_pci_nvme_err_invalid_dma();
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+    } else {
+        size_t bytes;
+
+        if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
+            bytes = qemu_iovec_to_buf(&sg->iov, 0, ptr, len);
+        } else {
+            bytes = qemu_iovec_from_buf(&sg->iov, 0, ptr, len);
+        }
+
+        if (unlikely(bytes != len)) {
+            trace_pci_nvme_err_invalid_dma();
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
+static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                                NvmeRequest *req)
+{
+    uint16_t status;
 
     status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
     if (status) {
         return status;
     }
 
-    if (req->sg.flags & NVME_SG_DMA) {
-        uint64_t residual;
+    return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_FROM_DEVICE);
+}
 
-        if (dir == DMA_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &req->sg.qsg);
-        } else {
-            residual = dma_buf_read(ptr, len, &req->sg.qsg);
-        }
+static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                                NvmeRequest *req)
+{
+    uint16_t status;
 
-        if (unlikely(residual)) {
-            trace_pci_nvme_err_invalid_dma();
-            status = NVME_INVALID_FIELD | NVME_DNR;
-        }
-    } else {
-        size_t bytes;
-
-        if (dir == DMA_DIRECTION_TO_DEVICE) {
-            bytes = qemu_iovec_to_buf(&req->sg.iov, 0, ptr, len);
-        } else {
-            bytes = qemu_iovec_from_buf(&req->sg.iov, 0, ptr, len);
-        }
-
-        if (unlikely(bytes != len)) {
-            trace_pci_nvme_err_invalid_dma();
-            status = NVME_INVALID_FIELD | NVME_DNR;
-        }
+    status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
+    if (status) {
+        return status;
     }
 
-    return status;
+    return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_TO_DEVICE);
 }
 
 static inline void nvme_blk_read(BlockBackend *blk, int64_t offset,
@@ -1746,8 +1772,7 @@ static void nvme_compare_cb(void *opaque, int ret)
 
     buf = g_malloc(ctx->iov.size);
 
-    status = nvme_dma(nvme_ctrl(req), buf, ctx->iov.size,
-                      DMA_DIRECTION_TO_DEVICE, req);
+    status = nvme_h2c(nvme_ctrl(req), buf, ctx->iov.size, req);
     if (status) {
         req->status = status;
         goto out;
@@ -1783,8 +1808,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
         NvmeDsmRange range[nr];
         uintptr_t *discards = (uintptr_t *)&req->opaque;
 
-        status = nvme_dma(n, (uint8_t *)range, sizeof(range),
-                          DMA_DIRECTION_TO_DEVICE, req);
+        status = nvme_h2c(n, (uint8_t *)range, sizeof(range), req);
         if (status) {
             return status;
         }
@@ -1870,8 +1894,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     range = g_new(NvmeCopySourceRange, nr);
 
-    status = nvme_dma(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
-                      DMA_DIRECTION_TO_DEVICE, req);
+    status = nvme_h2c(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
+                      req);
     if (status) {
         return status;
     }
@@ -2522,8 +2546,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
         zd_ext = nvme_get_zd_extension(ns, zone_idx);
-        status = nvme_dma(n, zd_ext, ns->params.zd_extension_size,
-                          DMA_DIRECTION_TO_DEVICE, req);
+        status = nvme_h2c(n, zd_ext, ns->params.zd_extension_size, req);
         if (status) {
             trace_pci_nvme_err_zd_extension_map_error(zone_idx);
             return status;
@@ -2677,8 +2700,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_dma(n, (uint8_t *)buf, data_size,
-                      DMA_DIRECTION_FROM_DEVICE, req);
+    status = nvme_c2h(n, (uint8_t *)buf, data_size, req);
 
     g_free(buf);
 
@@ -2944,8 +2966,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
         nvme_clear_events(n, NVME_AER_TYPE_SMART);
     }
 
-    return nvme_dma(n, (uint8_t *) &smart + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
 }
 
 static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
@@ -2963,8 +2984,7 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
     strpadcpy((char *)&fw_log.frs1, sizeof(fw_log.frs1), "1.0", ' ');
     trans_len = MIN(sizeof(fw_log) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *) &fw_log + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &fw_log + off, trans_len, req);
 }
 
 static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
@@ -2984,8 +3004,7 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     memset(&errlog, 0x0, sizeof(errlog));
     trans_len = MIN(sizeof(errlog) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *)&errlog, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
 
 static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
@@ -3025,8 +3044,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
 
     trans_len = MIN(sizeof(log) - off, buf_len);
 
-    return nvme_dma(n, ((uint8_t *)&log) + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
@@ -3194,7 +3212,7 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n, NvmeRequest *req)
 {
     uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
-    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, id, sizeof(id), req);
 }
 
 static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
@@ -3211,8 +3229,7 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_identify_ctrl();
 
-    return nvme_dma(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl), req);
 }
 
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
@@ -3235,7 +3252,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, id, sizeof(id), req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -3256,8 +3273,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
-        return nvme_dma(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+        return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
     }
 
     return NVME_INVALID_CMD_SET | NVME_DNR;
@@ -3283,8 +3299,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
         return nvme_rpt_empty_id_struct(n, req);
     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
-        return nvme_dma(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+        return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
+                        req);
     }
 
     return NVME_INVALID_FIELD | NVME_DNR;
@@ -3326,7 +3342,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
@@ -3366,7 +3382,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
@@ -3413,7 +3429,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     ns_descrs->csi.hdr.nidl = NVME_NIDL_CSI;
     ns_descrs->csi.v = ns->csi;
 
-    return nvme_dma(n, list, sizeof(list), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, sizeof(list), req);
 }
 
 static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
@@ -3426,7 +3442,7 @@ static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
     NVME_SET_CSI(*list, NVME_CSI_NVM);
     NVME_SET_CSI(*list, NVME_CSI_ZONED);
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
@@ -3518,8 +3534,7 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
 {
     uint64_t timestamp = nvme_get_timestamp(n);
 
-    return nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
 }
 
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
@@ -3680,8 +3695,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     uint16_t ret;
     uint64_t timestamp;
 
-    ret = nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
-                   DMA_DIRECTION_TO_DEVICE, req);
+    ret = nvme_h2c(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
     if (ret) {
         return ret;
     }
-- 
2.30.1


