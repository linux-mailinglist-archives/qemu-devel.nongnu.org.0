Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D233188DB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:00:40 +0100 (CET)
Received: from localhost ([::1]:56496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9iB-0004R0-Cq
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA9cg-0002Px-VY; Thu, 11 Feb 2021 05:54:59 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA9ce-0006Mq-Bq; Thu, 11 Feb 2021 05:54:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 06C155C0116;
 Thu, 11 Feb 2021 05:54:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 05:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=43eysmtlCd15QjsaRhNmak35DR
 Kx5Oj319gjNHkMrJ0=; b=HQXejQM3mYamxn4rgBx8Xn0tZzUvjukoTYSbdh4Gb0
 MW9HouinZIZL0D9mX/wel3jzdc8hIpBAvCxqcUFVOzCtRqYol35VL85ypqsWCf8W
 p9FES7+nt6Nd6OdL1PiT4h1j6tcxIIJUpGALtMnPvci49Tm22cBDqkaU7odvlIDI
 QAXYy6Z39kEU+wNLHFOjq2PVY2dAeX9pwlHIiCYR+5Q4CHLU5mBECC61z7IQ6RFn
 0yzvachyjUH/iRsn0mqOSHDRMNKWWcQQ/DV5xya0NEOuv2JwOFuULvztUATBaLux
 6hETc6h7bacwAqxlM1M2DxL/XTRixVXeVuCQliF8g9Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=43eysmtlCd15QjsaR
 hNmak35DRKx5Oj319gjNHkMrJ0=; b=NBv9dVHcNtGSM7bkvQKndo3ONhY/Er6uq
 tS7hEwrXjy+ko7UR8Ry9CFaM+agmzS/OmEcXmHLDW73EnJkwKP5PrfguBmKZs8gG
 RCXixk1QgcYwfjPPvxEjsGaeWHArtCEL9oydA6fYVxingHB3+y996g6MpDbDC8BH
 xDYNNEGY9//Jukp9Vt6LQcfB/iQq9PxP8Xkubbv86DCEcqDbM/bgxL1cDawleClE
 2VmGPDgdlFOCUMUOeqwUb/l4ICcj3IFrRA5lT/D1zIM0gZpssJ0+E1OJw/41UsJf
 pwkQqwvt6Q9pTjLEhl9l86wlMg6hrOSn2g2WAEX5dDnT7cMAmUiSw==
X-ME-Sender: <xms:_QwlYMNkINiX_ExRwZKbSQ0uzNcgJj4bNvIP4T-AwPuVQI9PcmEZ2w>
 <xme:_QwlYC81DGb8B5p04jwTjGPY37Rt1B9QwRdvtm51mpKJCE9Gmozs4BmoISQsJxsYX
 Gevhl-ElVc4iBAtuCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_QwlYDQ3ryu0YfDcVbk6yR7GBZh_FvVlt7DHjfqnFQGgnVz1yFo6sw>
 <xmx:_QwlYEulBkbYnK-cgqtY6XYccdGNurnZcHfBfHdDS65BIrLeN8l91A>
 <xmx:_QwlYEeHvXAY8iItKEflje76-YgdfqVzPLMlYmvufXMBC16SbKfMKg>
 <xmx:_wwlYMSAzJQGvIywcgTRc7VK7D-Yehr0pjGv8EmupbMxa2Ke5qRVPg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA1641080067;
 Thu, 11 Feb 2021 05:54:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix legacy namespace registration
Date: Thu, 11 Feb 2021 11:54:51 +0100
Message-Id: <20210211105451.937713-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Graf <agraf@csgraf.de>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Moving namespace registration to the nvme-ns realization function had
the unintended side-effect of breaking legacy namespace registration.
Fix this.

Fixes: 15d024d4aa9b ("hw/block/nvme: split setup and register for namespace")
Reported-by: Alexander Graf <agraf@csgraf.de>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5ce21b7100b3..d36e14fe13e2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4507,6 +4507,12 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         if (nvme_ns_setup(ns, errp)) {
             return;
         }
+
+        if (nvme_register_namespace(n, ns, errp)) {
+            error_propagate_prepend(errp, local_err,
+                                    "could not register namespace: ");
+            return;
+        }
     }
 }
 
-- 
2.30.0


