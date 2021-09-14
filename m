Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709640B967
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:45:04 +0200 (CEST)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFId-00019O-E2
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBs-0005er-Rr; Tue, 14 Sep 2021 16:38:09 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:52043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBm-0004k0-Ob; Tue, 14 Sep 2021 16:38:04 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 27DE032009E0;
 Tue, 14 Sep 2021 16:37:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 14 Sep 2021 16:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xBzgFB3wciwJS
 A350tEW9Xdhl/8XMQIg6jmVihu/RQo=; b=RCEAUeFIKkGGDVIziYTmQz6HSf1dW
 47dyzn0mdjO+iklxTKmCaxqC6f+AJVx7egLCVngdL6XBV09JC7Tk0/j3PGSUX972
 INLEb+TTWny2b1fJOE4vDe1TRQR1+QCwjg6yX+XrLXUBqOQZoGHAh6NZu9tuXACC
 834jAoA2AoPIZiAEa5fTOnUTgf5tdHP+ZN6r9CIrc6tWr9aXs26oVslIGzLKs/OW
 DSDszMOikH9Qyaacif27eJX4SgOs9xPv1o9LDgCmbz17NZHR6LvwE2oZDpkYoA6N
 sw1Jsn2YbTlvZE0wnEa+vgQB/NIfxSvfL+0vs7QuLg1gN9M1xIGo1MZHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xBzgFB3wciwJSA350tEW9Xdhl/8XMQIg6jmVihu/RQo=; b=sSbgjbaT
 8WO31rdy+AVpSfTexR/rr26Azadhs2l38Vceb67FpjJhkIxA5eeuy7Opa5SPgkhH
 oEeiL/T3dZdwvaiEAz+fYUSVEGWXjdrRZHwdJTeqdya75tXrUgw4IzrSc3RT5rtp
 N9L1D0AnKBiF8kOB1WxAljddCSRlbtVThQZQQmZIehjeYVq7mEFQlqI8JPdT+H44
 fTzHy8UVG+3AkbrbfQtrV8jNg/zidJWl9Noi0982rSg76Dmmia8brlKl/dTplh7b
 hCc8Lkp7lvx2brHRw2tUYlqUycgngnGSat2lx/JkH6XEi71kMJQ/RIia5KuTDUX1
 oEnBM8cTur7hjg==
X-ME-Sender: <xms:IwhBYQ0ujIcMze9OwTp9dPV4kqekgYBDTsLwBwEeyJMDIIqEDYBDFQ>
 <xme:IwhBYbFlAarG7gFZkWSIxbMSx1TA7XgtijDI5jFzWgHeYqWMt7pafLrDakF226Jms
 UOSHFfuYdlj9ewSwnc>
X-ME-Received: <xmr:IwhBYY6qgdiMiAu0LyC3OSqAn6cifmnuzMCWomp8aE_2TIdcBTTfGbpsrSWsMB3sVeSXnujDVmoM6lSGLiTG5BUvBCvGwLJgQi7T7iNDmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:IwhBYZ2ePFJaNQYBTMkLZG7a-mpz1yRjjcUA1O7FZKq-yu0yaY9iLw>
 <xmx:IwhBYTFbUBUmCYhXrzTRRj06HklC_3oG2Qceke-c-M4oYwjmP7lDPA>
 <xmx:IwhBYS92N1WvBEdaQhl88KggN_G6zk2mtzsLNM1dixAMq2oBQljREg>
 <xmx:IwhBYZZSSLwmGlRNYUadvr8h28z8REB2QBEBzx4IBx6x0vqDFUwJqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:37:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 04/13] hw/nvme: move nvm namespace members to separate
 struct
Date: Tue, 14 Sep 2021 22:37:28 +0200
Message-Id: <20210914203737.182571-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 282 +++++++++++++++++++++++++++----------------------
 hw/nvme/dif.c  | 101 +++++++++---------
 hw/nvme/dif.h  |  12 +--
 hw/nvme/ns.c   |  72 +++++++------
 hw/nvme/nvme.h |  45 +++++---
 5 files changed, 290 insertions(+), 222 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4c30823d389f..7f41181aafa1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -528,11 +528,11 @@ static inline void nvme_sg_unmap(NvmeSg *sg)
  * holds both data and metadata. This function splits the data and metadata
  * into two separate QSG/IOVs.
  */
