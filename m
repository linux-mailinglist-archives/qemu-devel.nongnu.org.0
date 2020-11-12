Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F402B0ED8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 21:11:10 +0100 (CET)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdIw1-0007GU-L3
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 15:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIlB-0003HU-09; Thu, 12 Nov 2020 14:59:57 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl8-000795-Ul; Thu, 12 Nov 2020 14:59:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 335BC5C010E;
 Thu, 12 Nov 2020 14:59:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 14:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=iVkidqtcwFOox
 hT/gqh/wRXIMvZcNUGIJ9h+LWPxQx8=; b=CV0AeAQIIAmEgN5nuqkUji+7aaaZU
 8lGJva05hgzBJttygrjJwGX3YMmnc1pAN0v35mx2bT23dtgCk4mjwLT8/YR37a2n
 fYJYKSXDDukd+8WgXNnmXhM7JgGR6CsOZZECq7oM8C0jrn3bBlbB4QvTKeYxKc3V
 4zMCKOt9nIC5BW9jImFmFdpyGDD82ZDOMd/WLhh2xlRa7D8Y+RwRIQPIHueKAH3G
 TxJFZGYTAod86gLV2AvmjFmG57sYup6KnIgg9IP8Xzyx3WKbo+Afn+TcK+4dPjY5
 1yhgahE8q7xuT2D6alAApuHupco5Yjz56PAk+zKwIcFZnyjGXxIikBFrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iVkidqtcwFOoxhT/gqh/wRXIMvZcNUGIJ9h+LWPxQx8=; b=JxhjTURl
 pESlfh99MrV9CelnB5oya2mgyR60U1/cyxr/qg1p8Tu6tVRg0g0MgACH7H/xWKTn
 9Z7oXtcDGuNF9aKQB4rYxu/UV5jqTSFk2/E0mg+hFHQBjjJ3aENqFfXRe4arvPIB
 ohc82h/ZDj3H268FrJ4QKH6vttJL/7JGHIx6BxkeeVgl5yNVqSE8ZnCkFW4k2H7c
 RJw9lSBtCOAQu5pzB5mW0bcvWBrxpxabbXIpFCKomETzyDMa2BReZKpMC5//z6EL
 qKLpcejnlUbWhhejF51rJPIq3/edMogzmXwo9rkXo7Hmk1Vj9jZYmveFo+yl0O2q
 4gWcbGwD+YBHUA==
X-ME-Sender: <xms:OZStX7t4NLWNtQNySv675heFWvdH62r9R3Jc4CGPFH6p5OMieVj73w>
 <xme:OZStX8eFKQr7sSN6-F3Cqwo3Zi09uCVEQecUJRMaPh4D7UuSMdl6WzuYkbI7JTgIp
 t0al4wE3xLLn64kxh4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:OpStX-wXs34YI_hG_zzGA6bjlVMg7HV78QcYOeBltaTbnTAAgoqZ7w>
 <xmx:OpStX6OjMtSycZjrclLtXp4w_FcUj5oKQLp22DptwDthFbbvflN4Xw>
 <xmx:OpStX7_iG0kDSIkjuaYo6XBt1w_dMI14ex8Jdi8pWxmLb4HdHO6irA>
 <xmx:OpStX2kz5S_mgT7oRoRwjuxLxsZUj-Jgbb6ohCmZXbfPkIN0H6GFEA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D242230689E4;
 Thu, 12 Nov 2020 14:59:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/5] hw/block/nvme: add the dataset management command
Date: Thu, 12 Nov 2020 20:59:45 +0100
Message-Id: <20201112195945.819915-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112195945.819915-1-its@irrelevant.dk>
References: <20201112195945.819915-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 14:59:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for the Dataset Management command and the Deallocate
attribute. Deallocation results in discards being sent to the underlying
block device. Whether of not the blocks are actually deallocated is
affected by the same factors as Write Zeroes (see previous commit).

     format | discard | dsm (512B)  dsm (4KiB)  dsm (64KiB)
    --------------------------------------------------------
      qcow2    ignore   n           n           n
      qcow2    unmap    n           n           y
      raw      ignore   n           n           n
      raw      unmap    n           y           y

Again, a raw format and 4KiB LBAs are preferable.

In order to set the Namespace Preferred Deallocate Granularity and
Alignment fields (NPDG and NPDA), choose a sane minimum discard
granularity of 4KiB. If we are using a passthru device supporting
discard at a 512B granularity, user should set the discard_granularity
property explicitly. NPDG and NPDA will also account for the
cluster_size of the block driver if required (i.e. for QCOW2).

See NVM Express 1.3d, Section 6.7 ("Dataset Management command").

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h    |  2 +
 hw/block/nvme-ns.c | 30 ++++++++++++--
 hw/block/nvme.c    | 98 +++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 125 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index e080a2318a50..574333caa3f9 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -28,6 +28,7 @@ typedef struct NvmeRequest {
     struct NvmeNamespace    *ns;
     BlockAIOCB              *aiocb;
     uint16_t                status;
+    void                    *opaque;
     NvmeCqe                 cqe;
     NvmeCmd                 cmd;
     BlockAcctCookie         acct;
@@ -60,6 +61,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
     case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
+    case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
     default:                        return "NVME_NVM_CMD_UNKNOWN";
     }
 }
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index f1cc734c60f5..2d69b5177b51 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -28,10 +28,14 @@
 #include "nvme.h"
 #include "nvme-ns.h"
 
