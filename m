Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B731B346
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:23:33 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQjk-0007yw-R4
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQQ5-0004RI-Rs; Sun, 14 Feb 2021 18:03:13 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:42635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPw-0001qS-Og; Sun, 14 Feb 2021 18:03:13 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 64D805800D2;
 Sun, 14 Feb 2021 18:03:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 14 Feb 2021 18:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=rFbif3niTtwhk
 DvuoPdBWmlApN2PL9KFMmaTkijN9+U=; b=HwMRIzm/Oag99xJ9EvNEXQSczKSm5
 JQiW07STlYny1u68wgnU0rANohEjsNaFDcYC6sCdlVp95hgTHCQOo3zW5whYr/BO
 ogvxZ+B4SDk7ZkwZe8sxIDsCBs+AMydL0OW9xP7/m5Axzrl3mztAgmcKvRqjGI/J
 UmlpnjS735HJvkexOUA7NZdpJPXtcJYbNoZsdSUT0NfhoLp0eR8/1WIP8Rh1Wrll
 Mgk2wdQ7f85VfLrozwoQpiYoC/sx19lyfONzWisBSY54yTvFObgxhdnFu+Y2sy4K
 tza8FyguDFYUKa+YZsvO8hEc4nfcz6K2lFOwOeSwo1NTvdQTbv2kNBNNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=rFbif3niTtwhkDvuoPdBWmlApN2PL9KFMmaTkijN9+U=; b=dTFUhN2w
 Gj1G0S/reNRjziSI1jHf5Hv8AksXQTcFGxMcGymgoOHH0yntqa7e6VvSV3VRXHo7
 yCXDYTGP6BHmlOKqClUiZIYuqqaQaAs+xjgsJgrpTc4zwwWXVK2XMEpfP0nmAWYD
 Ty9Q+uxlGOmIK01sdf3Qw7+lpMcjI+oZsIeJy7FQVtVrsbi8rByljkX9xGUjVTNd
 N7hdXLRX7aSE3GMt/1UVpOU82LbirQrWBvUBgYIlfVdQFGOA8GX1dZxZEeOu+iHL
 /lGbec0I4LFqpXshTGhzyD9hcOTvZ2hPDQoVa+/d2UITVPE09xcAd6LuwvLqwyEI
 b7unT436HQ8jXA==
X-ME-Sender: <xms:JqwpYKg9ajZXyHHjaQN2IUp8ifmR9kkUB2fI_0E_HLlB03LCxG9PHg>
 <xme:JqwpYK-x9o26j2bm8UeWRWBa1X5DbieznN-VFRmd47M_it6_N3No9ULWKFMFFnEJp
 Qm8uMJ-hlPlFIRNUYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JqwpYO_WJUbOEQ7JTETf-IkLA-86YdtybxmnAGrHgRfs9mrD6Ug06w>
 <xmx:JqwpYLAqNgViRyMC-MEA1XhZcvQX2bqxRJn-JcbWPKUJtRDYesOxbA>
 <xmx:JqwpYGxWqevNMUhtMZlOqUPlX5Wi6dLONykmsRt6Oq528pyZjVLBxw>
 <xmx:J6wpYJ6VwPGlqxzKtr0Ipv0YzujpbSBNQuxAajjvkZMr1BF64OSilA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FBA8240057;
 Sun, 14 Feb 2021 18:03:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 12/12] hw/block/nvme: add support for the format nvm
 command
Date: Mon, 15 Feb 2021 00:02:40 +0100
Message-Id: <20210214230240.301275-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210214230240.301275-1-its@irrelevant.dk>
References: <20210214230240.301275-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im@samsung.com>

Format NVM admin command can make a namespace or namespaces to be
with different LBA size and metadata size with protection information
types.

This patch introduces Format NVM command with LBA format, Metadata, and
Protection Information for the device. The secure erase operation things
are yet to be added.

The parameter checks inside of this patch has been referred from
Keith's old branch.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
[anaidu.gollu: rebased on e2e]
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: rebased for reworked aio tracking]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |   6 ++
 hw/block/nvme.h       |   1 +
 include/block/nvme.h  |   1 +
 hw/block/nvme-ns.c    |   1 +
 hw/block/nvme.c       | 167 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   3 +
 6 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index e537bfba18b8..07acc627680a 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -56,6 +56,7 @@ typedef struct NvmeNamespace {
     NvmeIdNs     id_ns;
     const uint32_t *iocs;
     uint8_t      csi;
+    uint16_t     status;
 
     NvmeSubsystem   *subsys;
 
@@ -80,6 +81,11 @@ typedef struct NvmeNamespace {
     } features;
 } NvmeNamespace;
 
+static inline uint16_t nvme_ns_status(NvmeNamespace *ns)
+{
+    return ns->status;
+}
+
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
     if (ns) {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index d1b09ece1985..36fd81c55927 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -70,6 +70,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
+    case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
     default:                            return "NVME_ADM_CMD_UNKNOWN";
     }
 }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index ec5262d17e12..2f21cd60cea3 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -825,6 +825,7 @@ enum NvmeStatusCodes {
     NVME_CAP_EXCEEDED           = 0x0081,
     NVME_NS_NOT_READY           = 0x0082,
     NVME_NS_RESV_CONFLICT       = 0x0083,
+    NVME_FORMAT_IN_PROGRESS     = 0x0084,
     NVME_INVALID_CQID           = 0x0100,
     NVME_INVALID_QID            = 0x0101,
     NVME_MAX_QSIZE_EXCEEDED     = 0x0102,
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 0a03ca416450..e9d34b14fb73 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -102,6 +102,7 @@ lbaf_found:
     ns->mdata_offset = nvme_l2b(ns, nlbas);
 
     ns->csi = NVME_CSI_NVM;
+    ns->status = 0x0;
 
     /* no thin provisioning */
     id_ns->ncap = id_ns->nsze;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e5832ce2a69e..9a611918e9e9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -189,6 +189,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -2077,6 +2078,42 @@ out:
     nvme_rw_complete_cb(req, ret);
 }
 
