Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276772DDABB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:21:03 +0100 (CET)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0hq-0003SC-0G
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Q1-00026F-2h; Thu, 17 Dec 2020 16:02:37 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Pv-0002C6-MP; Thu, 17 Dec 2020 16:02:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 794F558A;
 Thu, 17 Dec 2020 16:02:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Dec 2020 16:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sve0KRhX3um9N
 0gZKqkUcIJmDfL0Xx7xO7yaVxPl5q4=; b=j65oWQRlsV3zJc6lJ/0Uq0T0JC3Nc
 YHeamvnyIyj6rnWLMmT9xScRUWwqwUcziZlKAosROmI0QqtRoAuNUPy5+KxXhq3J
 eeSECxffotMEnObEBKPhszz9sIcVsdEaFWXbrHqLkW84OlvX3SOTx1jHwh55Geto
 4Ss3uUsOd4vD+ejWPcqlzOxt1x3UxplxplCF4uBnkKzSPIOBsPlnNH1B8fnu6+eX
 vvHCc+hELO8nZyUmZugD/XmbPiDLEjYYl9XoTFp9P68H2TpX+fcJSkF9hBK/Ibey
 XtddrpKQ6gej4WIZ9HHYqy1htJDsQjPvfBZuwS22k2s1jD24FGFYAi/HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sve0KRhX3um9N0gZKqkUcIJmDfL0Xx7xO7yaVxPl5q4=; b=o51aCyVX
 hGVx6seYbX0YxQiAXPXWOfNt1Q06FcDoBvSqlXjUoev5YX/XPHgOWOQMXPkkc69I
 Ng/3D4OBfOOwvqgxP9Ho/Mh2YzlaG26Z02yYlNO+NvenVZBmuDocXBh4Z1NClsbV
 4FxXKK+kYA7zem7reLOokG7y60WhOtHajbp/tNNHkYqgvIB27GFJtHDJGI3v2/Vh
 GWszQYgA0zQGc4nN+1Yfpnvm8XBhtI0JFSihuyCtteH2TFL6MS5O3ClL5EOAgEeS
 6MZdm8EQ437MXxiQ4SoMiVwWdWYGrnDC2jK0uJTK094i1AiFXDvJN9syRQlIWFbN
 sdTiAgYDQeLb7w==
X-ME-Sender: <xms:Y8fbX9UpMAE4ZcLuIfZ2hHN0IpDnRMqFPCQzdWJXbEHS8617RbzmGQ>
 <xme:Y8fbX9lJaVVAQ2_Xto6ge4r6g3QEp2wwwm6-WDbOoGfXiYvgXygwhk5YwwLS0agWZ
 UoMIJoE4IcPxgsJN1s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Y8fbX5a_mS8vx2cOlIgxFzRpOfU530C8UZxfa5BDYk_5zPj1WFu_eg>
 <xmx:Y8fbXwXDwl1sWXReBq6ftUuCdO7Ec3F4L5f1NvjSB6dmNdLHWzoYBA>
 <xmx:Y8fbX3lLA0KDFufdeJcUcMOggwPDTo9977v9F7cCCQeINu45nlU4pg>
 <xmx:Y8fbX1aufy3YDl37jUnbaU8J0lM4N7T9yGK74Ipa5wUqS-XRJbslsg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 63BE124005B;
 Thu, 17 Dec 2020 16:02:26 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 2/3] hw/block/nvme: refactor nvme_dma
Date: Thu, 17 Dec 2020 22:02:21 +0100
Message-Id: <20201217210222.779619-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217210222.779619-1-its@irrelevant.dk>
References: <20201217210222.779619-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The nvme_dma function doesn't just do DMA (QEMUSGList-based) memory transfers;
it also handles QEMUIOVector copies.

Introduce the NvmeTxDirection enum and rename to nvme_tx. Remove mapping
of PRPs/SGLs from nvme_tx and assert that they have been mapped
previously. This allows more fine-grained use. Also expose
nvme_tx_{qsg,iov} versions in preparation for end-to-end data protection
support.

Add new, better named, helpers, nvme_{c2h,h2c}, that does both PRP/SGL
mapping and transfer.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 133 +++++++++++++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 53 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e4922c37c94d..8d580c121bcc 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -682,48 +682,86 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, size_t len, NvmeRequest *req)
     }
 }
 
