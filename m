Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988040B98F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 23:02:06 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFZ7-000555-2D
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 17:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBy-0005hh-Hu; Tue, 14 Sep 2021 16:38:12 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBp-0004lv-2n; Tue, 14 Sep 2021 16:38:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2318332009DF;
 Tue, 14 Sep 2021 16:37:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 16:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=WSCxnEqoyrAOl
 owEI8fwelvaUOW2W1id0hoo4OaVAwI=; b=oBjrCSR6E9pYE42DYJoVDqJzOor1q
 fndW7SmcSIyS6R4fQSEuFOo8FIhU5ASGUNoUoe27MWjUx2qA4tCECLHCU7uR4EOd
 sEmnclGSHlcDTNyGqm4DOmNSvH+BhnHqNdCs3Ck4RgDmccs1g3GBW5KIDZvMh7tQ
 p+CzR8iZ707aTNcgTRM0KNOoCIT7XkKiOl6iZ/3Fim927ebBAzpfcTmhAK/HzXlJ
 lLDX0xAiT38XPDVB/uVdei8NJUHCuD97/gN5mzV8BXfxIpirfq4061EooQQGZg6X
 c8AqgtEWi5gwvTgtT6sMn0/ywyIuNcwH8k6K9gwvLkILSZEr7Uj3i5Edw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WSCxnEqoyrAOlowEI8fwelvaUOW2W1id0hoo4OaVAwI=; b=DlknY56y
 V/hRh9J3Jq7TRLgCjQBTBc3L3MV6JaucYfBUZ8gtIoBQUZ8jSOuO4Ngkvq+bmx+z
 5Z+PKww1sgrGwpEgK0PdvZbNaG80EbIdsL5FuDPl0xwKZquIeLRmqcm1lrMbRSf1
 1a6jogocOzfCZqoGq1/ayhU4y3UbPdWVrk/5pykQxGx26GhCCLwLMprHDYeg8ue/
 2Ojxj2BnkF7FGv6fzkivfLFcCNTTxWrsivdiAm2PuhsC4lVz/IKJXgLE/tEweCZB
 DTVBUKATuWp7hPoed9aXHYbSCVaJX38yGoP+oMwQK1A0ABHDp7W79tX3umARvbHb
 Zp17ct8LAF8yJQ==
X-ME-Sender: <xms:JghBYcKdwFxrAYnSLvDWoAxw59BxteZCVmO6o_W8nSx1XEpudCJiEw>
 <xme:JghBYcKTjX5itJwvfIsmw4h2vOoadEZT8_JdvKJm5NK0v_pQQe2AeOeVuuSgcxiUD
 rRN7dNsX0chwjt29ds>
X-ME-Received: <xmr:JghBYcuNQH_zgkDjJgyFYNVEs0HtPkrKWDz__1h409Q4jjaH1G_Zr4QIKqYpga98Nkx0dKdykRMu3Gm4byB5hHOqIAy4dv7kXqxttA_8gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JghBYZYt6DNcOFSKBQMUQjcT-8y-_dt1pd1GPraMOeVHG2hCauAB7A>
 <xmx:JghBYTbxWwm1PkRjGIUsvH-j54tr8tH4Vgt5U4djW8kwuhSEJEorBg>
 <xmx:JghBYVDUikns6zGGpE_epZTGORQBzlGqUnP89bUccEHCfEzd1QkB7w>
 <xmx:JghBYRN_KmiD5w3K8KcOoh0U2Q-00ybSWTssTBj_TW4wEmttaVMRFA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:37:57 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 05/13] hw/nvme: move BlockBackend to NvmeNamespaceNvm
Date: Tue, 14 Sep 2021 22:37:29 +0200
Message-Id: <20210914203737.182571-6-its@irrelevant.dk>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 hw/nvme/ctrl.c | 66 +++++++++++++++++++++++++-------------------------
 hw/nvme/dif.c  | 14 +++++------
 hw/nvme/nvme.h |  6 +++++
 3 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 7f41181aafa1..f05d85075f08 100644
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
@@ -4072,7 +4072,7 @@ struct nvme_stats {
 
 static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
 {
-    BlockAcctStats *s = blk_get_stats(ns->blkconf.blk);
+    BlockAcctStats *s = blk_get_stats(nvme_blk(ns));
 
     stats->units_read += s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
     stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
@@ -4938,7 +4938,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
                 continue;
             }
 
-            result = blk_enable_write_cache(ns->blkconf.blk);
+            result = blk_enable_write_cache(nvme_blk(ns));
             if (result) {
                 break;
             }
@@ -5110,11 +5110,11 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
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
@@ -5364,7 +5364,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
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


