Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19839B356
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 08:57:50 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3m9-0008TB-5M
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 02:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hG-0005X0-QT; Fri, 04 Jun 2021 02:52:46 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hE-0007HU-P2; Fri, 04 Jun 2021 02:52:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 06D2B5C0172;
 Fri,  4 Jun 2021 02:52:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Jun 2021 02:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=glz2jdk1GQ5nl
 sbk9WSR1QrpHK//qhNVz4gbqmja2ns=; b=O99bKlBYEO8T3IPP+iSv7eU5iFnMc
 D0VMUkW5tFmjFbF7pVuVe/tC7F1loEExvvmMwL+mLaLUeSUZ2gqH4PIOxxsZOphO
 Av2qW/wFwynlbAZfQlWDrap9CzRaImW66lZQpmgQBi405UZ+Wg0EgK7bYdnJf5RM
 3eJkUDPetlW0t04WgJ/TEg/f28YTD2IhrNdH7yB8PKGDBqu27ZyBNOPUdCCeEHZ6
 igAWIKWEOgSL1KFiGrNWSrJKkmR5gcS/UIqzFJPFSKfEe8ltTmWLG46e7BpxarSx
 ZZX1RDlhqVQIF+Uv2TgbfaVSysLU3rTauMy3eNdVBPHW3y9TiIa5mUWRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=glz2jdk1GQ5nlsbk9WSR1QrpHK//qhNVz4gbqmja2ns=; b=DUne8TAM
 gLw/V/URGlCzk5A/wWpbM/OiZ1nKdM9Zi96fk2E85NN6nMkpRFpm7MrQnXjPKjB7
 J9cpjP9yGuyYANJ9x2B078+DZipx3Ddh91VjTn+r//9wbLu4WWVRbCfpixvR3tv6
 Bh/oBNT8VFCMGmEA6Z30MhYmCRojYV8fdnb1IOk9VumqHvoql9N4yfl//a43h1+n
 rrUbYGAZ4YBDiZeBAIPelpuQbiDLXAgkFBflbJx4AgEZTaQxJK7HAcwtHPntAg82
 EJAdw334QnSEuUCtmx9xPzVFhlVQgEAaFDLOB4kwfc4lT3L/h441OTsAmS67Xjrv
 DOuP4+dPaYKBNg==
X-ME-Sender: <xms:u825YKrXsgzrzCFR6MSiksH-f_EmIciEQ6uWc-9MMcoNIm061fh9WA>
 <xme:u825YIqrlpoUOWoIuLyt-rml3mhZbPVW-hpMDPMwDaxwDSiBayvvl6GhOLabeLRne
 Z9zfyobFRl0j6SaOBU>
X-ME-Received: <xmr:u825YPNd3fa57IP-j9s-6iM-yESSG7wrp_dnl70WVMlpyC8kH6e7zN7lSg_ZPrvF98WB1zYMQvN4S5JeFrMOWizieu1r-WPyelUDIdbKXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:u825YJ6-kJkjQ72FHNF94R1ebSVWJGCWWo30ZdPbSkygZnEo7VVJ7Q>
 <xmx:u825YJ7hzme0KIj0lGJI_h_qPUT2dXEp0zjj0eo-5kQWirD3D4EjPA>
 <xmx:u825YJigWJRnXC_sYtA8xTO_eOeOobLDpvw9ZfR1Nclep15HpniiWQ>
 <xmx:vM25YEYsitpXh7L991oJ8UhBsXk-_Dlnt769wrxSy5tVRF59y04Xbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/11] hw/nvme: reimplement flush to allow cancellation
Date: Fri,  4 Jun 2021 08:52:27 +0200
Message-Id: <20210604065237.873228-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
References: <20210604065237.873228-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prior to this patch, a broadcast flush would result in submitting
multiple "fire and forget" aios (no reference saved to the aiocbs
returned from the blk_aio_flush calls).

Fix this by issuing the flushes one after another.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h       |   2 +
 hw/nvme/ctrl.c       | 205 ++++++++++++++++++++++++++-----------------
 hw/nvme/trace-events |   6 +-
 3 files changed, 129 insertions(+), 84 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 81a35cda142b..95730ff2bec5 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -27,6 +27,8 @@
 #define NVME_MAX_CONTROLLERS 32
 #define NVME_MAX_NAMESPACES  256
 
+QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
+
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 40a7efcea914..f49268741427 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1781,19 +1781,11 @@ static inline bool nvme_is_write(NvmeRequest *req)
 static void nvme_misc_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
-    NvmeNamespace *ns = req->ns;
 
-    BlockBackend *blk = ns->blkconf.blk;
-    BlockAcctCookie *acct = &req->acct;
-    BlockAcctStats *stats = blk_get_stats(blk);
-
-    trace_pci_nvme_misc_cb(nvme_cid(req), blk_name(blk));
+    trace_pci_nvme_misc_cb(nvme_cid(req));
 
     if (ret) {
-        block_acct_failed(stats, acct);
         nvme_aio_err(req, ret);
-    } else {
-        block_acct_done(stats, acct);
     }
 
     nvme_enqueue_req_completion(nvme_cq(req), req);
@@ -1909,41 +1901,6 @@ static void nvme_aio_format_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
-struct nvme_aio_flush_ctx {
-    NvmeRequest     *req;
-    NvmeNamespace   *ns;
-    BlockAcctCookie acct;
-};
-
-static void nvme_aio_flush_cb(void *opaque, int ret)
-{
-    struct nvme_aio_flush_ctx *ctx = opaque;
-    NvmeRequest *req = ctx->req;
-    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
-
-    BlockBackend *blk = ctx->ns->blkconf.blk;
-    BlockAcctCookie *acct = &ctx->acct;
-    BlockAcctStats *stats = blk_get_stats(blk);
-
-    trace_pci_nvme_aio_flush_cb(nvme_cid(req), blk_name(blk));
-
-    if (!ret) {
-        block_acct_done(stats, acct);
-    } else {
-        block_acct_failed(stats, acct);
-        nvme_aio_err(req, ret);
-    }
-
-    (*num_flushes)--;
-    g_free(ctx);
-
-    if (*num_flushes) {
-        return;
-    }
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
-}
-
 static void nvme_verify_cb(void *opaque, int ret)
 {
     NvmeBounceContext *ctx = opaque;
@@ -2858,56 +2815,142 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+typedef struct NvmeFlushAIOCB {
+    BlockAIOCB common;
+    BlockAIOCB *aiocb;
+    NvmeRequest *req;
+    QEMUBH *bh;
+    int ret;
+
+    NvmeNamespace *ns;
+    uint32_t nsid;
+    bool broadcast;
+} NvmeFlushAIOCB;
+
+static void nvme_flush_cancel(BlockAIOCB *acb)
+{
+    NvmeFlushAIOCB *iocb = container_of(acb, NvmeFlushAIOCB, common);
+
+    if (iocb->aiocb) {
+        blk_aio_cancel_async(iocb->aiocb);
+        return;
+    }
+
+    iocb->ret = -ECANCELED;
+}
+
+static AioContext *nvme_flush_get_aio_context(BlockAIOCB *acb)
+{
+    return qemu_get_aio_context();
+}
+
+static const AIOCBInfo nvme_flush_aiocb_info = {
+    .aiocb_size = sizeof(NvmeFlushAIOCB),
+    .cancel_async = nvme_flush_cancel,
+    .get_aio_context = nvme_flush_get_aio_context,
+};
+
+static void nvme_flush_ns_cb(void *opaque, int ret)
+{
+    NvmeFlushAIOCB *iocb = opaque;
+    NvmeNamespace *ns = iocb->ns;
+
+    if (ret < 0) {
+        iocb->ret = ret;
+        goto out;
+    }
+
+    if (ns) {
+        trace_pci_nvme_flush_ns(iocb->nsid);
+
+        iocb->ns = NULL;
+        iocb->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_flush_ns_cb, iocb);
+        return;
+    }
+
+out:
+    iocb->aiocb = NULL;
+    qemu_bh_schedule(iocb->bh);
+}
+
+static void nvme_flush_bh(void *opaque)
+{
+    NvmeFlushAIOCB *iocb = opaque;
+    NvmeRequest *req = iocb->req;
+    NvmeCtrl *n = nvme_ctrl(req);
+    int i;
+
+    if (iocb->ret < 0) {
+        goto done;
+    }
+
+    if (iocb->broadcast) {
+        for (i = iocb->nsid + 1; i <= NVME_MAX_NAMESPACES; i++) {
+            iocb->ns = nvme_ns(n, i);
+            if (iocb->ns) {
+                iocb->nsid = i;
+                break;
+            }
+        }
+    }
+
+    if (!iocb->ns) {
+        goto done;
+    }
+
+    nvme_flush_ns_cb(iocb, 0);
+    return;
+
+done:
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_aio_unref(iocb);
+
+    return;
+}
+
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeFlushAIOCB *iocb;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
-    uintptr_t *num_flushes = (uintptr_t *)&req->opaque;
     uint16_t status;
