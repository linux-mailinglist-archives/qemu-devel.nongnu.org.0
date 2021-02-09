Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D23149C1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:53:06 +0100 (CET)
Received: from localhost ([::1]:47138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9NpZ-0007Pj-Rj
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUi-0004qR-Rw; Tue, 09 Feb 2021 02:31:32 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:48299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUg-0005TX-Oi; Tue, 09 Feb 2021 02:31:32 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A4380B5B;
 Tue,  9 Feb 2021 02:31:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dsejZNU+pOrL7
 /Kcmv4AzIssTNLd3NDuFMQvTF5lNa8=; b=ilx+NwW+eOeo1PraY/YsiYstKkKaR
 LoLUljpGBlAhKjoQUzGroXgjzE8o3ZkfmvXGVx+z1C6Gei6Q1vEfKNJtvvwGQESD
 qM0PZraAvl3uZDcWXT9vuTexh0lwKL0hwRbvcR84GueQpHPIlNLDwx4n7wL+8JAe
 aTCr6VK4ukn5bLOzKOdyqKKiI8drLEhwxNO2jrOVIpK2yGe3mGbOYJ7MyY/0sQ03
 OkR5I4jtHvd1vpaeRCf7Zdf2YUEEo3NWPYTYEd0U4Lo/TVcgNXzXkR6Yr0zqpu5G
 hx9TV0e6F4/sBfFLuhOfetbUViAzSlV77ZP8WGJ7W8NTv0cSGoyKjK/4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dsejZNU+pOrL7/Kcmv4AzIssTNLd3NDuFMQvTF5lNa8=; b=V/M64xEo
 Z+fi0gBq6lNF4yvB5euuDMUuWkWyBcPu41GWcCdF8Fben+wVAMysSxyC8mt2/RAR
 igWCHZZ+X0GY56dYWue/A5cJIzywdrrAlmToWxe8xPZqT3ht/bHVWtEFy9i345HT
 8A2W7bh7qq2zVAO52AMPvjCiNYTkZIX7OgtTFsNICuzfw0hpdflln0MDRiJTbIlv
 IwbNMn1bx3iZKnYORHdl18awCwqCeBdwtcghcDA1vw1CdBEhXAfyr+elPlqZHHQK
 TXwXgQP/AJbiXY0RehkS7RAJynqwIw13B6yDkbCcNNfNNsBCbcEkTfswzgJWCUl4
 ITxzkiSTLdO8WQ==
X-ME-Sender: <xms:UDoiYLTYffeR28TARLtNQVxKUKKwwEjbp6PQk9beUx4l3ukYVUX67g>
 <xme:UDoiYMwYLZfyENhc3E1t1FKqT3UDo9_Loz-F0-s6a-BbDa5RS6BKLCWOQJv-8a4ab
 7rwf_qVgf892TBTgL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:UDoiYA0v6516A5gf6VU8JAdk34WdjCHTN9R86khfiA9ecWmyl2YjPg>
 <xmx:UDoiYLAiSHR9pw-CcapVNNnelzld99_Tq7fLM5P5Dar3GCptvuGI5g>
 <xmx:UDoiYEipZCgC2l58gFHCI23C-XTWFoaE1OSvwhOFYzHRplD711ncIg>
 <xmx:UDoiYAhufmsPwadG2D928Ec0gqndkVAGN9_EHV0_fiHhpuiX9JtlEg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E7AB3108005F;
 Tue,  9 Feb 2021 02:31:26 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/56] hw/block/nvme: add the dataset management command
Date: Tue,  9 Feb 2021 08:30:10 +0100
Message-Id: <20210209073101.548811-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
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
index 53ded460348e..37f95951a6b8 100644
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
@@ -60,6 +75,11 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
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
@@ -93,7 +113,9 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    nvme_ns_init(ns);
+    if (nvme_ns_init(ns, errp)) {
+        return -1;
+    }
 
     if (nvme_register_namespace(n, ns, errp)) {
         return -1;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6e6bdb338ad7..f019d43788ac 100644
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
@@ -2829,7 +2925,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
-                           NVME_ONCS_FEATURES);
+                           NVME_ONCS_FEATURES | NVME_ONCS_DSM);
 
     id->vwc = 0x1;
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
-- 
2.30.0


