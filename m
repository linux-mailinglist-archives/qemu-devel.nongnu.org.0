Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A5382882
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:38:16 +0200 (CEST)
Received: from localhost ([::1]:35200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZhX-0001UX-5K
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZO9-0003TR-DP; Mon, 17 May 2021 05:18:13 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:52057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZO7-0005qB-NF; Mon, 17 May 2021 05:18:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 78F0B5D1;
 Mon, 17 May 2021 05:18:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 17 May 2021 05:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 4+pw42IwkYwDJjmSNCsR7w/zoN01EaPIki4wOi5jSiU=; b=jenQ4JhBWA+tIapQ
 bZnxJ21pfIo55siDKIDbhDnHvX7UHWsW082wlfyWe8Yk9BiA9j+FNjiu99zTjAh+
 eG9mc10q4eDi0RPz7ob4jfHsyPKoWiXL+o8p3L+ORqAoZ+gIIoPRPK8K+4YuvKZq
 l1PiB3/zeXQ8afbGbJdyYebUabB0beHhfzahGJhrJAd0ofOVBV66ZZ6Ce6AwOPan
 zYTyyc1VywNqZ56u9r2Nej/ablV2uKSmNH1Ac2eGBlNesWEbBVvCWFVlvEsm1+Q1
 V0YBu87s5EgGlKSrnY/lSWZ5u93qbEcybYtOz7i4tw7KQsRepLTnpo9mImm7Cl4o
 M64Vdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=4+pw42IwkYwDJjmSNCsR7w/zoN01EaPIki4wOi5jS
 iU=; b=MwHNMYyOWcogZjIkqcR1uFQi97wUuPxV+iEDpWJ87sb3ChLIAppNSwyo/
 NcoeZskOkQZp6ivVTjvQr2ZSzEnDrUtyCXI8CXNguLKX6UErw240d5GC/Xk1kwLr
 yeNy4qFHq1CNjaT8U64G0Fe7+KqBjMZQXHDKUeTsQuitIfbkbdsdboU9d73dEMLI
 05yKQRK2Dqn4QOeMz/33lCY7pq9ErNCvkcHApyh7aPMqsGt2bZWA25jQiSu7hIs+
 K2+cK5zxZoaQFCbpDAGy2+YiwP0NcxTOu79CUlZu59c6n5gkKzbMSSRSkfm99NQo
 XvuNcCtN4VlEONCbseaw+xaMZq+aA==
X-ME-Sender: <xms:0TSiYLy4QVM3wJz4dv1yW1OVJd6PM5zG0Z5fOuHPR3H3ARjAlPSWiQ>
 <xme:0TSiYDSsOhzvBNMU73KYzAvwwyC1e8Ghz-nEcBZH0e05u5aeAzy3mgB5i1pnkeVfb
 3JHpXPtktIfgkIk1KQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0TSiYFViAos5q6ChpOFX7HeyVxJFvRCa7zvizwIw2IM-3Vd1aR_bTQ>
 <xmx:0TSiYFiom_Uzg_BcCKA1HHDauYiXVEm2l9VTzvvfEk8YPnmtSKF-Gg>
 <xmx:0TSiYNCB6SkFw8qhaSdlU39D__TOixogovHAmNb1tfgDvD0kutErPw>
 <xmx:0TSiYBuPy_gKHpO3YQtcfaYChQVSLSHE-yUppoNVAsw8kjZV0R9SjScMRLg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 08/20] hw/block/nvme: rename __nvme_advance_zone_wp
Date: Mon, 17 May 2021 11:17:25 +0200
Message-Id: <20210517091737.841787-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Get rid of the (reserved) double underscore use.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9e5ab4cacb06..acbfa3f890dc 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1757,8 +1757,8 @@ static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
     return nvme_zrm_open_flags(ns, zone, 0);
 }
 
-static void __nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
-                                   uint32_t nlb)
+static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
+                                 uint32_t nlb)
 {
     zone->d.wp += nlb;
 
@@ -1778,7 +1778,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
 
-    __nvme_advance_zone_wp(ns, zone, nlb);
+    nvme_advance_zone_wp(ns, zone, nlb);
 }
 
 static inline bool nvme_is_write(NvmeRequest *req)
@@ -2167,7 +2167,7 @@ out:
         uint64_t sdlba = le64_to_cpu(copy->sdlba);
         NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
 
-        __nvme_advance_zone_wp(ns, zone, ctx->nlb);
+        nvme_advance_zone_wp(ns, zone, ctx->nlb);
     }
 
     g_free(ctx->bounce);
-- 
2.31.1


