Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9C3127C0
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 23:02:37 +0100 (CET)
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8s8a-00068t-5Y
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 17:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwK-0000fY-Ap; Sun, 07 Feb 2021 16:49:56 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwH-0004Rr-Vk; Sun, 07 Feb 2021 16:49:56 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 296595C00BC;
 Sun,  7 Feb 2021 16:49:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 07 Feb 2021 16:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+YhEiJgCQmYAy
 7xFR0BmYOo7AMO05W8tLO21riKC1BM=; b=smzjjqI1Bc2GojRXduCWsvPYVDKj5
 7x5+MZ4n0I4piBa7RF/ie4PMv9+ZBalE1vzXvgoY+QfJAjmyh21BkoO68J0W3MKy
 rmob9wB86cgtqoBnt7elEMx6jA9/R8ciQU6K6vpgmvS5VIK47oz69o3/C5zl1Vq8
 qm818I4ZF0ritGAIi3NfdLmGCDehFNlyFJglEdrxMJ+omdDoqTDWUyZXe7DzfUcz
 rVyq1H75bl18pO7L4UQH0BFbbfxNY3OKSokg+X+iyfZarHRgYC/d00SXQ8UUSorV
 i3Yz0p22TD3DO2RfcM+45eutKFXKXymRL2kno1SgTBE7rpqY4aiPtnD3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+YhEiJgCQmYAy7xFR0BmYOo7AMO05W8tLO21riKC1BM=; b=texyTH6/
 ANzFgLhX6Tsm6YvaPOxmu6+oDtG8bsUx2aaNCPqN2deubuMcM1dOKFyV4ziV1ik+
 3scRqj/tM2krUbpLnfa7huh+pi1l3RED2+NJXqZv25lOFLZJP1D6pGCW/WpRSOf1
 ZFWvgHwegIqLJICyeC6E1ijBgY1mqoGC94okFax17IAHzD7J6SBYNZ1X9jT/UILL
 zl6RorPcU5fMQsidHv+V4XCOu97+qe5UF0MZhpnxDSBdtr39lI8W2MDkORgpiEgB
 7t93AGgnG5cbNvh8A9a8RB0yjWr49pyB0FndtCkmG4A0tOI8pfXFOlG2JwumNKQH
 yujstjsSn/+SIQ==
X-ME-Sender: <xms:gGAgYCp5ozQKMHfTotc2XW-fNTGz8eUvmTgvidNH6e3MBB1vzWPohQ>
 <xme:gGAgYAnUo8-tEE57HEhQOtNkcPV2xY1xMIoDt2SI_3F38kRZsVKN5IMw3bUtxGT0K
 yFV1Gn7_Mmb-jdceek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gGAgYEFTsoBTt_gzrV4rpVj2h-OSF1EHUDW88Vkb1SdytkJeGbV8bw>
 <xmx:gGAgYJrFUOJBLg9aDxbqgeabz_o4TB4LYIpS15gUmmUhZJNXgje_DA>
 <xmx:gGAgYA6I47LlOqmT6WJOM1N8c9pY7Wqda4F5vAVgtnMmxh0P0QDtZA>
 <xmx:gWAgYLs3SdbrjFG1MxsOuIrbDZXR2A0TVZCrhrl64xiToBUIL-MLWA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16BAD1080057;
 Sun,  7 Feb 2021 16:49:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 6/8] hw/block/nvme: refactor nvme_dma
Date: Sun,  7 Feb 2021 22:49:38 +0100
Message-Id: <20210207214940.281889-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207214940.281889-1-its@irrelevant.dk>
References: <20210207214940.281889-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
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
---
 hw/block/nvme.c | 143 ++++++++++++++++++++++++++----------------------
 1 file changed, 77 insertions(+), 66 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 24156699b035..2752e5d8572a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -843,48 +843,72 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
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
+    /* assert that exactly one of qsg and iov carries data */
+    assert((sg->qsg.nsg > 0) != (sg->iov.niov > 0));
+
+    if (sg->qsg.nsg > 0) {
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
 
-    /* assert that only one of qsg and iov carries data */
-    assert((req->sg.qsg.nsg > 0) != (req->sg.iov.niov > 0));
+    return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_FROM_DEVICE);
+}
 
-    if (req->sg.qsg.nsg > 0) {
-        uint64_t residual;
+static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                                NvmeRequest *req)
+{
+    uint16_t status;
 
-        if (dir == DMA_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &req->sg.qsg);
-        } else {
-            residual = dma_buf_read(ptr, len, &req->sg.qsg);
-        }
-
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
@@ -1683,8 +1707,7 @@ static void nvme_compare_cb(void *opaque, int ret)
 
     buf = g_malloc(ctx->iov.size);
 
