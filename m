Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7102DE35B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:38:11 +0100 (CET)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFxR-0005gV-RS
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFou-0003Tg-Sh; Fri, 18 Dec 2020 08:29:20 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:44299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFop-0002u2-Qo; Fri, 18 Dec 2020 08:29:20 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 7A76988A;
 Fri, 18 Dec 2020 08:29:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Dec 2020 08:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=QHIU6l3GSFq9S
 aq0UIfD5aj+OYbt/5OEHiYmulTTuTQ=; b=U5L/vwU0RxHOlSUJUppjW8XmYZsos
 7Xqogxo46G5IKeXJBzgNPQUL8r03snwdCaZmE2kddM9paUPPKoMKyzmfxjAnbpOP
 udzE5aNzhnjFJrK4cCaUdW1odI30CD+jD/mFYQcKzZTyxUaTGaQ7B/q15Fvt72Yg
 WmDzFcUZvMcgPfziIMzrqC/ptHGNTOaap9AtwUmO6KMpGSg/LXodWuUNJ1rFVq2S
 drHB19IsW/hmY8eaQ0B8V4vonWUsPyv7562vm9niMZICHpI682ZmvmFE1aycgBJd
 wM1bo0COD/ZnN0oksPjkY53JROFM6Xv6AbiDNmegNeh48yH8LcGSXjXEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=QHIU6l3GSFq9Saq0UIfD5aj+OYbt/5OEHiYmulTTuTQ=; b=eEd1o2L+
 K+CpcXZx2kWXLftsKT/W6zIgxidqwTCgZEubjJVvGILFNIjXtHEGh34qGFw92pLT
 /K8eCyQhU08IMgg2jYooC+dkMvIGrH4DlIF5wBEAPJdARMJGYFVt3Cvn2uTj1rDU
 qg1XS85nOwqp8dxLct0T4OwXjvMV5zhOV+243iySEf1TIWpv952rNWzqsEItfchZ
 fKFOQavwhcT9IJ108ptGgV7U5i3kUQ6J20qJN4XkLqYhCVUpUkJVg4vhMfpg5wwv
 XfsNTUnNMSycYm5MoAw0Ao4g319ZmkhRXsFgKmUQSIrnKNxJsveXZxFef6yrWEF+
 1tnk4wUW9EYtQw==
X-ME-Sender: <xms:pq7cX_UUroVwP7aVXiXaqPc4jOP852PybMSGVoya0S3YZhnAaap5yQ>
 <xme:pq7cXxpqHGzb56zTMkyNQaLzjRU3-qFnsUorKYrXPbWLLnELTyTks0uqOz3AoyRWE
 nUkC9UylWwvyWV04Ak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pq7cX7TkPl_pTagUTPLNpd8UTmPwveG9cftkZkD0au2dGqweB5ZA9g>
 <xmx:pq7cX70Tmoux_6bRnglCOIyzXhl2hMPOOIgRzxcDsEcnXZ18dHYsWA>
 <xmx:pq7cX3DzHoqQGjwql6PDBPqHg4362zqPYui6XT7dSOyuAHUj9wGm7A>
 <xmx:p67cX64xKLGm9Utk-0L03KFsvv4ImO-xXv5aGvsO3IOoMcBdfVQzWWqxROc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFACE24005A;
 Fri, 18 Dec 2020 08:29:08 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] hw/block/nvme: indicate CMB support through controller
 capabilities register
Date: Fri, 18 Dec 2020 14:28:58 +0100
Message-Id: <20201218132905.967326-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218132905.967326-1-its@irrelevant.dk>
References: <20201218132905.967326-1-its@irrelevant.dk>
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
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Maxim Levitsky <mlevitsky@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>

This patch sets CMBS bit in controller capabilities register when user
configures NVMe driver with CMB support, so capabilites are correctly
reported to guest OS.

Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Reviewed-by: Maxim Levitsky <mlevitsky@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 10 +++++++---
 hw/block/nvme.c      |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 11ac1c2b7dfb..24f3c256a7f9 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -36,6 +36,7 @@ enum NvmeCapShift {
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMR_SHIFT      = 56,
+    CAP_CMB_SHIFT      = 57,
 };
 
 enum NvmeCapMask {
@@ -49,6 +50,7 @@ enum NvmeCapMask {
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMR_MASK       = 0x1,
+    CAP_CMB_MASK       = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -78,9 +80,11 @@ enum NvmeCapMask {
 #define NVME_CAP_SET_MPSMIN(cap, val) (cap |= (uint64_t)(val & CAP_MPSMIN_MASK)\
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
-                                                            << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val) (cap |= (uint64_t)(val & CAP_PMR_MASK)\
-                                                            << CAP_PMR_SHIFT)
+                                                           << CAP_MPSMAX_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
+                                                           << CAP_PMR_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
+                                                           << CAP_CMB_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 28416b18a5c0..fe809195a08a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3046,6 +3046,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_NVM);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
+    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.29.2


