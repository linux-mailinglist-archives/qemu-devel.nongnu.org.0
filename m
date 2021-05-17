Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4631C38291D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:59:10 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lia1k-0005Gd-Pz
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOW-0003mA-KH; Mon, 17 May 2021 05:18:36 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOS-000601-Hx; Mon, 17 May 2021 05:18:36 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DA2515C00E1;
 Mon, 17 May 2021 05:18:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=KoEThqcP7Z8Qw
 U5iQVPgxM4jpuELOiZ8+q85/wTcuVk=; b=gVlDVniENB475vDA1qsBpGRYVvg9X
 sw7ezuNNLBuCHTCtF0ixhZpTrk8/1qR/EI/QidzOLeHakCDSdtiadN+ed8P+j/Gt
 a4rKI/7JJSu15/0By1oMmrCtPcDM5lX1sPhJshhovmhj84Ud5YIXOtK6jViu4lQK
 IkPPk5qBUaCDmgsrsqyZ97BPLyv1Dn3fWUy9PYDxF20A3NphymURySZ/qfqruGJJ
 njl3ChGnHU7Q4tFxQ7MVb+2M8SkifMW6iDJvqb1WAMyqmLsdWDEV6enZINf6Bhux
 na+FsCfgpasUR685khwkG3WuildvrWYM2d/NXkzmUqpLMetg9lHPivKvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=KoEThqcP7Z8QwU5iQVPgxM4jpuELOiZ8+q85/wTcuVk=; b=PFlkSA0O
 U8iUu5VM4kobSK2jc6wIFA13fcDIFm1JxzGhNuMAI3XQWZZeJJqNevoky+yMx5Nq
 E8hBG96hYO2DdKaC4lX2Cbkvm8qQB+z5rxoaVN38SVphny0N3TPiOSvrR896ExCR
 t+UkbbyPWJJGfFApcXbytm3SdrFhxqEialLnJC0Egtia9YXP6MigdjBlnH5eJRJr
 +R7tplO5TkPLnTto8ps+LtR8dp3fwHP6KBVT+/x7gnl6dXoWQ9LpzBqm1R5s6rQL
 NBESnr+wTwa+c9cvF04fCseNgQrpUYEH6YJ33dw3FwjShrvl/CUVumy17cdmEf1f
 S+Oy/qmrA1k7aQ==
X-ME-Sender: <xms:5TSiYA4JgAG0DO2HzZMejZmY_k3lsjR3X-mKDbGoke3UuU7XX_1GnA>
 <xme:5TSiYB6LhHDtQsE0v-PuxizTifdr7EnLyqj8Zr1b-B6KGR3y--MvCzzJ7mxhskU3t
 EQk9Y_LXbT-WYHQYOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5TSiYPeHdDgQIITOayoS9zOT5Pt39kVq-2Rd3wle_6o2Glsa0iwZwA>
 <xmx:5TSiYFI6XYo3QaeUi4IdsjMwfE9uM4hQ9ruVvDUwVndBjCLN-TUlqQ>
 <xmx:5TSiYEJF88fO_0DgdRqHcbh6g0ZUJiFU9qL11KdhxpWfV2ZbO6wK0A>
 <xmx:5jSiYNoYv9aSBWZZscNbR_oXHq_-AC1Xoume1fkvPOzklBKmfulSZg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:28 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 15/20] hw/block/nvme: add metadata offset helper
Date: Mon, 17 May 2021 11:17:32 +0200
Message-Id: <20210517091737.841787-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add an nvme_moff() helper.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h     |  7 ++++++-
 hw/block/nvme-dif.c |  4 ++--
 hw/block/nvme-ns.c  |  2 +-
 hw/block/nvme.c     | 12 ++++++------
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index dc065e57b509..9349d1c33ad7 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -107,7 +107,7 @@ typedef struct NvmeNamespace {
     BlockConf    blkconf;
     int32_t      bootindex;
     int64_t      size;
-    int64_t      mdata_offset;
+    int64_t      moff;
     NvmeIdNs     id_ns;
     NvmeLBAF     lbaf;
     size_t       lbasz;
@@ -158,6 +158,11 @@ static inline size_t nvme_m2b(NvmeNamespace *ns, uint64_t lba)
     return ns->lbaf.ms * lba;
 }
 
