Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99B364B1E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:24:22 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaRR-0006AB-By
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZf-000103-CS; Mon, 19 Apr 2021 15:28:50 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:52227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZb-0005Iv-4q; Mon, 19 Apr 2021 15:28:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F343621DE;
 Mon, 19 Apr 2021 15:28:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Apr 2021 15:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hZjK1ogb4nlNG
 XmoTMVhY++OIYcXh1NOcn/XnQcCRhM=; b=djnB6aWGwZpJrB+Tftc4GKc0h+5NE
 8gq3BZim2NLsLG/BkiK4iWndndf7xmQrkkqRELQVW9BWAvq41fG60Cljdm9KjZXn
 gQ3C5Zb62K8A1b/Yw97/uaqoqtljSsv6IofRtbH2KbhhSlM3EW/UtUWrnyIBiXal
 kwWX7z1f693mrFduWUn+9SK4qmzsF+Jl//PftPQE9YfPLVQljefdyaKvVp2HPsk8
 vOFijdPKOXyiNF64Z5nzAMwBoBNobVIngrbB6CwU870KmVbjaiXcWya2c6UAp8yj
 VYwQXJDDsu4BVPHmSkBwlnrGsTEE1OJHFEMjw00qahXfLRJf6gT3CkAug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hZjK1ogb4nlNGXmoTMVhY++OIYcXh1NOcn/XnQcCRhM=; b=crreZ+rJ
 4rSV+yBIOQPhKhuOWKfOpbJiKiOuRL7cSmm8xMeHyYkbZia9O5v58KdJDbWEM/a5
 oPFbH3Mo/rrPWQmaODgh9PXNWEeDzB1c/tioGQW24ZanglurjBv+X0wP/Nf/W3fK
 KcSBil1feQsRQ5aFsZXD/+bfcr/YT7iIUxx5j5gu5AdirtniWnAO0htjVd/6Pumj
 rHnCjK9RP/GHQHr7BR4QpnMITO0h3sR+gzRrlnTJUb+7D3neFDkmsOl6Z4WWDPDy
 6uuW7bARapAck0RQpM5FlxGwMxqPWe1UlUQEmZCKMwmoe3apnbUSQ0dvPIdx5SUY
 ZaC1sVwIMh9uyA==
X-ME-Sender: <xms:z9l9YAL2eEuA7U0qlKnhrPLUZuOpE-gGPkDNcGeG1DWpmJPUW5Yo3w>
 <xme:z9l9YJjWxCYWMJG7IbEGvhDSYImwK-ptovW3O1mpPAI61gcOdIUOkhrD6YC-jEfz9
 QSml7hflrMDEnnt8o0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:z9l9YJMsu86FeS3Ne4S7sZGkJc9Wh4o2_RPkavrxezBfxXH-6mOU4w>
 <xmx:z9l9YM6Kev2iJEooV5R7lVH0TPyErkuUdNfxh3l9DO5qdyGJyTKfmQ>
 <xmx:z9l9YIkzd3632rXKV1krVGduh70WSE4WCnzi0IsHi-egT9adA8rw6w>
 <xmx:z9l9YCvOgtaW_VVg0OeLr41U4y_iu3y9eGZITFquz3V0979zQ5yb2w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A21AD108005F;
 Mon, 19 Apr 2021 15:28:14 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/14] hw/block/nvme: add metadata offset helper
Date: Mon, 19 Apr 2021 21:27:56 +0200
Message-Id: <20210419192801.62255-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add an nvme_moff() helper.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
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
index 2224b497e4b5..84f602652354 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -42,7 +42,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    ns->mdata_offset = (int64_t)nlbas << ns->lbaf.ds;
+    ns->moff = (int64_t)nlbas << ns->lbaf.ds;
 
     npdg = ns->blkconf.discard_granularity / ns->lbasz;
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index fcc0fe72dc33..b0a6c1457a88 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1827,7 +1827,7 @@ static void nvme_rw_cb(void *opaque, int ret)
         NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
-        uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+        uint64_t offset = nvme_moff(ns, slba);
 
         if (req->cmd.opcode == NVME_CMD_WRITE_ZEROES) {
             size_t mlen = nvme_m2b(ns, nlb);
@@ -1993,7 +1993,7 @@ static void nvme_verify_mdata_in_cb(void *opaque, int ret)
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t mlen = nvme_m2b(ns, nlb);
-    uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+    uint64_t offset = nvme_moff(ns, slba);
     BlockBackend *blk = ns->blkconf.blk;
 
     trace_pci_nvme_verify_mdata_in_cb(nvme_cid(req), blk_name(blk));
@@ -2096,7 +2096,7 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
     }
 
     if (ns->lbaf.ms) {
-        int64_t offset = ns->mdata_offset + nvme_m2b(ns, zone->d.zslba);
+        int64_t offset = nvme_moff(ns, zone->d.zslba);
 
         blk_aio_pwrite_zeroes(ns->blkconf.blk, offset,
                               nvme_m2b(ns, ns->zone_size), BDRV_REQ_MAY_UNMAP,
@@ -2167,7 +2167,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     if (ns->lbaf.ms) {
         NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
         uint64_t sdlba = le64_to_cpu(copy->sdlba);
-        int64_t offset = ns->mdata_offset + nvme_m2b(ns, sdlba);
+        int64_t offset = nvme_moff(ns, sdlba);
 
         qemu_iovec_reset(&req->sg.iov);
         qemu_iovec_add(&req->sg.iov, ctx->mbounce, nvme_m2b(ns, ctx->nlb));
@@ -2463,7 +2463,7 @@ static void nvme_compare_data_cb(void *opaque, int ret)
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
         size_t mlen = nvme_m2b(ns, nlb);
-        uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+        uint64_t offset = nvme_moff(ns, slba);
 
         ctx->mdata.bounce = g_malloc(mlen);
 
@@ -2744,7 +2744,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
         if (ns->lbaf.ms) {
             len = nvme_m2b(ns, nlb);
-            offset = ns->mdata_offset + nvme_m2b(ns, slba);
+            offset = nvme_moff(ns, slba);
 
             in_ctx = g_new(struct nvme_copy_in_ctx, 1);
             in_ctx->req = req;
-- 
2.31.1


