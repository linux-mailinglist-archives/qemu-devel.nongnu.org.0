Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8833E146
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:19:52 +0100 (CET)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMI2Z-0002Mr-TZ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHY2-0007FI-Vh; Tue, 16 Mar 2021 17:48:19 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHY0-00012q-KG; Tue, 16 Mar 2021 17:48:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C1523580A4C;
 Tue, 16 Mar 2021 17:48:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 17:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=WoE/sX9J+0qD/
 kEuH3GUilv3Cb4Cd0xi/xvOGKnKYTU=; b=u5n1+TYYMNVJD/I41YreMTzNykEfC
 64v08yENR1C3MP9zJParrdBratJxazg1oHqtFjmq5MxV2/tC97ZTLHXs0tblxTss
 +DLXygTVs1ESWVIpO8CPuB9kqRdqj3pAI5iY6WuFD6b8BSubTAFIFvDTu56wR0K/
 kNq/4XJmDPlhxPdwzG5AoUUlMs4+sSd1Z3Q+9R7YMDGV6YBlHLazxE1/Gf7l38Qw
 f7SlVp4evpfxzw74fUYUVDj/LXkM2tvfHWwadK53rFXQ5Ji7pr6ygM5FEIpW2yOH
 fmruyIrHDxK3f8cek/hN5Q7wcCyf2WTrm5aWMQpJOmerYl6vDaMSfZUvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=WoE/sX9J+0qD/kEuH3GUilv3Cb4Cd0xi/xvOGKnKYTU=; b=I26vdvAh
 /iZyka8hWFySR2TUgt8VnxpQ4u2j4ve2rjm3Pwjd2T4OuADiuh2x7eaI4BDwSvji
 XKsQneo4U13kPNVN9FhfmEpJpSYSZFhDMnficzhQ24ej4QiLolqrlBEjWcSxtvjy
 +rmzUlHdRiYgZk8kId0D86nFC1ACE6m1T3I9wxkmVziv6ilAeuP4tWfINaUH1puL
 lu3dxKCuubgDb/B5g/87BR289/kndyyA8HJGoDDrp02bRVBjTo2XFzML9Lnz3DE9
 HESXmxOkzGFR/wEEyebYudnNuhF3hZV0VXDYFjGZxLqupmGJRAxTlRVi3CnSfO1b
 Lp+rW0sC0du3pA==
X-ME-Sender: <xms:nidRYNJLwgInIPCk49GblE6eG3ZwOI6Xr7VfovNUrrCyKIe78qwKsg>
 <xme:nidRYJIQZwZC1yuTnr-u3b9keD9RqoaeE-sliSBMvtwZE_psbujDo8C5jibg5Logr
 9tzwcpnJu1yVKB9UBU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:nidRYFuSvSyvZ6O3HJ6aCgQJ9fq4MxHuJ8eAc2ZXWR41v1fsv6OaEA>
 <xmx:nidRYOZ-_HjrDicB-6rCiDx5CVaSKUVw1Zc_LLAJBPXytIaHw_FG-Q>
 <xmx:nidRYEZw0AnFfIQWqTDoFus2IiZgZki1rUDz4HTOBJxsXzaY5CMNRg>
 <xmx:nydRYCklZ47064zOaYiuNBtpwSCDWoiiwJLfXh_GGTAgY_hOon73JA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 35102108005C;
 Tue, 16 Mar 2021 17:48:13 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 11/11] hw/block/nvme: add support for the format nvm command
Date: Tue, 16 Mar 2021 22:47:53 +0100
Message-Id: <20210316214753.399389-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
References: <20210316214753.399389-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im@samsung.com>

Format NVM admin command can make a namespace or namespaces to be
with different LBA size and metadata size with protection information
types.

This patch introduces Format NVM command with LBA format, Metadata, and
Protection Information for the device. The secure erase operation things
and support for formatting zoned namespaces are yet to be added.

The parameter checks inside of this patch has been referred from
Keith's old branch.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
[anaidu.gollu: rebased on e2e]
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: rebased for reworked aio tracking]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.h    |   7 ++
 hw/block/nvme.h       |   1 +
 include/block/nvme.h  |   1 +
 hw/block/nvme-ns.c    |   3 +-
 hw/block/nvme.c       | 175 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   3 +
 6 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 07e16880801d..9ab7894fc83e 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -59,6 +59,7 @@ typedef struct NvmeNamespace {
     NvmeIdNs     id_ns;
     const uint32_t *iocs;
     uint8_t      csi;
+    uint16_t     status;
 
     NvmeSubsystem   *subsys;
     QTAILQ_ENTRY(NvmeNamespace) entry;
@@ -84,6 +85,11 @@ typedef struct NvmeNamespace {
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
@@ -218,6 +224,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
     assert(ns->nr_active_zones >= 0);
 }
 
+void nvme_ns_init_format(NvmeNamespace *ns);
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 7b082212db04..5b0031b11db2 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -86,6 +86,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
+    case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
     default:                            return "NVME_ADM_CMD_UNKNOWN";
     }
 }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index ba757b32dbb7..b0a4e4291611 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -828,6 +828,7 @@ enum NvmeStatusCodes {
     NVME_CAP_EXCEEDED           = 0x0081,
     NVME_NS_NOT_READY           = 0x0082,
     NVME_NS_RESV_CONFLICT       = 0x0083,
+    NVME_FORMAT_IN_PROGRESS     = 0x0084,
     NVME_INVALID_CQID           = 0x0100,
     NVME_INVALID_QID            = 0x0101,
     NVME_MAX_QSIZE_EXCEEDED     = 0x0102,
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 1e8ef36ba5ae..7f8d139a8663 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -32,7 +32,7 @@
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
-static void nvme_ns_init_format(NvmeNamespace *ns)
+void nvme_ns_init_format(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns = &ns->id_ns;
     BlockDriverInfo bdi;
@@ -66,6 +66,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     int i;
 
     ns->csi = NVME_CSI_NVM;
+    ns->status = 0x0;
 
     ns->id_ns.dlfeat = 0x1;
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 64cb966ab695..6842b01ab58b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -213,6 +213,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
+    [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -1866,6 +1867,42 @@ out:
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
@@ -3556,6 +3593,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint16_t status;
 
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req),
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
@@ -3597,6 +3635,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
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
@@ -4898,6 +4941,134 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
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
+    if (ns->params.zoned) {
+        return NVME_INVALID_FORMAT | NVME_DNR;
+    }
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
+    nvme_ns_drain(ns);
+    nvme_ns_shutdown(ns);
+    nvme_ns_cleanup(ns);
+
+    ns->id_ns.dps = (pil << 3) | pi;
+    ns->id_ns.flbas = lbaf | (mset << 4);
+
+    nvme_ns_init_format(ns);
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
+        if (status && status != NVME_NO_COMPLETE) {
+            req->status = status;
+        }
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
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -4936,6 +5107,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_aer(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
+    case NVME_ADM_CMD_FORMAT_NVM:
+        return nvme_format(n, req);
     default:
         assert(false);
     }
@@ -5912,7 +6085,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT);
+    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 72114a5946fc..b71cf7a08755 100644
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


