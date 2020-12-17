Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BED2DDA8E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:07:56 +0100 (CET)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0V8-0003NN-Oi
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Py-000259-Oa; Thu, 17 Dec 2020 16:02:34 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:34785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Pw-0002C4-1h; Thu, 17 Dec 2020 16:02:34 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A21CC5C1;
 Thu, 17 Dec 2020 16:02:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Dec 2020 16:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=hhw9gLpBdP6/r
 6Sd+jV/ZS2e3O75A/6Z+R6ZKiPYXBM=; b=ab2VRbNPm0u8kHGXpeTVo6U55NFBP
 smF0hoW/V/jgu9+5vKx53sa7gB9CWHlEycfcXEBOvrKVqxq61uYzZwIFGvXT+uIS
 IiIxnEjJ72uHsoMwDRQEgdwWjHl3Obf3NGi+ztER82JAKDKgQZcx0eRUGFMZebGC
 VZs0XYNfKM5qmLVsu1JDe/nPGgWQIH6R4U1epdgm6F5X/doMiiH2Rk1o5f+SFz2f
 Z9QgPU56bmxV67s2shsc7/R2XOu6iwAxKGiJqwzVHS8K3SdUrfIrxVCd0n92lr8L
 SQzRbyr1ZJThRLdyj+8V8zf9ATUzfowhylWswigIcdTca7OgPaCedQkWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hhw9gLpBdP6/r6Sd+jV/ZS2e3O75A/6Z+R6ZKiPYXBM=; b=Kl1NFgWo
 SKf6y30d2jNh+dDWP2py0QZzOBLOy3pNJCG4ePPRmUjnD5+yVobr0YpvHpAJIrkU
 nVlEf4Vs3MGKTzGRZp2r/fLNC55Dt7rj2x1FWdPiLaLv7TCnp4UNaA3JdRwsA5jz
 rmMcVHGIZIvUN0TckPAGru0NojXIoXnAo9FjJjpmnbXyWQuguttacNwtFLVabNUQ
 b9Hk47DH5FVCJWxn7RlyB2hCCd61eb6SzxP/RExQem/XUYchM2JFDTXRdXXzQq11
 nlDhps5NGVOwm0bX95GiOucx2xi05lMdEllTuttnYZPFVItRL2YGZgfCqJ0L4RGW
 9UP8kDvk+jfWJA==
X-ME-Sender: <xms:YsfbXxnQtg4WJ8Acfii5wxwQf7kV5R3twMYqvKH6IrHRimdVmdvH6g>
 <xme:YsfbXxEG_qgcVxxTHhFf9hZLvghbXuxTEviC6Nalqz_ZLEXjIlR0b61tY6iuCZEz8
 u7AedztzfmDofBxCSM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YsfbXyrI8kSwwjJtJAH4IgkTlvB3QmvDAAwFodAUMSU8T7QtesdW9A>
 <xmx:YsfbX17_63yDtx2RCHt6aUm34ohwVOo20Ez0CbTH4zPr0DjA9Sl-yQ>
 <xmx:YsfbX47OJf_M9mo9NkVXUN9h24cwLKZQjpUPfArDS12K3O8Opj8vnA>
 <xmx:Y8fbX0DRatYn4bIPAuD7IMnKjeKi6g6EomwTz7VpJ5aiG0U7mOGF4w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4131240066;
 Thu, 17 Dec 2020 16:02:24 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/3] nvme: add support for extended LBAs
Date: Thu, 17 Dec 2020 22:02:20 +0100
Message-Id: <20201217210222.779619-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217210222.779619-1-its@irrelevant.dk>
References: <20201217210222.779619-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

This allows logical blocks to be extended with a number of metadata
bytes specified by the new namespace parameter 'ms'. The additional
bytes are stored immediately after each logical block.

The Deallocated or Unwritten Logical Block Error recovery feature is not
supported for namespaces with extended LBAs since the extended logical
blocks are not aligned with the blocks of the underlying device and the
allocation status of blocks can thus not be detemined by the
BDRV_BLOCK_ZERO bdrv_block_status flag. Similary, the DLFEAT field will
not report any read behavior for deallocated logical blocks reported.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h | 19 ++++++++++++++++---
 hw/block/nvme-ns.c | 21 +++++++++++++++++----
 hw/block/nvme.c    |  6 ++++--
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 44bf6271b744..1e621fb130a3 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -21,6 +21,7 @@
 
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+    uint16_t ms;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -57,18 +58,30 @@ static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
     return nvme_ns_lbaf(ns)->ds;
 }
 
-/* calculate the number of LBAs that the namespace can accomodate */
-static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
+static inline uint16_t nvme_ns_ms(NvmeNamespace *ns)
 {
-    return ns->size >> nvme_ns_lbads(ns);
+    return nvme_ns_lbaf(ns)->ms;
 }
 
 /* convert an LBA to the equivalent in bytes */
 static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
 {
+    if (NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas)) {
+        return (lba << nvme_ns_lbads(ns)) + (lba * nvme_ns_ms(ns));
+    }
+
     return lba << nvme_ns_lbads(ns);
 }
 
+/* calculate the number of LBAs that the namespace can accomodate */
+static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
+{
+    if (NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas)) {
+        return ns->size / nvme_l2b(ns, 1);
+    }
+    return ns->size >> nvme_ns_lbads(ns);
+}
+
 typedef struct NvmeCtrl NvmeCtrl;
 
 int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 2d69b5177b51..a9785a12eb13 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -37,9 +37,24 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
     int npdg;
 
-    ns->id_ns.dlfeat = 0x9;
+    id_ns->dlfeat = 0x10;
 
     id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
+    id_ns->lbaf[lba_index].ms = ns->params.ms;
+
+    /* support DULBE and I/O optimization fields */
+    id_ns->nsfeat |= 0x10;
+
+    if (!ns->params.ms) {
+        /* zeroes are guaranteed to be read from deallocated blocks */
+        id_ns->dlfeat |= 0x1 | 0x8;
+
+        /* support DULBE */
+        id_ns->nsfeat |= 0x4;
+    } else {
+        id_ns->mc = 0x1;
+        id_ns->flbas |= 0x10;
+    }
 
     id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
 
@@ -47,9 +62,6 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    /* support DULBE and I/O optimization fields */
-    id_ns->nsfeat |= (0x4 | 0x10);
-
     npdg = ns->blkconf.discard_granularity / ns->blkconf.logical_block_size;
 
     if (bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi) >= 0 &&
@@ -150,6 +162,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
+    DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 28416b18a5c0..e4922c37c94d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1214,6 +1214,7 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
         BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;
     BlockBackend *blk = ns->blkconf.blk;
     uint16_t status;
+    uint32_t sector_size;
 
     trace_pci_nvme_rw(nvme_cid(req), nvme_io_opc_str(rw->opcode),
                       nvme_nsid(ns), nlb, data_size, slba);
@@ -1246,12 +1247,13 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_size, acct);
     if (req->qsg.sg) {
+        sector_size = nvme_l2b(ns, 1);
         if (acct == BLOCK_ACCT_WRITE) {
             req->aiocb = dma_blk_write(blk, &req->qsg, data_offset,
-                                       BDRV_SECTOR_SIZE, nvme_rw_cb, req);
+                                       sector_size, nvme_rw_cb, req);
         } else {
             req->aiocb = dma_blk_read(blk, &req->qsg, data_offset,
-                                      BDRV_SECTOR_SIZE, nvme_rw_cb, req);
+                                      sector_size, nvme_rw_cb, req);
         }
     } else {
         if (acct == BLOCK_ACCT_WRITE) {
-- 
2.29.2


