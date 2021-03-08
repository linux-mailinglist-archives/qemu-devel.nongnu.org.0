Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A53330D72
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:28:43 +0100 (CET)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJF06-0005fh-3T
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv3-0002ym-S1; Mon, 08 Mar 2021 07:23:29 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:50327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv0-0006tZ-18; Mon, 08 Mar 2021 07:23:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1EB30365D;
 Mon,  8 Mar 2021 07:23:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=idtya7nBh5KAK
 LdIKlWEKOm/lApj/BMYnzK/ItvUflI=; b=0FUspVedfwoJ79fhfojh7JEW/xwYK
 j4BHXoE0C1klh8HmvDA3xNqv4i2QeMzxGpCmAmreI6MLoryMaFaDnG5Pud1oYbw2
 LN9KfAfgwXNj3arsBGNUowICPNwpICulAOiFeg1LdMeS0YSM5H51JgRCdqZF0W3B
 iOQLeQv+KU9XG5zMLn2jXDFk2NWvsh4scuTSVLnoCAOW4w683tgVViypzM2Z29UX
 9exXF/gOk7u4GGpMamNPKDTaT5WSMGBiMwTbNGqfb741JHm6T+0WAVW12WoszsXl
 4r1rlytYCkfyqIV+UQmMsrGLt+2K/dNjEsWsMYKZEVscFVQmv7xTNjfAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=idtya7nBh5KAKLdIKlWEKOm/lApj/BMYnzK/ItvUflI=; b=ORq1XYMK
 /fd15Xxp+4qucTba/7aWS+l3FVCURSkzdiIFSpFv7i/CciwDLFNrReG9O35NNRoY
 J8h2AzF0qdBIuzkQhMBVh+sViEQPklLORyO/8XBDVxwWDRU0lAHnL8LWYp0lYTKw
 VdlLAzID71T8kL5tWIgTebh37cbRUFp01LGr3AfJHTwF3iQG2dKxr6i7+ghLRPWv
 PfHfFypZr1GN4+Mjp8NzsStK1YSi6b6cvWc6KxG/EnygbBARSd2b788W+0dhs/Rb
 81Jwzd24lkcbispAP9ApGVIVfH12s463NmLt+qQAOtrgVtQd0JVPIvjpxy7yo7dq
 TzVkQtfp+I0OGQ==
X-ME-Sender: <xms:OhdGYPsRyMvC7vLxqOZWfaFJNl6d_hnQ205pr2hMkezApGVqy7V4cg>
 <xme:OhdGYAdGsQmFlZUV6gFN-xYio8Vaddf2wq6FjkcXmE0aQXKdmndOFWiSJYmoB7tGg
 0PDEoCWd5Kd60PcLMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OhdGYCxzOf1jn1zBFkxJLn_FvEJhQuRqNZTNBRqYgKvB6ey0pp-EyQ>
 <xmx:OhdGYOP9Ygg7ynk69WZssQj4N2tqFGYl0TzI9L2VMmdg_n9hYVNeCQ>
 <xmx:OhdGYP_Px6X3GbRlInhUuN9LkTEa0MN88IrDgBmj_ERjlopApdMUBw>
 <xmx:OhdGYLR-G6bUQMLQojsxHANpFPKBqTXBXhRr2OHwKz-kn0OZyKwVqefgU8g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 42EA0108005C;
 Mon,  8 Mar 2021 07:23:21 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/38] hw/block/nvme: support for multi-controller in subsystem
Date: Mon,  8 Mar 2021 13:22:39 +0100
Message-Id: <20210308122313.286938-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
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
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

We have nvme-subsys and nvme devices mapped together.  To support
multi-controller scheme to this setup, controller identifier(id) has to
be managed.  Earlier, cntlid(controller id) used to be always 0 because
we didn't have any subsystem scheme that controller id matters.

This patch introduced 'cntlid' attribute to the nvme controller
instance(NvmeCtrl) and make it allocated by the nvme-subsys device
mapped to the controller.  If nvme-subsys is not given to the
controller, then it will always be 0 as it was.

Added 'ctrls' array in the nvme-subsys instance to manage attached
controllers to the subsystem with a limit(32).  This patch didn't take
list for the controllers to make it seamless with nvme-ns device.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h |  4 ++++
 hw/block/nvme.h        |  1 +
 hw/block/nvme-subsys.c | 21 +++++++++++++++++++++
 hw/block/nvme.c        | 29 +++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 40f06a4c7db0..4eba50d96a1d 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -20,6 +20,10 @@ typedef struct NvmeNamespace NvmeNamespace;
 typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     uint8_t     subnqn[256];
+
+    NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
 } NvmeSubsystem;
 
+int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+
 #endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 04d4684601fd..b8f5f2d6ffb8 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -134,6 +134,7 @@ typedef struct NvmeCtrl {
     NvmeBus      bus;
     BlockConf    conf;
 
+    uint16_t    cntlid;
     bool        qs_created;
     uint32_t    page_size;
     uint16_t    page_bits;
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index aa82911b951c..e9d61c993c90 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -22,6 +22,27 @@
 #include "nvme.h"
 #include "nvme-subsys.h"
 
+int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    int cntlid;
+
+    for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
+        if (!subsys->ctrls[cntlid]) {
+            break;
+        }
+    }
+
+    if (cntlid == ARRAY_SIZE(subsys->ctrls)) {
+        error_setg(errp, "no more free controller id");
+        return -1;
+    }
+
+    subsys->ctrls[cntlid] = n;
+
+    return cntlid;
+}
+
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 84c7e2798026..4e8e15a82da0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4439,6 +4439,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
     strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
+
+    id->cntlid = cpu_to_le16(n->cntlid);
+
     id->rab = 6;
     id->ieee[0] = 0x00;
     id->ieee[1] = 0x02;
@@ -4485,6 +4488,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
+    if (n->subsys) {
+        id->cmic |= NVME_CMIC_MULTI_CTRL;
+    }
+
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
@@ -4499,6 +4506,24 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     n->bar.intmc = n->bar.intms = 0;
 }
 
+static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
+{
+    int cntlid;
+
+    if (!n->subsys) {
+        return 0;
+    }
+
+    cntlid = nvme_subsys_register_ctrl(n, errp);
+    if (cntlid < 0) {
+        return -1;
+    }
+
+    n->cntlid = cntlid;
+
+    return 0;
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
@@ -4519,6 +4544,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
+    if (nvme_init_subsys(n, errp)) {
+        error_propagate(errp, local_err);
+        return;
+    }
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
-- 
2.30.1


