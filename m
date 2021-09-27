Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705BA418EAE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:33:27 +0200 (CEST)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjGY-0006Cx-D1
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2F-00038r-FV; Mon, 27 Sep 2021 01:18:39 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:50781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj2B-0000Az-Ve; Mon, 27 Sep 2021 01:18:39 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 714AC2B0120B;
 Mon, 27 Sep 2021 01:18:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 27 Sep 2021 01:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TY2HX/At9ES/Y
 Rcp44HLh/CPfHci73ZM/lQlQhq7/Fo=; b=g2f0VmxSGhI9w5yofmtMelsZ4ctxz
 hP5qhTVbEVwFrC9m6DVmsETZOTTpwYP5ueQuYkYXn3dD5bKj8A5VgqJ+ZhvkNUFE
 Y9hcgzizAJnxNIfGqICpvHe9ymvA1wsV+nq8l6CxrVCV853VBbyxRPcx/wdbJ0hw
 sfHa6eazmxSad7TltrcwXvjZBhTDLyu7p3c/oAy3/kf7CqSCJuO1irKvnMr5KXHj
 3EJEnEVQxTvyFzOjeZtTEqbk3A0ZNJuKExMHkKyEcwC1BPqXxaDeOEr0RakrRRZP
 hB0mVm7sWQBzQamriFyfGOvI6m13jPA4U4Lh0ZmAfHlW8Chp3R4UZYk1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=TY2HX/At9ES/YRcp44HLh/CPfHci73ZM/lQlQhq7/Fo=; b=Z+1/TF3k
 N/A8B1w/DTsbPdzUWsPdpxhSrKj4ElYQ5/aYDUqiR1MWhAO2BqBlfRw5/G+m+M+k
 Ato6WROr3eG+/eDS1Aw1nqoLKrhDBmBty6teROqlD91WZuUIX8lRDLinlq8TUlrn
 /+HkF1O+fLZctSH+H8FSDN+43ooZZdobtkNKoogDL4CvmUyN2nmyfbASBASNXP9D
 OpZHNeSjPY5wXvO9o/uGqXxUD3FpPkvhCGZiqdDhyENJEEDTGxdlub/Rky/hq7u5
 ITIbkdNP5ubyT9PEyMAVsCgnFvPK9hKPfc3kJLMb64d7k5RIco4QsPz/AvuZ8Y1C
 88p+XUigDPQ3sQ==
X-ME-Sender: <xms:KFRRYZpPf4WP-YE4gocjjeZ0oo8E2Z6kxDhEwBHWOL2hNKPQeJXZIw>
 <xme:KFRRYbpcp25ysZxdPFpStrh2rjAcHDfpXitZq6SsDykyUKN00okr_6B_Fk1tvAYE6
 PF-uRYldIIHXVFjVUU>
X-ME-Received: <xmr:KFRRYWPvaTl3VbTEW5Kda94HAji7-NCz1KABHFLxbWkSDblIByyYP47FKLt1jq0it7TahpauIuMG12tQEVjwHsqh5oZWSSBv8kTG1PIkrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:KFRRYU5LVW14C5mUJsPQYeVilT4dtWeW-kyp_7nFpRh_QtS7_cflsQ>
 <xmx:KFRRYY7oJHvg0_g6MCjSaUgjm7_5A_DKNax5wn2cpXNwJVAN1G_W3A>
 <xmx:KFRRYcg0dZ8GmIVrQuSIiMCv_6zR8scqIf8Eo6tOpt8BG6lgCRw6kg>
 <xmx:KVRRYToOZxeZfNb6TsnIDz8HgJlNn3MW3uVU0CJ_9MLLF4rsV5BOEhlVvFU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:30 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 07/16] hw/nvme: move BlockBackend to NvmeNamespaceNvm
Date: Mon, 27 Sep 2021 07:17:50 +0200
Message-Id: <20210927051759.447305-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927051759.447305-1-its@irrelevant.dk>
References: <20210927051759.447305-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 66 +++++++++++++++++++++++++-------------------------
 hw/nvme/dif.c  | 14 +++++------
 hw/nvme/nvme.h |  6 +++++
 3 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 026dfaa71bda..3e561a13f76f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1465,7 +1465,7 @@ static int nvme_block_status_all(NvmeNamespace *ns, uint64_t slba,
                                  uint32_t nlb, int flags)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    BlockDriverState *bs = blk_bs(ns->blkconf.blk);
