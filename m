Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A116A308760
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:33:57 +0100 (CET)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QA8-0007UG-Ij
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psn-0006Wu-BW; Fri, 29 Jan 2021 04:16:01 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psf-0003fG-IK; Fri, 29 Jan 2021 04:16:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 576D45C01F1;
 Fri, 29 Jan 2021 04:15:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jan 2021 04:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0flBLSbbMlXNn
 /wOwiwAWAtV4FBWIQsKzH4mRReHeLs=; b=jotu81Bew59Oajercwn/36ciLAJIk
 cLj82y1XQups0hiUvDYSxuRH9GHS+BoZKUrWgHtlpdvClQxut9lJlDWrGGJkQpVh
 f0umNEqk2Wtp46fm2QL887MdJOTgwmWM647s0Wz2fbnulXDDwHJR9wkjH1BawJAG
 Ytz7n+ZwTQAQpvQ2dLQrOmgNj7qFMW2NaDfjoECyfvA3AYbCl90PeLMcnU1KZMHo
 Cu9Dfb5qgWhdNEHPPP8VCNeHsdhSo/p62CZjKl6UH521aykw7vcIvYVeg8GhmCBg
 P4IkNk/Ugu2y8jEL3Hf9tDT8/h37xrvD/5KycqlFEtaHe/CDZ5p0PLlEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0flBLSbbMlXNn/wOwiwAWAtV4FBWIQsKzH4mRReHeLs=; b=HSWLgUfu
 eZxa5yrAXTYUOjWwyOj6npUotV8Zop6HtCYqplsEHfZGiC9xEhPZhgKllitblYEf
 5uOWAS4DVXxYUltgnwUzKzW1ofX1Q4tu1BSUt9BQXPZqKfPYpYLHPdZpcTaTUKVU
 +zIMn7wJvp6EtsFYw/QDIIEn0Wypi6tcL0qutOOP3GIyxdHGMUJs1Ap/ZUTFiEzZ
 PgFJagtoWgtUu8LPLGP0z6exIdEx6C4Y1Ol30P2a6N7PqriQmncS8nIt3hdNv2+5
 /mCKsQ6eiWE4KhJUm34RtFj3zIpDRf1qgaYN307NWFI0PFvBofELZ9msyxYHMek5
 6+i2yOMkTVaQYA==
X-ME-Sender: <xms:SNITYDcZSEcexjqFiGozgpYnRdvhF93tclh4Vh_eQosHlsfaZg5IDg>
 <xme:SNITYJNCBFnkdMdvZJ0p69wHpzgkGl17pQk2tcEFZBIUUNrfexyeMwXQFuLuNNI6F
 TiZPmV5Doy4j9DLWVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucflvghn
 shgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrhhnpe
 euleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefgkeenucfk
 phepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SNITYMjChIsKFBfXQg04Gc6pagIT_rBrRY4VvwZOigLSguLvLbE4aw>
 <xmx:SNITYE8LyvNPQe69-21E685c2ppJCLtg7-7xC2sb9sswgL0x66M3Bg>
 <xmx:SNITYPuOR34KkZ65YxaFTRljLH0CnHDXKTjW_Od3XvYCUfsPPKWtHQ>
 <xmx:SNITYDg62mFLRknB-rnO7auLFtW_Rut9mHE-EwMIvD08i3jkvB4NIQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FD1E24005A;
 Fri, 29 Jan 2021 04:15:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/5] hw/block/nvme: add simple copy command
Date: Fri, 29 Jan 2021 10:15:41 +0100
Message-Id: <20210129091541.566330-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129091541.566330-1-its@irrelevant.dk>
References: <20210129091541.566330-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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

Add support for TP 4065a ("Simple Copy Command"), v2020.05.04
("Ratified").

The implementation uses a bounce buffer to first read in the source
logical blocks, then issue a write of that bounce buffer. The default
maximum number of source logical blocks is 128, translating to 512 KiB
for 4k logical blocks which aligns with the default value of MDTS.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |   4 +
 hw/block/nvme.h       |   1 +
 hw/block/nvme-ns.c    |   8 ++
 hw/block/nvme.c       | 253 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   7 ++
 5 files changed, 272 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 293ac990e3f6..6ba7ae7ced9c 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -29,6 +29,10 @@ typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     QemuUUID uuid;
 
