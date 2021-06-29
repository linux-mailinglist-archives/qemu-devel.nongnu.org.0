Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5F33B789A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:28:20 +0200 (CEST)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJP9-0002uj-6s
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInM-0001zy-3M; Tue, 29 Jun 2021 14:49:16 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInH-0005fY-Dx; Tue, 29 Jun 2021 14:49:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 47C102B00AC6;
 Tue, 29 Jun 2021 14:48:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 29 Jun 2021 14:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=vio4zXWSjN0xE
 KlqJ4Ey4Vu/JZKT1Pv2y4bfNe5vWjM=; b=ZeEia5MbSCo+SD7bcrsYbmbuCs/IV
 lX2rAShBDyFTPUKFRFjGZtWWt1ptGkOZ8alk/DptHFHDjgGzL61BF1B7JzSDkiOl
 7kmVTgvyd8zSmDP3064C2qvC4dPud5LNjqEfA+uvXlZUtXNmPkCdQini8bgxXfGr
 b5ApTs2GftzF+cZ+7VA9o5zAS89deRYRMXhxUU+k1u5AG6cVCX2RF6dHbIchSKtd
 yi4F1RsPzFD7BESr3+vfplnNECiRnTSkI65pm3i5fhCICC8RbTIF/dYuBpIjwBCR
 i6fPya23qgzn7zug8SUmlrCWvd/Q2qnrQC94cnZHKQer0GEJNKCJ0Yt/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vio4zXWSjN0xEKlqJ4Ey4Vu/JZKT1Pv2y4bfNe5vWjM=; b=iK68hWd7
 kgSSBQf6nov3iIU7QVejR216n27NOPoLwuVga1RpKLiEaMlam6IMyWPjodzqj3rC
 ui9a67w/XPaMsykGtSHhOBBFJH7dJPQkQShZqEZ/vJpWchNQ/Deo57I5XjKOQYoZ
 Tbcco0NjPHKKA8xmT+hQZU1uLrWlVEFFI9aMY72aX9WfEfsVSNmO5H59XY6xoDHp
 Co0Wmo4cvRZQOkmPomxeFaB8sQSi+Ja0TViwOteLCuBEJWlHPPn5s1msiJH9CyGu
 D3Y0kuJqNtwRSHHxtXh8Auoguk3uDNIxajPzUxXhCOiQNL2s9Fw9SfaJB0wExnhu
 dEeNzxJOgCX5Rg==
X-ME-Sender: <xms:D2vbYGYwO9AD875h0D98cu91BFUIeU2IanOq3Mo1KnzOgkVoROtT_w>
 <xme:D2vbYJZbrTCTd6veeypaqblWbfo3fpK39wK1z8rH8Qh30JY1B4DOHWbkNnGMKza4H
 JDHl9XMv3NtQQzsg34>
X-ME-Received: <xmr:D2vbYA8bwfMSIryEl-2-qOGuAbQh6K_DBfi0qS3taB5sFMpUTLjxh9fD1WugYLxUU1reFVYAQgtZNQ1jvUDUYDRjmsjGyGXRrbTgr6FVQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:D2vbYIprP4CWKseGmqzadeDxrWufOT9-FIAFQmPHrzSr-u0Hg4il4A>
 <xmx:D2vbYBqKGqGI9bZV7miv84shRLmA3PRB-tcBBkqEX9HyhlOXC28hCg>
 <xmx:D2vbYGTFPs1OdA3BJUb1fuqQZgszPn3WcgjSgDqGTu10w8Trtt6Hcw>
 <xmx:D2vbYOjW_wBBb6KFL-ULE8NKVDgG-jacBw6ULUtZdh4g0y8PJsDMtX5yt3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:46 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 17/23] hw/nvme: reimplement format nvm to allow cancellation
Date: Tue, 29 Jun 2021 20:47:37 +0200
Message-Id: <20210629184743.230173-18-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prior to this patch, the aios associated with broadcast format are
submitted anonymously (no aiocb reference saved from the blk_aio call).

Fix this by formatting the namespaces one after another, saving a
reference to the aiocb for each.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c       | 289 +++++++++++++++++++++++--------------------
 hw/nvme/trace-events |   4 +-
 2 files changed, 156 insertions(+), 137 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5b550ec1a1b4..3b8c542db6e7 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1924,42 +1924,6 @@ out:
     nvme_rw_complete_cb(req, ret);
 }
 
