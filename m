Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189272C0079
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 08:10:48 +0100 (CET)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5zp-0001HL-S4
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 02:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p5-0005Mu-NS; Mon, 23 Nov 2020 01:59:39 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p1-00074f-4C; Mon, 23 Nov 2020 01:59:39 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BADC5C0101;
 Mon, 23 Nov 2020 01:59:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Nov 2020 01:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=UzHndcDiAeSOP
 8LCJAaHGU/fA9PsoWVVDW797xf53gA=; b=u4ZhqBiynK5e/+XvAcfGJ+yemSE+A
 jhqESbFsldAXpA5XWfiSPy5EL2K/YneqB3djMzUbbQlQGwY7jrdnhZfNpiRM7Cqj
 iXWkBP3iWz1TK9NnNmOX2ZVKduR+AZPiqfWzlEtFxWNsLTPh7nNIrBK/yJ5ayRRA
 sl/rVkNpjrOpk237a2vxbnLT+XKYwAy+c677h8SVzaRZIFrTbuxahwARc4G3KDuP
 8Oc6BHlgeUB3f0u+H9NX8ud2VzRyO+x0PF0lIAplfWKvsmicwWqoj9re3lmP7i3B
 E4b6Y/z0iGlb3ntW9sLKI0dIiU+6zGr0C9bI/141l8zK/sI3N+9aJ419g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=UzHndcDiAeSOP8LCJAaHGU/fA9PsoWVVDW797xf53gA=; b=jVtXdLeJ
 Q6WRWyqXJwHt3g8I97x0SD4ICOY9a35bf+Hdu9WfSopwSbbdIvdvcgQaq7Yf6IZ9
 Z/16+9s+RPZaWYrd7Ldq/hwy0++lUAqbFtu10SRq9j6c9dC2k2uG15cbkrSbjt0H
 FXtaV/gkIrXxeoiLs7kVyExHzQD0X8SsdG4PCOBonpjTtCRnCpiCdd55uvsuFqU+
 aX6fY3QKV+dimzMCryb6rQ5hJrozGrnwcSPJrqbAUv5EFcvr2Sz1bcQbmDv9GHYW
 NEoe5EBdELbLoVq4VKaavOm//fI/1d8NF9qC8FDVJyaXXi05Ppfi/a9edbYS3S1z
 7am0mroLjy2gvg==
X-ME-Sender: <xms:1l27X9EavB3cHo61c8iwAn-Ysn_tIyJC1DOBqu85QEnoZeB8-vIRBA>
 <xme:1l27XyVN0efb2Vp4N7nhWcvrONxuzSjKwcB0GkJgl1XQMMHRetu2d2M8h27xbUECj
 vU-aZ7roocdyhf4yR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1l27X_Ju6er4JkmDbKFFpjceyQminJ3e9I4L0rqnDq20L2TChGRPnw>
 <xmx:1l27XzEVDSdkGOhebO-U8WeAqA8ZBF2tBjzlEZOMbeV4pjx8yVeUAQ>
 <xmx:1l27XzXQC6U7KC42QiKqzsPfci-93wqhNXPxStApthUV6dTXyN8BBA>
 <xmx:1l27X5dPCG8Uh9NwbSr6x43GDptQ_QnxWnp4Ja_Hcc2bC8PJOL9dmw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A0973280064;
 Mon, 23 Nov 2020 01:59:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: allow cmb and pmr to coexist
Date: Mon, 23 Nov 2020 07:59:27 +0100
Message-Id: <20201123065927.108923-4-its@irrelevant.dk>
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
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With BAR 4 now free to use, allow PMR and CMB to be enabled
simultaneously.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index db8c5ae2f527..72d5449121c7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -28,14 +28,13 @@
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
  *
- * cmb_size_mb= and pmrdev= options are mutually exclusive due to limitation
- * in available BAR's. cmb_size_mb= will take precedence over pmrdev= when
- * both provided.
  * Enabling pmr emulation can be achieved by pointing to memory-backend-file.
  * For example:
  * -object memory-backend-file,id=<mem_id>,share=on,mem-path=<file_path>, \
  *  size=<size> .... -device nvme,...,pmrdev=<mem_id>
  *
+ * The PMR will use BAR 4/5 exclusively.
+ *
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
@@ -76,7 +75,7 @@
 #define NVME_DB_SIZE  4
 #define NVME_SPEC_VER 0x00010300
 #define NVME_CMB_BIR 2
-#define NVME_PMR_BIR 2
+#define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
 #define NVME_TEMPERATURE_WARNING 0x157
 #define NVME_TEMPERATURE_CRITICAL 0x175
@@ -2520,7 +2519,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
-    if (!n->params.cmb_size_mb && n->pmrdev) {
+    if (n->pmrdev) {
         if (host_memory_backend_is_mapped(n->pmrdev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmrdev)));
@@ -2610,9 +2609,6 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* Controller Capabilities register */
-    NVME_CAP_SET_PMRS(n->bar.cap, 1);
-
     /* PMR Capabities register */
     n->bar.pmrcap = 0;
     NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
@@ -2705,7 +2701,9 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
-    } else if (n->pmrdev) {
+    }
+
+    if (n->pmrdev) {
         nvme_init_pmr(n, pci_dev);
     }
 }
@@ -2775,6 +2773,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
+    NVME_CAP_SET_PMRS(n->bar.cap, n->pmrdev ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.29.2


