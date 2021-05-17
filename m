Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F23828D0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:50:28 +0200 (CEST)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZtL-0007aG-8F
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOT-0003g6-19; Mon, 17 May 2021 05:18:33 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:33805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOJ-0005xe-Nh; Mon, 17 May 2021 05:18:32 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 9BD1C5FA;
 Mon, 17 May 2021 05:18:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=MDNcPVvuJ0Ech
 tx6DSV3Nkv64aezBJYrJ+NgYnyQhZk=; b=cnIWQWzC3m+RT+QeMzEiOjHOTxiPE
 AVwI9BG8dz87WhJ/nxLvLCwSwjzt5oTUFuYCvURe8JgF4lWOB7RQe1xCFCkLvTk7
 ILTOpfjd0J3tnQ6m/sWEbPjYytENfsAa/eCf6aVJrDjJKgZbeAYVNkNN0iHx4gAr
 P49zj2IwX/OJa3evTngONXlIHZ3Wy7DseFlHbTUnHLC1wXJGAj3PJQefS1JrgC8X
 xtucqPEd4aKOnDyOjtrAykoyCKjQxjxvi8oXIcgXPRRjo2YWJy82GhCVLIAceR0p
 29WzRltx4s/I//gRySvIWLpMWRWij8CUdYkd5FtEYnKTVv1P3WTh8q0yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=MDNcPVvuJ0Echtx6DSV3Nkv64aezBJYrJ+NgYnyQhZk=; b=ZoA6gKD2
 tnApBL/KA98B993i1T4oGc4Z699ZFVOeOcrddes188VGWZsbJad47Hpdc1bns2ic
 RMxHlu8ZXXhQASPTuHjH5hTp6gDpcIGIBLOLJs+f8WKFV9S7xFBJzzsa4cyk9OQ7
 Dzjks0CR3l9jiTuXln3lAJqRMgkRw+oIfmQACeu9vGNyO0Rj983ARUqOAo97Sbm4
 OOZVkN/e3N/Uy0CD02xlgIYcUfjWo29qpEMpeBpPB3ZcSttphDmGkEerDy1ud8PA
 yp69Jtw+QELGrYoKoD57fCTbuFn0CmYeKz0YAMvSGifu/ZRPrzzGPkRub5tsdboR
 DMBkaqRQi86zGQ==
X-ME-Sender: <xms:3TSiYKTyrQKMRz0Oy35lqrPhnePZ4LBDp-q05BjKSHuEcnsGX6WS0g>
 <xme:3TSiYPzDNZu64vPPKiRuaYWwjdfTZ56LKUDR3Ojh_vI-_V0dKszQhLCjp7CzJ8G-P
 IA7Ai9b2pOYBFHInLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3TSiYH0yqY_Wl5i9P-tucHdIkoa9t7Ff75dgMDepl67-KKLf9vJMaQ>
 <xmx:3TSiYGA5hmQosmWEwnU_lywTLmYR3eWcK1ADr49ZJNlUPxfJdQ_wuw>
 <xmx:3TSiYDhydsXuURDEkzHIqLh4vu5iE2V-4efO-z7ZSPUM_a4OYeafpQ>
 <xmx:3TSiYDhFyBTjUg49QF-Qmnmub_bXwKqhUYvLPP_97c-wRnd5iCN1Aw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:19 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/20] hw/block/nvme: remove non-shared defines from header file
Date: Mon, 17 May 2021 11:17:29 +0200
Message-Id: <20210517091737.841787-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Remove non-shared defines from the shared header.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h    | 2 --
 hw/block/nvme-ns.c | 1 +
 hw/block/nvme.c    | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index d9374d3e33e0..2c4e7b90fa54 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -24,8 +24,6 @@
 
 #include "block/nvme.h"
 
-#define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
-#define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 #define NVME_MAX_CONTROLLERS 32
 #define NVME_MAX_NAMESPACES  256
 
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index d91bf7bbbbbb..93aaf6de02af 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -23,6 +23,7 @@
 #include "trace.h"
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
+#define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 
 void nvme_ns_init_format(NvmeNamespace *ns)
 {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e152c61adb76..e7bd22b8b2ed 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -168,6 +168,7 @@
 #define NVME_TEMPERATURE_WARNING 0x157
 #define NVME_TEMPERATURE_CRITICAL 0x175
 #define NVME_NUM_FW_SLOTS 1
+#define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
-- 
2.31.1


