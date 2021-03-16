Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FBD33E138
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:14:08 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHx1-00026r-Gy
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHY1-0007B8-4c; Tue, 16 Mar 2021 17:48:17 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXx-00010o-Sz; Tue, 16 Mar 2021 17:48:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 21F69580A76;
 Tue, 16 Mar 2021 17:48:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 17:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=T23YrOp/speKd
 jcX67s/LEXoUYiRjWTWXjYsdg7FdZc=; b=IRRFh3hQpH1CIHzhDtkF8I+yhdlvS
 tHIQ8mCoFKga227haG8EWynRC4s2S5y/SXC9Vny24wmJugkxbpHinRz37xGePacm
 m9cSlA8h5/N+dbX56rjsDbUpS0sx66yAdciCxauxRvoUfAhr3PO7gFFRv+gUndRq
 m8do0bf2ik+gp9ShZkgHU5zC0R58Klp/VCnLlP3z95BIiWT6a5e0bkux/EKYdsdP
 nZzCZM5QBDcwFTxF1ByI2aAyWAobSHemrgb6arMyy4OWFRpeM55hCaO0plVeKQzg
 isuAwXojErqsvGyrDNyP24YBC/8+aytWcJrcvd3eoemjPtolhKL0lUdNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=T23YrOp/speKdjcX67s/LEXoUYiRjWTWXjYsdg7FdZc=; b=RkmwPrRa
 rEyjYfJmWjff2cWZTjYy2cUa/wICa9JebsPS/8o/3kUz7dGi3t3PRSW/Z3lXeTR5
 MmVl0eEjJYyi5gti/dEcncIxYmIQfvnCNAvD26C9Gw1fsWeCphnKCWS/hHGbQDB6
 mG4ToyPWwRnxDgD00y6c2ROyDTVsSZH1fjWAs4FqkaeqhPoe7qIQb8kb8BieeCSV
 KfKqoVpk70HKVZxv8jvf56BVNDgQpkkfLh1iM/uV0CnNzTLevCylrzBuSAECRKcS
 V2z8JjO3KNIlpfs2JBgHHzKMPfOi1xzYlEDPqFZlSU44O5TbnRerBdAUdM6yuXxX
 eBiL8AtdZvePuA==
X-ME-Sender: <xms:nSdRYDibVMlgHdpdgsNfND0aBfOCA6zlG9fxWFgnA1D6ElK0aoPcLw>
 <xme:nSdRYACDEKyIQ06_v2iyp2SZTrD-6PHeXoPzOrMOgO3BgFtMU7SxnScEs1zUysKzP
 HTYfwr_SwOPRVZNoCY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:nSdRYDEfGtSsmbtnLTSw2eQcRXyc-QQadjIFfdNnUgDpI1ubaUsTKg>
 <xmx:nSdRYAS6NEv2aHBtz9urtiTEVVW01X568FiqrvcI3J-R2fnkzSY2Rw>
 <xmx:nSdRYAyQhpRAEHF1CZGrpfIyj1_qh_2AQXGoTj3hGAGzEjEvFYh5bw>
 <xmx:nSdRYPk1w8he16fXp0HzdB6WQc0lDpGbZDUn7sZfo4GKi4MNEKBHtA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99020108005C;
 Tue, 16 Mar 2021 17:48:11 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/11] hw/block/nvme: pull lba format initialization
Date: Tue, 16 Mar 2021 22:47:52 +0100
Message-Id: <20210316214753.399389-11-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Pull lba format initialization code into separate function in
preparation for Format NVM support.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c | 74 +++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7e3cba55e4db..1e8ef36ba5ae 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -32,17 +32,55 @@
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
+static void nvme_ns_init_format(NvmeNamespace *ns)
+{
+    NvmeIdNs *id_ns = &ns->id_ns;
+    BlockDriverInfo bdi;
+    int npdg, nlbas, ret;
+
+    nlbas = nvme_ns_nlbas(ns);
+
+    id_ns->nsze = cpu_to_le64(nlbas);
+
+    /* no thin provisioning */
+    id_ns->ncap = id_ns->nsze;
+    id_ns->nuse = id_ns->ncap;
+
+    ns->mdata_offset = nvme_l2b(ns, nlbas);
+
+    npdg = ns->blkconf.discard_granularity / nvme_lsize(ns);
+
+    ret = bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi);
+    if (ret >= 0 && bdi.cluster_size > ns->blkconf.discard_granularity) {
+        npdg = bdi.cluster_size / nvme_lsize(ns);
+    }
+
+    id_ns->npda = id_ns->npdg = npdg - 1;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
-    BlockDriverInfo bdi;
     NvmeIdNs *id_ns = &ns->id_ns;
-    int npdg, nlbas;
     uint8_t ds;
     uint16_t ms;
     int i;
 
+    ns->csi = NVME_CSI_NVM;
+
     ns->id_ns.dlfeat = 0x1;
 
+    /* support DULBE and I/O optimization fields */
+    id_ns->nsfeat |= (0x4 | 0x10);
+
+    if (nvme_ns_shared(ns)) {
+        id_ns->nmic |= NVME_NMIC_NS_SHARED;
+    }
+
+    /* simple copy */
+    id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
+    id_ns->mcl = cpu_to_le32(ns->params.mcl);
+    id_ns->msrc = ns->params.msrc;
+
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
@@ -96,37 +134,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->flbas |= id_ns->nlbaf;
 
 lbaf_found:
-    nlbas = nvme_ns_nlbas(ns);
-
-    id_ns->nsze = cpu_to_le64(nlbas);
-    ns->mdata_offset = nvme_l2b(ns, nlbas);
-
-    ns->csi = NVME_CSI_NVM;
-
-    /* no thin provisioning */
-    id_ns->ncap = id_ns->nsze;
-    id_ns->nuse = id_ns->ncap;
-
-    /* support DULBE and I/O optimization fields */
-    id_ns->nsfeat |= (0x4 | 0x10);
-
-    npdg = ns->blkconf.discard_granularity / nvme_lsize(ns);
-
-    if (bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi) >= 0 &&
-        bdi.cluster_size > ns->blkconf.discard_granularity) {
-        npdg = bdi.cluster_size / nvme_lsize(ns);
-    }
-
-    id_ns->npda = id_ns->npdg = npdg - 1;
-
-    if (nvme_ns_shared(ns)) {
-        id_ns->nmic |= NVME_NMIC_NS_SHARED;
-    }
-
-    /* simple copy */
-    id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
-    id_ns->mcl = cpu_to_le32(ns->params.mcl);
-    id_ns->msrc = ns->params.msrc;
+    nvme_ns_init_format(ns);
 
     return 0;
 }
-- 
2.30.1


