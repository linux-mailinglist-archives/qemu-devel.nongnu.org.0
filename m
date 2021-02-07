Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD63127B6
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 22:56:05 +0100 (CET)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8s2G-0002vo-Bh
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 16:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwH-0000Zq-BL; Sun, 07 Feb 2021 16:49:53 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwD-0004NT-Oa; Sun, 07 Feb 2021 16:49:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 261EB5C00BC;
 Sun,  7 Feb 2021 16:49:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 07 Feb 2021 16:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1ngZCBffcsyHz
 HUIddRnrgrLvTWlJpe2NfqUeHO8pHg=; b=rJ9r+SB1oGlvGIWvnkkraf6aM4iwV
 XtzSkBnpm0GQFH5XmV97iqeacTtY/ahxembHH5AdDkdnSVurS8nLsMIDk5Hw3Ii7
 7AxlwHTcHy4CX0Y9twttaPmb3X7WUZGs8Xe5C191/73j7EY5n03qN5GVGtaOYsxt
 vLDm8/SMiTxylhRPIkjHVLaiHbyjppIOWnzlBi0uwNgWUWr1agce7IhsXAuJe2eO
 F7HX567hhCTgpw5P3wErgcJIQwgOhi+6o1JUV8WezHs222A4Ejix84OM4NlKIO4l
 1X3dNpAMnAT8LdEV68X6PBcF7lGLsiY/X+WYf/NAIRvk+QDVmaJjnqrPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1ngZCBffcsyHzHUIddRnrgrLvTWlJpe2NfqUeHO8pHg=; b=dcWweqjc
 1LuVTD+oGjoBji2CjXt+mVxww1NLZoyntdlkLp4llcEiUwo25a3kNtj0GCxv2r9j
 6sU9QfVu7cxNnI0ENkqStn3bbmdh1ns26Ob8wUlZV4k7IDx50bnropb2p9Z3smF3
 bseH8DCsDc8Lq5k2LLsdQvE3PqpClbMJkkKMF/fkQ2nQqbMk+8ynyPaLxc6oKK3L
 oa57msaX3EauXU5gx9pXEcUcw2X/wRTdbjycmFpHrVyCu3B9yov74xPH45hDfyev
 jcdY2J1Ef14fXMzmu/R6g+QquIoTv4JsQktqZNxxb6fZqII3WPPBvlxJl4lFXHsc
 8nSjriDlm58w8Q==
X-ME-Sender: <xms:eWAgYNJTcBkZA4vBrD-Rswvobo-HL0kHI3qnehgzhtyD00-lStH7TA>
 <xme:eWAgYJJ4sGmk9jr0_Aryf15nmX0jmJtnCRZSEnHE8hJ1lORhm1OIiyupG--sDSqZi
 RddXIx22M8ug6WqGlU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:eWAgYFvabkb3DhS7FYGZjo0dq0msNu8MWPll-knitqDW1-lduJ79Qw>
 <xmx:eWAgYOYmKBBSKL_FSmobLJ6Ds_Y6sDOONUXUXMl8BzWoEeyoJ37eUA>
 <xmx:eWAgYEb4VoBD1tM567cXdSZbyGyAlPJYb_mr6IKiMCDPOcOBxFRZ8A>
 <xmx:eWAgYE5LUYtUAldGhUwGNQIGOjvWfk7EHSdNOnxUeaWIphVHhukA4Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF4261080059;
 Sun,  7 Feb 2021 16:49:43 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 1/8] hw/block/nvme: remove redundant len member in
 compare context
Date: Sun,  7 Feb 2021 22:49:33 +0100
Message-Id: <20210207214940.281889-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207214940.281889-1-its@irrelevant.dk>
References: <20210207214940.281889-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The 'len' member of the nvme_compare_ctx struct is redundant since the
same information is available in the 'iov' member.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6b84e34843f5..6b46925ddd18 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1656,7 +1656,6 @@ static void nvme_aio_copy_in_cb(void *opaque, int ret)
 struct nvme_compare_ctx {
     QEMUIOVector iov;
     uint8_t *bounce;
-    size_t len;
 };
 
 static void nvme_compare_cb(void *opaque, int ret)
@@ -1677,16 +1676,16 @@ static void nvme_compare_cb(void *opaque, int ret)
         goto out;
     }
 
-    buf = g_malloc(ctx->len);
+    buf = g_malloc(ctx->iov.size);
 
-    status = nvme_dma(nvme_ctrl(req), buf, ctx->len, DMA_DIRECTION_TO_DEVICE,
-                      req);
+    status = nvme_dma(nvme_ctrl(req), buf, ctx->iov.size,
+                      DMA_DIRECTION_TO_DEVICE, req);
     if (status) {
         req->status = status;
         goto out;
     }
 
-    if (memcmp(buf, ctx->bounce, ctx->len)) {
+    if (memcmp(buf, ctx->bounce, ctx->iov.size)) {
         req->status = NVME_CMP_FAILURE;
     }
 
@@ -1924,7 +1923,6 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     ctx = g_new(struct nvme_compare_ctx, 1);
     ctx->bounce = bounce;
-    ctx->len = len;
 
     req->opaque = ctx;
 
-- 
2.30.0