+    uint16_t mssrl;
+    uint32_t mcl;
+    uint8_t  msrc;
+
     bool     zoned;
     bool     cross_zone_read;
     uint64_t zone_size_bs;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index dee6092bd45f..407c7b3fbe91 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -68,6 +68,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
+    case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
     case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
     case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
     case NVME_CMD_ZONE_APPEND:      return "NVME_ZONED_CMD_ZONE_APPEND";
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 62b25cf69bfa..69ac62752347 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -63,6 +63,11 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->npda = id_ns->npdg = npdg - 1;
 
+    /* simple copy */
+    id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
+    id_ns->mcl = cpu_to_le32(ns->params.mcl);
+    id_ns->msrc = ns->params.msrc;
+
     return 0;
 }
 
@@ -377,6 +382,9 @@ static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
+    DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
+    DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 127),
     DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
     DEFINE_PROP_SIZE("zoned.zone_size", NvmeNamespace, params.zone_size_bs,
                      NVME_DEFAULT_ZONE_SIZE),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6df285ecac03..08b63c85f4cf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -167,6 +167,7 @@ static const uint32_t nvme_cse_iocs_nvm[256] = {
     [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
 };
 
@@ -176,6 +177,7 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
     [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
     [NVME_CMD_ZONE_APPEND]          = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
     [NVME_CMD_ZONE_MGMT_SEND]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
@@ -1502,6 +1504,136 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_copy_ctx {
+    int copies;
+    uint8_t *bounce;
+    uint32_t nlb;
+};
+
+struct nvme_copy_in_ctx {
+    NvmeRequest *req;
+    QEMUIOVector iov;
+};
+
+static void nvme_copy_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeNamespace *ns = req->ns;
+    struct nvme_copy_ctx *ctx = req->opaque;
+
+    trace_pci_nvme_copy_cb(nvme_cid(req));
+
+    if (ns->params.zoned) {
+        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+        uint64_t sdlba = le64_to_cpu(copy->sdlba);
+        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
+
+        __nvme_advance_zone_wp(ns, zone, ctx->nlb);
+    }
+
+    if (!ret) {
+        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+    } else {
+        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
+        nvme_aio_err(req, ret);
+    }
+
+    g_free(ctx->bounce);
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+static void nvme_copy_in_complete(NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+    struct nvme_copy_ctx *ctx = req->opaque;
+    uint64_t sdlba = le64_to_cpu(copy->sdlba);
+    uint16_t status;
+
+    trace_pci_nvme_copy_in_complete(nvme_cid(req));
+
+    block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+
+    status = nvme_check_bounds(ns, sdlba, ctx->nlb);
+    if (status) {
+        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
+        goto invalid;
+    }
+
+    if (ns->params.zoned) {
+        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
+
+        status = nvme_check_zone_write(ns, zone, sdlba, ctx->nlb);
+        if (status) {
+            goto invalid;
+        }
+
+        status = nvme_zrm_auto(ns, zone);
+        if (status) {
+            goto invalid;
+        }
+
+        zone->w_ptr += ctx->nlb;
+    }
+
+    qemu_iovec_init(&req->iov, 1);
+    qemu_iovec_add(&req->iov, ctx->bounce, nvme_l2b(ns, ctx->nlb));
+
+    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct,
+                     nvme_l2b(ns, ctx->nlb), BLOCK_ACCT_WRITE);
+
+    req->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, sdlba),
+                                 &req->iov, 0, nvme_copy_cb, req);
+
+    return;
+
+invalid:
+    req->status = status;
+
+    g_free(ctx->bounce);
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+static void nvme_aio_copy_in_cb(void *opaque, int ret)
+{
+    struct nvme_copy_in_ctx *in_ctx = opaque;
+    NvmeRequest *req = in_ctx->req;
+    NvmeNamespace *ns = req->ns;
+    struct nvme_copy_ctx *ctx = req->opaque;
+
+    qemu_iovec_destroy(&in_ctx->iov);
+    g_free(in_ctx);
+
+    trace_pci_nvme_aio_copy_in_cb(nvme_cid(req));
+
+    if (ret) {
+        nvme_aio_err(req, ret);
+    }
+
+    ctx->copies--;
+
+    if (ctx->copies) {
+        return;
+    }
+
+    if (req->status) {
+        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
+
+        g_free(ctx->bounce);
+        g_free(ctx);
+
+        nvme_enqueue_req_completion(nvme_cq(req), req);
+
+        return;
+    }
+
+    nvme_copy_in_complete(req);
+}
+
 struct nvme_compare_ctx {
     QEMUIOVector iov;
     uint8_t *bounce;
@@ -1620,6 +1752,122 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+    g_autofree NvmeCopySourceRange *range = NULL;
+
+    uint32_t cdw12 = le32_to_cpu(copy->cdw12);
+    uint16_t nr = (cdw12 & 0xff) + 1;
+    uint8_t format = (cdw12 >> 8) & 0xf;
+    uint32_t nlb = 0;
+
+    uint8_t *bounce = NULL, *bouncep = NULL;
+    struct nvme_copy_ctx *ctx;
+    uint16_t status;
+    int i;
+
+    trace_pci_nvme_copy(nvme_cid(req), nvme_nsid(ns), nr, format);
+
+    if (!(n->id_ctrl.ocfs & (1 << format))) {
+        trace_pci_nvme_err_copy_invalid_format(format);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (nr > ns->id_ns.msrc + 1) {
+        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+    }
+
+    range = g_new(NvmeCopySourceRange, nr);
+
+    status = nvme_dma(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
+                      DMA_DIRECTION_TO_DEVICE, req);
+    if (status) {
+        return status;
+    }
+
+    for (i = 0; i < nr; i++) {
+        uint64_t slba = le64_to_cpu(range[i].slba);
+        uint32_t _nlb = le16_to_cpu(range[i].nlb) + 1;
+
+        if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
+            return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        }
+
+        status = nvme_check_bounds(ns, slba, _nlb);
+        if (status) {
+            trace_pci_nvme_err_invalid_lba_range(slba, _nlb, ns->id_ns.nsze);
+            return status;
+        }
+
+        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
+            status = nvme_check_dulbe(ns, slba, _nlb);
+            if (status) {
+                return status;
+            }
+        }
+
+        if (ns->params.zoned) {
+            status = nvme_check_zone_read(ns, slba, _nlb);
+            if (status) {
+                return status;
+            }
+        }
+
+        nlb += _nlb;
+    }
+
+    if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
+        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+    }
+
+    bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
+
+    block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct,
+                     nvme_l2b(ns, nlb), BLOCK_ACCT_READ);
+
+    ctx = g_new(struct nvme_copy_ctx, 1);
+
+    ctx->bounce = bounce;
+    ctx->nlb = nlb;
+    ctx->copies = 1;
+
+    req->opaque = ctx;
+
+    for (i = 0; i < nr; i++) {
+        uint64_t slba = le64_to_cpu(range[i].slba);
+        uint32_t nlb = le16_to_cpu(range[i].nlb) + 1;
+
+        size_t len = nvme_l2b(ns, nlb);
+        int64_t offset = nvme_l2b(ns, slba);
+
+        trace_pci_nvme_copy_source_range(slba, nlb);
+
+        struct nvme_copy_in_ctx *in_ctx = g_new(struct nvme_copy_in_ctx, 1);
+        in_ctx->req = req;
+
+        qemu_iovec_init(&in_ctx->iov, 1);
+        qemu_iovec_add(&in_ctx->iov, bouncep, len);
+
+        ctx->copies++;
+
+        blk_aio_preadv(ns->blkconf.blk, offset, &in_ctx->iov, 0,
+                       nvme_aio_copy_in_cb, in_ctx);
+
+        bouncep += len;
+    }
+
+    /* account for the 1-initialization */
+    ctx->copies--;
+
+    if (!ctx->copies) {
+        nvme_copy_in_complete(req);
+    }
+
+    return NVME_NO_COMPLETE;
+}
+
 static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -2357,6 +2605,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_compare(n, req);
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
+    case NVME_CMD_COPY:
+        return nvme_copy(n, req);
     case NVME_CMD_ZONE_MGMT_SEND:
         return nvme_zone_mgmt_send(n, req);
     case NVME_CMD_ZONE_MGMT_RECV:
@@ -4436,9 +4686,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE);
+                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
 
     id->vwc = (0x2 << 1) | 0x1;
+    id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0);
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index c083000b8c1f..b26866ba4338 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -43,12 +43,18 @@ pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opna
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
+pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
+pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
@@ -113,6 +119,7 @@ pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_cfs(void) "controller fatal status"
 pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu16" err '%s' status 0x%"PRIx16""
+pci_nvme_err_copy_invalid_format(uint8_t format) "format 0x%"PRIx8""
 pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
-- 
2.30.0


