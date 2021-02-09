Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EA4314994
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:38:27 +0100 (CET)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9NbO-0007sW-3X
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUn-0004wc-V0; Tue, 09 Feb 2021 02:31:37 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:51453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUl-0005XM-KE; Tue, 09 Feb 2021 02:31:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 81E4E31C;
 Tue,  9 Feb 2021 02:31:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=XrRMME8E6KFnM
 4mUx+Xts4NxEBUdQkaA6OVYUEUi+EM=; b=sUpRHadPqwlb9+8RWvSJDHVA3k2+Z
 dZbotcwwLyoc2SIvFKpqg36n9nbVxujkmz4rBXOCtEMuOqzRjhtWK6bjmjWdXn76
 EiAa8taqsvg2AHNNkTpgdtHNylNKdh2Haj0aU9l20rUv2Xk8QZJ8JuKDs2ZKJQZ7
 Rs1PsJVrHXHm84nk5//QgAmvjwmvp4dw2yYb75YYiCS1H/pl8KyCU+0/6qIhpylW
 U6Fd+S2rZzYWdFngjo4jyfMDn+tqboc4eeXuyxOs55LiGQUAai6eaSPfWgF3fLNQ
 UFbP+8ljQeXLjWn/eGYrRN/rI7GHTf/1/xUTAcRzepF0JtygaR75GOA3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XrRMME8E6KFnM4mUx+Xts4NxEBUdQkaA6OVYUEUi+EM=; b=EVvmun2l
 o4xUjwXxmtnL+si3bGe+we4kT0g4KTdfL80js5OclA8tvqsVs8kQJ9g5d6BVG/lm
 4xkE2pZF1OqxGI+/DpLgOvcAzuCkyxr58zEh508uVfEH6KPkZ0RCYpQlxEkr1ady
 55XzYh29xACkzoB/AmLi0msQ2N+XX1Z3kFdxMNM78m/aY04JCfBJ9OUZxTlnyfs5
 UBDtNPl2K7ua4CBNKaFJrROWgYlG1KdLUL6iLEgk0hLatzHdEGDBi2xCEMgQJX0x
 Z1K36cSguEgqbpGCN+YnL7Hq6Ke5L5rxNt4wAy3tk2EV5ORQwnU2eLx+yso9SM5B
 f+E+AGYTukJVcg==
X-ME-Sender: <xms:VDoiYFPUZdtqsYuc1l_0a7uVxjfH5zsgUaIeUGlhR75K5bCtpGNtCA>
 <xme:VDoiYH8VmOW46LtMXtIaEFOrzA3HE6Xe38py1k7hcZxd_2lh1IL5QGd2WaBXtQPRC
 8dKCa_-2J98bmeSI7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:VDoiYESZhU-048UtDS-FEqRhu8uAzK287pVR2iTEsSdq8ldvh8YL7A>
 <xmx:VDoiYBvGKGu5XhNMKFLrOjJqAit1-9Dz3wWTuMda9g-Hv669TEXbxQ>
 <xmx:VDoiYNdfgImV57M1pThta2DPe_3Ciiv-zE_1TvrAXkTlS5TQmJDEIw>
 <xmx:VToiYMxanWaK1wbngTH-jRWW_ZzwD6celMCty4f3WAbqIT20mhnuEKfheDM>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92CA41080057;
 Tue,  9 Feb 2021 02:31:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/56] hw/block/nvme: Process controller reset and shutdown
 differently
Date: Tue,  9 Feb 2021 08:30:13 +0100
Message-Id: <20210209073101.548811-9-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Controller reset ans subsystem shutdown are handled very much the same
in the current code, but some of the steps should be different in these
two cases.

Introduce two new functions, nvme_reset_ctrl() and nvme_shutdown_ctrl(),
to separate some portions of the code from nvme_clear_ctrl(). The steps
that are made different between reset and shutdown are that BAR.CC is not
reset to zero upon the shutdown and namespace data is flushed to
backing storage as a part of shutdown handling, but not upon reset.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h |  2 +-
 hw/block/nvme-ns.c |  2 +-
 hw/block/nvme.c    | 24 ++++++++++++++++++------
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 44bf6271b744..ed3d7e65d597 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -73,6 +73,6 @@ typedef struct NvmeCtrl NvmeCtrl;
 
 int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
-void nvme_ns_flush(NvmeNamespace *ns);
+void nvme_ns_shutdown(NvmeNamespace *ns);
 
 #endif /* NVME_NS_H */
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 37f95951a6b8..a0de53e71878 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -129,7 +129,7 @@ void nvme_ns_drain(NvmeNamespace *ns)
     blk_drain(ns->blkconf.blk);
 }
 
-void nvme_ns_flush(NvmeNamespace *ns)
+void nvme_ns_shutdown(NvmeNamespace *ns)
 {
     blk_flush(ns->blkconf.blk);
 }
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index de52487aaf06..f54c5c6ea44d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2295,6 +2295,20 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
+}
+
+static void nvme_ctrl_reset(NvmeCtrl *n)
+{
+    nvme_clear_ctrl(n);
+    n->bar.cc = 0;
+}
+
+static void nvme_ctrl_shutdown(NvmeCtrl *n)
+{
+    NvmeNamespace *ns;
+    int i;
+
+    nvme_clear_ctrl(n);
 
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
@@ -2302,10 +2316,8 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
             continue;
         }
 
-        nvme_ns_flush(ns);
+        nvme_ns_shutdown(ns);
     }
-
-    n->bar.cc = 0;
 }
 
 static int nvme_start_ctrl(NvmeCtrl *n)
@@ -2472,12 +2484,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             }
         } else if (!NVME_CC_EN(data) && NVME_CC_EN(n->bar.cc)) {
             trace_pci_nvme_mmio_stopped();
-            nvme_clear_ctrl(n);
+            nvme_ctrl_reset(n);
             n->bar.csts &= ~NVME_CSTS_READY;
         }
         if (NVME_CC_SHN(data) && !(NVME_CC_SHN(n->bar.cc))) {
             trace_pci_nvme_mmio_shutdown_set();
-            nvme_clear_ctrl(n);
+            nvme_ctrl_shutdown(n);
             n->bar.cc = data;
             n->bar.csts |= NVME_CSTS_SHST_COMPLETE;
         } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(n->bar.cc)) {
@@ -3088,7 +3100,7 @@ static void nvme_exit(PCIDevice *pci_dev)
 {
     NvmeCtrl *n = NVME(pci_dev);
 
-    nvme_clear_ctrl(n);
+    nvme_ctrl_shutdown(n);
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
-- 
2.30.0