-static void nvme_sg_split(NvmeSg *sg, NvmeNamespace *ns, NvmeSg *data,
+static void nvme_sg_split(NvmeSg *sg, NvmeNamespaceNvm *nvm, NvmeSg *data,
                           NvmeSg *mdata)
 {
     NvmeSg *dst = data;
-    uint32_t trans_len, count = ns->lbasz;
+    uint32_t trans_len, count = nvm->lbasz;
     uint64_t offset = 0;
     bool dma = sg->flags & NVME_SG_DMA;
     size_t sge_len;
@@ -564,7 +564,7 @@ static void nvme_sg_split(NvmeSg *sg, NvmeNamespace *ns, NvmeSg *data,
 
         if (count == 0) {
             dst = (dst == data) ? mdata : data;
-            count = (dst == data) ? ns->lbasz : ns->lbaf.ms;
+            count = (dst == data) ? nvm->lbasz : nvm->lbaf.ms;
         }
 
         if (sge_len == offset) {
@@ -1029,17 +1029,17 @@ static uint16_t nvme_map_mptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
 
 static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
 {
-    NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
-    bool pi = !!NVME_ID_NS_DPS_TYPE(ns->id_ns.dps);
+    bool pi = !!NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps);
     bool pract = !!(le16_to_cpu(rw->control) & NVME_RW_PRINFO_PRACT);
-    size_t len = nvme_l2b(ns, nlb);
+    size_t len = nvme_l2b(nvm, nlb);
     uint16_t status;
 
-    if (nvme_ns_ext(ns) && !(pi && pract && ns->lbaf.ms == 8)) {
+    if (nvme_ns_ext(nvm) && !(pi && pract && nvm->lbaf.ms == 8)) {
         NvmeSg sg;
 
-        len += nvme_m2b(ns, nlb);
+        len += nvme_m2b(nvm, nlb);
 
         status = nvme_map_dptr(n, &sg, len, &req->cmd);
         if (status) {
@@ -1047,7 +1047,7 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
         }
 
         nvme_sg_init(n, &req->sg, sg.flags & NVME_SG_DMA);
-        nvme_sg_split(&sg, ns, &req->sg, NULL);
+        nvme_sg_split(&sg, nvm, &req->sg, NULL);
         nvme_sg_unmap(&sg);
 
         return NVME_SUCCESS;
@@ -1058,14 +1058,14 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
 
 static uint16_t nvme_map_mdata(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
 {
-    NvmeNamespace *ns = req->ns;
-    size_t len = nvme_m2b(ns, nlb);
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
+    size_t len = nvme_m2b(nvm, nlb);
     uint16_t status;
 
-    if (nvme_ns_ext(ns)) {
+    if (nvme_ns_ext(nvm)) {
         NvmeSg sg;
 
-        len += nvme_l2b(ns, nlb);
+        len += nvme_l2b(nvm, nlb);
 
         status = nvme_map_dptr(n, &sg, len, &req->cmd);
         if (status) {
@@ -1073,7 +1073,7 @@ static uint16_t nvme_map_mdata(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
         }
 
         nvme_sg_init(n, &req->sg, sg.flags & NVME_SG_DMA);
-        nvme_sg_split(&sg, ns, NULL, &req->sg);
+        nvme_sg_split(&sg, nvm, NULL, &req->sg);
         nvme_sg_unmap(&sg);
 
         return NVME_SUCCESS;
@@ -1209,14 +1209,14 @@ static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req)
 {
-    NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
-    bool pi = !!NVME_ID_NS_DPS_TYPE(ns->id_ns.dps);
+    bool pi = !!NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps);
     bool pract = !!(le16_to_cpu(rw->control) & NVME_RW_PRINFO_PRACT);
 
-    if (nvme_ns_ext(ns) && !(pi && pract && ns->lbaf.ms == 8)) {
-        return nvme_tx_interleaved(n, &req->sg, ptr, len, ns->lbasz,
-                                   ns->lbaf.ms, 0, dir);
+    if (nvme_ns_ext(nvm) && !(pi && pract && nvm->lbaf.ms == 8)) {
+        return nvme_tx_interleaved(n, &req->sg, ptr, len, nvm->lbasz,
+                                   nvm->lbaf.ms, 0, dir);
     }
 
     return nvme_tx(n, &req->sg, ptr, len, dir);
@@ -1225,12 +1225,12 @@ uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
 uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                            NvmeTxDirection dir, NvmeRequest *req)
 {
-    NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
     uint16_t status;
 
-    if (nvme_ns_ext(ns)) {
-        return nvme_tx_interleaved(n, &req->sg, ptr, len, ns->lbaf.ms,
-                                   ns->lbasz, ns->lbasz, dir);
+    if (nvme_ns_ext(nvm)) {
+        return nvme_tx_interleaved(n, &req->sg, ptr, len, nvm->lbaf.ms,
+                                   nvm->lbasz, nvm->lbasz, dir);
     }
 
     nvme_sg_unmap(&req->sg);
@@ -1448,10 +1448,10 @@ static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
     return NVME_SUCCESS;
 }
 
-static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
+static inline uint16_t nvme_check_bounds(NvmeNamespaceNvm *nvm, uint64_t slba,
                                          uint32_t nlb)
 {
-    uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
+    uint64_t nsze = le64_to_cpu(nvm->id_ns.nsze);
 
     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, nsze);
@@ -1464,10 +1464,11 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
 static int nvme_block_status_all(NvmeNamespace *ns, uint64_t slba,
                                  uint32_t nlb, int flags)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockDriverState *bs = blk_bs(ns->blkconf.blk);
 
-    int64_t pnum = 0, bytes = nvme_l2b(ns, nlb);
-    int64_t offset = nvme_l2b(ns, slba);
+    int64_t pnum = 0, bytes = nvme_l2b(nvm, nlb);
+    int64_t offset = nvme_l2b(nvm, slba);
     int ret;
 
     /*
@@ -1888,6 +1889,7 @@ static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
 
     BlockBackend *blk = ns->blkconf.blk;
 
@@ -1897,14 +1899,14 @@ static void nvme_rw_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (ns->lbaf.ms) {
+    if (nvm->lbaf.ms) {
         NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
-        uint64_t offset = nvme_moff(ns, slba);
+        uint64_t offset = nvme_moff(nvm, slba);
 
         if (req->cmd.opcode == NVME_CMD_WRITE_ZEROES) {
-            size_t mlen = nvme_m2b(ns, nlb);
+            size_t mlen = nvme_m2b(nvm, nlb);
 
             req->aiocb = blk_aio_pwrite_zeroes(blk, offset, mlen,
                                                BDRV_REQ_MAY_UNMAP,
@@ -1912,7 +1914,7 @@ static void nvme_rw_cb(void *opaque, int ret)
             return;
         }
 
-        if (nvme_ns_ext(ns) || req->cmd.mptr) {
+        if (nvme_ns_ext(nvm) || req->cmd.mptr) {
             uint16_t status;
 
             nvme_sg_unmap(&req->sg);
@@ -1939,6 +1941,7 @@ static void nvme_verify_cb(void *opaque, int ret)
     NvmeBounceContext *ctx = opaque;
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockBackend *blk = ns->blkconf.blk;
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
@@ -1960,7 +1963,7 @@ static void nvme_verify_cb(void *opaque, int ret)
 
     block_acct_done(stats, acct);
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
         status = nvme_dif_mangle_mdata(ns, ctx->mdata.bounce,
                                        ctx->mdata.iov.size, slba);
         if (status) {
@@ -1968,7 +1971,7 @@ static void nvme_verify_cb(void *opaque, int ret)
             goto out;
         }
 
-        req->status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
+        req->status = nvme_dif_check(nvm, ctx->data.bounce, ctx->data.iov.size,
                                      ctx->mdata.bounce, ctx->mdata.iov.size,
                                      prinfo, slba, apptag, appmask, &reftag);
     }
@@ -1991,11 +1994,12 @@ static void nvme_verify_mdata_in_cb(void *opaque, int ret)
     NvmeBounceContext *ctx = opaque;
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
-    size_t mlen = nvme_m2b(ns, nlb);
-    uint64_t offset = nvme_moff(ns, slba);
+    size_t mlen = nvme_m2b(nvm, nlb);
+    uint64_t offset = nvme_moff(nvm, slba);
     BlockBackend *blk = ns->blkconf.blk;
 
     trace_pci_nvme_verify_mdata_in_cb(nvme_cid(req), blk_name(blk));
@@ -2033,6 +2037,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCtrl *n = nvme_ctrl(req);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
@@ -2063,14 +2068,14 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
         uint64_t slba = le64_to_cpu(rw->slba);
         uint8_t *bufp;
         uint8_t *mbufp = ctx->mdata.bounce;
         uint8_t *end = mbufp + ctx->mdata.iov.size;
         int16_t pil = 0;
 
-        status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
+        status = nvme_dif_check(nvm, ctx->data.bounce, ctx->data.iov.size,
                                 ctx->mdata.bounce, ctx->mdata.iov.size, prinfo,
                                 slba, apptag, appmask, &reftag);
         if (status) {
@@ -2082,12 +2087,12 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
          * When formatted with protection information, do not compare the DIF
          * tuple.
          */
-        if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-            pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+        if (!(nvm->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+            pil = nvm->lbaf.ms - sizeof(NvmeDifTuple);
         }
 
-        for (bufp = buf; mbufp < end; bufp += ns->lbaf.ms, mbufp += ns->lbaf.ms) {
-            if (memcmp(bufp + pil, mbufp + pil, ns->lbaf.ms - pil)) {
+        for (bufp = buf; mbufp < end; bufp += nvm->lbaf.ms, mbufp += nvm->lbaf.ms) {
+            if (memcmp(bufp + pil, mbufp + pil, nvm->lbaf.ms - pil)) {
                 req->status = NVME_CMP_FAILURE;
                 goto out;
             }
@@ -2120,6 +2125,7 @@ static void nvme_compare_data_cb(void *opaque, int ret)
     NvmeRequest *req = opaque;
     NvmeCtrl *n = nvme_ctrl(req);
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockBackend *blk = ns->blkconf.blk;
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
@@ -2150,12 +2156,12 @@ static void nvme_compare_data_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (ns->lbaf.ms) {
+    if (nvm->lbaf.ms) {
         NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
-        size_t mlen = nvme_m2b(ns, nlb);
-        uint64_t offset = nvme_moff(ns, slba);
+        size_t mlen = nvme_m2b(nvm, nlb);
+        uint64_t offset = nvme_moff(nvm, slba);
 
         ctx->mdata.bounce = g_malloc(mlen);
 
@@ -2232,6 +2238,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     NvmeDSMAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeDsmRange *range;
     uint64_t slba;
     uint32_t nlb;
@@ -2241,7 +2248,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
         goto done;
     }
 
-    if (!ns->lbaf.ms) {
+    if (!nvm->lbaf.ms) {
         nvme_dsm_cb(iocb, 0);
         return;
     }
@@ -2265,8 +2272,8 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
         nvme_dsm_cb(iocb, 0);
     }
 
-    iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
-                                        nvme_m2b(ns, nlb), BDRV_REQ_MAY_UNMAP,
+    iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(nvm, slba),
+                                        nvme_m2b(nvm, nlb), BDRV_REQ_MAY_UNMAP,
                                         nvme_dsm_cb, iocb);
     return;
 
@@ -2281,6 +2288,7 @@ static void nvme_dsm_cb(void *opaque, int ret)
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeDsmRange *range;
     uint64_t slba;
     uint32_t nlb;
@@ -2306,14 +2314,14 @@ next:
         goto next;
     }
 
-    if (nvme_check_bounds(ns, slba, nlb)) {
+    if (nvme_check_bounds(nvm, slba, nlb)) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb,
-                                             ns->id_ns.nsze);
+                                             nvm->id_ns.nsze);
         goto next;
     }
 
-    iocb->aiocb = blk_aio_pdiscard(ns->blkconf.blk, nvme_l2b(ns, slba),
-                                   nvme_l2b(ns, nlb),
+    iocb->aiocb = blk_aio_pdiscard(ns->blkconf.blk, nvme_l2b(nvm, slba),
+                                   nvme_l2b(nvm, nlb),
                                    nvme_dsm_md_cb, iocb);
     return;
 
@@ -2362,11 +2370,12 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockBackend *blk = ns->blkconf.blk;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
-    size_t len = nvme_l2b(ns, nlb);
-    int64_t offset = nvme_l2b(ns, slba);
+    size_t len = nvme_l2b(nvm, nlb);
+    int64_t offset = nvme_l2b(nvm, slba);
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint32_t reftag = le32_to_cpu(rw->reftag);
     NvmeBounceContext *ctx = NULL;
@@ -2374,8 +2383,8 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_verify(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-        status = nvme_check_prinfo(ns, prinfo, slba, reftag);
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
+        status = nvme_check_prinfo(nvm, prinfo, slba, reftag);
         if (status) {
             return status;
         }
@@ -2389,7 +2398,7 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    status = nvme_check_bounds(ns, slba, nlb);
+    status = nvme_check_bounds(nvm, slba, nlb);
     if (status) {
         return status;
     }
@@ -2519,6 +2528,7 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCopySourceRange *range;
     uint32_t nlb;
     size_t mlen;
@@ -2531,7 +2541,7 @@ static void nvme_copy_out_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (!ns->lbaf.ms) {
+    if (!nvm->lbaf.ms) {
         nvme_copy_out_completed_cb(iocb, 0);
         return;
     }
@@ -2539,13 +2549,13 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     range = &iocb->ranges[iocb->idx];
     nlb = le32_to_cpu(range->nlb) + 1;
 
-    mlen = nvme_m2b(ns, nlb);
-    mbounce = iocb->bounce + nvme_l2b(ns, nlb);
+    mlen = nvme_m2b(nvm, nlb);
+    mbounce = iocb->bounce + nvme_l2b(nvm, nlb);
 
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, mbounce, mlen);
 
-    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_moff(ns, iocb->slba),
+    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_moff(nvm, iocb->slba),
                                   &iocb->iov, 0, nvme_copy_out_completed_cb,
                                   iocb);
 
@@ -2560,6 +2570,7 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCopySourceRange *range;
     uint32_t nlb;
     size_t len;
@@ -2574,11 +2585,11 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
 
     range = &iocb->ranges[iocb->idx];
     nlb = le32_to_cpu(range->nlb) + 1;
-    len = nvme_l2b(ns, nlb);
+    len = nvme_l2b(nvm, nlb);
 
     trace_pci_nvme_copy_out(iocb->slba, nlb);
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
         NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
 
         uint16_t prinfor = ((copy->control[0] >> 4) & 0xf);
@@ -2589,10 +2600,10 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         uint32_t reftag = le32_to_cpu(range->reftag);
 
         uint64_t slba = le64_to_cpu(range->slba);
-        size_t mlen = nvme_m2b(ns, nlb);
-        uint8_t *mbounce = iocb->bounce + nvme_l2b(ns, nlb);
+        size_t mlen = nvme_m2b(nvm, nlb);
+        uint8_t *mbounce = iocb->bounce + nvme_l2b(nvm, nlb);
 
-        status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen, prinfor,
+        status = nvme_dif_check(nvm, iocb->bounce, len, mbounce, mlen, prinfor,
                                 slba, apptag, appmask, &reftag);
         if (status) {
             goto invalid;
@@ -2602,15 +2613,15 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         appmask = le16_to_cpu(copy->appmask);
 
         if (prinfow & NVME_PRINFO_PRACT) {
-            status = nvme_check_prinfo(ns, prinfow, iocb->slba, iocb->reftag);
+            status = nvme_check_prinfo(nvm, prinfow, iocb->slba, iocb->reftag);
             if (status) {
                 goto invalid;
             }
 
-            nvme_dif_pract_generate_dif(ns, iocb->bounce, len, mbounce, mlen,
+            nvme_dif_pract_generate_dif(nvm, iocb->bounce, len, mbounce, mlen,
                                         apptag, &iocb->reftag);
         } else {
-            status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen,
+            status = nvme_dif_check(nvm, iocb->bounce, len, mbounce, mlen,
                                     prinfow, iocb->slba, apptag, appmask,
                                     &iocb->reftag);
             if (status) {
@@ -2619,7 +2630,7 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         }
     }
 
-    status = nvme_check_bounds(ns, iocb->slba, nlb);
+    status = nvme_check_bounds(nvm, iocb->slba, nlb);
     if (status) {
         goto invalid;
     }
@@ -2636,7 +2647,7 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, iocb->bounce, len);
 
-    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, iocb->slba),
+    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(nvm, iocb->slba),
                                   &iocb->iov, 0, nvme_copy_out_cb, iocb);
 
     return;
@@ -2659,6 +2670,7 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCopySourceRange *range;
     uint64_t slba;
     uint32_t nlb;
@@ -2670,7 +2682,7 @@ static void nvme_copy_in_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (!ns->lbaf.ms) {
+    if (!nvm->lbaf.ms) {
         nvme_copy_in_completed_cb(iocb, 0);
         return;
     }
@@ -2680,10 +2692,10 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     nlb = le32_to_cpu(range->nlb) + 1;
 
     qemu_iovec_reset(&iocb->iov);
-    qemu_iovec_add(&iocb->iov, iocb->bounce + nvme_l2b(ns, nlb),
-                   nvme_m2b(ns, nlb));
+    qemu_iovec_add(&iocb->iov, iocb->bounce + nvme_l2b(nvm, nlb),
+                   nvme_m2b(nvm, nlb));
 
-    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_moff(ns, slba),
+    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_moff(nvm, slba),
                                  &iocb->iov, 0, nvme_copy_in_completed_cb,
                                  iocb);
     return;
@@ -2697,6 +2709,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCopySourceRange *range;
     uint64_t slba;
     uint32_t nlb;
@@ -2717,16 +2730,16 @@ static void nvme_copy_cb(void *opaque, int ret)
     range = &iocb->ranges[iocb->idx];
     slba = le64_to_cpu(range->slba);
     nlb = le32_to_cpu(range->nlb) + 1;
-    len = nvme_l2b(ns, nlb);
+    len = nvme_l2b(nvm, nlb);
 
     trace_pci_nvme_copy_source_range(slba, nlb);
 
-    if (nlb > le16_to_cpu(ns->id_ns.mssrl)) {
+    if (nlb > le16_to_cpu(nvm->id_ns.mssrl)) {
         status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
         goto invalid;
     }
 
-    status = nvme_check_bounds(ns, slba, nlb);
+    status = nvme_check_bounds(nvm, slba, nlb);
     if (status) {
         goto invalid;
     }
@@ -2748,7 +2761,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, iocb->bounce, len);
 
-    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(ns, slba),
+    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(nvm, slba),
                                  &iocb->iov, 0, nvme_copy_in_cb, iocb);
     return;
 
@@ -2765,6 +2778,7 @@ done:
 static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
     NvmeCopyAIOCB *iocb = blk_aio_get(&nvme_copy_aiocb_info, ns->blkconf.blk,
                                       nvme_misc_cb, req);
@@ -2780,7 +2794,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     iocb->ranges = NULL;
     iocb->zone = NULL;
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps) &&
         ((prinfor & NVME_PRINFO_PRACT) != (prinfow & NVME_PRINFO_PRACT))) {
         status = NVME_INVALID_FIELD | NVME_DNR;
         goto invalid;
@@ -2792,7 +2806,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    if (nr > ns->id_ns.msrc + 1) {
+    if (nr > nvm->id_ns.msrc + 1) {
         status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
         goto invalid;
     }
@@ -2828,8 +2842,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     iocb->nr = nr;
     iocb->idx = 0;
     iocb->reftag = le32_to_cpu(copy->reftag);
-    iocb->bounce = g_malloc_n(le16_to_cpu(ns->id_ns.mssrl),
-                              ns->lbasz + ns->lbaf.ms);
+    iocb->bounce = g_malloc_n(le16_to_cpu(nvm->id_ns.mssrl),
+                              nvm->lbasz + nvm->lbaf.ms);
 
     qemu_iovec_init(&iocb->iov, 1);
 
@@ -2853,24 +2867,25 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockBackend *blk = ns->blkconf.blk;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
-    size_t data_len = nvme_l2b(ns, nlb);
+    size_t data_len = nvme_l2b(nvm, nlb);
     size_t len = data_len;
-    int64_t offset = nvme_l2b(ns, slba);
+    int64_t offset = nvme_l2b(nvm, slba);
     struct nvme_compare_ctx *ctx = NULL;
     uint16_t status;
 
     trace_pci_nvme_compare(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) && (prinfo & NVME_PRINFO_PRACT)) {
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps) && (prinfo & NVME_PRINFO_PRACT)) {
         return NVME_INVALID_PROT_INFO | NVME_DNR;
     }
 
-    if (nvme_ns_ext(ns)) {
-        len += nvme_m2b(ns, nlb);
+    if (nvme_ns_ext(nvm)) {
+        len += nvme_m2b(nvm, nlb);
     }
 
     status = nvme_check_mdts(n, len);
@@ -2878,7 +2893,7 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
         return status;
     }
 
-    status = nvme_check_bounds(ns, slba, nlb);
+    status = nvme_check_bounds(nvm, slba, nlb);
     if (status) {
         return status;
     }
@@ -3051,22 +3066,23 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
-    uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t data_size = nvme_l2b(nvm, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
     BlockBackend *blk = ns->blkconf.blk;
     uint16_t status;
 
-    if (nvme_ns_ext(ns)) {
-        mapped_size += nvme_m2b(ns, nlb);
+    if (nvme_ns_ext(nvm)) {
+        mapped_size += nvme_m2b(nvm, nlb);
 
-        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
             bool pract = prinfo & NVME_PRINFO_PRACT;
 
-            if (pract && ns->lbaf.ms == 8) {
+            if (pract && nvm->lbaf.ms == 8) {
                 mapped_size = data_size;
             }
         }
@@ -3079,7 +3095,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    status = nvme_check_bounds(ns, slba, nlb);
+    status = nvme_check_bounds(nvm, slba, nlb);
     if (status) {
         goto invalid;
     }
@@ -3099,7 +3115,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
         return nvme_dif_rw(n, req);
     }
 
@@ -3108,7 +3124,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    data_offset = nvme_l2b(ns, slba);
+    data_offset = nvme_l2b(nvm, slba);
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_size,
                      BLOCK_ACCT_READ);
@@ -3125,11 +3141,12 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint16_t ctrl = le16_to_cpu(rw->control);
     uint8_t prinfo = NVME_RW_PRINFO(ctrl);
-    uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t data_size = nvme_l2b(nvm, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
     NvmeZone *zone;
@@ -3137,14 +3154,14 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     BlockBackend *blk = ns->blkconf.blk;
     uint16_t status;
 
-    if (nvme_ns_ext(ns)) {
-        mapped_size += nvme_m2b(ns, nlb);
+    if (nvme_ns_ext(nvm)) {
+        mapped_size += nvme_m2b(nvm, nlb);
 
-        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
             bool pract = prinfo & NVME_PRINFO_PRACT;
 
-            if (pract && ns->lbaf.ms == 8) {
-                mapped_size -= nvme_m2b(ns, nlb);
+            if (pract && nvm->lbaf.ms == 8) {
+                mapped_size -= nvme_m2b(nvm, nlb);
             }
         }
     }
@@ -3159,7 +3176,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         }
     }
 
-    status = nvme_check_bounds(ns, slba, nlb);
+    status = nvme_check_bounds(nvm, slba, nlb);
     if (status) {
         goto invalid;
     }
@@ -3189,7 +3206,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             rw->slba = cpu_to_le64(slba);
             res->slba = cpu_to_le64(slba);
 
-            switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+            switch (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
             case NVME_ID_NS_DPS_TYPE_1:
                 if (!piremap) {
                     return NVME_INVALID_PROT_INFO | NVME_DNR;
@@ -3227,9 +3244,9 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         zone->w_ptr += nlb;
     }
 
-    data_offset = nvme_l2b(ns, slba);
+    data_offset = nvme_l2b(nvm, slba);
 
-    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
         return nvme_dif_rw(n, req);
     }
 
@@ -3273,6 +3290,7 @@ static inline uint16_t nvme_zone_append(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
                                             uint64_t *slba, uint32_t *zone_idx)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeNamespaceZoned *zoned;
 
     uint32_t dw10 = le32_to_cpu(c->cdw10);
@@ -3286,8 +3304,8 @@ static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
     zoned = NVME_NAMESPACE_ZONED(ns);
 
     *slba = ((uint64_t)dw11) << 32 | dw10;
-    if (unlikely(*slba >= ns->id_ns.nsze)) {
-        trace_pci_nvme_err_invalid_lba_range(*slba, 0, ns->id_ns.nsze);
+    if (unlikely(*slba >= nvm->id_ns.nsze)) {
+        trace_pci_nvme_err_invalid_lba_range(*slba, 0, nvm->id_ns.nsze);
         *slba = 0;
         return NVME_LBA_RANGE | NVME_DNR;
     }
@@ -3506,6 +3524,8 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
     NvmeZoneResetAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
     int64_t moff;
     int count;
 
@@ -3514,13 +3534,13 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
         return;
     }
 
-    if (!ns->lbaf.ms) {
+    if (!nvm->lbaf.ms) {
         nvme_zone_reset_cb(iocb, 0);
         return;
     }
 
-    moff = nvme_moff(ns, iocb->zone->d.zslba);
-    count = nvme_m2b(ns, NVME_NAMESPACE_ZONED(ns)->zone_size);
+    moff = nvme_moff(nvm, iocb->zone->d.zslba);
+    count = nvme_m2b(nvm, zoned->zone_size);
 
     iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, moff, count,
                                         BDRV_REQ_MAY_UNMAP,
@@ -3533,6 +3553,7 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     NvmeZoneResetAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
 
     if (ret < 0) {
@@ -3573,8 +3594,8 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
         trace_pci_nvme_zns_zone_reset(zone->d.zslba);
 
         iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk,
-                                            nvme_l2b(ns, zone->d.zslba),
-                                            nvme_l2b(ns, zoned->zone_size),
+                                            nvme_l2b(nvm, zone->d.zslba),
+                                            nvme_l2b(nvm, zoned->zone_size),
                                             BDRV_REQ_MAY_UNMAP,
                                             nvme_zone_reset_epilogue_cb,
                                             iocb);
@@ -4471,7 +4492,8 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     }
 
     if (active || ns->csi == NVME_CSI_NVM) {
-        return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
+        NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+        return nvme_c2h(n, (uint8_t *)&nvm->id_ns, sizeof(NvmeIdNs), req);
     }
 
     return NVME_INVALID_CMD_SET | NVME_DNR;
@@ -4990,6 +5012,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = NULL;
+    NvmeNamespaceNvm *nvm;
 
     NvmeCmd *cmd = &req->cmd;
     uint32_t dw10 = le32_to_cpu(cmd->cdw10);
@@ -5064,7 +5087,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
                     continue;
                 }
 
-                if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat)) {
+                nvm = NVME_NAMESPACE_NVM(ns);
+
+                if (NVME_ID_NS_NSFEAT_DULBE(nvm->id_ns.nsfeat)) {
                     ns->features.err_rec = dw11;
                 }
             }
@@ -5073,7 +5098,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         }
 
         assert(ns);
-        if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat))  {
+        nvm = NVME_NAMESPACE_NVM(ns);
+        if (NVME_ID_NS_NSFEAT_DULBE(nvm->id_ns.nsfeat))  {
             ns->features.err_rec = dw11;
         }
         break;
@@ -5155,12 +5181,15 @@ static void nvme_update_dmrsl(NvmeCtrl *n)
 
     for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
         NvmeNamespace *ns = nvme_ns(n, nsid);
+        NvmeNamespaceNvm *nvm;
         if (!ns) {
             continue;
         }
 
+        nvm = NVME_NAMESPACE_NVM(ns);
+
         n->dmrsl = MIN_NON_ZERO(n->dmrsl,
-                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(nvm, 1));
     }
 }
 
@@ -5302,6 +5331,7 @@ static const AIOCBInfo nvme_format_aiocb_info = {
 
 static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     uint32_t dw10 = le32_to_cpu(cmd->cdw10);
     uint8_t lbaf = dw10 & 0xf;
     uint8_t pi = (dw10 >> 5) & 0x7;
@@ -5310,8 +5340,8 @@ static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
 
     trace_pci_nvme_format_set(ns->params.nsid, lbaf, mset, pi, pil);
 
-    ns->id_ns.dps = (pil << 3) | pi;
-    ns->id_ns.flbas = lbaf | (mset << 4);
+    nvm->id_ns.dps = (pil << 3) | pi;
+    nvm->id_ns.flbas = lbaf | (mset << 4);
 
     nvme_ns_init_format(ns);
 }
@@ -5321,6 +5351,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
     NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = iocb->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     int bytes;
 
     if (ret < 0) {
@@ -5330,8 +5361,8 @@ static void nvme_format_ns_cb(void *opaque, int ret)
 
     assert(ns);
 
-    if (iocb->offset < ns->size) {
-        bytes = MIN(BDRV_REQUEST_MAX_BYTES, ns->size - iocb->offset);
+    if (iocb->offset < nvm->size) {
+        bytes = MIN(BDRV_REQUEST_MAX_BYTES, nvm->size - iocb->offset);
 
         iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, iocb->offset,
                                             bytes, BDRV_REQ_MAY_UNMAP,
@@ -5353,15 +5384,17 @@ done:
 
 static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+
     if (nvme_ns_zoned(ns)) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
-    if (lbaf > ns->id_ns.nlbaf) {
+    if (lbaf > nvm->id_ns.nlbaf) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
-    if (pi && (ns->id_ns.lbaf[lbaf].ms < sizeof(NvmeDifTuple))) {
+    if (pi && (nvm->id_ns.lbaf[lbaf].ms < sizeof(NvmeDifTuple))) {
         return NVME_INVALID_FORMAT | NVME_DNR;
     }
 
@@ -6510,6 +6543,7 @@ static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
 
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     uint32_t nsid = ns->params.nsid;
     assert(nsid && nsid <= NVME_MAX_NAMESPACES);
 
@@ -6517,7 +6551,7 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
     ns->attached++;
 
     n->dmrsl = MIN_NON_ZERO(n->dmrsl,
-                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(nvm, 1));
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index cd0cea2b5ebd..26c7412eb523 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -16,10 +16,10 @@
 #include "dif.h"
 #include "trace.h"
 
-uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
-                           uint32_t reftag)
+uint16_t nvme_check_prinfo(NvmeNamespaceNvm *nvm, uint8_t prinfo,
+                           uint64_t slba, uint32_t reftag)
 {
-    if ((NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) == NVME_ID_NS_DPS_TYPE_1) &&
+    if ((NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps) == NVME_ID_NS_DPS_TYPE_1) &&
         (prinfo & NVME_PRINFO_PRCHK_REF) && (slba & 0xffffffff) != reftag) {
         return NVME_INVALID_PROT_INFO | NVME_DNR;
     }
@@ -40,23 +40,23 @@ static uint16_t crc_t10dif(uint16_t crc, const unsigned char *buffer,
     return crc;
 }
 
-void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                                 uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t *reftag)
+void nvme_dif_pract_generate_dif(NvmeNamespaceNvm *nvm, uint8_t *buf,
+                                 size_t len, uint8_t *mbuf, size_t mlen,
+                                 uint16_t apptag, uint32_t *reftag)
 {
     uint8_t *end = buf + len;
     int16_t pil = 0;
 
-    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+    if (!(nvm->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = nvm->lbaf.ms - sizeof(NvmeDifTuple);
     }
 
-    trace_pci_nvme_dif_pract_generate_dif(len, ns->lbasz, ns->lbasz + pil,
+    trace_pci_nvme_dif_pract_generate_dif(len, nvm->lbasz, nvm->lbasz + pil,
                                           apptag, *reftag);
 
-    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
+    for (; buf < end; buf += nvm->lbasz, mbuf += nvm->lbaf.ms) {
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
-        uint16_t crc = crc_t10dif(0x0, buf, ns->lbasz);
+        uint16_t crc = crc_t10dif(0x0, buf, nvm->lbasz);
 
         if (pil) {
             crc = crc_t10dif(crc, mbuf, pil);
@@ -66,18 +66,18 @@ void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
         dif->apptag = cpu_to_be16(apptag);
         dif->reftag = cpu_to_be32(*reftag);
 
-        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+        if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
             (*reftag)++;
         }
     }
 }
 
-static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
+static uint16_t nvme_dif_prchk(NvmeNamespaceNvm *nvm, NvmeDifTuple *dif,
                                uint8_t *buf, uint8_t *mbuf, size_t pil,
                                uint8_t prinfo, uint16_t apptag,
                                uint16_t appmask, uint32_t reftag)
 {
-    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    switch (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
     case NVME_ID_NS_DPS_TYPE_3:
         if (be32_to_cpu(dif->reftag) != 0xffffffff) {
             break;
@@ -97,7 +97,7 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
     }
 
     if (prinfo & NVME_PRINFO_PRCHK_GUARD) {
-        uint16_t crc = crc_t10dif(0x0, buf, ns->lbasz);
+        uint16_t crc = crc_t10dif(0x0, buf, nvm->lbasz);
 
         if (pil) {
             crc = crc_t10dif(crc, mbuf, pil);
@@ -130,7 +130,7 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
     return NVME_SUCCESS;
 }
 
-uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
+uint16_t nvme_dif_check(NvmeNamespaceNvm *nvm, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
                         uint16_t appmask, uint32_t *reftag)
@@ -139,27 +139,27 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
     int16_t pil = 0;
     uint16_t status;
 
-    status = nvme_check_prinfo(ns, prinfo, slba, *reftag);
+    status = nvme_check_prinfo(nvm, prinfo, slba, *reftag);
     if (status) {
         return status;
     }
 
-    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+    if (!(nvm->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = nvm->lbaf.ms - sizeof(NvmeDifTuple);
     }
 
-    trace_pci_nvme_dif_check(prinfo, ns->lbasz + pil);
+    trace_pci_nvme_dif_check(prinfo, nvm->lbasz + pil);
 
-    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
+    for (; buf < end; buf += nvm->lbasz, mbuf += nvm->lbaf.ms) {
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
 
-        status = nvme_dif_prchk(ns, dif, buf, mbuf, pil, prinfo, apptag,
+        status = nvme_dif_prchk(nvm, dif, buf, mbuf, pil, prinfo, apptag,
                                 appmask, *reftag);
         if (status) {
             return status;
         }
 
-        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+        if (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
             (*reftag)++;
         }
     }
@@ -170,21 +170,22 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
 uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
                                uint64_t slba)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockBackend *blk = ns->blkconf.blk;
     BlockDriverState *bs = blk_bs(blk);
 
-    int64_t moffset = 0, offset = nvme_l2b(ns, slba);
+    int64_t moffset = 0, offset = nvme_l2b(nvm, slba);
     uint8_t *mbufp, *end;
     bool zeroed;
     int16_t pil = 0;
-    int64_t bytes = (mlen / ns->lbaf.ms) << ns->lbaf.ds;
+    int64_t bytes = (mlen / nvm->lbaf.ms) << nvm->lbaf.ds;
     int64_t pnum = 0;
 
     Error *err = NULL;
 
 
-    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+    if (!(nvm->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = nvm->lbaf.ms - sizeof(NvmeDifTuple);
     }
 
     do {
@@ -206,15 +207,15 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
 
         if (zeroed) {
             mbufp = mbuf + moffset;
-            mlen = (pnum >> ns->lbaf.ds) * ns->lbaf.ms;
+            mlen = (pnum >> nvm->lbaf.ds) * nvm->lbaf.ms;
             end = mbufp + mlen;
 
-            for (; mbufp < end; mbufp += ns->lbaf.ms) {
+            for (; mbufp < end; mbufp += nvm->lbaf.ms) {
                 memset(mbufp + pil, 0xff, sizeof(NvmeDifTuple));
             }
         }
 
-        moffset += (pnum >> ns->lbaf.ds) * ns->lbaf.ms;
+        moffset += (pnum >> nvm->lbaf.ds) * nvm->lbaf.ms;
         offset += pnum;
     } while (pnum != bytes);
 
@@ -246,6 +247,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
     NvmeBounceContext *ctx = opaque;
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCtrl *n = nvme_ctrl(req);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
@@ -269,7 +271,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
         goto out;
     }
 
-    status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
+    status = nvme_dif_check(nvm, ctx->data.bounce, ctx->data.iov.size,
                             ctx->mdata.bounce, ctx->mdata.iov.size, prinfo,
                             slba, apptag, appmask, &reftag);
     if (status) {
@@ -284,7 +286,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (prinfo & NVME_PRINFO_PRACT && ns->lbaf.ms == 8) {
+    if (prinfo & NVME_PRINFO_PRACT && nvm->lbaf.ms == 8) {
         goto out;
     }
 
@@ -303,11 +305,12 @@ static void nvme_dif_rw_mdata_in_cb(void *opaque, int ret)
     NvmeBounceContext *ctx = opaque;
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
-    size_t mlen = nvme_m2b(ns, nlb);
-    uint64_t offset = nvme_moff(ns, slba);
+    size_t mlen = nvme_m2b(nvm, nlb);
+    uint64_t offset = nvme_moff(nvm, slba);
     BlockBackend *blk = ns->blkconf.blk;
 
     trace_pci_nvme_dif_rw_mdata_in_cb(nvme_cid(req), blk_name(blk));
@@ -334,9 +337,10 @@ static void nvme_dif_rw_mdata_out_cb(void *opaque, int ret)
     NvmeBounceContext *ctx = opaque;
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
-    uint64_t offset = nvme_moff(ns, slba);
+    uint64_t offset = nvme_moff(nvm, slba);
     BlockBackend *blk = ns->blkconf.blk;
 
     trace_pci_nvme_dif_rw_mdata_out_cb(nvme_cid(req), blk_name(blk));
@@ -357,14 +361,15 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockBackend *blk = ns->blkconf.blk;
     bool wrz = rw->opcode == NVME_CMD_WRITE_ZEROES;
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
-    size_t len = nvme_l2b(ns, nlb);
-    size_t mlen = nvme_m2b(ns, nlb);
+    size_t len = nvme_l2b(nvm, nlb);
+    size_t mlen = nvme_m2b(nvm, nlb);
     size_t mapped_len = len;
-    int64_t offset = nvme_l2b(ns, slba);
+    int64_t offset = nvme_l2b(nvm, slba);
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
@@ -388,9 +393,9 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
 
         if (pract) {
             uint8_t *mbuf, *end;
-            int16_t pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
+            int16_t pil = nvm->lbaf.ms - sizeof(NvmeDifTuple);
 
-            status = nvme_check_prinfo(ns, prinfo, slba, reftag);
+            status = nvme_check_prinfo(nvm, prinfo, slba, reftag);
             if (status) {
                 goto err;
             }
@@ -405,17 +410,17 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
             mbuf = ctx->mdata.bounce;
             end = mbuf + mlen;
 
-            if (ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT) {
+            if (nvm->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT) {
                 pil = 0;
             }
 
-            for (; mbuf < end; mbuf += ns->lbaf.ms) {
+            for (; mbuf < end; mbuf += nvm->lbaf.ms) {
                 NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
 
                 dif->apptag = cpu_to_be16(apptag);
                 dif->reftag = cpu_to_be32(reftag);
 
-                switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+                switch (NVME_ID_NS_DPS_TYPE(nvm->id_ns.dps)) {
                 case NVME_ID_NS_DPS_TYPE_1:
                 case NVME_ID_NS_DPS_TYPE_2:
                     reftag++;
@@ -428,7 +433,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
         return NVME_NO_COMPLETE;
     }
 
-    if (nvme_ns_ext(ns) && !(pract && ns->lbaf.ms == 8)) {
+    if (nvme_ns_ext(nvm) && !(pract && nvm->lbaf.ms == 8)) {
         mapped_len += mlen;
     }
 
@@ -462,7 +467,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     qemu_iovec_init(&ctx->mdata.iov, 1);
     qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
 
-    if (!(pract && ns->lbaf.ms == 8)) {
+    if (!(pract && nvm->lbaf.ms == 8)) {
         status = nvme_bounce_mdata(n, ctx->mdata.bounce, ctx->mdata.iov.size,
                                    NVME_TX_DIRECTION_TO_DEVICE, req);
         if (status) {
@@ -470,18 +475,18 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_check_prinfo(ns, prinfo, slba, reftag);
+    status = nvme_check_prinfo(nvm, prinfo, slba, reftag);
     if (status) {
         goto err;
     }
 
     if (pract) {
         /* splice generated protection information into the buffer */
-        nvme_dif_pract_generate_dif(ns, ctx->data.bounce, ctx->data.iov.size,
+        nvme_dif_pract_generate_dif(nvm, ctx->data.bounce, ctx->data.iov.size,
                                     ctx->mdata.bounce, ctx->mdata.iov.size,
                                     apptag, &reftag);
     } else {
-        status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
+        status = nvme_dif_check(nvm, ctx->data.bounce, ctx->data.iov.size,
                                 ctx->mdata.bounce, ctx->mdata.iov.size, prinfo,
                                 slba, apptag, appmask, &reftag);
         if (status) {
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index e36fea30e71e..7d47299252ae 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -37,14 +37,14 @@ static const uint16_t t10_dif_crc_table[256] = {
     0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
 };
 
-uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
-                           uint32_t reftag);
+uint16_t nvme_check_prinfo(NvmeNamespaceNvm *nvm, uint8_t prinfo,
+                           uint64_t slba, uint32_t reftag);
 uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
                                uint64_t slba);
-void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                                 uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t *reftag);
-uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
+void nvme_dif_pract_generate_dif(NvmeNamespaceNvm *nvm, uint8_t *buf,
+                                 size_t len, uint8_t *mbuf, size_t mlen,
+                                 uint16_t apptag, uint32_t *reftag);
+uint16_t nvme_dif_check(NvmeNamespaceNvm *nvm, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
                         uint16_t appmask, uint32_t *reftag);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 419e501239da..0e231102c475 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -28,14 +28,15 @@
 
 void nvme_ns_init_format(NvmeNamespace *ns)
 {
-    NvmeIdNs *id_ns = &ns->id_ns;
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    NvmeIdNs *id_ns = &nvm->id_ns;
     BlockDriverInfo bdi;
     int npdg, nlbas, ret;
 
-    ns->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
-    ns->lbasz = 1 << ns->lbaf.ds;
+    nvm->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+    nvm->lbasz = 1 << nvm->lbaf.ds;
 
-    nlbas = ns->size / (ns->lbasz + ns->lbaf.ms);
+    nlbas = nvm->size / (nvm->lbasz + nvm->lbaf.ms);
 
     id_ns->nsze = cpu_to_le64(nlbas);
 
@@ -43,13 +44,13 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    ns->moff = (int64_t)nlbas << ns->lbaf.ds;
+    nvm->moff = (int64_t)nlbas << nvm->lbaf.ds;
 
-    npdg = ns->blkconf.discard_granularity / ns->lbasz;
+    npdg = nvm->discard_granularity / nvm->lbasz;
 
     ret = bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi);
-    if (ret >= 0 && bdi.cluster_size > ns->blkconf.discard_granularity) {
-        npdg = bdi.cluster_size / ns->lbasz;
+    if (ret >= 0 && bdi.cluster_size > nvm->discard_granularity) {
+        npdg = bdi.cluster_size / nvm->lbasz;
     }
 
     id_ns->npda = id_ns->npdg = npdg - 1;
@@ -57,8 +58,9 @@ void nvme_ns_init_format(NvmeNamespace *ns)
 
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     static uint64_t ns_count;
-    NvmeIdNs *id_ns = &ns->id_ns;
+    NvmeIdNs *id_ns = &nvm->id_ns;
     uint8_t ds;
     uint16_t ms;
     int i;
@@ -66,7 +68,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ns->csi = NVME_CSI_NVM;
     ns->status = 0x0;
 
-    ns->id_ns.dlfeat = 0x1;
+    nvm->id_ns.dlfeat = 0x1;
 
     /* support DULBE and I/O optimization fields */
     id_ns->nsfeat |= (0x4 | 0x10);
@@ -82,12 +84,12 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     }
 
     /* simple copy */
-    id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
-    id_ns->mcl = cpu_to_le32(ns->params.mcl);
-    id_ns->msrc = ns->params.msrc;
+    id_ns->mssrl = cpu_to_le16(nvm->mssrl);
+    id_ns->mcl = cpu_to_le32(nvm->mcl);
+    id_ns->msrc = nvm->msrc;
     id_ns->eui64 = cpu_to_be64(ns->params.eui64);
 
-    ds = 31 - clz32(ns->blkconf.logical_block_size);
+    ds = 31 - clz32(nvm->lbasz);
     ms = ns->params.ms;
 
     id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
@@ -140,6 +142,7 @@ lbaf_found:
 
 static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     bool read_only;
 
     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
@@ -156,9 +159,14 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
             MAX(ns->blkconf.logical_block_size, MIN_DISCARD_GRANULARITY);
     }
 
-    ns->size = blk_getlength(ns->blkconf.blk);
-    if (ns->size < 0) {
-        error_setg_errno(errp, -ns->size, "could not get blockdev size");
+    nvm->lbasz = ns->blkconf.logical_block_size;
+    nvm->discard_granularity = ns->blkconf.discard_granularity;
+    nvm->lbaf.ds = 31 - clz32(nvm->lbasz);
+    nvm->lbaf.ms = ns->params.ms;
+
+    nvm->size = blk_getlength(ns->blkconf.blk);
+    if (nvm->size < 0) {
+        error_setg_errno(errp, -nvm->size, "could not get blockdev size");
         return -1;
     }
 
@@ -167,6 +175,7 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 
 static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
 
     uint64_t zone_size, zone_cap;
@@ -187,14 +196,14 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
                    "zone size %"PRIu64"B", zone_cap, zone_size);
         return -1;
     }
-    if (zone_size < ns->lbasz) {
+    if (zone_size < nvm->lbasz) {
         error_setg(errp, "zone size %"PRIu64"B too small, "
-                   "must be at least %zuB", zone_size, ns->lbasz);
+                   "must be at least %zuB", zone_size, nvm->lbasz);
         return -1;
     }
-    if (zone_cap < ns->lbasz) {
+    if (zone_cap < nvm->lbasz) {
         error_setg(errp, "zone capacity %"PRIu64"B too small, "
-                   "must be at least %zuB", zone_cap, ns->lbasz);
+                   "must be at least %zuB", zone_cap, nvm->lbasz);
         return -1;
     }
 
@@ -202,9 +211,9 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
      * Save the main zone geometry values to avoid
      * calculating them later again.
      */
-    zoned->zone_size = zone_size / ns->lbasz;
-    zoned->zone_capacity = zone_cap / ns->lbasz;
-    zoned->num_zones = le64_to_cpu(ns->id_ns.nsze) / zoned->zone_size;
+    zoned->zone_size = zone_size / nvm->lbasz;
+    zoned->zone_capacity = zone_cap / nvm->lbasz;
+    zoned->num_zones = le64_to_cpu(nvm->id_ns.nsze) / zoned->zone_size;
 
     /* Do a few more sanity checks of ZNS properties */
     if (!zoned->num_zones) {
@@ -258,6 +267,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespaceZoned *zoned)
 
 static void nvme_ns_zoned_init(NvmeNamespace *ns)
 {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
     NvmeIdNsZoned *id_ns_z = &zoned->id_ns;
     int i;
@@ -273,16 +283,16 @@ static void nvme_ns_zoned_init(NvmeNamespace *ns)
         id_ns_z->ozcs |= NVME_ID_NS_ZONED_OZCS_CROSS_READ;
     }
 
-    for (i = 0; i <= ns->id_ns.nlbaf; i++) {
+    for (i = 0; i <= nvm->id_ns.nlbaf; i++) {
         id_ns_z->lbafe[i].zsze = cpu_to_le64(zoned->zone_size);
         id_ns_z->lbafe[i].zdes =
             zoned->zd_extension_size >> 6; /* Units of 64B */
     }
 
     ns->csi = NVME_CSI_ZONED;
-    ns->id_ns.nsze = cpu_to_le64(zoned->num_zones * zoned->zone_size);
-    ns->id_ns.ncap = ns->id_ns.nsze;
-    ns->id_ns.nuse = ns->id_ns.ncap;
+    nvm->id_ns.nsze = cpu_to_le64(zoned->num_zones * zoned->zone_size);
+    nvm->id_ns.ncap = nvm->id_ns.nsze;
+    nvm->id_ns.nuse = nvm->id_ns.ncap;
 
     /*
      * The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
@@ -291,13 +301,13 @@ static void nvme_ns_zoned_init(NvmeNamespace *ns)
      * we can only support DULBE if the zone size is a multiple of the
      * calculated NPDG.
      */
-    if (zoned->zone_size % (ns->id_ns.npdg + 1)) {
+    if (zoned->zone_size % (nvm->id_ns.npdg + 1)) {
         warn_report("the zone size (%"PRIu64" blocks) is not a multiple of "
                     "the calculated deallocation granularity (%d blocks); "
                     "DULBE support disabled",
-                    zoned->zone_size, ns->id_ns.npdg + 1);
+                    zoned->zone_size, nvm->id_ns.npdg + 1);
 
-        ns->id_ns.nsfeat &= ~0x4;
+        nvm->id_ns.nsfeat &= ~0x4;
     }
 }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 9cfb172101a9..c5e08cf9e1c1 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -147,15 +147,32 @@ typedef struct NvmeNamespaceZoned {
     QTAILQ_HEAD(, NvmeZone) full_zones;
 } NvmeNamespaceZoned;
 
+enum {
+    NVME_NS_NVM_EXTENDED_LBA = 1 << 0,
+    NVME_NS_NVM_PI_FIRST     = 1 << 1,
+};
+
+typedef struct NvmeNamespaceNvm {
+    NvmeIdNs id_ns;
+
+    int64_t size;
+    int64_t moff;
+
+    NvmeLBAF lbaf;
+    size_t   lbasz;
+    uint32_t discard_granularity;
+
+    uint16_t mssrl;
+    uint32_t mcl;
+    uint8_t  msrc;
+
+    unsigned long flags;
+} NvmeNamespaceNvm;
+
 typedef struct NvmeNamespace {
     DeviceState  parent_obj;
     BlockConf    blkconf;
     int32_t      bootindex;
-    int64_t      size;
-    int64_t      moff;
-    NvmeIdNs     id_ns;
-    NvmeLBAF     lbaf;
-    size_t       lbasz;
     const uint32_t *iocs;
     uint8_t      csi;
     uint16_t     status;
@@ -169,9 +186,11 @@ typedef struct NvmeNamespace {
         uint32_t err_rec;
     } features;
 
+    NvmeNamespaceNvm   nvm;
     NvmeNamespaceZoned zoned;
 } NvmeNamespace;
 
+#define NVME_NAMESPACE_NVM(ns) (&(ns)->nvm)
 #define NVME_NAMESPACE_ZONED(ns) (&(ns)->zoned)
 
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
@@ -183,24 +202,24 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
     return 0;
 }
 
-static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
+static inline size_t nvme_l2b(NvmeNamespaceNvm *nvm, uint64_t lba)
 {
-    return lba << ns->lbaf.ds;
+    return lba << nvm->lbaf.ds;
 }
 
-static inline size_t nvme_m2b(NvmeNamespace *ns, uint64_t lba)
+static inline size_t nvme_m2b(NvmeNamespaceNvm *nvm, uint64_t lba)
 {
-    return ns->lbaf.ms * lba;
+    return nvm->lbaf.ms * lba;
 }
 
-static inline int64_t nvme_moff(NvmeNamespace *ns, uint64_t lba)
+static inline int64_t nvme_moff(NvmeNamespaceNvm *nvm, uint64_t lba)
 {
-    return ns->moff + nvme_m2b(ns, lba);
+    return nvm->moff + nvme_m2b(nvm, lba);
 }
 
-static inline bool nvme_ns_ext(NvmeNamespace *ns)
+static inline bool nvme_ns_ext(NvmeNamespaceNvm *nvm)
 {
-    return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
+    return !!NVME_ID_NS_FLBAS_EXTENDED(nvm->id_ns.flbas);
 }
 
 void nvme_ns_init_format(NvmeNamespace *ns);
-- 
2.33.0