-struct nvme_aio_format_ctx {
-    NvmeRequest   *req;
-    NvmeNamespace *ns;
-
-    /* number of outstanding write zeroes for this namespace */
-    int *count;
-};
-
-static void nvme_aio_format_cb(void *opaque, int ret)
-{
-    struct nvme_aio_format_ctx *ctx = opaque;
-    NvmeRequest *req = ctx->req;
-    NvmeNamespace *ns = ctx->ns;
-    uintptr_t *num_formats = (uintptr_t *)&req->opaque;
-    int *count = ctx->count;
-
-    g_free(ctx);
-
-    if (ret) {
-        nvme_aio_err(req, ret);
-    }
-
-    if (--(*count)) {
-        return;
-    }
-
-    g_free(count);
-    ns->status = 0x0;
-
-    if (--(*num_formats)) {
-        return;
-    }
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
 static void nvme_verify_cb(void *opaque, int ret)
 {
     NvmeBounceContext *ctx = opaque;
@@ -5272,30 +5236,98 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_format_ns(NvmeCtrl *n, NvmeNamespace *ns, uint8_t lbaf,
-                               uint8_t mset, uint8_t pi, uint8_t pil,
-                               NvmeRequest *req)
-{
-    int64_t len, offset;
-    struct nvme_aio_format_ctx *ctx;
-    BlockBackend *blk = ns->blkconf.blk;
-    uint16_t ms;
-    uintptr_t *num_formats = (uintptr_t *)&req->opaque;
-    int *count;
+typedef struct NvmeFormatAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    QEMUBH *bh;
+    NvmeRequest *req;
+    int ret;
 
+    NvmeNamespace *ns;
+    uint32_t nsid;
+    bool broadcast;
+    int64_t offset;
+} NvmeFormatAIOCB;
+
+static void nvme_format_bh(void *opaque);
+
+static void nvme_format_cancel(BlockAIOCB *aiocb)
+{
+    NvmeFormatAIOCB *iocb = container_of(aiocb, NvmeFormatAIOCB, common);
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+    }
+}
+
+static const AIOCBInfo nvme_format_aiocb_info = {
+    .aiocb_size = sizeof(NvmeFormatAIOCB),
+    .cancel_async = nvme_format_cancel,
+    .get_aio_context = nvme_get_aio_context,
+};
+
+static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
+{
+    uint32_t dw10 = le32_to_cpu(cmd->cdw10);
+    uint8_t lbaf = dw10 & 0xf;
+    uint8_t pi = (dw10 >> 5) & 0x7;
+    uint8_t mset = (dw10 >> 4) & 0x1;
+    uint8_t pil = (dw10 >> 8) & 0x1;
+
+    trace_pci_nvme_format_set(ns->params.nsid, lbaf, mset, pi, pil);
+
+    ns->id_ns.dps = (pil << 3) | pi;
+    ns->id_ns.flbas = lbaf | (mset << 4);
+
+    nvme_ns_init_format(ns);
+}
+
+static void nvme_format_ns_cb(void *opaque, int ret)
+{
+    NvmeFormatAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeNamespace *ns = iocb->ns;
+    int bytes;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto done;
+    }
+
+    assert(ns);
+
+    if (iocb->offset < ns->size) {
+        bytes = MIN(BDRV_REQUEST_MAX_BYTES, ns->size - iocb->offset);
+
+        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, iocb->offset,
+                                            bytes, BDRV_REQ_MAY_UNMAP,
+                                            nvme_format_ns_cb, iocb);
+
+        iocb->offset += bytes;
+        return;
+    }
+
+    nvme_format_set(ns, &req->cmd);
+    ns->status = 0x0;
+    iocb->ns = NULL;
+    iocb->offset = 0;
+
+done:
+    iocb->aiocb = NULL;
+    qemu_bh_schedule(iocb->bh);
+}
+
+static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
+{
     if (ns->params.zoned) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
-    trace_pci_nvme_format_ns(nvme_cid(req), nvme_nsid(ns), lbaf, mset, pi, pil);
-
     if (lbaf > ns->id_ns.nlbaf) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
-    ms = ns->id_ns.lbaf[lbaf].ms;
-
-    if (pi && (ms < sizeof(NvmeDifTuple))) {
+    if (pi && (ns->id_ns.lbaf[lbaf].ms < sizeof(NvmeDifTuple))) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
@@ -5303,107 +5335,96 @@ static uint16_t nvme_format_ns(NvmeCtrl *n, NvmeNamespace *ns, uint8_t lbaf,
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    nvme_ns_drain(ns);
-    nvme_ns_shutdown(ns);
-    nvme_ns_cleanup(ns);
-
-    ns->id_ns.dps = (pil << 3) | pi;
-    ns->id_ns.flbas = lbaf | (mset << 4);
-
-    nvme_ns_init_format(ns);
-
-    ns->status = NVME_FORMAT_IN_PROGRESS;
-
-    len = ns->size;
-    offset = 0;
-
-    count = g_new(int, 1);
-    *count = 1;
-
-    (*num_formats)++;
-
-    while (len) {
-        ctx = g_new(struct nvme_aio_format_ctx, 1);
-        ctx->req = req;
-        ctx->ns = ns;
-        ctx->count = count;
-
-        size_t bytes = MIN(BDRV_REQUEST_MAX_BYTES, len);
-
-        (*count)++;
-
-        blk_aio_pwrite_zeroes(blk, offset, bytes, BDRV_REQ_MAY_UNMAP,
-                              nvme_aio_format_cb, ctx);
-
-        offset += bytes;
-        len -= bytes;
-
-    }
-
-    if (--(*count)) {
-        return NVME_NO_COMPLETE;
-    }
-
-    g_free(count);
-    ns->status = 0x0;
-    (*num_formats)--;
-
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
+static void nvme_format_bh(void *opaque)
 {
-    NvmeNamespace *ns;
+    NvmeFormatAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeCtrl *n = nvme_ctrl(req);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
-    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
     uint8_t lbaf = dw10 & 0xf;
-    uint8_t mset = (dw10 >> 4) & 0x1;
     uint8_t pi = (dw10 >> 5) & 0x7;
-    uint8_t pil = (dw10 >> 8) & 0x1;
-    uintptr_t *num_formats = (uintptr_t *)&req->opaque;
     uint16_t status;
     int i;
 
-    trace_pci_nvme_format(nvme_cid(req), nsid, lbaf, mset, pi, pil);
+    if (iocb->ret < 0) {
+        goto done;
+    }
 
-    /* 1-initialize; see the comment in nvme_dsm */
-    *num_formats = 1;
-
-    if (nsid != NVME_NSID_BROADCAST) {
-        if (!nvme_nsid_valid(n, nsid)) {
-            return NVME_INVALID_NSID | NVME_DNR;
-        }
-
-        ns = nvme_ns(n, nsid);
-        if (!ns) {
-            return NVME_INVALID_FIELD | NVME_DNR;
-        }
-
-        status = nvme_format_ns(n, ns, lbaf, mset, pi, pil, req);
-        if (status && status != NVME_NO_COMPLETE) {
-            req->status = status;
-        }
-    } else {
-        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
-            ns = nvme_ns(n, i);
-            if (!ns) {
-                continue;
-            }
-
-            status = nvme_format_ns(n, ns, lbaf, mset, pi, pil, req);
-            if (status && status != NVME_NO_COMPLETE) {
-                req->status = status;
+    if (iocb->broadcast) {
+        for (i = iocb->nsid + 1; i <= NVME_MAX_NAMESPACES; i++) {
+            iocb->ns = nvme_ns(n, i);
+            if (iocb->ns) {
+                iocb->nsid = i;
                 break;
             }
         }
     }
 
-    /* account for the 1-initialization */
-    if (--(*num_formats)) {
-        return NVME_NO_COMPLETE;
+    if (!iocb->ns) {
+        goto done;
     }
 
-    return req->status;
+    status = nvme_format_check(iocb->ns, lbaf, pi);
+    if (status) {
+        req->status = status;
+        goto done;
+    }
+
+    iocb->ns->status = NVME_FORMAT_IN_PROGRESS;
+    nvme_format_ns_cb(iocb, 0);
+    return;
+
+done:
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_aio_unref(iocb);
+}
+
+static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeFormatAIOCB *iocb;
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint16_t status;
+
+    iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
+
+    iocb->req = req;
+    iocb->bh = qemu_bh_new(nvme_format_bh, iocb);
+    iocb->ret = 0;
+    iocb->ns = NULL;
+    iocb->nsid = 0;
+    iocb->broadcast = (nsid == NVME_NSID_BROADCAST);
+    iocb->offset = 0;
+
+    if (!iocb->broadcast) {
+        if (!nvme_nsid_valid(n, nsid)) {
+            status = NVME_INVALID_NSID | NVME_DNR;
+            goto out;
+        }
+
+        iocb->ns = nvme_ns(n, nsid);
+        if (!iocb->ns) {
+            status = NVME_INVALID_FIELD | NVME_DNR;
+            goto out;
+        }
+    }
+
+    req->aiocb = &iocb->common;
+    qemu_bh_schedule(iocb->bh);
+
+    return NVME_NO_COMPLETE;
+
+out:
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
+    return status;
 }
 
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index dc00c2860db7..48d10c36e85b 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -10,9 +10,7 @@ pci_nvme_map_sgl(uint8_t typ, uint64_t len) "type 0x%"PRIx8" len %"PRIu64""
 pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid 0x%"PRIx32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_flush_ns(uint32_t nsid) "nsid 0x%"PRIx32""
-pci_nvme_format(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
-pci_nvme_format_ns(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
-pci_nvme_format_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
+pci_nvme_format_set(uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-- 
2.32.0


