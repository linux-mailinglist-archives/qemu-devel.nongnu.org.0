Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1032810B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:36:40 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjf5-0003Gh-2a
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6m-0002Nn-MK; Mon, 01 Mar 2021 09:01:12 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6j-00044X-UU; Mon, 01 Mar 2021 09:01:12 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 16E075803BC;
 Mon,  1 Mar 2021 09:01:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 01 Mar 2021 09:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2iDKW2giOmFQm
 ADh951bGZISJEsgcwgKZP1d+yIxjHg=; b=v8bFxj7XMUfNLd7O2vBsRSM0XUtX0
 xkoAWsnTGakJCCIAyySSHNkjBKGF3bNtE4erECgWFAEMkvJSFidjZnt77j2qmGfx
 AWqCYw+HJVt53/bUALOsOFvAkJ60EpPG0GAf5TwWDXCcGQGu5oUwmcZ+OS2ETDIC
 pVhh2v0O/vQB9SeuQ0lEO2no/OU5Qf8vKVRL3Iq1It4UVf2/YyXjsHq3JZcyPbI8
 8onIOe4e2KUCTaZEH/7CTZwtSa2Zk0hMr/Ja3w+yGGT7pbWcGT8dPXHlqv9OlNNF
 hOHI+VH4GoKLIMmKvqiwBBUsYWCH1puRZ0CxYxj8uCVshIqrLXzPmqfkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2iDKW2giOmFQmADh951bGZISJEsgcwgKZP1d+yIxjHg=; b=KL/d0r4C
 dPTMW/2X4NZP55A/iE7RvkygIU1bTU0HwhUUWRwrIToXh6MR/C+sgzl/Cn9S6fVV
 bn0RkCEe8NRAdXYwwnvW2Py5aDGXgf/Y4TZiV5+j5Nu+AeBSzkHhZVuPQyAYlrF5
 /23k3algnMIz0n3jd0TKBKxulzgzyddmezq2sl2nUVN7Sl56p+T49bS3FCY/+KZs
 Hy6yo7cMHXJHp7so54waJuoda1hs9eGr/+4MGgekG9f8JBf7EKwAI85wyD2X6ZKF
 eZ+WiFzZdKBE4coF7diXihkZKxTNeZSqk6knW2lupQ9DiO8o0mLO+KkoZhy8tfIH
 KuXL4OUCvFIKrA==
X-ME-Sender: <xms:pPM8YBbTzOrM4PMIOwOyUcmwcyQU-tv5wxNjP_r52FgZuZivcx_D9g>
 <xme:pPM8YKqo8alJiDjPVIwRXSDMJeHUCHGWmn2WHdYWwyJEeCUIIf8pPtpAYSlZXu8vT
 eRz33qsShONyxzVMAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:pPM8YGNoaU09y9aml7G0jJd-h71_urldTiIb448-itA8sMtojsSuVQ>
 <xmx:pPM8YFrSnU0MPoKMBHl6B26wf76E6w16EVAs-3GI3e1QlZX8DACDMQ>
 <xmx:pPM8YLdA3BXJJh1nh4JlIclmH3Y8Cl1APADjaD7HFgVWE3kDVmweiQ>
 <xmx:pfM8YI2EY-8HJDt8ftwXR22sz-AK07IjasVNMqhe-6PGOwL6Zxe2kQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A2D41080064;
 Mon,  1 Mar 2021 09:01:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/12] hw/block/nvme: add support for the format nvm command
Date: Mon,  1 Mar 2021 15:00:47 +0100
Message-Id: <20210301140047.106261-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301140047.106261-1-its@irrelevant.dk>
References: <20210301140047.106261-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
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
index 5a41522a4b33..94b97595ff4e 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -58,6 +58,7 @@ typedef struct NvmeNamespace {
     NvmeIdNs     id_ns;
     const uint32_t *iocs;
     uint8_t      csi;
+    uint16_t     status;
 
     NvmeSubsystem   *subsys;
 
@@ -82,6 +83,11 @@ typedef struct NvmeNamespace {
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
index 5154196ad5a3..e9f6bba2e788 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -80,6 +80,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
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
index 9aa9de335348..6ddccdb38dcf 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -102,6 +102,7 @@ lbaf_found:
     ns->mdata_offset = nvme_l2b(ns, nlbas);
 
     ns->csi = NVME_CSI_NVM;
+    ns->status = 0x0;
 
     /* no thin provisioning */
     id_ns->ncap = id_ns->nsze;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index beaf7f850bd3..9f55ac1ae3da 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -196,6 +196,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -1831,6 +1832,42 @@ out:
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
@@ -3514,6 +3551,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint16_t status;
 
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req),
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
@@ -3555,6 +3593,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
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
@@ -4670,6 +4713,126 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
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
@@ -4706,6 +4869,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_FORMAT_NVM:
+        return nvme_format(n, req);
     default:
         assert(false);
     }
@@ -5641,7 +5806,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(0);
+    id->oacs = cpu_to_le16(NVME_OACS_FORMAT);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 64b2834ccee1..4b2d47ea4906 100644
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
2.30.1