+    BlockDriverState *bs = blk_bs(nvme_blk(ns));
 
     int64_t pnum = 0, bytes = nvme_l2b(nvm, nlb);
     int64_t offset = nvme_l2b(nvm, slba);
@@ -1865,7 +1865,7 @@ void nvme_rw_complete_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
 
@@ -1891,7 +1891,7 @@ static void nvme_rw_cb(void *opaque, int ret)
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
 
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
 
     trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
 
@@ -1942,7 +1942,7 @@ static void nvme_verify_cb(void *opaque, int ret)
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -2000,7 +2000,7 @@ static void nvme_verify_mdata_in_cb(void *opaque, int ret)
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t mlen = nvme_m2b(nvm, nlb);
     uint64_t offset = nvme_moff(nvm, slba);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
 
     trace_pci_nvme_verify_mdata_in_cb(nvme_cid(req), blk_name(blk));
 
@@ -2046,7 +2046,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     uint32_t reftag = le32_to_cpu(rw->reftag);
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
     uint16_t status = NVME_SUCCESS;
@@ -2126,7 +2126,7 @@ static void nvme_compare_data_cb(void *opaque, int ret)
     NvmeCtrl *n = nvme_ctrl(req);
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
 
@@ -2272,7 +2272,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
         nvme_dsm_cb(iocb, 0);
     }
 
-    iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(nvm, slba),
+    iocb->aiocb = blk_aio_pwrite_zeroes(nvme_blk(ns), nvme_moff(nvm, slba),
                                         nvme_m2b(nvm, nlb), BDRV_REQ_MAY_UNMAP,
                                         nvme_dsm_cb, iocb);
     return;
@@ -2320,7 +2320,7 @@ next:
         goto next;
     }
 
-    iocb->aiocb = blk_aio_pdiscard(ns->blkconf.blk, nvme_l2b(nvm, slba),
+    iocb->aiocb = blk_aio_pdiscard(nvme_blk(ns), nvme_l2b(nvm, slba),
                                    nvme_l2b(nvm, nlb),
                                    nvme_dsm_md_cb, iocb);
     return;
@@ -2341,7 +2341,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_dsm(nr, attr);
 
     if (attr & NVME_DSMGMT_AD) {
-        NvmeDSMAIOCB *iocb = blk_aio_get(&nvme_dsm_aiocb_info, ns->blkconf.blk,
+        NvmeDSMAIOCB *iocb = blk_aio_get(&nvme_dsm_aiocb_info, nvme_blk(ns),
                                          nvme_misc_cb, req);
 
         iocb->req = req;
@@ -2371,7 +2371,7 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t len = nvme_l2b(nvm, nlb);
@@ -2421,7 +2421,7 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
     block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
                      BLOCK_ACCT_READ);
 
-    req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+    req->aiocb = blk_aio_preadv(nvme_blk(ns), offset, &ctx->data.iov, 0,
                                 nvme_verify_mdata_in_cb, ctx);
     return NVME_NO_COMPLETE;
 }
@@ -2472,7 +2472,7 @@ static void nvme_copy_bh(void *opaque)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
-    BlockAcctStats *stats = blk_get_stats(ns->blkconf.blk);
+    BlockAcctStats *stats = blk_get_stats(nvme_blk(ns));
 
     if (iocb->idx != iocb->nr) {
         req->cqe.result = cpu_to_le32(iocb->idx);
@@ -2555,7 +2555,7 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, mbounce, mlen);
 
-    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_moff(nvm, iocb->slba),
+    iocb->aiocb = blk_aio_pwritev(nvme_blk(ns), nvme_moff(nvm, iocb->slba),
                                   &iocb->iov, 0, nvme_copy_out_completed_cb,
                                   iocb);
 
@@ -2647,7 +2647,7 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, iocb->bounce, len);
 
-    iocb->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(nvm, iocb->slba),
+    iocb->aiocb = blk_aio_pwritev(nvme_blk(ns), nvme_l2b(nvm, iocb->slba),
                                   &iocb->iov, 0, nvme_copy_out_cb, iocb);
 
     return;
