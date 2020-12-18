Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95EB2DE369
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:46:50 +0100 (CET)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqG5p-0003GL-P7
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFp7-0003bO-Jh; Fri, 18 Dec 2020 08:29:34 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFor-0002v5-Bi; Fri, 18 Dec 2020 08:29:33 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 6D9295E8;
 Fri, 18 Dec 2020 08:29:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Dec 2020 08:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=GG57It1ERfvEk
 xwNAf5+Ns1dYD6+oWHN/nXMMZpoF0M=; b=aahi/pPPckcuYGWb0/S29ezpNKOwi
 FIwFBl5OymSfktSzcM9iyQnPHCCZi2vaybZ+pxHyNYTHIzbkZcA7V5I1zy5w7+sc
 qugc4BmTf6lMsU7Ma4WD1Ys1YbVgTFLTX57NsliVaPYAg/WIyN/8neZ62ZXtS4uY
 XChwxn2kpLKHXDq89xbtXpDG/GqBhLqQ6z+wsk2lnGwpqsSy7hiu2Cg07+9nAo8v
 TALkTMcZQSFkUXjkpVHagl1Ek/59zowJdPkZcnIcucXUItugX2c+z6W1yX+2wwim
 onODvgJWJKJRwKD3H247BpmJkAvuPFEoHqKNwDhPZbAjMAqMSmeWm4fMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GG57It1ERfvEkxwNAf5+Ns1dYD6+oWHN/nXMMZpoF0M=; b=Y4mtbGix
 Z5NKvkOPuiXU0k8X1hWNuYXBSmFtgsgTXPkzAOSNmfQYrL6GKxU1jRAXjUvZPs+t
 LDsV/iLW3vN1MHdnuv+NQEHGCLOgt+EPyaDjGRMoFrrMChWGHauAuavk5C0Ip5rM
 1iZzUXanzeASMSkJCFa2iJCbQvLuCuB0Ooq259f00WESFfQtYbm7g/6ICwMUhhOi
 T1tUDwXKiU4/NqW44OR3d9fy+UULW3uCJ0EAkKJGUWP+Pc3PYESgf4GTwAvFqk5a
 DI4yX4IA4KW8fsneXxV2pDMuWDzIn68Ko/8LetjrQf/tXl+H6eWFUs+r88u8gCHL
 UowgfXIJ5SlNAg==
X-ME-Sender: <xms:qa7cXyVRQk31_KN3cyuTuhJdOXUjmRLYmaywZOZRMF8X6x93e1YXCg>
 <xme:qa7cX3MOjlWtMF7zgBe-wUKRhLQ7cfiDC8tPM8DkTVjDKmC8uw4OKhJF46PUtRD-U
 cbqFpAe2E_9FhFqsnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:qa7cX91LYBFkypEuffiXcbKRrVIoJ8udytix__mrg2TWem_9xMJItA>
 <xmx:qa7cXzT2r0_O40ZN8C3JyKBVrtt5Orz3we281zDkw6Pd5v-uhQCejg>
 <xmx:qa7cXwn3P9JY8HW4y1fiFsfgLGHio8sd84MM0qwV635iyXRS-wsDjw>
 <xmx:qa7cX4kUpo2G957recmV9s3aGhmTyCi3aYrXGwtD_-nrbkEFw8RpvQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE375240064;
 Fri, 18 Dec 2020 08:29:11 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] hw/block/nvme: allow cmb and pmr to coexist
Date: Fri, 18 Dec 2020 14:29:00 +0100
Message-Id: <20201218132905.967326-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218132905.967326-1-its@irrelevant.dk>
References: <20201218132905.967326-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
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
index 8a7f682cb3ab..69f2fe4bd4ff 100644
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
@@ -2812,7 +2811,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
-    if (!n->params.cmb_size_mb && n->pmrdev) {
+    if (n->pmrdev) {
         if (host_memory_backend_is_mapped(n->pmrdev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmrdev)));
@@ -2902,9 +2901,6 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* Controller Capabilities register */
-    NVME_CAP_SET_PMRS(n->bar.cap, 1);
-
     /* PMR Capabities register */
     n->bar.pmrcap = 0;
     NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
@@ -2997,7 +2993,9 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
-    } else if (n->pmrdev) {
+    }
+
+    if (n->pmrdev) {
         nvme_init_pmr(n, pci_dev);
     }
 }
@@ -3067,6 +3065,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
+    NVME_CAP_SET_PMRS(n->bar.cap, n->pmrdev ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.29.2