+static inline int64_t nvme_moff(NvmeNamespace *ns, uint64_t lba)
+{
+    return ns->moff + nvme_m2b(ns, lba);
+}
+
 static inline bool nvme_ns_ext(NvmeNamespace *ns)
 {
     return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index c72e43195abf..88efcbe9bd60 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -306,7 +306,7 @@ static void nvme_dif_rw_mdata_in_cb(void *opaque, int ret)
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t mlen = nvme_m2b(ns, nlb);
-    uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+    uint64_t offset = nvme_moff(ns, slba);
     BlockBackend *blk = ns->blkconf.blk;
 
     trace_pci_nvme_dif_rw_mdata_in_cb(nvme_cid(req), blk_name(blk));
@@ -335,7 +335,7 @@ static void nvme_dif_rw_mdata_out_cb(void *opaque, int ret)
     NvmeNamespace *ns = req->ns;
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
-    uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+    uint64_t offset = nvme_moff(ns, slba);
     BlockBackend *blk = ns->blkconf.blk;
 
     trace_pci_nvme_dif_rw_mdata_out_cb(nvme_cid(req), blk_name(blk));
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index b9369460b965..b25838ac4fd4 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -42,7 +42,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    ns->mdata_offset = (int64_t)nlbas << ns->lbaf.ds;
+    ns->moff = (int64_t)nlbas << ns->lbaf.ds;
 
     npdg = ns->blkconf.discard_granularity / ns->lbasz;
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9153d5d91363..1db9a603f5c4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1839,7 +1839,7 @@ static void nvme_rw_cb(void *opaque, int ret)
         NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
-        uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+        uint64_t offset = nvme_moff(ns, slba);
 
         if (req->cmd.opcode == NVME_CMD_WRITE_ZEROES) {
             size_t mlen = nvme_m2b(ns, nlb);
@@ -2005,7 +2005,7 @@ static void nvme_verify_mdata_in_cb(void *opaque, int ret)
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t mlen = nvme_m2b(ns, nlb);
-    uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+    uint64_t offset = nvme_moff(ns, slba);
     BlockBackend *blk = ns->blkconf.blk;
 
     trace_pci_nvme_verify_mdata_in_cb(nvme_cid(req), blk_name(blk));
@@ -2108,7 +2108,7 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
     }
 
     if (ns->lbaf.ms) {
-        int64_t offset = ns->mdata_offset + nvme_m2b(ns, zone->d.zslba);
+        int64_t offset = nvme_moff(ns, zone->d.zslba);
 
         blk_aio_pwrite_zeroes(ns->blkconf.blk, offset,
                               nvme_m2b(ns, ns->zone_size), BDRV_REQ_MAY_UNMAP,
@@ -2179,7 +2179,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     if (ns->lbaf.ms) {
         NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
         uint64_t sdlba = le64_to_cpu(copy->sdlba);
-        int64_t offset = ns->mdata_offset + nvme_m2b(ns, sdlba);
+        int64_t offset = nvme_moff(ns, sdlba);
 
         qemu_iovec_reset(&req->sg.iov);
         qemu_iovec_add(&req->sg.iov, ctx->mbounce, nvme_m2b(ns, ctx->nlb));
@@ -2485,7 +2485,7 @@ static void nvme_compare_data_cb(void *opaque, int ret)
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
         size_t mlen = nvme_m2b(ns, nlb);
-        uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+        uint64_t offset = nvme_moff(ns, slba);
 
         ctx->mdata.bounce = g_malloc(mlen);
 
@@ -2762,7 +2762,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
         if (ns->lbaf.ms) {
             len = nvme_m2b(ns, nlb);
-            offset = ns->mdata_offset + nvme_m2b(ns, slba);
+            offset = nvme_moff(ns, slba);
 
             in_ctx = g_new(struct nvme_copy_in_ctx, 1);
             in_ctx->req = req;
-- 
2.31.1


