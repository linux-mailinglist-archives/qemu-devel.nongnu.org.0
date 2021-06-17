Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B23ABCD2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:33:04 +0200 (CEST)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxl9-0005tM-0s
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxMD-0002dW-9z; Thu, 17 Jun 2021 15:07:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxMA-00033B-Ll; Thu, 17 Jun 2021 15:07:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFC465C00B3;
 Thu, 17 Jun 2021 15:07:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Jun 2021 15:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=9rV8BYnmjySYc
 W66KzGk6JYbFZ1NWM3oGO+fhml+9eE=; b=LUaLEWSbO29XA6O/lSL4R2/Mx4nzG
 E3nHKe2RlwqFdZHXhydKVt74OU/4HT/1SVaNSvpHM3/DTCI61fqV/d1QSyXXv/al
 9mm0GEssokF3VWMDOxBGEHCsCXc1uOqGPu1lkif6V9NkWfFoUwgY3KVQOiPKgkUY
 DCcRirC/ygumwWcL8bB5G2O6nTR9XqlbUeBzKSfBHoavGrBl8LDtN2YcvSAz8lx/
 QskVoj11i8OcFgxHsWtup/B/nsQGDhCPuaQrXzbQ+pRgBU7Om2Dv6nPKzmAHDN+a
 k6uxHychoZAxnCNL3Ei4b1WGTXTN9oix9gv9RQQLaFC2MfLU/xllby2Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=9rV8BYnmjySYcW66KzGk6JYbFZ1NWM3oGO+fhml+9eE=; b=u6gWQgs9
 tblzvTBSd2tIizLKJCF6GWOQL18qJY+hmUii0icgBVoR2tzXGYKDiTvl5J01SqGt
 2MNk7u7MZttMSTfRHJtxfIxR+rqP7nRqtow9M5Uj+ULb1UaWuHE/xPEtciKGTGIl
 LBD2G7AFlSncTQISEZvNRON+i8+BdRg4rPs9OoAPkpU3pyVPKl8YSTO+IPoKotXh
 uZQc0H2lfleYRXmrIPdCYkAsGK89QiI8lPMXaF62LhPkKNkSfMVwWugFHAfHH/Da
 yGv+XiksTTug+roNQ1yzmO8nC/okk/EUhUCS1ipLsTFWzeInWTXcchdcRxqcVqcH
 oe/FRovVTcXxsw==
X-ME-Sender: <xms:YZ3LYM_xUJdff5rhzYbuYeXsWEVBEjOeFN8eWeaGu5TcezZjUBYvJQ>
 <xme:YZ3LYEsLgdtdvyXe9dwKKVBgi4fRNskpEEauu6OQPigWosJEmnynO0sgfUsg1InSI
 PXICfXAlJcQLjdbWTs>
X-ME-Received: <xmr:YZ3LYCCJm9Cf0eJ3Ft9eI87qndhTyaCK4NOIEQ6dnqIFAbYNK_IQaFPDsz1YCd6b7mpNMbFFIa7DVTkzlEAevBAwW15dY_QQ8cCD5HIw_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YZ3LYMeOz_1T-CReX5ULf-Hn4IT1acOHvnlkI6NKHB9EZ4kelLV3TA>
 <xmx:YZ3LYBNZXvnFNn0EvtoxRnOQ3qplkGkZQJRtnHgtZ5I0DRljndGQig>
 <xmx:YZ3LYGmbnQm2wgjI8r8JKAeTsFEZwKo7RA9jsFGZWSUuKPxWJK-tYA>
 <xmx:YZ3LYKj5vohIhZgYZj_M-_fzaLfdo27Z3SEhldv5dAZfQ9mix7A8Fg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:07:11 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/11] hw/nvme: use prinfo directly in nvme_check_prinfo
 and nvme_dif_check
