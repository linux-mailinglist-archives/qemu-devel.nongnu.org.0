Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC42F128E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:48:04 +0100 (CET)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywc7-0000Sy-B5
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN7-0002Pw-OH; Mon, 11 Jan 2021 07:32:33 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN4-0006r0-Md; Mon, 11 Jan 2021 07:32:33 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 5A40E29F4;
 Mon, 11 Jan 2021 07:32:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jan 2021 07:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=PLFFFUlCfhQEh
 Bngs/osjgJd8mfOPQeRvanj/GSoYjE=; b=pWii6i2DPyzV0qDzqwhmARlx0XabT
 xxV3MZ6bTl+Gh1qPs6PNMGpr5UJyRIAJ2yzMQpkRSkqlmvMwKJDt4c0O5jIO+DM0
 9NK0c8rgMiwHmc6AeKzFAYb7sb8u4GZguZtKDf/OwCAhFvUnc5jZ9rWWHiYB2wmf
 5nBrro7hD8Hr/nRM1iqT0Ua9f0BpBoTHATliNnjDnvn1vvYq+JVoTGST2dHM+5K+
 c9Q/zF6lbquEkHZHsIuoBhcGACtLo0m8OHqNDZwe4RjX80qAD0vEWYpOGPkdq7hD
 2gMU+tJEZ0UFsmiqL2/isVDDkXC6vYRhVpV95L2RR3cKSRspdUZ1c2RQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=PLFFFUlCfhQEhBngs/osjgJd8mfOPQeRvanj/GSoYjE=; b=Xgv0lzXR
 FoeBYlLTITpjIHcOWQLb7yk2rabhP5GXEU7VpXaJHNdhHARY51C+5XunpRZ6AAeU
 VBV6Sc12jhSDUj/3I/QVTmBXCSzJ2kBTwz1kK/d2/r9KLMimNc9whf3FLKR0heth
 80lES5Se2l2NCIn/wEbRoHz5RzQi94LEKEXJz4AFWWlF+69M8qk8nc12EwuQUoCj
 384o06KRB7WCihRAZChM7dFFXGhIilFlnFpEiKxCWgttLrK8n53ABIXYlmAYAcuR
 UDSR9H59r+CXa1a1QfCUsze8MbnHtYsgcwLE6H+a28aPgt4YSvgSCPbs96V+IDbJ
 6G2MqQyUOU6w6A==
X-ME-Sender: <xms:W0X8X5gt80IzwCyGC_XndbKaClKqffidIVfv2pRnAJFBgvLMmGCW7Q>
 <xme:W0X8X7nV5L_Vf5qFemHSbPcHkVHuR5yN97blkaXm_VempA_MOHHbGtd0vFcpGZKm6
 NMu3vz36I3g3H4zAMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:W0X8X_ijrk_MzW8MTXUetlwgkBMKZtxOz4efEgyt_9EmtVmGXtixqA>
 <xmx:W0X8X_10AVXmG_vYCc8iCm5ygsVWc4gNlrcpb9pNyKIp_TN1NMxMeQ>
 <xmx:W0X8X4J9QxK-KDF81lmwAVx04RgfnJqYcnA-o90d2c8QUNtJV5dHLQ>
 <xmx:XEX8X0cIuz97dUAYeR5G7B-ac1EQ37IH4neVrzbq0k6IxQsd4Pje1A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D256108005F;
 Mon, 11 Jan 2021 07:32:26 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/block/nvme: fix shutdown/reset logic
Date: Mon, 11 Jan 2021 13:32:18 +0100
Message-Id: <20210111123223.76248-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111123223.76248-1-its@irrelevant.dk>
References: <20210111123223.76248-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

A shutdown is only about flushing stuff. It is the host that should
delete any queues, so do not perform a reset here.

Also, on shutdown, make sure that the PMR is flushed if in use.

Fixes: 368f4e752cf9 ("hw/block/nvme: Process controller reset and shutdown differently")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0854ee307227..cba509e90537 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3413,7 +3413,7 @@ static void nvme_process_sq(void *opaque)
     }
 }
 
-static void nvme_clear_ctrl(NvmeCtrl *n)
+static void nvme_ctrl_reset(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -3447,11 +3447,7 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
-}
 
-static void nvme_ctrl_reset(NvmeCtrl *n)
-{
-    nvme_clear_ctrl(n);
     n->bar.cc = 0;
 }
 
@@ -3460,7 +3456,9 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    nvme_clear_ctrl(n);
+    if (n->pmrdev) {
+        memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
+    }
 
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
@@ -4303,7 +4301,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     NvmeNamespace *ns;
     int i;
 
-    nvme_ctrl_shutdown(n);
+    nvme_ctrl_reset(n);
 
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
-- 
2.30.0


