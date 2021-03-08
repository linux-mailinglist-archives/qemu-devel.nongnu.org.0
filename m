Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25772330E8C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:41:35 +0100 (CET)
Received: from localhost ([::1]:34238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFCY-0004Oe-1x
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvA-00033z-4A; Mon, 08 Mar 2021 07:23:36 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv3-0006v7-T1; Mon, 08 Mar 2021 07:23:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9A82936D3;
 Mon,  8 Mar 2021 07:23:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=OkfwHqpnkxAYc
 nqcP3phcf6I0Al1zCh0Na/CshXiB/w=; b=E+hq4i9VW2DbyKlj2Ris5wxRUTrmS
 AtrVh+2LgPwBd3mMDLdACbKtNxBfFedNGMPLuhyDIENwQyXJUNGPrlVga/amhk7P
 fFwC8AalUM/mmuUYC5onapLgXZqEfIapdYGNwNjjtoSKQyzMXOQerR2lRGSKj24Y
 VYu7s65+j3yM5w6x6Yf4Qlhdp5/tYkNfB0XF7jgTvO5QZgICCWii9yDFbkeJ3DQb
 b09Det7wbv9Dkk2raLlTJU4ng02Df4aSJi3Pq4qk0G863jQX6sdoABMU2SbKg6KQ
 uNDIyyb9MVEYT6da1Nu0ziHum775CkmJQd6je/DQNgGTrkx148TOdiGQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=OkfwHqpnkxAYcnqcP3phcf6I0Al1zCh0Na/CshXiB/w=; b=HAVRDRXa
 eQaXL9R8bUaOEjKDFPn95NhGBtQW6E/HAPK6d1i7G5V5JZvwVDm5qo9luvIJT0dN
 CdFiw7sut+GHc9DpDC+6PlSJPZi1+Vr3J/gLdOOMHZ2wkCbIEditgNF8f+gEZGdj
 MGi507HgcHDRM4ElaqHHBCmvoAcU+gh7uPIhFytizfpAI5NTELeSqvmmDqxyPNVe
 Cnsg0e7tqzyvPHcNxtf/BF7ZxPegNiFp9wGtWqPjo0ba1GUWK59tXNrI6K30xWzh
 C556+FClk/N9vmBswPHOysBKScGZYWo37h87SBjvdcZDpyKjjeVd1LGAXWUkwRyx
 4w7JaKubApp94A==
X-ME-Sender: <xms:PxdGYD6r0ycmVX8Dg9SarL7uXkjbxKruvT6IUylJekOzRr1rClaztQ>
 <xme:PxdGYI65FwoJTLgoLzeo0ZGvXANGcJyl-PYBdcI0VtTrkBcWkh7O4FxXl3kCE4ZJg
 fIzZt7yJDT1N8BeCFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PxdGYKftF8eEq58UnChrcUeff61xT9-l4X5PUkDJFUHCP3jSFq_Lxg>
 <xmx:PxdGYEKmi3EQjCh5t12NFQ8XeC7Ro-x10illmaddS3L6nkTx7BuoSw>
 <xmx:PxdGYHLa8Ix0TjE1v0n31csRL3dcUscvUkACrMnVvb9YtsdFs5DaPg>
 <xmx:PxdGYErDOgZ7ZioQIBN4nvfkUI-TdTN8oUBBK5LSFzXUTz1LFJh_gg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBE651080063;
 Mon,  8 Mar 2021 07:23:25 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 07/38] hw/block/nvme: remove unused parameter in check zone
 write
Date: Mon,  8 Mar 2021 13:22:42 +0100
Message-Id: <20210308122313.286938-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the unused NvmeCtrl parameter in nvme_check_zone_write.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 34f9be0199d5..b8070e1f7fd9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1204,9 +1204,8 @@ static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
     return NVME_INTERNAL_DEV_ERROR;
 }
 
-static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
-                                      NvmeZone *zone, uint64_t slba,
-                                      uint32_t nlb)
+static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
+                                      uint64_t slba, uint32_t nlb)
 {
     uint64_t zcap = nvme_zone_wr_boundary(zone);
     uint16_t status;
@@ -1769,7 +1768,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             res->slba = cpu_to_le64(slba);
         }
 
-        status = nvme_check_zone_write(n, ns, zone, slba, nlb);
+        status = nvme_check_zone_write(ns, zone, slba, nlb);
         if (status) {
             goto invalid;
         }
-- 
2.30.1