+struct nvme_aio_format_ctx {
+    NvmeRequest   *req;
+    NvmeNamespace *ns;
+
+    /* number of outstanding write zeroes for this namespace */
+    int *count;
+};
+
+static void nvme_aio_format_cb(void *opaque, int ret)
+{
+    struct nvme_aio_format_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = ctx->ns;
+    uintptr_t *num_formats = (uintptr_t *)&req->opaque;
+    int *count = ctx->count;
+
+    g_free(ctx);
+
+    if (ret) {
+        nvme_aio_err(req, ret);
+    }
+
+    if (--(*count)) {
+        return;
+    }
+
+    g_free(count);
+    ns->status = 0x0;
+
+    if (--(*num_formats)) {
+        return;
+    }
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
 struct nvme_aio_flush_ctx {
     NvmeRequest     *req;
     NvmeNamespace   *ns;
@@ -4040,6 +4077,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint16_t status;
 
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req),
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
@@ -4081,6 +4119,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 
+    status = nvme_ns_status(req->ns);
+    if (unlikely(status)) {
+        return status;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
@@ -5197,6 +5240,126 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+static uint16_t nvme_format_ns(NvmeCtrl *n, NvmeNamespace *ns, uint8_t lbaf,
+                               uint8_t mset, uint8_t pi, uint8_t pil,
+                               NvmeRequest *req)
+{
+    int64_t len, offset;
+    struct nvme_aio_format_ctx *ctx;
+    BlockBackend *blk = ns->blkconf.blk;
+    uint16_t ms;
+    uintptr_t *num_formats = (uintptr_t *)&req->opaque;
+    int *count;
+
+    trace_pci_nvme_format_ns(nvme_cid(req), nvme_nsid(ns), lbaf, mset, pi, pil);
+
+    if (lbaf > ns->id_ns.nlbaf) {
+        return NVME_INVALID_FORMAT | NVME_DNR;
+    }
+
+    ms = ns->id_ns.lbaf[lbaf].ms;
+
+    if (pi && (ms < sizeof(NvmeDifTuple))) {
+        return NVME_INVALID_FORMAT | NVME_DNR;
+    }
+
+    if (pi && pi > NVME_ID_NS_DPS_TYPE_3) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    blk_drain(blk);
+
+    ns->id_ns.dps = (pil << 3) | pi;
+    ns->id_ns.flbas = lbaf | (mset << 4);
+    ns->id_ns.nsze = ns->id_ns.ncap = ns->id_ns.nuse =
+        cpu_to_le64(nvme_ns_nlbas(ns));
+
+    ns->status = NVME_FORMAT_IN_PROGRESS;
+
+    len = ns->size;
+    offset = 0;
+
+    count = g_new(int, 1);
+    *count = 1;
+
+    (*num_formats)++;
+
+    while (len) {
+        ctx = g_new(struct nvme_aio_format_ctx, 1);
+        ctx->req = req;
+        ctx->ns = ns;
+        ctx->count = count;
+
+        size_t bytes = MIN(BDRV_REQUEST_MAX_BYTES, len);
+
+        (*count)++;
+
+        blk_aio_pwrite_zeroes(blk, offset, bytes, BDRV_REQ_MAY_UNMAP,
+                              nvme_aio_format_cb, ctx);
+
+        offset += bytes;
+        len -= bytes;
+
+    }
+
+    (*count)--;
+
+    return NVME_NO_COMPLETE;
+}
+
+static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns;
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint8_t lbaf = dw10 & 0xf;
+    uint8_t mset = (dw10 >> 4) & 0x1;
+    uint8_t pi = (dw10 >> 5) & 0x7;
+    uint8_t pil = (dw10 >> 8) & 0x1;
+    uintptr_t *num_formats = (uintptr_t *)&req->opaque;
+    uint16_t status;
+    int i;
+
+    trace_pci_nvme_format(nvme_cid(req), nsid, lbaf, mset, pi, pil);
+
+    /* 1-initialize; see the comment in nvme_dsm */
+    *num_formats = 1;
+
+    if (nsid != NVME_NSID_BROADCAST) {
+        if (!nvme_nsid_valid(n, nsid)) {
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+
+        ns = nvme_ns(n, nsid);
+        if (!ns) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        status = nvme_format_ns(n, ns, lbaf, mset, pi, pil, req);
+    } else {
+        for (i = 1; i <= n->num_namespaces; i++) {
+            ns = nvme_ns(n, i);
+            if (!ns) {
+                continue;
+            }
+
+            status = nvme_format_ns(n, ns, lbaf, mset, pi, pil, req);
+            if (status && status != NVME_NO_COMPLETE) {
+                req->status = status;
+                break;
+            }
+        }
+    }
+
+    /* account for the 1-initialization */
+    if (--(*num_formats)) {
+        return NVME_NO_COMPLETE;
+    }
+
+    return req->status;
+}
+
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -5233,6 +5396,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_FORMAT_NVM:
+        return nvme_format(n, req);
     default:
         assert(false);
     }
@@ -6188,7 +6353,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(0);
+    id->oacs = cpu_to_le16(NVME_OACS_FORMAT);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b5189aa88b85..b46910a98bff 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -41,6 +41,9 @@ pci_nvme_map_sgl(uint8_t typ, uint64_t len) "type 0x%"PRIx8" len %"PRIu64""
 pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_flush(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
+pci_nvme_format(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
+pci_nvme_format_ns(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
+pci_nvme_format_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-- 
2.30.0


