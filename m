Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3248330ED5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:05:39 +0100 (CET)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFZq-0001rW-OE
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvg-0003e9-Ep; Mon, 08 Mar 2021 07:24:08 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvd-00077j-PI; Mon, 08 Mar 2021 07:24:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B695F36D3;
 Mon,  8 Mar 2021 07:24:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=GGIhcb+KP6Yfa
 UfHtRsj9qGgMTVC/f4Im92/iSmo8cs=; b=JryTCorID1dim97jv0jFoXIDBiQ7A
 Y6Kc+WOp54c9bvDHnkFJL22cxH+jMWFnVvwfPBiNapGhm6+Zw4s4H1ooA4U3X0EV
 18HbdhZ9nYX2j0S+QA2xFYm/E2KSVoCvJLDAAFyWB8bK2ippf7w+lXzK4Nn4ygK7
 t9ppUzGz2EflSfQuW0qMSoxJTCFinDAxosTIAn66aK6StbUu3LcSQt7B37vSg9sW
 nSIbUHm6qoexDOrmLkMuR50yhDfzNDCQiq2B1KPfU2oVpZ9NUiWB9sRSbGHkKm1n
 n/icYw8i+rc6boX0ckhTdJ6AL3bm6lGE/JH9JO1Ppd0OvoSEmo+GxnR0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GGIhcb+KP6YfaUfHtRsj9qGgMTVC/f4Im92/iSmo8cs=; b=lX/jxysB
 scjY8N0x2UtFQVlS3cfxztLmlINqCV5qYzuVwFadBCFOMAGqgF5m5i7Nfhq4fwJP
 9rMoD00DYNRE2OSyA4wz2qRkCSWYUZrGRfhirznAnXTB+jsRShU+u74dvaN8ek3D
 CGNuxzDctXLUqaeH37BCRJWjeGnvOH6Y1JK5TjjUl6BvvTNsL/STIovTPH74P/F+
 VHBj/TxNE/UpYbY35iZJ2xdLQZutroe+xdK7D22XAf48XBfQ5MMHpPzyJwDJ466E
 LmANNwNAQ3iTLR0xcWhCS3PGwMeyeAnMG0+MaPLfc1s0SJipXvmFNFxbCkf8Jz0D
 n3+m6/ECSm49Mg==
X-ME-Sender: <xms:YxdGYCtgRdVsJXVEckjuxOLuyRA8678BB-3VlWmMAxG7B1cUQo7JjQ>
 <xme:YxdGYHewilwX2nAMSRoO2YSLOmdzobM3-xX_QNjn0k8OdFBgAVEBnN4KUhiiOC3cf
 Aon2bSy6kD_yxs9_4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YxdGYNxkrNjbyH9OdnpVxwtsAwS_y69woSVyPMuZvGMy3VreKM2fSg>
 <xmx:YxdGYNMFuCu24xGqTgBqOy9Kmh5kfzMFl-Y2KjBnNlubpfmW7bA7lA>
 <xmx:YxdGYC_RXYfCzKRzZhWCSwulEhuKjYdS4I_F4Cp3VRgieSGbkC_b0Q>
 <xmx:YxdGYHNG7RySGs5l7y6h0c6iVmkGD6D0Xqc1VKvvnfRjkJdUrrI7Yw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E87601080064;
 Mon,  8 Mar 2021 07:24:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 30/38] hw/block/nvme: refactor nvme_dma
Date: Mon,  8 Mar 2021 13:23:05 +0100
Message-Id: <20210308122313.286938-31-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index fb0bc971704f..22bd8403496b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -862,45 +862,71 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
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
@@ -1737,8 +1763,7 @@ static void nvme_compare_cb(void *opaque, int ret)
 
     buf = g_malloc(ctx->iov.size);
 
