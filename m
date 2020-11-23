Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F762C0071
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 08:04:57 +0100 (CET)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5uB-0007Lt-KX
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 02:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p2-0005IZ-Ip; Mon, 23 Nov 2020 01:59:36 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p0-00073B-8o; Mon, 23 Nov 2020 01:59:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA86D5C00E7;
 Mon, 23 Nov 2020 01:59:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Nov 2020 01:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/twqJxqCHBs+R
 aEqYziCPayMDM1HzPI49QKbsUtcA4U=; b=SoRJbCTi8775cjZxEmVypXmLbi3lD
 bZxCsk9MB6Qg4UIVJLb/ZTKY4+jjdBH35YeuMKj9e9pX9gsTUUxRGED+eHYQct28
 8NcX1Ab0sZKWkUXCAJGPIPcEEXl/Mef4SNFDEiBkK22E/5yVn2fF73tYeYSvTJsN
 2fC3bMQI6DN+k4Zbb791wBZyTMoZkGCWTRLP3+35NW0P52lo1BoccDv0uspvvypd
 IEa8LRivUpxw3xeHYrsU65EBOjMJ9+JkmrblhwERMLTQdYjJxvAPMYzEsJ1sA8YD
 MQY9TPxVgNMBDRrfGbGIv3wLJsFbDpzQEThjepbDo6TnHZl9seUiTDeZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/twqJxqCHBs+RaEqYziCPayMDM1HzPI49QKbsUtcA4U=; b=EE09WfIY
 wSaaPiCk8vPhC1PZZOxQwmM9nFuxFWE2XqHyGN98RZN7h1rhxeu7mkB6tgM/KvQv
 CLb4S/IPMuSstmiyn331GkuKxTl5EsH3HdzaLVf68qiSxhxk8iGe/bDlS4OGhC1N
 Ih8FI0ClqIR+jZm9gUJr1KPS1meXcZJbSR3eIhwRbSgm06JJC7ehLyaYkqyI+9Wl
 9Ehqb0WOVBHY3jDaTW4rl7zb5lLnzoxiiH6o6j2h5/nFf0QOVZGVUB4a10mVzPq2
 jzo/XgO2PVKYh+yL1jOpOaX4jgsSKkyL0bzdjj56TfTLwKWynMFHRf3Wk9SuzWzI
 4RE2+/HlWC8Qxw==
X-ME-Sender: <xms:0127X17eYjPY9tVU1wOhjmxBDQfiaoRT8eTHyT9RnuhOY7NhPvAnwA>
 <xme:0127Xy4-f38SpOtx4yLu_C5bTDRFqr9ausEHt_cCPxq7jlp3hNk6zsCuGaoMeFHyC
 facOkrCr9b9yrCUyB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0127X8cl08ggusG9zxw9dphbDiGR0_8vJ2zZh5PYMX8p2jYyMX7JCg>
 <xmx:0127X-JLL-Cso8tlwI2i7qGT8vpfeFvoaCG2ovAFCu1kV0CsorCuiQ>
 <xmx:0127X5If7B5KVWCqhyDr-yt7R5xTB-g-6OAwmjZvulel3b5OGVtzOA>
 <xmx:0127Xx-X3H_ORvmoXs47tNQ-TIUw6vdCPU9VbZRzUuiX-eDbT59pkw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6D3263280068;
 Mon, 23 Nov 2020 01:59:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: indicate CMB support through controller
 capabilities register
Date: Mon, 23 Nov 2020 07:59:25 +0100
Message-Id: <20201123065927.108923-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123065927.108923-1-its@irrelevant.dk>
References: <20201123065927.108923-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Maxim Levitsky <mlevitsky@gmail.com>, Keith Busch <kbusch@kernel.org>
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
index 8a46d9cf015f..c7cba786b491 100644
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
index 01b657b1c5e2..4c599159f533 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2754,6 +2754,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_NVM);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
+    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.29.2