-    struct nvme_aio_flush_ctx *ctx;
-    NvmeNamespace *ns;
 
-    trace_pci_nvme_flush(nvme_cid(req), nsid);
+    iocb = qemu_aio_get(&nvme_flush_aiocb_info, NULL, nvme_misc_cb, req);
 
-    if (nsid != NVME_NSID_BROADCAST) {
-        req->ns = nvme_ns(n, nsid);
-        if (unlikely(!req->ns)) {
-            return NVME_INVALID_FIELD | NVME_DNR;
+    iocb->req = req;
+    iocb->bh = qemu_bh_new(nvme_flush_bh, iocb);
+    iocb->ret = 0;
+    iocb->ns = NULL;
+    iocb->nsid = 0;
+    iocb->broadcast = (nsid == NVME_NSID_BROADCAST);
+
+    if (!iocb->broadcast) {
+        if (!nvme_nsid_valid(n, nsid)) {
+            status = NVME_INVALID_NSID | NVME_DNR;
+            goto out;
         }
 
-        block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
-                         BLOCK_ACCT_FLUSH);
-        req->aiocb = blk_aio_flush(req->ns->blkconf.blk, nvme_misc_cb, req);
-        return NVME_NO_COMPLETE;
-    }
-
-    /* 1-initialize; see comment in nvme_dsm */
-    *num_flushes = 1;
-
-    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
-        ns = nvme_ns(n, i);
-        if (!ns) {
-            continue;
+        iocb->ns = nvme_ns(n, nsid);
+        if (!iocb->ns) {
+            status = NVME_INVALID_FIELD | NVME_DNR;
+            goto out;
         }
 
-        ctx = g_new(struct nvme_aio_flush_ctx, 1);
-        ctx->req = req;
-        ctx->ns = ns;
-
-        (*num_flushes)++;
-
-        block_acct_start(blk_get_stats(ns->blkconf.blk), &ctx->acct, 0,
-                         BLOCK_ACCT_FLUSH);
-        blk_aio_flush(ns->blkconf.blk, nvme_aio_flush_cb, ctx);
+        iocb->nsid = nsid;
     }
 
-    /* account for the 1-initialization */
-    (*num_flushes)--;
+    req->aiocb = &iocb->common;
+    qemu_bh_schedule(iocb->bh);
 
-    if (*num_flushes) {
-        status = NVME_NO_COMPLETE;
-    } else {
-        status = req->status;
-    }
+    return NVME_NO_COMPLETE;
+
+out:
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
 
     return status;
 }
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ea33d0ccc383..ce6b6ffe9604 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -7,16 +7,16 @@ pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
 pci_nvme_map_sgl(uint8_t typ, uint64_t len) "type 0x%"PRIx8" len %"PRIu64""
-pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
+pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" nsid 0x%"PRIx32" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
-pci_nvme_flush(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
+pci_nvme_flush_ns(uint32_t nsid) "nsid 0x%"PRIx32""
 pci_nvme_format(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
 pci_nvme_format_ns(uint16_t cid, uint32_t nsid, uint8_t lbaf, uint8_t mset, uint8_t pi, uint8_t pil) "cid %"PRIu16" nsid %"PRIu32" lbaf %"PRIu8" mset %"PRIu8" pi %"PRIu8" pil %"PRIu8""
 pci_nvme_format_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-pci_nvme_misc_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_misc_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_dif_rw(uint8_t pract, uint8_t prinfo) "pract 0x%"PRIx8" prinfo 0x%"PRIx8""
 pci_nvme_dif_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_dif_rw_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
-- 
2.31.1


