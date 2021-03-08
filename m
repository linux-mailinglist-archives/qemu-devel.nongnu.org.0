Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A5330F10
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:24:24 +0100 (CET)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFrw-0006ax-Dv
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvv-0003mD-SQ; Mon, 08 Mar 2021 07:24:27 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:43863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvq-00074G-6D; Mon, 08 Mar 2021 07:24:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 01ED9FDB;
 Mon,  8 Mar 2021 07:23:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YvVql8HSdq+lS
 v/P5l8+1BHXMz87sH6F5IGR+O/+IcY=; b=L1QcY8N/BdMdWzHW5g0V3z5/xMuMn
 lvX0rXM+ipxrAoDd3qjA71v+5IUj7Ovu6D9YAQOB7cA8rcjYH6teeazn8n18yIlh
 O2qet3a/dghfs/BZiH1ZOXyRuF5DM3c3xo6FbUMce+kDGbJr5FKzjXXeyXfwbKch
 QEuZlUqKe+ZuCkBDJ5TplLipB63pzordNVw3yo1BA98aZzpDz4EP5DZzKobTvyw2
 xyefnGw/VTpWeMu7zTs8Un0lkKuMijekmoyChdQHZBbKqRAF6oD0xfAd5T3JkZyD
 Ip/LQN2cJRwbMH3uEYE0k0MRnGnnggT8cMBeIh2CQKw9J9nYTnm9MSDSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YvVql8HSdq+lSv/P5l8+1BHXMz87sH6F5IGR+O/+IcY=; b=RRHBSkpd
 8fwd7a9BU0ttxDiDMQ1iDxBJ38jR0v99CMKvPhEFWKogGj8ChqRNjANLNLdzK8gJ
 jFPq4Hb58fAwQy++/8J+h3i6pXLDIzoE8Dupdw0tQN4W7YeRGy4kkkeiGFt+3qC+
 o76X3fDVe2QIKRhCvyABWhT96hQu0NmXgo4YwiSj/Gk0LtTFDGHQ76iMhtGrqiA3
 uErSqURlZfb1O3Hl4pJULxxRThqV7Dh6OWwUyqD/LFKL5gwETrGJH/cMZXq9s4Za
 eaVnIwQPVyy9jZslI0bIOhbejy9a6+v2eCo63xeH1Y/SE8tR9AHjbuV1K14/Ikhp
 47TlAx8H+oSuyw==
X-ME-Sender: <xms:WxdGYKkZbXCgXejf9xwIUMhwB1N4mbrGA_2SsVIvFgg8VRoNsChG5A>
 <xme:WxdGYB3fQ2HI9xnRBmBHP_XE4i2LVKM4fYyQPCAw4tX5MNee6U8v67DFS8QICngBz
 TUZY_zp6ve74ewQiUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WxdGYIpldjCM0LZD52-rh3yKKnVaGgafMCB7rEU2ilPpAq_LASuC7w>
 <xmx:WxdGYOmjvo0qhBh4Kkt7aL41EgNBl2xkq9ONgWgyVWLowAerBWyy3w>
 <xmx:WxdGYI3kfgbmoVGCWH9clqgRrR16smTv4Pt02esuc6mVhcRrNwjrRg>
 <xmx:WxdGYJLEETVTnfSukjU-LZnYOlMvjiQrwgMPONqkWakAxy3olbKa3SuIjBM>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27A1F108005F;
 Mon,  8 Mar 2021 07:23:54 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 25/38] hw/block/nvme: remove redundant len member in compare
 context
Date: Mon,  8 Mar 2021 13:23:00 +0100
Message-Id: <20210308122313.286938-26-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The 'len' member of the nvme_compare_ctx struct is redundant since the
same information is available in the 'iov' member.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0f6400cd7274..8b84342d72a8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1694,7 +1694,6 @@ static void nvme_aio_copy_in_cb(void *opaque, int ret)
 struct nvme_compare_ctx {
     QEMUIOVector iov;
     uint8_t *bounce;
-    size_t len;
 };
 
 static void nvme_compare_cb(void *opaque, int ret)
@@ -1715,16 +1714,16 @@ static void nvme_compare_cb(void *opaque, int ret)
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
 
@@ -1965,7 +1964,6 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     ctx = g_new(struct nvme_compare_ctx, 1);
     ctx->bounce = bounce;
-    ctx->len = len;
 
     req->opaque = ctx;
 
-- 
2.30.1