-static void nvme_ns_init(NvmeNamespace *ns)
+#define MIN_DISCARD_GRANULARITY (4 * KiB)
+
+static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
+    BlockDriverInfo bdi;
     NvmeIdNs *id_ns = &ns->id_ns;
     int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
+    int npdg;
 
     ns->id_ns.dlfeat = 0x9;
 
@@ -43,8 +47,19 @@ static void nvme_ns_init(NvmeNamespace *ns)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    /* support DULBE */
-    id_ns->nsfeat |= 0x4;
+    /* support DULBE and I/O optimization fields */
+    id_ns->nsfeat |= (0x4 | 0x10);
+
+    npdg = ns->blkconf.discard_granularity / ns->blkconf.logical_block_size;
+
+    if (bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi) >= 0 &&
+        bdi.cluster_size > ns->blkconf.discard_granularity) {
+        npdg = bdi.cluster_size / ns->blkconf.logical_block_size;
+    }
+
+    id_ns->npda = id_ns->npdg = npdg - 1;
+
+    return 0;
 }
 
 static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
@@ -59,6 +74,11 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->blkconf.discard_granularity == -1) {
+        ns->blkconf.discard_granularity =
+            MAX(ns->blkconf.logical_block_size, MIN_DISCARD_GRANULARITY);
+    }
+
     ns->size = blk_getlength(ns->blkconf.blk);
     if (ns->size < 0) {
         error_setg_errno(errp, -ns->size, "could not get blockdev size");
@@ -92,7 +112,9 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    nvme_ns_init(ns);
+    if (nvme_ns_init(ns, errp)) {
+        return -1;
+    }
 
     if (nvme_register_namespace(n, ns, errp)) {
         return -1;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8d75a89fd872..f7f888402b06 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -242,6 +242,7 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
 static void nvme_req_clear(NvmeRequest *req)
 {
     req->ns = NULL;
+    req->opaque = NULL;
     memset(&req->cqe, 0x0, sizeof(req->cqe));
     req->status = NVME_SUCCESS;
 }
@@ -978,6 +979,99 @@ static void nvme_rw_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+static void nvme_aio_discard_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    uintptr_t *discards = (uintptr_t *)&req->opaque;
+
+    trace_pci_nvme_aio_discard_cb(nvme_cid(req));
+
+    if (ret) {
+        nvme_aio_err(req, ret);
+    }
+
+    (*discards)--;
+
+    if (*discards) {
+        return;
+    }
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    NvmeDsmCmd *dsm = (NvmeDsmCmd *) &req->cmd;
+
+    uint32_t attr = le32_to_cpu(dsm->attributes);
+    uint32_t nr = (le32_to_cpu(dsm->nr) & 0xff) + 1;
+
+    uint16_t status = NVME_SUCCESS;
+
+    trace_pci_nvme_dsm(nvme_cid(req), nvme_nsid(ns), nr, attr);
+
+    if (attr & NVME_DSMGMT_AD) {
+        int64_t offset;
+        size_t len;
+        NvmeDsmRange range[nr];
+        uintptr_t *discards = (uintptr_t *)&req->opaque;
+
+        status = nvme_dma(n, (uint8_t *)range, sizeof(range),
+                          DMA_DIRECTION_TO_DEVICE, req);
+        if (status) {
+            return status;
+        }
+
+        /*
+         * AIO callbacks may be called immediately, so initialize discards to 1
+         * to make sure the the callback does not complete the request before
+         * all discards have been issued.
+         */
+        *discards = 1;
+
+        for (int i = 0; i < nr; i++) {
+            uint64_t slba = le64_to_cpu(range[i].slba);
+            uint32_t nlb = le32_to_cpu(range[i].nlb);
+
+            if (nvme_check_bounds(ns, slba, nlb)) {
+                trace_pci_nvme_err_invalid_lba_range(slba, nlb,
+                                                     ns->id_ns.nsze);
+                continue;
+            }
+
+            trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns), slba,
+                                          nlb);
+
+            offset = nvme_l2b(ns, slba);
+            len = nvme_l2b(ns, nlb);
+
+            while (len) {
+                size_t bytes = MIN(BDRV_REQUEST_MAX_BYTES, len);
+
+                (*discards)++;
+
+                blk_aio_pdiscard(ns->blkconf.blk, offset, bytes,
+                                 nvme_aio_discard_cb, req);
+
+                offset += bytes;
+                len -= bytes;
+            }
+        }
+
+        /* account for the 1-initialization */
+        (*discards)--;
+
+        if (*discards) {
+            status = NVME_NO_COMPLETE;
+        } else {
+            status = req->status;
+        }
+    }
+
+    return status;
+}
+
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
     block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
@@ -1107,6 +1201,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_WRITE:
     case NVME_CMD_READ:
         return nvme_rw(n, req);
+    case NVME_CMD_DSM:
+        return nvme_dsm(n, req);
     default:
         trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
@@ -2831,7 +2927,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
-                           NVME_ONCS_FEATURES);
+                           NVME_ONCS_FEATURES | NVME_ONCS_DSM);
 
     id->vwc = 0x1;
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
-- 
2.29.2


