Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6533249C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:01:43 +0100 (CET)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJb3W-0001fX-2p
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanu-0008HB-Mi; Tue, 09 Mar 2021 06:45:34 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanl-00006Q-B0; Tue, 09 Mar 2021 06:45:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C289E275F;
 Tue,  9 Mar 2021 06:45:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=C99L0/tH1ohpk
 9fIFzQAr03WqmfpfPGKb6ktUnvxpTg=; b=LADxGil9XcjUArrIcTtzH+SHtHBJP
 cqVO9jvAd3vC4CCQM2o+YpFAceKqDLA0mKIU2Neb4n1dTsKHLvh4gAINeFX5q/Sn
 LBX3o5Vm2hboE9dY22zdtoDukerID1shx/zQOTepaSj1Eza1gR8/w5mshdOyFD6h
 Balxkl3MCfz1k9ViDlUPHfx9IXqRz76r8QZC5x/Wmz3rIQ7c5YmGB0PenbtPOjpB
 3QZshXB0LSGU3PD3610Fo7UeCRWzep4tozh1Z4/CYaCMsiy5XwcwmkhmfHX4rtvW
 fU9IXZQ5jwJgDiLggMEwPOu7+Opv4bHQY0ueHToxkjWp59g9kMyjpcC9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=C99L0/tH1ohpk9fIFzQAr03WqmfpfPGKb6ktUnvxpTg=; b=Bpc4pphq
 5kX8HBr8rtfaFvZXKYnK5Ad0tlTGYjUBjAyhIUOF8Lo4H3x3XYZ+0NCF1+l653Nt
 k0CmNWIQ6o2ScGRK6dREjBz3CCL/uAELJbpHrJdkkY4Wr0DCpX06+VMpQqkBX6D7
 Vk4RAeXQv34yjq9SnQCqM/YzI53XBYjyH0NVbEzpDZzyTndnjQKb1XJlg2bK1xoL
 aMo4Dc7tWh1GYv3+/yU+omA0idCZVARCI5ejPd9jrZHD9PmuqvPzXgv32grzVAi9
 K+yIuZcEPFDKLqegCS0wnJfnwOwjtS+8NoerMtSFvJ7QQrr8Gt/GwQstnqYjC+lx
 oU8ZUaCtZ2rbQw==
X-ME-Sender: <xms:0l9HYJD6HFDtqOcNpGihxhx6qVPYbZJWX8HJVqwj9GAuiQdyVcb5kg>
 <xme:0l9HYDCiRqXETQAEzwBptMxG3iCpVvFeE9fjQwVwa8G4vSwhSBVCa1kxxrCjxBo5X
 q7uy4HqMfPSwGmMxZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0l9HYLBYq35Kp1GqZ2wHuU6UNNJ3fp2TJF8NVeUQ_9AiPVrHb4bsrA>
 <xmx:0l9HYOqf-HeADcNyA6VJvRcYlQAefY0TX6QmEPByzu7-iD1iJq05PA>
 <xmx:0l9HYFmsPNDTnp1EG9EDVx9QE_CU6BOzSXGxLPqU3YcO8KmKePjX-Q>
 <xmx:0l9HYNncJ9DzxUmuemqBe4PGFsn0ngzKIgjb4uUiRu1Q7B8pVdTWegHjffE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E5F3240054;
 Tue,  9 Mar 2021 06:45:20 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 04/38] hw/block/nvme: support for multi-controller in
 subsystem
Date: Tue,  9 Mar 2021 12:44:38 +0100
Message-Id: <20210309114512.536489-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
index fc86d01ff32e..55411eccfb54 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -21,9 +21,13 @@ typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     uint8_t     subnqn[256];
 
+    NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
+
     struct {
         char *nqn;
     } params;
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
index 840448bb13f1..283a97b79d57 100644
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
     const char *nqn = subsys->params.nqn ?
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f5a19fd54676..5a63c356bad9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4448,6 +4448,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
     strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
     strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
+
+    id->cntlid = cpu_to_le16(n->cntlid);
+
     id->rab = 6;
     id->ieee[0] = 0x00;
     id->ieee[1] = 0x02;
@@ -4494,6 +4497,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
+    if (n->subsys) {
+        id->cmic |= NVME_CMIC_MULTI_CTRL;
+    }
+
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
@@ -4508,6 +4515,24 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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
@@ -4528,6 +4553,10 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
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


