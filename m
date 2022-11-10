Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCF624D79
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otFid-0000ET-1t; Thu, 10 Nov 2022 17:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFia-0000Ba-8b; Thu, 10 Nov 2022 17:08:16 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otFiV-0007ba-E8; Thu, 10 Nov 2022 17:08:16 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A63A85C00DA;
 Thu, 10 Nov 2022 17:08:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Nov 2022 17:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668118090; x=
 1668204490; bh=w79ngmaa0yVHyMHk4lu7wSgXhqkIB9pDZtu4N99wv3E=; b=q
 3wtS8HxtEKs9LxKaWtec96RqDR++wzvMF067hQiHj5Ez5zkANsFRCGqm7d0x5bvG
 03PBvy1RexkxLGhYzgEJO2ILeHKZMfzdQ9T5auBmk8uvit97SwRHFbgOEFCu5V0c
 a77GEZZyLA7RTsO4RdWVleagI0IVmtrYJhJskRgD24Eqt1gU+DhjfXckWGTpNVsi
 c7owCTQXpAMD5Ffmb+xtQauxsfN0PYc45r4Ucgn2D4R24nsh+6ZoSmv/RDIc+/h9
 9ET9WKRJXG96Qqzav8wQf/a/JlOuomMiar6zCisgl5c01nJJuQpHGgazHr6l58Y6
 UxYYzEUmYFbc21NmfGr1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668118090; x=
 1668204490; bh=w79ngmaa0yVHyMHk4lu7wSgXhqkIB9pDZtu4N99wv3E=; b=R
 oCRXmqYngY52g2UJsf+qNP8BAH9FRQaEknnscfaWv75Owtt0Jcwk78ieHxf5jVPQ
 XwJJP+AO1YKFWRFuoIkoRjB9FZRt/6JVfF0iv2SrGzfmoanmRCa2IbhqTdGKLFJI
 IBVSIA+S8Nb2s80ewufHabJN0j6PNa0jbfHhLmjNJkZJtKXE74HWjMjCccYPrHpV
 kFJLlKlopsmGTJ7rLbUxj/YKs0nOPZpnP0U5iohncMFCCaO/nDiKz7d+Rj/XARqf
 0um+XmEhbP/aNz/QXriX2AsfSDzTUS1gA+KmCQXSizCkelpM0Uf0YFILWyyVir6E
 509tsmFSnY4Ybp25lXaoA==
X-ME-Sender: <xms:SnZtY4TPIhrUILt63l5fbRydTcnkHQ-YbAo_8TW0ohVc3fyP3wsVAQ>
 <xme:SnZtY1wP6XR3fN3HdInAePZ-_6WMtrf5homWSHNDInBFUQxocTlGGt70XVuz1wMUW
 QMcoXQdFx9DTIWMtKs>
X-ME-Received: <xmr:SnZtY12KOBPCFIAbXv5h7ofKVYHICVt_QVnGcmTWWPFBm25Twbg3n8D_MLmqgyMj1Fjb_U2IaFC6yV7sR3o1SypcZ8jemdxUWTjdcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejieejjedviedtgeehieevuefghffgjefhvddtledufedtvddthffhieel
 keeuleenucffohhmrghinhepqhguvghvrdhiugenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SnZtY8DjAXRRuzcp1lJy7rGEGiLeZpll9FkfDMbq5OvIKk-kBuyVRw>
 <xmx:SnZtYxg9sMjXT_7zuhsSHwGyArERjaCyoH8SJ_BcyD7AxDYC-Gm8zw>
 <xmx:SnZtY4ov9GwRjZq8ApEiokjYsiXuAQ_U7ptwvY3PYI1BJzYNgSMgPg>
 <xmx:SnZtY_YIAIlx2ckaZf4p8scWWNf6Q_9hDuYy4Me_ogK-poXYWb9-_Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 17:08:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/2] hw/nvme: fix incorrect use of errp/local_err
Date: Thu, 10 Nov 2022 23:08:04 +0100
Message-Id: <20221110220805.26816-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110220805.26816-1-its@irrelevant.dk>
References: <20221110220805.26816-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6817; i=k.jensen@samsung.com;
 h=from:subject; bh=VHs1Ai0dI/NwJg2dqhwDBpUxHt7606UKC+LaQGUmslY=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNtdkXu6Xv22Hx1kIAIbEG//2PqtBS5ifLPrMQQ
 HcwCTh2rhYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbXZFAAoJEE3hrzFtTw3p3D
 4H/1+1jRi6Liz7OdBrK+YxxIj4PWVzubEgtNbO8mZd+hs+5h18ezjngvdffbWfeO6xe0ACs7dvzOmj
 8MyI6w1Zn1SS94L+VIUq63cfewJAa8UITJoXSGV15sR6H6xt/Rau/QQgj8x7hOGGJN3Ftao7O7dkrB
 yANBhik0p5D6/8bGdD9GZ/sSOZObUxAySDW4iNb9rQCSePlULkM+++JFWXpjUGsklKTf8RuWQPIzgG
 blY6eoTIivZpbik0AwOBZYls50EWfB5Ar7esZSNroHu2FHPQVfvvn/n9xfjzWLw2f+eo3+Gc8cyCJX
 ELjlvjEBAi0NvHb9QvXj6Ik6Z2c6PEkEgc46u2
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Remove an unnecessary local Error value in nvme_realize(). In the
process, change nvme_check_constraints() into returning a bool.