-    status = nvme_dma(nvme_ctrl(req), buf, ctx->iov.size,
-                      DMA_DIRECTION_TO_DEVICE, req);
+    status = nvme_h2c(nvme_ctrl(req), buf, ctx->iov.size, req);
     if (status) {
         req->status = status;
         goto out;
@@ -1774,8 +1799,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
         NvmeDsmRange range[nr];
         uintptr_t *discards = (uintptr_t *)&req->opaque;
 
-        status = nvme_dma(n, (uint8_t *)range, sizeof(range),
-                          DMA_DIRECTION_TO_DEVICE, req);
+        status = nvme_h2c(n, (uint8_t *)range, sizeof(range), req);
         if (status) {
             return status;
         }
@@ -1861,8 +1885,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     range = g_new(NvmeCopySourceRange, nr);
 
-    status = nvme_dma(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
-                      DMA_DIRECTION_TO_DEVICE, req);
+    status = nvme_h2c(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
+                      req);
     if (status) {
         return status;
     }
@@ -2513,8 +2537,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
         zd_ext = nvme_get_zd_extension(ns, zone_idx);
-        status = nvme_dma(n, zd_ext, ns->params.zd_extension_size,
-                          DMA_DIRECTION_TO_DEVICE, req);
+        status = nvme_h2c(n, zd_ext, ns->params.zd_extension_size, req);
         if (status) {
             trace_pci_nvme_err_zd_extension_map_error(zone_idx);
             return status;
@@ -2668,8 +2691,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_dma(n, (uint8_t *)buf, data_size,
-                      DMA_DIRECTION_FROM_DEVICE, req);
+    status = nvme_c2h(n, (uint8_t *)buf, data_size, req);
 
     g_free(buf);
 
@@ -2935,8 +2957,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
         nvme_clear_events(n, NVME_AER_TYPE_SMART);
     }
 
-    return nvme_dma(n, (uint8_t *) &smart + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
 }
 
 static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
@@ -2954,8 +2975,7 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
     strpadcpy((char *)&fw_log.frs1, sizeof(fw_log.frs1), "1.0", ' ');
     trans_len = MIN(sizeof(fw_log) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *) &fw_log + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &fw_log + off, trans_len, req);
 }
 
 static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
@@ -2975,8 +2995,7 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     memset(&errlog, 0x0, sizeof(errlog));
     trans_len = MIN(sizeof(errlog) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *)&errlog, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
 
 static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
@@ -3016,8 +3035,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
 
     trans_len = MIN(sizeof(log) - off, buf_len);
 
-    return nvme_dma(n, ((uint8_t *)&log) + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
@@ -3185,7 +3203,7 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n, NvmeRequest *req)
 {
     uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
-    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, id, sizeof(id), req);
 }
 
 static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
@@ -3202,8 +3220,7 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_identify_ctrl();
 
-    return nvme_dma(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl), req);
 }
 
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
@@ -3226,7 +3243,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, id, sizeof(id), req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -3247,8 +3264,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
-        return nvme_dma(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+        return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
     }
 
     return NVME_INVALID_CMD_SET | NVME_DNR;
@@ -3274,8 +3290,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
         return nvme_rpt_empty_id_struct(n, req);
     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
-        return nvme_dma(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
-                        DMA_DIRECTION_FROM_DEVICE, req);
+        return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
+                        req);
     }
 
     return NVME_INVALID_FIELD | NVME_DNR;
@@ -3317,7 +3333,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
@@ -3357,7 +3373,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
@@ -3404,7 +3420,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     ns_descrs->csi.hdr.nidl = NVME_NIDL_CSI;
     ns_descrs->csi.v = ns->csi;
 
-    return nvme_dma(n, list, sizeof(list), DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, sizeof(list), req);
 }
 
 static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
@@ -3417,7 +3433,7 @@ static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
     NVME_SET_CSI(*list, NVME_CSI_NVM);
     NVME_SET_CSI(*list, NVME_CSI_ZONED);
 
-    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, data_len, req);
 }
 
 static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
@@ -3509,8 +3525,7 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
 {
     uint64_t timestamp = nvme_get_timestamp(n);
 
-    return nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
 }
 
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
@@ -3671,8 +3686,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
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