Date: Thu, 17 Jun 2021 21:06:52 +0200
Message-Id: <20210617190657.110823-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The nvme_check_prinfo() and nvme_dif_check() functions operate on the
16 bit "control" member of the NvmeCmd. These functions do not otherwise
operate on an NvmeCmd or an NvmeRequest, so change them to expect the
actual 4 bit PRINFO field and add constants that work on this field as
well.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h       |  4 +--
 include/block/nvme.h |  8 ++++++
 hw/nvme/ctrl.c       | 67 +++++++++++++++++---------------------------
 hw/nvme/dif.c        | 44 ++++++++++++++---------------
 4 files changed, 57 insertions(+), 66 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 6e43f3f3d128..7491157f56f6 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -533,7 +533,7 @@ static const uint16_t t10_dif_crc_table[256] = {
     0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
 };
 
-uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl, uint64_t slba,
+uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
                            uint32_t reftag);
 uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
                                uint64_t slba);
@@ -541,7 +541,7 @@ void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
                                  uint8_t *mbuf, size_t mlen, uint16_t apptag,
                                  uint32_t *reftag);
 uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                        uint8_t *mbuf, size_t mlen, uint16_t ctrl,
+                        uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
                         uint16_t appmask, uint32_t *reftag);
 uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 333affdb8534..0fabe28b7bdd 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -708,6 +708,14 @@ enum {
 
 #define NVME_RW_PRINFO(control) ((control >> 10) & 0xf)
 
+enum {
+    NVME_PRINFO_PRACT       = 1 << 3,
+    NVME_PRINFO_PRCHK_GUARD = 1 << 2,
+    NVME_PRINFO_PRCHK_APP   = 1 << 1,
+    NVME_PRINFO_PRCHK_REF   = 1 << 0,
+    NVME_PRINFO_PRCHK_MASK  = 7 << 0,
+};
+
 typedef struct QEMU_PACKED NvmeDsmCmd {
     uint8_t     opcode;
     uint8_t     flags;
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f1a36c2052d0..aca6cf068e2b 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1010,16 +1010,12 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    bool pi = !!NVME_ID_NS_DPS_TYPE(ns->id_ns.dps);
+    bool pract = !!(le16_to_cpu(rw->control) & NVME_RW_PRINFO_PRACT);
     size_t len = nvme_l2b(ns, nlb);
     uint16_t status;
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
-        (ctrl & NVME_RW_PRINFO_PRACT && ns->lbaf.ms == 8)) {
-        goto out;
-    }
-
-    if (nvme_ns_ext(ns)) {
+    if (nvme_ns_ext(ns) && !(pi && pract && ns->lbaf.ms == 8)) {
         NvmeSg sg;
 
         len += nvme_m2b(ns, nlb);
@@ -1036,7 +1032,6 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
         return NVME_SUCCESS;
     }
 
-out:
     return nvme_map_dptr(n, &req->sg, len, &req->cmd);
 }
 
@@ -1195,10 +1190,10 @@ uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 {
     NvmeNamespace *ns = req->ns;
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    bool pi = !!NVME_ID_NS_DPS_TYPE(ns->id_ns.dps);
+    bool pract = !!(le16_to_cpu(rw->control) & NVME_RW_PRINFO_PRACT);
 
-    if (nvme_ns_ext(ns) &&
-        !(ctrl & NVME_RW_PRINFO_PRACT && ns->lbaf.ms == 8)) {
+    if (nvme_ns_ext(ns) && !(pi && pract && ns->lbaf.ms == 8)) {
         return nvme_tx_interleaved(n, &req->sg, ptr, len, ns->lbasz,
                                    ns->lbaf.ms, 0, dir);
     }
@@ -1950,14 +1945,13 @@ static void nvme_verify_cb(void *opaque, int ret)
     BlockAcctStats *stats = blk_get_stats(blk);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
     uint32_t reftag = le32_to_cpu(rw->reftag);
     uint16_t status;
 
-    trace_pci_nvme_verify_cb(nvme_cid(req), NVME_RW_PRINFO(ctrl), apptag,
-                             appmask, reftag);
+    trace_pci_nvme_verify_cb(nvme_cid(req), prinfo, apptag, appmask, reftag);
 
     if (ret) {
         block_acct_failed(stats, acct);
@@ -1977,7 +1971,7 @@ static void nvme_verify_cb(void *opaque, int ret)
 
         req->status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
                                      ctx->mdata.bounce, ctx->mdata.iov.size,
-                                     ctrl, slba, apptag, appmask, &reftag);
+                                     prinfo, slba, apptag, appmask, &reftag);
     }
 
 out:
@@ -2183,8 +2177,8 @@ static void nvme_copy_in_complete(NvmeRequest *req)
     block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
 
     if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-        uint16_t prinfor = (copy->control[0] >> 4) & 0xf;
-        uint16_t prinfow = (copy->control[2] >> 2) & 0xf;
+        uint8_t prinfor = (copy->control[0] >> 4) & 0xf;
+        uint8_t prinfow = (copy->control[2] >> 2) & 0xf;
         uint16_t nr = copy->nr + 1;
         NvmeCopySourceRange *range;
         uint64_t slba;
@@ -2195,13 +2189,6 @@ static void nvme_copy_in_complete(NvmeRequest *req)
         size_t len, mlen;
         int i;
 
-        /*
-         * The dif helpers expects prinfo to be similar to the control field of
-         * the NvmeRwCmd, so shift by 10 to fake it.
-         */
-        prinfor = prinfor << 10;
-        prinfow = prinfow << 10;
-
         for (i = 0; i < nr; i++) {
             range = &ctx->ranges[i];
             slba = le64_to_cpu(range->slba);
@@ -2342,7 +2329,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     NvmeNamespace *ns = req->ns;
     NvmeCtrl *n = nvme_ctrl(req);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
     uint32_t reftag = le32_to_cpu(rw->reftag);
@@ -2378,7 +2365,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
         int16_t pil = 0;
 
         status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
-                                ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
+                                ctx->mdata.bounce, ctx->mdata.iov.size, prinfo,
                                 slba, apptag, appmask, &reftag);
         if (status) {
             req->status = status;
@@ -2674,7 +2661,7 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t len = nvme_l2b(ns, nlb);
     int64_t offset = nvme_l2b(ns, slba);
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint32_t reftag = le32_to_cpu(rw->reftag);
     NvmeBounceContext *ctx = NULL;
     uint16_t status;
@@ -2682,12 +2669,12 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_verify(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
     if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-        status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+        status = nvme_check_prinfo(ns, prinfo, slba, reftag);
         if (status) {
             return status;
         }
 
-        if (ctrl & NVME_RW_PRINFO_PRACT) {
+        if (prinfo & NVME_PRINFO_PRACT) {
             return NVME_INVALID_PROT_INFO | NVME_DNR;
         }
     }
@@ -2731,13 +2718,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     uint16_t nr = copy->nr + 1;
     uint8_t format = copy->control[0] & 0xf;
-
-    /*
-     * Shift the PRINFOR/PRINFOW values by 10 to allow reusing the
-     * NVME_RW_PRINFO constants.
-     */
-    uint16_t prinfor = ((copy->control[0] >> 4) & 0xf) << 10;
-    uint16_t prinfow = ((copy->control[2] >> 2) & 0xf) << 10;
+    uint8_t prinfor = (copy->control[0] >> 4) & 0xf;
+    uint8_t prinfow = (copy->control[2] >> 2) & 0xf;
 
     uint32_t nlb = 0;
     uint8_t *bounce = NULL, *bouncep = NULL;
@@ -2749,7 +2731,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_copy(nvme_cid(req), nvme_nsid(ns), nr, format);
 
     if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
-        ((prinfor & NVME_RW_PRINFO_PRACT) != (prinfow & NVME_RW_PRINFO_PRACT))) {
+        ((prinfor & NVME_PRINFO_PRACT) != (prinfow & NVME_PRINFO_PRACT))) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -2886,7 +2868,7 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     BlockBackend *blk = ns->blkconf.blk;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     size_t data_len = nvme_l2b(ns, nlb);
     size_t len = data_len;
     int64_t offset = nvme_l2b(ns, slba);
@@ -2895,7 +2877,7 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_compare(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) && (ctrl & NVME_RW_PRINFO_PRACT)) {
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) && (prinfo & NVME_PRINFO_PRACT)) {
         return NVME_INVALID_PROT_INFO | NVME_DNR;
     }
 
