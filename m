Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BD2F1DC1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:15:24 +0100 (CET)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1it-00087h-Fg
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kz1di-0006ZQ-57; Mon, 11 Jan 2021 13:10:02 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:51029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kz1df-0008Eu-MS; Mon, 11 Jan 2021 13:10:01 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E0295C01DE;
 Mon, 11 Jan 2021 13:09:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 13:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=o7cn/qypveFzilLYrFu4PRL7NT
 tXvSooCBs7ATd4mw4=; b=EVkbVq+mzAPtC7ft0YLZgmXSMiUD0c353LpGFlHZMw
 7Cjq88JEOO8tItVXFwEJyi6Oi0LUsZAf25vjcbAikw1PCfWl78gi+lY15sMF9koX
 lpYuMf4iPw8QA9mssPimVFal0s8/uAgOb9k8CUv7FkYiHYhM57Qs9jz1OpARROXU
 MvG8wPVYEWXAnDrUmoXxNMhkTbcJhg5gW/SUWJYAe8/EghRlJSD6zlK0zNQhyB+Q
 VpkfsmpK21Jia5ys+bdoGfxYvuOh1zdZkHck5ibcSIydYn/iAgARXTHBNown/ogw
 YoQbNzb1fWAAou6NKDstB4tlnGOkuLtgEsRf3WD1KsFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=o7cn/qypveFzilLYr
 Fu4PRL7NTtXvSooCBs7ATd4mw4=; b=D2o7lA7KTnDjsId3R/C5hSiYI7aAVOlFO
 FlbLyYo8ro9oxFUMq9qp1OBAOJvbMZ9xKsIctcK4ddPsn5hC6oT0uL3DmHq6tmOJ
 DdoVZg9CHYqfxrsBeYbKp7qNmTyUtdMX3mQMfIjzTn5LMbMlowZVJ2yN5Ma9B2QW
 +9LGPeIsKngrtPyo36//4BnR5mpFd1gIAr4LVaaaNTJJPaoM7kcmb1REGGQOFlCs
 Z8vsfT/DpobnvpIM8mN5UcQWAf2HtpWvZE5UKkYDrqlhCkadQNmRX5N7aoCo+M36
 Zss/7uwprF/61yLauOCndy5vMK4J68Qyd0q71X3a2TmwN9suXkSQA==
X-ME-Sender: <xms:c5T8Xx939i7eVXodAyhuWTTuSUAmsJ4z1GgaY57j0uVbvsk2UMN4wg>
 <xme:c5T8X1uugGiEbnhBvG17RAXuiXudriLaGRxZOzbiKtEajaF-QLjULfdn3jFK1OAfy
 sweKQFmmLTH4oPDbIc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteeh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:c5T8X_BWtLj63P9tAJzLQ1epa8Y8xKeGRPDhcftNK22C99IFSgKGuA>
 <xmx:c5T8X1cQCDWQHUaIbUK2EScaRHYH9eYzeiAu88rpA87n_7eJpFpurQ>
 <xmx:c5T8X2PjlJGus7HdxHJjVYviSwgYP4zPBFnDbf46vPk9xMAqM5chbw>
 <xmx:dZT8X91BcUh-arrYN7SZKllZG92iJhnLxKl6Csb_0iPghhdAV1TYKQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA5C01080057;
 Mon, 11 Jan 2021 13:09:54 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: conditionally enable DULBE for zoned namespaces
Date: Mon, 11 Jan 2021 19:09:52 +0100
Message-Id: <20210111180952.112488-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
status of logical blocks. Since the zoned namespaces command set
specification defines that logical blocks SHALL be marked as deallocated
when the zone is in the Empty or Offline states, DULBE can only be
supported if the zone size is a multiple of the calculated deallocation
granularity (reported in NPDG) which depends on the underlying block
device cluster size (if applicable) or the configured
discard_granularity.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index a4972ac23d8f..274eaf61b721 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -16,6 +16,7 @@
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "hw/block/block.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
@@ -226,6 +227,22 @@ static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
     ns->id_ns.ncap = ns->id_ns.nsze;
     ns->id_ns.nuse = ns->id_ns.ncap;
 
+    /*
+     * The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
+     * status of logical blocks. Since the spec defines that logical blocks
+     * SHALL be deallocated when then zone is in the Empty or Offline states,
+     * we can only support DULBE if the zone size is a multiple of the
+     * calculated NPDG.
+     */
+    if (ns->zone_size % (ns->id_ns.npdg + 1)) {
+        warn_report("the zone size (%"PRIu64" blocks) is not a multiple of "
+                    "the calculated deallocation granularity "
+                    "(%"PRIu16" blocks); DULBE support disabled",
+                    ns->zone_size, ns->id_ns.npdg + 1);
+
+        ns->id_ns.nsfeat &= ~0x4;
+    }
+
     ns->id_ns_zoned = id_ns_z;
 }
 
-- 
2.30.0