-static uint16_t nvme_dma(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
-                         DMADirection dir, NvmeRequest *req)
+typedef enum NvmeTxDirection {
+    NVME_TX_DIRECTION_TO_DEVICE   = 0,
+    NVME_TX_DIRECTION_FROM_DEVICE = 1,
+} NvmeTxDirection;
+
+static uint16_t nvme_tx_qsg(uint8_t *ptr, uint32_t len, QEMUSGList *qsg,
+                            NvmeTxDirection dir)
 {
-    uint16_t status = NVME_SUCCESS;
+    uint64_t residual;
+
+    if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
+        residual = dma_buf_write(ptr, len, qsg);
+    } else {
+        residual = dma_buf_read(ptr, len, qsg);
+    }
+
+    if (unlikely(residual)) {
+        trace_pci_nvme_err_invalid_dma();
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_tx_iov(uint8_t *ptr, uint32_t len, QEMUIOVector *iov,
+                            NvmeTxDirection dir)
+{
+    size_t bytes;
+
+    if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
+        bytes = qemu_iovec_to_buf(iov, 0, ptr, len);
+    } else {
+        bytes = qemu_iovec_from_buf(iov, 0, ptr, len);
+    }
+
+    if (unlikely(bytes != len)) {
+        trace_pci_nvme_err_invalid_dma();
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_tx(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                        NvmeTxDirection dir, NvmeRequest *req)
+{
+    /* assert that exactly one of qsg and iov carries data */
+    assert((req->qsg.nsg > 0) != (req->iov.niov > 0));
+
+    if (req->qsg.nsg > 0) {
+        return nvme_tx_qsg(ptr, len, &req->qsg, dir);
+    }
+
+    return nvme_tx_iov(ptr, len, &req->iov, dir);
+}
+
+static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                         NvmeRequest *req)
+{
+    uint16_t status;
 
     status = nvme_map_dptr(n, len, req);
     if (status) {
         return status;
     }
 
-    /* assert that only one of qsg and iov carries data */
-    assert((req->qsg.nsg > 0) != (req->iov.niov > 0));
+    return nvme_tx(n, ptr, len, NVME_TX_DIRECTION_FROM_DEVICE, req);
+}
 
-    if (req->qsg.nsg > 0) {
-        uint64_t residual;
+static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                         NvmeRequest *req)
+{
+    uint16_t status;
 
-        if (dir == DMA_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &req->qsg);
-        } else {
-            residual = dma_buf_read(ptr, len, &req->qsg);
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
-            bytes = qemu_iovec_to_buf(&req->iov, 0, ptr, len);
-        } else {
-            bytes = qemu_iovec_from_buf(&req->iov, 0, ptr, len);
-        }
-
-        if (unlikely(bytes != len)) {
-            trace_pci_nvme_err_invalid_dma();
-            status = NVME_INVALID_FIELD | NVME_DNR;
-        }
+    status = nvme_map_dptr(n, len, req);
+    if (status) {
+        return status;
     }
 
-    return status;
+    return nvme_tx(n, ptr, len, NVME_TX_DIRECTION_TO_DEVICE, req);
 }
 
 static void nvme_post_cqes(void *opaque)
@@ -1025,8 +1063,7 @@ static void nvme_compare_cb(void *opaque, int ret)
 
     buf = g_malloc(ctx->len);
 
-    status = nvme_dma(nvme_ctrl(req), buf, ctx->len, DMA_DIRECTION_TO_DEVICE,
-                      req);
+    status = nvme_h2c(nvme_ctrl(req), buf, ctx->len, req);
     if (status) {
         req->status = status;
         goto out;
@@ -1062,8 +1099,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
         NvmeDsmRange range[nr];
         uintptr_t *discards = (uintptr_t *)&req->opaque;
 
-        status = nvme_dma(n, (uint8_t *)range, sizeof(range),
-                          DMA_DIRECTION_TO_DEVICE, req);
+        status = nvme_h2c(n, (uint8_t *)range, sizeof(range), req);
         if (status) {
             return status;
         }
@@ -1498,8 +1534,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
         nvme_clear_events(n, NVME_AER_TYPE_SMART);
     }
 
-    return nvme_dma(n, (uint8_t *) &smart + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
 }
 
 static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
@@ -1517,8 +1552,7 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
     strpadcpy((char *)&fw_log.frs1, sizeof(fw_log.frs1), "1.0", ' ');
     trans_len = MIN(sizeof(fw_log) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *) &fw_log + off, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *) &fw_log + off, trans_len, req);
 }
 
 static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
@@ -1538,8 +1572,7 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     memset(&errlog, 0x0, sizeof(errlog));
     trans_len = MIN(sizeof(errlog) - off, buf_len);
 
-    return nvme_dma(n, (uint8_t *)&errlog, trans_len,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
 
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
@@ -1702,8 +1735,7 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_identify_ctrl();
 
-    return nvme_dma(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl), req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -1726,8 +1758,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
         id_ns = &ns->id_ns;
     }
 
-    return nvme_dma(n, (uint8_t *)id_ns, sizeof(NvmeIdNs),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)id_ns, sizeof(NvmeIdNs), req);
 }
 
 static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
@@ -1761,8 +1792,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
             break;
         }
     }
-    ret = nvme_dma(n, (uint8_t *)list, data_len, DMA_DIRECTION_FROM_DEVICE,
-                   req);
+    ret = nvme_c2h(n, (uint8_t *)list, data_len, req);
     g_free(list);
     return ret;
 }
@@ -1804,8 +1834,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     ns_descrs->uuid.hdr.nidl = NVME_NIDT_UUID_LEN;
     stl_be_p(&ns_descrs->uuid.v, nsid);
 
-    return nvme_dma(n, list, NVME_IDENTIFY_DATA_SIZE,
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, list, NVME_IDENTIFY_DATA_SIZE, req);
 }
 
 static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
@@ -1878,8 +1907,7 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
 {
     uint64_t timestamp = nvme_get_timestamp(n);
 
-    return nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
-                    DMA_DIRECTION_FROM_DEVICE, req);
+    return nvme_c2h(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
 }
 
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
@@ -2026,8 +2054,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     uint16_t ret;
     uint64_t timestamp;
 
-    ret = nvme_dma(n, (uint8_t *)&timestamp, sizeof(timestamp),
-                   DMA_DIRECTION_TO_DEVICE, req);
+    ret = nvme_h2c(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
     if (ret != NVME_SUCCESS) {
         return ret;
     }
-- 
2.29.2


