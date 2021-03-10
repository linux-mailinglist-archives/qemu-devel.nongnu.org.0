Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E41A333958
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:01:13 +0100 (CET)
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJveS-0001VF-3K
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXc-0007dl-Oq; Wed, 10 Mar 2021 04:54:10 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXX-0005AI-Ve; Wed, 10 Mar 2021 04:54:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 304625C013B;
 Wed, 10 Mar 2021 04:54:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=izsKBIMneMFOR
 OBk71bidB5RLUn/iIuN60GvQkW2suo=; b=IiZ/4bTunapTz2L80J12S2zKhjXH8
 oRgE1Mcq43gElfN0Thn490km1257KtEQgG5SJ6cS/97SQUMxOVn7AVRlwhF4kOJN
 Eq4CYs4wHD/z3swQYaYxZ5vhK2PQ26F9LXXTA/hvTDI5XtU0OA48rRduS4/IT+5l
 xQuZsmSli3vDpFtFxbj3xQP9j6QsUO3jIoA1iMGQ45g8YrSImPKcswEXksPpJxAQ
 OBI5CKwBhU2T37//6mawe2ZCZRf9eg7iebhy9vkmmAdqWpq5uqvtGXvJTNf40iZQ
 fp/ZLhiSpxuPU4/pusDZD6PyWSGH1a8BxdK0CDQg64dCtAXmSxKjcynBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=izsKBIMneMFOROBk71bidB5RLUn/iIuN60GvQkW2suo=; b=pn1ukYeT
 g7k/1R/fswLFuGQvU/68f9zJ3KC9QyJlmGaNwic/cTGhbI5fq4vXVvAPfd9OXWO4
 SUZVnw9vc5L1Ir8hDdboT5XshiNz8oZCRu54CHTB4HKXux76qw4tGQHH8WznoSr+
 c/xbzAcYfFJqrOom2DMnr9u62tFK3/Iz8fjMHOX1CnDZvIX5XKNCmf2VtfZckqzQ
 dxCYeQZL2dHLrn6mL4NoceHPbYrYILY9fSz9oi4eubmlXKHnqoarbMld/zzM4MCl
 8OXXjdK3uuXode5dAlsh6x/hGuPgSm+QGEzkhWjKYR4ied9rlNNSyAsrpQRXGnSV
 4hRyKhKJQ6pxWA==
X-ME-Sender: <xms:O5dIYK51rPzPCSwTnsZQvKzJmrtsImjzm99oUF_fZ1S8XZW4z1DKvA>
 <xme:O5dIYD6Lhi9D1WZxt-P0BQz3hk0vT-7JQJyQQoMDrHnIZlVEXH8wQbCVatTrGtALl
 bA-X0bxPG9qXcSd2Vo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:O5dIYJdV6zUcoXbPu7VrG4VZwns4O-HclO8wpHXb_d2VrHM78xowGw>
 <xmx:O5dIYHKHMIKyDJSjK6YEOeQZqOzuZ-7Vb9sD5wGgD4KaenSzskaBrA>
 <xmx:O5dIYOLbtf2UcX_A1J78_kJvdM9XBWEQgmkvAhcpk10sFoccd6PKqw>
 <xmx:O5dIYPpgwWgxWNNF5vAAGBxN6YzNPVjkXRCNcdJp8uUHmA7lCboKKw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E9C924005A;
 Wed, 10 Mar 2021 04:54:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/13] hw/block/nvme: pull lba format initialization
Date: Wed, 10 Mar 2021 10:53:42 +0100
Message-Id: <20210310095347.682395-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Pull lba format initialization code into separate function in
preparation for Format NVM support.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
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