@@ -3083,7 +3065,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
     NvmeNamespace *ns = req->ns;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint64_t data_size = nvme_l2b(ns, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
@@ -3094,7 +3076,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         mapped_size += nvme_m2b(ns, nlb);
 
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-            bool pract = ctrl & NVME_RW_PRINFO_PRACT;
+            bool pract = prinfo & NVME_PRINFO_PRACT;
 
             if (pract && ns->lbaf.ms == 8) {
                 mapped_size = data_size;
@@ -3158,6 +3140,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(ctrl);
     uint64_t data_size = nvme_l2b(ns, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
@@ -3170,7 +3153,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         mapped_size += nvme_m2b(ns, nlb);
 
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-            bool pract = ctrl & NVME_RW_PRINFO_PRACT;
+            bool pract = prinfo & NVME_PRINFO_PRACT;
 
             if (pract && ns->lbaf.ms == 8) {
                 mapped_size -= nvme_m2b(ns, nlb);
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index f5f86f1c26ad..5dbd18b2a4a5 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -15,11 +15,11 @@
 #include "nvme.h"
 #include "trace.h"
 
-uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl, uint64_t slba,
+uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
                            uint32_t reftag)
 {
     if ((NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) == NVME_ID_NS_DPS_TYPE_1) &&
-        (ctrl & NVME_RW_PRINFO_PRCHK_REF) && (slba & 0xffffffff) != reftag) {
+        (prinfo & NVME_PRINFO_PRCHK_REF) && (slba & 0xffffffff) != reftag) {
         return NVME_INVALID_PROT_INFO | NVME_DNR;
     }
 
@@ -73,7 +73,7 @@ void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
 
 static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
                                uint8_t *buf, uint8_t *mbuf, size_t pil,
-                               uint16_t ctrl, uint16_t apptag,
+                               uint8_t prinfo, uint16_t apptag,
                                uint16_t appmask, uint32_t reftag)
 {
     switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
@@ -95,7 +95,7 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
         return NVME_SUCCESS;
     }
 
-    if (ctrl & NVME_RW_PRINFO_PRCHK_GUARD) {
+    if (prinfo & NVME_PRINFO_PRCHK_GUARD) {
         uint16_t crc = crc_t10dif(0x0, buf, ns->lbasz);
 
         if (pil) {
@@ -109,7 +109,7 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
         }
     }
 
-    if (ctrl & NVME_RW_PRINFO_PRCHK_APP) {
+    if (prinfo & NVME_PRINFO_PRCHK_APP) {
         trace_pci_nvme_dif_prchk_apptag(be16_to_cpu(dif->apptag), apptag,
                                         appmask);
 
@@ -118,7 +118,7 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
         }
     }
 
-    if (ctrl & NVME_RW_PRINFO_PRCHK_REF) {
+    if (prinfo & NVME_PRINFO_PRCHK_REF) {
         trace_pci_nvme_dif_prchk_reftag(be32_to_cpu(dif->reftag), reftag);
 
         if (be32_to_cpu(dif->reftag) != reftag) {
@@ -130,7 +130,7 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
 }
 
 uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                        uint8_t *mbuf, size_t mlen, uint16_t ctrl,
+                        uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
                         uint16_t appmask, uint32_t *reftag)
 {
@@ -138,7 +138,7 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
     int16_t pil = 0;
     uint16_t status;
 
-    status = nvme_check_prinfo(ns, ctrl, slba, *reftag);
+    status = nvme_check_prinfo(ns, prinfo, slba, *reftag);
     if (status) {
         return status;
     }
@@ -147,12 +147,12 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
         pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
     }
 
-    trace_pci_nvme_dif_check(NVME_RW_PRINFO(ctrl), ns->lbasz + pil);
+    trace_pci_nvme_dif_check(prinfo, ns->lbasz + pil);
 
     for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
 
-        status = nvme_dif_prchk(ns, dif, buf, mbuf, pil, ctrl, apptag,
+        status = nvme_dif_prchk(ns, dif, buf, mbuf, pil, prinfo, apptag,
                                 appmask, *reftag);
         if (status) {
             return status;
@@ -248,14 +248,14 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
     NvmeCtrl *n = nvme_ctrl(req);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
     uint32_t reftag = le32_to_cpu(rw->reftag);
     uint16_t status;
 
-    trace_pci_nvme_dif_rw_check_cb(nvme_cid(req), NVME_RW_PRINFO(ctrl), apptag,
-                                   appmask, reftag);
+    trace_pci_nvme_dif_rw_check_cb(nvme_cid(req), prinfo, apptag, appmask,
+                                   reftag);
 
     if (ret) {
         goto out;
@@ -269,7 +269,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
     }
 
     status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
-                            ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
+                            ctx->mdata.bounce, ctx->mdata.iov.size, prinfo,
                             slba, apptag, appmask, &reftag);
     if (status) {
         req->status = status;
@@ -283,7 +283,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (ctrl & NVME_RW_PRINFO_PRACT && ns->lbaf.ms == 8) {
+    if (prinfo & NVME_PRINFO_PRACT && ns->lbaf.ms == 8) {
         goto out;
     }
 
@@ -364,15 +364,15 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     size_t mlen = nvme_m2b(ns, nlb);
     size_t mapped_len = len;
     int64_t offset = nvme_l2b(ns, slba);
-    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
     uint32_t reftag = le32_to_cpu(rw->reftag);
-    bool pract = !!(ctrl & NVME_RW_PRINFO_PRACT);
+    bool pract = !!(prinfo & NVME_PRINFO_PRACT);
     NvmeBounceContext *ctx;
     uint16_t status;
 
-    trace_pci_nvme_dif_rw(pract, NVME_RW_PRINFO(ctrl));
+    trace_pci_nvme_dif_rw(pract, prinfo);
 
     ctx = g_new0(NvmeBounceContext, 1);
     ctx->req = req;
@@ -380,7 +380,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     if (wrz) {
         BdrvRequestFlags flags = BDRV_REQ_MAY_UNMAP;
 
-        if (ctrl & NVME_RW_PRINFO_PRCHK_MASK) {
+        if (prinfo & NVME_PRINFO_PRCHK_MASK) {
             status = NVME_INVALID_PROT_INFO | NVME_DNR;
             goto err;
         }
@@ -389,7 +389,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
             uint8_t *mbuf, *end;
             int16_t pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
 
-            status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+            status = nvme_check_prinfo(ns, prinfo, slba, reftag);
             if (status) {
                 goto err;
             }
@@ -469,7 +469,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+    status = nvme_check_prinfo(ns, prinfo, slba, reftag);
     if (status) {
         goto err;
     }
@@ -481,7 +481,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
                                     apptag, &reftag);
     } else {
         status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
-                                ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
+                                ctx->mdata.bounce, ctx->mdata.iov.size, prinfo,
                                 slba, apptag, appmask, &reftag);
         if (status) {
             goto err;
-- 
2.32.0