-    status = nvme_dma(nvme_ctrl(req), buf, ctx->iov.size,
-                      DMA_DIRECTION_TO_DEVICE, req);
+    status = nvme_h2c(nvme_ctrl(req), buf, ctx->iov.size, req);
     if (status) {
         req->status = status;
         goto out;
@@ -1720,8 +1743,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
         NvmeDsmRange range[nr];
         uintptr_t *discards = (uintptr_t *)&req->opaque;
 
-        status = nvme_dma(n, (uint8_t *)range, sizeof(range),
-                          DMA_DIRECTION_TO_DEVICE, req);
+        status = nvme_h2c(n, (uint8_t *)range, sizeof(range), req);
         if (status) {
             return status;
         }
@@ -1803,8 +1825,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     range = g_new(NvmeCopySourceRange, nr);
 
-    status = nvme_dma(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
-                      DMA_DIRECTION_TO_DEVICE, req);
+    status = nvme_h2c(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
+                      req);
     if (status) {
         return status;
     }
@@ -2413,8 +2435,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
         zd_ext = nvme_get_zd_extension(ns, zone_idx);
-        status = nvme_dma(n, zd_ext, ns->params.zd_extension_size,
-                          DMA_DIRECTION_TO_DEVICE, req);
+        status = nvme_h2c(n, zd_ext, ns->params.zd_extension_size, req);
         if (status) {
             trace_pci_nvme_err_zd_extension_map_error(zone_idx);
             return status;
@@ -2569,8 +2590,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_dma(n, (uint8_t *)buf, data_size,
-                      DMA_DIRECTION_FROM_DEVICE, req);
+    status = nvme_c2h(n, (uint8_t *)buf, data_size, req);
 
     g_free(buf);
 
@@ -2814,8 +2834,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
         nvme_clear_events(n, NVME_AER_TYPE_SMART);
     }
 
-    return nvme_dma(n, (uint8_t *) &smart + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
 }
 
 static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
@@ -2833,8 +2852,7 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
     strpadcpy((char *)&fw_log.frs1, sizeof(fw_log.frs1), "1.0", ' ');
     trans_len = MIN(sizeof(fw_log) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *) &fw_log + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &fw_log + off, trans_len, req);
 }
 
 static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
@@ -2854,8 +2872,7 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     memset(&errlog, 0x0, sizeof(errlog));
     trans_len = MIN(sizeof(errlog) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *)&errlog, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
 
 static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
@@ -2895,8 +2912,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
 
     trans_len = MIN(sizeof(log) - off, buf_len);
 
-    return nvme_dma(n, ((uint8_t *)&log) + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
@@ -3066,7 +3082,7 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n, NvmeRequest *req)
 {
     uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
-    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, id, sizeof(id), req);
 }
 
 static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
@@ -3083,8 +3099,7 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_identify_ctrl();
 
-    return nvme_dma(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl), req);
 }
 
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
@@ -3100,8 +3115,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
         if (n->params.zasl_bs) {
             id.zasl = n->zasl;
         }
-        return nvme_dma(n, (uint8_t *)&id, sizeof(id),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+        return nvme_c2h(n, (uint8_t *)&id, sizeof(id), req);
     }
 
     return NVME_INVALID_FIELD | NVME_DNR;
@@ -3125,8 +3139,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
-        return nvme_dma(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+        return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
     }
 
     return NVME_INVALID_CMD_SET | NVME_DNR;
@@ -3152,8 +3165,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
         return nvme_rpt_empty_id_struct(n, req);
     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
-        return nvme_dma(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+        return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
+                        req);
     }
 
     return NVME_INVALID_FIELD | NVME_DNR;
@@ -3195,7 +3208,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
@@ -3235,7 +3248,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
@@ -3282,7 +3295,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     ns_descrs->csi.hdr.nidl = NVME_NIDL_CSI;
     ns_descrs->csi.v = ns->csi;
 
-    return nvme_dma(n, list, sizeof(list), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, sizeof(list), req);
 }
 
 static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
@@ -3295,7 +3308,7 @@ static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
     NVME_SET_CSI(*list, NVME_CSI_NVM);
     NVME_SET_CSI(*list, NVME_CSI_ZONED);
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
@@ -3384,8 +3397,7 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
 {
     uint64_t timestamp = nvme_get_timestamp(n);
 
-    return nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
 }
 
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
@@ -3545,8 +3557,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     uint16_t ret;
     uint64_t timestamp;
 
-    ret = nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
-                   DMA_DIRECTION_TO_DEVICE, req);
+    ret = nvme_h2c(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
     if (ret) {
         return ret;
     }
-- 
2.30.0


