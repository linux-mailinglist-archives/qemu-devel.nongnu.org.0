Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB8314AAB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:47:07 +0100 (CET)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ofq-0007Xj-Q4
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWK-0005ln-KX; Tue, 09 Feb 2021 02:33:12 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:45015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWI-00060O-UZ; Tue, 09 Feb 2021 02:33:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 46322CC6;
 Tue,  9 Feb 2021 02:32:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Oz3/PVphhEItC
 X6yIcX+5zKBd/hZPa12wC8aRkpZNfU=; b=zQzWNXx/jFmiygN5H6BN8rm/VNj63
 ctfptf1xSCZ9KeuwZITZWw7afVBMdV4DbkTI50oRfzQ2Iq5qHO3QGOSHytnw/TnX
 S3RZ1gjRFxHqxLv08pmFMfoLwrMMcQiD/Xhbh8bnGjT7kxZxR9CVu1GnkloEJe2V
 Z1mHbNVUXF1oP6fTUSZgH6ff1RKzQYzVZDoHV+hcXpEAtRmY8XuChz+HMnby+I5g
 GBAURo9ls+LTD4VUK8/YfHz/r6We0RCHi400ezGtu+rsrPCjqrYzx+krO5DkUAdx
 izu2mY+tGHYZVdehhswwNs/dip3N1w5Ig6I6a5JneEqzAuvIjFEuEZ2aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Oz3/PVphhEItCX6yIcX+5zKBd/hZPa12wC8aRkpZNfU=; b=VNoobTl3
 /mihoQ+LAxinsJ0h2kHju0AMt67Qdx7NlegSpC7UOLCLb7QRFH33PcNGJhBdFYsJ
 px0sC0bzGGOk26oqVZBgA9GR49Q3DmseR2KVWyfB66jMlkkfQd2jHOWlOKqwVuAp
 DA2/XEfCUzmEYgVDLeFCi6LXd4yyu8vl+eJhqmFENQC4DnU2prSuA/Nuc18T2od/
 PjDKLSscGlFSNavhxJq97lRfCLd3x/Bf29qRpRcJ5TNF+vKMq5iP6/zE0HDxfgb/
 KrkXa95DMDL3Gc3vfpdKXAB2jnvqOzz2ZNj/3eyIOUG6FOwYaNfj1WKesroMuvqt
 U9eXMURgHx2CUw==
X-ME-Sender: <xms:mDoiYODsJ2LDdpueebSQ49-qqQr5Sg1znwfMpB6MUlkKsj6krRDpaw>
 <xme:mDoiYIg3R5BcUm7MyjcqZ9f4JaMoXecK8tywQmhGMIOq0hu3gxEMeKldxbby_4Tp-
 nVQrzp2RdSvsGI7FII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mDoiYBkt94LRnFXtSbr8zXQeYP7mwc_3b267-wdaUS819x7zHQN-6A>
 <xmx:mDoiYMwVslu1nTnhKpG6aRe8h_KGPzpruK5gglrJhqCKDpSWvQinBg>
 <xmx:mDoiYDRUvEaUsKaBlqKBvYZXxZqyJFuETmU2i67VAhMmGuiShFM_8w>
 <xmx:mDoiYOGNHzbO_jdckQvwgOxqfxDRiliuy9BEwxPy3WX_qV6KEH1gFlkm6RQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 737B71080057;
 Tue,  9 Feb 2021 02:32:39 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 50/56] hw/block/nvme: error if drive less than a zone size
Date: Tue,  9 Feb 2021 08:30:55 +0100
Message-Id: <20210209073101.548811-51-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

If a user assigns a backing device with less capacity than the size of a
single zone, the namespace capacity will be reported as zero and the
kernel will silently fail to allocate the namespace.

This patch errors out in case that the backing device cannot accomodate
at least a single zone.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
[k.jensen: small fixup in the error and commit message]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 3f52acb89c95..dfed71a950fa 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -134,6 +134,13 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
     ns->num_zones = ns->size / lbasz / ns->zone_size;
 
     /* Do a few more sanity checks of ZNS properties */
+    if (!ns->num_zones) {
+        error_setg(errp,
+                   "insufficient drive capacity, must be at least the size "
+                   "of one zone (%"PRIu64"B)", zone_size);
+        return -1;
+    }
+
     if (ns->params.max_open_zones > ns->num_zones) {
         error_setg(errp,
                    "max_open_zones value %u exceeds the number of zones %u",
-- 
2.30.0


