Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA52F9C11
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:56:53 +0100 (CET)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RHI-0006B4-8G
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R82-0000jA-Im; Mon, 18 Jan 2021 04:47:18 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R80-00013X-OF; Mon, 18 Jan 2021 04:47:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F3BFA5C0175;
 Mon, 18 Jan 2021 04:47:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0YNmbcXL7GDFS
 bbeEk/dJsjw1Rx2NO0Ag+1LUNqHdtU=; b=P9df1ArzO7z9tDFatQFVqODa+CXdr
 h2F9AAN85LXH2VXGv8vMaf5UyhDYfwaxMJB1FrCNzVJ0lDT/2c1W9pVkUNAFnH7F
 8WW22FInKgcd5ZHp3pvgAMCt1+CbbdFgQa/zCA5ehmTbaW3xUkVEU/5AVi5rJpua
 rAHWhlqxr+P4JSJFl+84Q2AikJAxY16FNsfX/HkowFCRwSskieHcGJBsb9Dr2D5I
 UdYuIMIQvYPyn4TQ0QyS/XpC4gzEjQ+/Jca/B6Qbsed3LlBdsTyriGHsJtMcpCYk
 tKexOOhh2ZvSKxfbSGFzZ4ZMlAYCI7ZNf619HMylU/h9FESPIz8M8HJtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0YNmbcXL7GDFSbbeEk/dJsjw1Rx2NO0Ag+1LUNqHdtU=; b=m7M2y9cw
 yEI5WRgW8oxfQNaenQTZcn/pX0+c6mcY6NtwRzxVVaxf1C3w9lUP5Lz53fRi+NLn
 F1P3bXEGAaCtwaL4qyMMjUCoDqHfAameIkHkpxmZTMrSvfKH+rcYdn77xW1SLb1d
 g2xboTSl/vS1XKnKwGRUpoiPb9jwYKeRyc2yqqN8INWiV8WY55yY5CS3dMc8V3pP
 yC3jyM1XicIuf4OhM1p/wQ13AEno5F6cEDS79xZFLGiar1XbeuWq6HvP9B+kiwuN
 Aq23ELIle662Tzzl/9W9BerhIX+zrAXd7ScOKtpSNRKlcc2xVkcy3xmUBcwoYdbc
 4tWEINksKWThOA==
X-ME-Sender: <xms:I1kFYPXqCSsvdG2tDsJiXd_-M8rd5PWfgyJVPCTjF9PiiHvrc3LiSA>
 <xme:I1kFYHlEI5RI9a8otU_vpAQjvI3972MyBeezU7aKIhjxG52SVPuH8fddsEDcSEsmj
 uD8UvT-bW7QyvIyyLI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:I1kFYLY1dcfYp85gkFzj40cmWwiRja9hYOz3Q3P7-HIcN0ea1-Z6NA>
 <xmx:I1kFYKXO1Ndo-rE5JNbIhIasXVJ--XLYMt7uc1GiGAhqk_OGEsjhtA>
 <xmx:I1kFYJn-o-kLOfrAubSIGLLoJzqr_4UDTW5pWeOvixsTFGlu70MQbQ>
 <xmx:I1kFYHb3ywMzH2U80I1F3r2x_OYzFR9DWQg16AE5GSf79-r9nYtUig>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0AD924005D;
 Mon, 18 Jan 2021 04:47:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] hw/block/nvme: allow cmb and pmr to coexist
Date: Mon, 18 Jan 2021 10:46:58 +0100
Message-Id: <20210118094705.56772-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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
index ec2104fcf3b6..f3bea582b3c0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -29,14 +29,13 @@
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
@@ -109,7 +108,7 @@
 #define NVME_DB_SIZE  4
 #define NVME_SPEC_VER 0x00010300
 #define NVME_CMB_BIR 2
-#define NVME_PMR_BIR 2
+#define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
 #define NVME_TEMPERATURE_WARNING 0x157
 #define NVME_TEMPERATURE_CRITICAL 0x175
@@ -4083,7 +4082,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
-    if (!n->params.cmb_size_mb && n->pmrdev) {
+    if (n->pmrdev) {
         if (host_memory_backend_is_mapped(n->pmrdev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmrdev)));
@@ -4180,9 +4179,6 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* Controller Capabilities register */
-    NVME_CAP_SET_PMRS(n->bar.cap, 1);
-
     /* PMR Capabities register */
     n->bar.pmrcap = 0;
     NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
@@ -4283,7 +4279,9 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
-    } else if (n->pmrdev) {
+    }
+
+    if (n->pmrdev) {
         nvme_init_pmr(n, pci_dev);
     }
 
@@ -4356,6 +4354,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
+    NVME_CAP_SET_PMRS(n->bar.cap, n->pmrdev ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.30.0


