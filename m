Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3472330E98
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:44:57 +0100 (CET)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFFo-0006C8-PU
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvA-00034C-BN; Mon, 08 Mar 2021 07:23:36 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:47871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv7-0006vX-IP; Mon, 08 Mar 2021 07:23:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 97FB932DE;
 Mon,  8 Mar 2021 07:23:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sEYF7PIY8nGIX
 2soEEvJIwCiuUA+AjDVrkL6IEGqRjQ=; b=vqQDDchfX7CPhvMECxRvuImGxcJUg
 8dH4tc0ixSqUZXJ1ocx+RM65bjqR+0ADvmcSUTzvW3kW4e97J59akg3F6icot4L7
 eyvyBdJ3kiCqtJHbirALjhJ98VhWQ4AaoT2aUnfJrMuk8Ah9Xe/7vsa6i4zPShU0
 cwO4yEpCHvbKwBtufy1Bc5wC73yo0vi7H94aFQN0SHKDSoOu6nVxF29V1syr+AaK
 FjvxNM5/2JlAwu2Dzpfc1Wo85/h7+yFOQImSlEgfE5V22VZ3ZvStCo9JgUTLXBFG
 PuPzymiqX48NtD3F9IRv+9UlofZ9tk71BdnzRFbZy8xj7xEIKFJM3LQ6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sEYF7PIY8nGIX2soEEvJIwCiuUA+AjDVrkL6IEGqRjQ=; b=GYGZ8jdV
 E12uTz8yUvKUZxuxyeKoh6IwTyaTJ/pA3KvJtTOhFDFektT4dZpG8z9TVDIkp+Kq
 DjPLsM6Esvcfldy94nujX4RuNXUhRxL8Ps+2cIUHtjZSKG83dqNkt5uYOemJEEHo
 mQ3bRvCpSnFC65v0Rg/4bfVQ3kxYbnyCAz1VVHTgUv/rKNPM9ngxhiUzs3/XMhzz
 ZQmTiYkHcO3MC2SmFP9P+A3KliTlR4kknNAisXB40RvKMgtBjERq6yps4y2nxX8n
 LYRBBEugf742q6CfAlvVl6demMmFL2H4+DADLJQgDvjxKJRgK8YUGoeir27wqUFg
 ZLG6luCHdu0v1Q==
X-ME-Sender: <xms:QhdGYBgKE1rvrOa8jGNe80iJX8bABqoH2IVZ48p-vfvCgsJds4mLBQ>
 <xme:QhdGYGD4QtuydxxT3eisPbRhZ9duNtkL8o7tVc99Ajc6m8M5yu9fMVHCJqtk9im9u
 N2as7rGW0ZhmlN0OeI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QhdGYBFZirb6MCu8wnfKL27e86yTzf1aMLm3eCJPMdcEIs55El8Rrw>
 <xmx:QhdGYGSefCMlIeh7OEzNwfnvN31BoM1vun-SLnKw8mDvjuNKaGcVog>
 <xmx:QhdGYOwM0QqizLiyD8g5_x9nEAUpcK8DDdAS1XZo8fz0g9APiVYjCg>
 <xmx:QhdGYJxa26_DopG3WLVfJTFrNFVxrutIIdL8MeybulzVCTANPPt8aA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D856B1080064;
 Mon,  8 Mar 2021 07:23:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/38] hw/block/nvme: pull write pointer advancement to
 separate function
Date: Mon,  8 Mar 2021 13:22:44 +0100
Message-Id: <20210308122313.286938-10-its@irrelevant.dk>
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

In preparation for Simple Copy, pull write pointer advancement into a
separate function that is independent off an NvmeRequest.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9d85d498455c..4d6cd7755986 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1398,6 +1398,16 @@ static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
     return __nvme_zrm_open(ns, zone, false);
 }
 
+static void __nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
+                                   uint32_t nlb)
+{
+    zone->d.wp += nlb;
+
+    if (zone->d.wp == nvme_zone_wr_boundary(zone)) {
+        nvme_zrm_finish(ns, zone);
+    }
+}
+
 static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -1409,11 +1419,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
 
-    zone->d.wp += nlb;
-
-    if (zone->d.wp == nvme_zone_wr_boundary(zone)) {
-        nvme_zrm_finish(ns, zone);
-    }
+    __nvme_advance_zone_wp(ns, zone, nlb);
 }
 
 static inline bool nvme_is_write(NvmeRequest *req)
-- 
2.30.1