Finally, removing the local Error value also fixes a bug where an error
returned from nvme_init_subsys() would be lost.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac3885ce5079..a5c0a5fa6ce2 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7035,7 +7035,7 @@ static const MemoryRegionOps nvme_cmb_ops = {
     },
 };
 
-static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
+static bool nvme_check_params(NvmeCtrl *n, Error **errp)
 {
     NvmeParams *params = &n->params;
 
@@ -7049,38 +7049,38 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     if (n->namespace.blkconf.blk && n->subsys) {
         error_setg(errp, "subsystem support is unavailable with legacy "
                    "namespace ('drive' property)");
-        return;
+        return false;
     }
 
     if (params->max_ioqpairs < 1 ||
         params->max_ioqpairs > NVME_MAX_IOQPAIRS) {
         error_setg(errp, "max_ioqpairs must be between 1 and %d",
                    NVME_MAX_IOQPAIRS);
-        return;
+        return false;
     }
 
     if (params->msix_qsize < 1 ||
         params->msix_qsize > PCI_MSIX_FLAGS_QSIZE + 1) {
         error_setg(errp, "msix_qsize must be between 1 and %d",
                    PCI_MSIX_FLAGS_QSIZE + 1);
-        return;
+        return false;
     }
 
     if (!params->serial) {
         error_setg(errp, "serial property not set");
-        return;
+        return false;
     }
 
     if (n->pmr.dev) {
         if (host_memory_backend_is_mapped(n->pmr.dev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmr.dev)));
-            return;
+            return false;
         }
 
         if (!is_power_of_2(n->pmr.dev->size)) {
             error_setg(errp, "pmr backend size needs to be power of 2 in size");
-            return;
+            return false;
         }
 
         host_memory_backend_set_mapped(n->pmr.dev, true);
@@ -7089,64 +7089,64 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     if (n->params.zasl > n->params.mdts) {
         error_setg(errp, "zoned.zasl (Zone Append Size Limit) must be less "
                    "than or equal to mdts (Maximum Data Transfer Size)");
-        return;
+        return false;
     }
 
     if (!n->params.vsl) {
         error_setg(errp, "vsl must be non-zero");
-        return;
+        return false;
     }
 
     if (params->sriov_max_vfs) {
         if (!n->subsys) {
             error_setg(errp, "subsystem is required for the use of SR-IOV");
-            return;
+            return false;
         }
 
         if (params->sriov_max_vfs > NVME_MAX_VFS) {
             error_setg(errp, "sriov_max_vfs must be between 0 and %d",
                        NVME_MAX_VFS);
-            return;
+            return false;
         }
 
         if (params->cmb_size_mb) {
             error_setg(errp, "CMB is not supported with SR-IOV");
-            return;
+            return false;
         }
 
         if (n->pmr.dev) {
             error_setg(errp, "PMR is not supported with SR-IOV");
-            return;
+            return false;
         }
 
         if (!params->sriov_vq_flexible || !params->sriov_vi_flexible) {
             error_setg(errp, "both sriov_vq_flexible and sriov_vi_flexible"
                        " must be set for the use of SR-IOV");
-            return;
+            return false;
         }
 
         if (params->sriov_vq_flexible < params->sriov_max_vfs * 2) {
             error_setg(errp, "sriov_vq_flexible must be greater than or equal"
                        " to %d (sriov_max_vfs * 2)", params->sriov_max_vfs * 2);
-            return;
+            return false;
         }
 
         if (params->max_ioqpairs < params->sriov_vq_flexible + 2) {
             error_setg(errp, "(max_ioqpairs - sriov_vq_flexible) must be"
                        " greater than or equal to 2");
-            return;
+            return false;
         }
 
         if (params->sriov_vi_flexible < params->sriov_max_vfs) {
             error_setg(errp, "sriov_vi_flexible must be greater than or equal"
                        " to %d (sriov_max_vfs)", params->sriov_max_vfs);
-            return;
+            return false;
         }
 
         if (params->msix_qsize < params->sriov_vi_flexible + 1) {
             error_setg(errp, "(msix_qsize - sriov_vi_flexible) must be"
                        " greater than or equal to 1");
-            return;
+            return false;
         }
 
         if (params->sriov_max_vi_per_vf &&
@@ -7154,7 +7154,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "sriov_max_vi_per_vf must meet:"
                        " (sriov_max_vi_per_vf - 1) %% %d == 0 and"
                        " sriov_max_vi_per_vf >= 1", NVME_VF_RES_GRANULARITY);
-            return;
+            return false;
         }
 
         if (params->sriov_max_vq_per_vf &&
@@ -7163,9 +7163,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "sriov_max_vq_per_vf must meet:"
                        " (sriov_max_vq_per_vf - 1) %% %d == 0 and"
                        " sriov_max_vq_per_vf >= 2", NVME_VF_RES_GRANULARITY);
-            return;
+            return false;
         }
     }
+
+    return true;
 }
 
 static void nvme_init_state(NvmeCtrl *n)
@@ -7564,7 +7566,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
     NvmeNamespace *ns;
-    Error *local_err = NULL;
     NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
 
     if (pci_is_vf(pci_dev)) {
@@ -7576,9 +7577,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         n->subsys = pn->subsys;
     }
 
-    nvme_check_constraints(n, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!nvme_check_params(n, errp)) {
         return;
     }
 
@@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
               &pci_dev->qdev, n->parent_obj.qdev.id);
 
     if (nvme_init_subsys(n, errp)) {
-        error_propagate(errp, local_err);
         return;
     }
     nvme_init_state(n);
-- 
2.38.1