@@ -2695,7 +2695,7 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     qemu_iovec_add(&iocb->iov, iocb->bounce + nvme_l2b(nvm, nlb),
                    nvme_m2b(nvm, nlb));
 
-    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_moff(nvm, slba),
+    iocb->aiocb = blk_aio_preadv(nvme_blk(ns), nvme_moff(nvm, slba),
                                  &iocb->iov, 0, nvme_copy_in_completed_cb,
                                  iocb);
     return;
@@ -2761,7 +2761,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, iocb->bounce, len);
 
-    iocb->aiocb = blk_aio_preadv(ns->blkconf.blk, nvme_l2b(nvm, slba),
+    iocb->aiocb = blk_aio_preadv(nvme_blk(ns), nvme_l2b(nvm, slba),
                                  &iocb->iov, 0, nvme_copy_in_cb, iocb);
     return;
 
@@ -2780,7 +2780,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-    NvmeCopyAIOCB *iocb = blk_aio_get(&nvme_copy_aiocb_info, ns->blkconf.blk,
+    NvmeCopyAIOCB *iocb = blk_aio_get(&nvme_copy_aiocb_info, nvme_blk(ns),
                                       nvme_misc_cb, req);
     uint16_t nr = copy->nr + 1;
     uint8_t format = copy->control[0] & 0xf;
@@ -2847,9 +2847,9 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     qemu_iovec_init(&iocb->iov, 1);
 
-    block_acct_start(blk_get_stats(ns->blkconf.blk), &iocb->acct.read, 0,
+    block_acct_start(blk_get_stats(nvme_blk(ns)), &iocb->acct.read, 0,
                      BLOCK_ACCT_READ);
-    block_acct_start(blk_get_stats(ns->blkconf.blk), &iocb->acct.write, 0,
+    block_acct_start(blk_get_stats(nvme_blk(ns)), &iocb->acct.write, 0,
                      BLOCK_ACCT_WRITE);
 
     req->aiocb = &iocb->common;
@@ -2868,7 +2868,7 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
@@ -2971,7 +2971,7 @@ static void nvme_flush_ns_cb(void *opaque, int ret)
         trace_pci_nvme_flush_ns(iocb->nsid);
 
         iocb->ns = NULL;
-        iocb->aiocb = blk_aio_flush(ns->blkconf.blk, nvme_flush_ns_cb, iocb);
+        iocb->aiocb = blk_aio_flush(nvme_blk(ns), nvme_flush_ns_cb, iocb);
         return;
     }
 
@@ -3073,7 +3073,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
     uint64_t data_size = nvme_l2b(nvm, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     uint16_t status;
 
     if (nvme_ns_ext(nvm)) {
@@ -3151,7 +3151,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     uint64_t data_offset;
     NvmeZone *zone;
     NvmeZonedResult *res = (NvmeZonedResult *)&req->cqe;
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     uint16_t status;
 
     if (nvme_ns_ext(nvm)) {
@@ -3542,7 +3542,7 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
     moff = nvme_moff(nvm, iocb->zone->d.zslba);
     count = nvme_m2b(nvm, zoned->zone_size);
 
-    iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, moff, count,
+    iocb->aiocb = blk_aio_pwrite_zeroes(nvme_blk(ns), moff, count,
                                         BDRV_REQ_MAY_UNMAP,
                                         nvme_zone_reset_cb, iocb);
     return;
@@ -3593,7 +3593,7 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
 
         trace_pci_nvme_zns_zone_reset(zone->d.zslba);
 
-        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk,
+        iocb->aiocb = blk_aio_pwrite_zeroes(nvme_blk(ns),
                                             nvme_l2b(nvm, zone->d.zslba),
                                             nvme_l2b(nvm, zoned->zone_size),
                                             BDRV_REQ_MAY_UNMAP,
@@ -3673,7 +3673,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ZONE_ACTION_RESET:
         trace_pci_nvme_reset_zone(slba, zone_idx, all);
 
-        iocb = blk_aio_get(&nvme_zone_reset_aiocb_info, ns->blkconf.blk,
+        iocb = blk_aio_get(&nvme_zone_reset_aiocb_info, nvme_blk(ns),
                            nvme_misc_cb, req);
 
         iocb->req = req;
@@ -4076,7 +4076,7 @@ struct nvme_stats {
 
 static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
 {
-    BlockAcctStats *s = blk_get_stats(ns->blkconf.blk);
+    BlockAcctStats *s = blk_get_stats(nvme_blk(ns));
 
     stats->units_read += s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
     stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
@@ -4942,7 +4942,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
                 continue;
             }
 
-            result = blk_enable_write_cache(ns->blkconf.blk);
+            result = blk_enable_write_cache(nvme_blk(ns));
             if (result) {
                 break;
             }
@@ -5114,11 +5114,11 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
                 continue;
             }
 
-            if (!(dw11 & 0x1) && blk_enable_write_cache(ns->blkconf.blk)) {
-                blk_flush(ns->blkconf.blk);
+            if (!(dw11 & 0x1) && blk_enable_write_cache(nvme_blk(ns))) {
+                blk_flush(nvme_blk(ns));
             }
 
-            blk_set_enable_write_cache(ns->blkconf.blk, dw11 & 1);
+            blk_set_enable_write_cache(nvme_blk(ns), dw11 & 1);
         }
 
         break;
@@ -5368,7 +5368,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
     if (iocb->offset < nvm->size) {
         bytes = MIN(BDRV_REQUEST_MAX_BYTES, nvm->size - iocb->offset);
 
-        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, iocb->offset,
+        iocb->aiocb = blk_aio_pwrite_zeroes(nvme_blk(ns), iocb->offset,
                                             bytes, BDRV_REQ_MAY_UNMAP,
                                             nvme_format_ns_cb, iocb);
 
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 26c7412eb523..1b8f9ba2fb44 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -171,7 +171,7 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
                                uint64_t slba)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     BlockDriverState *bs = blk_bs(blk);
 
     int64_t moffset = 0, offset = nvme_l2b(nvm, slba);
@@ -227,7 +227,7 @@ static void nvme_dif_rw_cb(void *opaque, int ret)
     NvmeBounceContext *ctx = opaque;
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
 
     trace_pci_nvme_dif_rw_cb(nvme_cid(req), blk_name(blk));
 
@@ -311,7 +311,7 @@ static void nvme_dif_rw_mdata_in_cb(void *opaque, int ret)
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t mlen = nvme_m2b(nvm, nlb);
     uint64_t offset = nvme_moff(nvm, slba);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
 
     trace_pci_nvme_dif_rw_mdata_in_cb(nvme_cid(req), blk_name(blk));
 
@@ -341,7 +341,7 @@ static void nvme_dif_rw_mdata_out_cb(void *opaque, int ret)
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint64_t offset = nvme_moff(nvm, slba);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
 
     trace_pci_nvme_dif_rw_mdata_out_cb(nvme_cid(req), blk_name(blk));
 
@@ -362,7 +362,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    BlockBackend *blk = ns->blkconf.blk;
+    BlockBackend *blk = nvme_blk(ns);
     bool wrz = rw->opcode == NVME_CMD_WRITE_ZEROES;
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
@@ -451,7 +451,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
         block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
                          BLOCK_ACCT_READ);
 
-        req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+        req->aiocb = blk_aio_preadv(nvme_blk(ns), offset, &ctx->data.iov, 0,
                                     nvme_dif_rw_mdata_in_cb, ctx);
         return NVME_NO_COMPLETE;
     }
@@ -497,7 +497,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
                      BLOCK_ACCT_WRITE);
 
-    req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+    req->aiocb = blk_aio_pwritev(nvme_blk(ns), offset, &ctx->data.iov, 0,
                                  nvme_dif_rw_mdata_out_cb, ctx);
 
     return NVME_NO_COMPLETE;
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index c5e08cf9e1c1..525bfd0ca831 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -155,6 +155,7 @@ enum {
 typedef struct NvmeNamespaceNvm {
     NvmeIdNs id_ns;
 
+    BlockBackend *blk;
     int64_t size;
     int64_t moff;
 
@@ -193,6 +194,11 @@ typedef struct NvmeNamespace {
 #define NVME_NAMESPACE_NVM(ns) (&(ns)->nvm)
 #define NVME_NAMESPACE_ZONED(ns) (&(ns)->zoned)
 
+static inline BlockBackend *nvme_blk(NvmeNamespace *ns)
+{
+    return NVME_NAMESPACE_NVM(ns)->blk;
+}
+
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
     if (ns) {
-- 
2.33.0


