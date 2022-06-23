Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D187F558A96
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:20:12 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UFH-00089N-7e
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDh-0005ba-1e; Thu, 23 Jun 2022 17:18:33 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:58551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDf-000447-6z; Thu, 23 Jun 2022 17:18:32 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2FFA03200920;
 Thu, 23 Jun 2022 17:18:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019107; x=
 1656105507; bh=cn4VKbqnAk8XkRrnxeF4mMjoV8m+KL6EIkNrVpCKnOk=; b=e
 XkFp2d5a0vyNNdyGg7ZY2zbTes+1j7s5xTN7nGFb9ulUNwdwjUfEZpj5uQYghOIq
 ugVmHuGUEyS0htd8BlO/ZKqYUtqMIUwF2+6/a2ypCaqfTwDwb3U0tgMS4IQLfFvq
 26iSvJ0Nk8bGziK1H+pgROvs5WwomzttxCqi701lHK6ZBFyrTCV1BRr3D0kjI2g4
 vB2b9E1iSyjJw1sa6wIgoNv5dqS8W9FXqWJFNaValiICzHNUvEpDpYmvSvepsdhu
 yjHqp9jcP3c4S26qzuIk3qONZdWbv4dqU167/1Ve+P9vwDDgnqNbN7BFGPEych/3
 cLg4M7sJm5xVPvkwiuVwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019107; x=1656105507; bh=cn4VKbqnAk8Xk
 RrnxeF4mMjoV8m+KL6EIkNrVpCKnOk=; b=G9/epwDwWszGDRPCfzTOY6kssxDN8
 PPaGS8jb3XaWvugmUIzqhGm+zKzAnW9ZMSMKPAES88noH/K/MttdKIWFxSolyRMV
 EB+Q5KGCbr1esm8i9twOR8NegCYFP75zrr0LGqFI15RwLsp3BIg7ow5QxpTxVEbg
 wHfd301cisTq6esuWHvKUFnpFKEEx+juLcLUEehJFE9eMqrsgE2sMXiSe+oxIRhL
 1ejs9fU4p0OcIZ9/3A+SO26mnGVUJY2PnR7BziAhwm9bPJKLjtWZxGzqHS/pIPK2
 98yL/rHR1mCpsdhQIBxo8ZJ+8yK/7iNiXTy+/8xuuszcvv+CXau4vG0jw==
X-ME-Sender: <xms:o9i0YjaJ0HkiuU9MN6IhbYxRW7NA3e1LXrnwc_ElP45Rkq6A83GuQA>
 <xme:o9i0YiYMz9J1jU6UZ7n_mZ66kEg-fbuVYj4SXZkzN2R_8mrbTokT-WVEg03_EyRqw
 -CD357UZf95t_DV9Q0>
X-ME-Received: <xmr:o9i0Yl-oeuX623TNLx4tbiXvPB5hYh2RWKnmInbGAMq2QMLnmZmhpEawmzpzS0eEqLs6QrWdjxEzPrlDUFHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeegvddtheeukedufedugeeigfdvhfetgfegtddvfeejheevgeeijedvfedt
 tdelheenucffohhmrghinhepqhguvghvrdhiugenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:o9i0Ypp29sZMb9WOMol6s98EhpW4wscCylI2x0A4CI2Gn46odEaVwA>
 <xmx:o9i0YuqfukO3laUkbOZTV6uLNZ3rr-AcsKUy_B0XiWtyDRf4tFnqpQ>
 <xmx:o9i0YvTuwFrtx7wO1kABB_pVOoXlpQyja7xsvsHnyhaYUcCsSRBguA>
 <xmx:o9i0YhW_NIIq8tsXS4WVfFuVVY_rG0H9SPviPvUw4Lk5ZL2bT46sAQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:26 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 01/12] hw/nvme: fix incorrect use of errp/local_err
Date: Thu, 23 Jun 2022 23:18:10 +0200
Message-Id: <20220623211821.50534-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
References: <20220623211821.50534-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Make nvme_check_constraints() return an int and fix incorrect use of
errp/local_err.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d349b3e42620..c8c4a0718fc4 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6808,7 +6808,7 @@ static const MemoryRegionOps nvme_cmb_ops = {
     },
 };
 
-static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
+static int nvme_check_params(NvmeCtrl *n, Error **errp)
 {
     NvmeParams *params = &n->params;
 
@@ -6822,38 +6822,38 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     if (n->namespace.blkconf.blk && n->subsys) {
         error_setg(errp, "subsystem support is unavailable with legacy "
                    "namespace ('drive' property)");
-        return;
+        return -1;
     }
 
     if (params->max_ioqpairs < 1 ||
         params->max_ioqpairs > NVME_MAX_IOQPAIRS) {
         error_setg(errp, "max_ioqpairs must be between 1 and %d",
                    NVME_MAX_IOQPAIRS);
-        return;
+        return -1;
     }
 
     if (params->msix_qsize < 1 ||
         params->msix_qsize > PCI_MSIX_FLAGS_QSIZE + 1) {
         error_setg(errp, "msix_qsize must be between 1 and %d",
                    PCI_MSIX_FLAGS_QSIZE + 1);
-        return;
+        return -1;
     }
 
     if (!params->serial) {
         error_setg(errp, "serial property not set");
-        return;
+        return -1;
     }
 
     if (n->pmr.dev) {
         if (host_memory_backend_is_mapped(n->pmr.dev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmr.dev)));
-            return;
+            return -1;
         }
 
         if (!is_power_of_2(n->pmr.dev->size)) {
             error_setg(errp, "pmr backend size needs to be power of 2 in size");
-            return;
+            return -1;
         }
 
         host_memory_backend_set_mapped(n->pmr.dev, true);
@@ -6862,64 +6862,64 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     if (n->params.zasl > n->params.mdts) {
         error_setg(errp, "zoned.zasl (Zone Append Size Limit) must be less "
                    "than or equal to mdts (Maximum Data Transfer Size)");
-        return;
+        return -1;
     }
 
     if (!n->params.vsl) {
         error_setg(errp, "vsl must be non-zero");
-        return;
+        return -1;
     }
 
     if (params->sriov_max_vfs) {
         if (!n->subsys) {
             error_setg(errp, "subsystem is required for the use of SR-IOV");
-            return;
+            return -1;
         }
 
         if (params->sriov_max_vfs > NVME_MAX_VFS) {
             error_setg(errp, "sriov_max_vfs must be between 0 and %d",
                        NVME_MAX_VFS);
-            return;
+            return -1;
         }
 
         if (params->cmb_size_mb) {
             error_setg(errp, "CMB is not supported with SR-IOV");
-            return;
+            return -1;
         }
 
         if (n->pmr.dev) {
             error_setg(errp, "PMR is not supported with SR-IOV");
-            return;
+            return -1;
         }
 
         if (!params->sriov_vq_flexible || !params->sriov_vi_flexible) {
             error_setg(errp, "both sriov_vq_flexible and sriov_vi_flexible"
                        " must be set for the use of SR-IOV");
-            return;
+            return -1;
         }
 
         if (params->sriov_vq_flexible < params->sriov_max_vfs * 2) {
             error_setg(errp, "sriov_vq_flexible must be greater than or equal"
                        " to %d (sriov_max_vfs * 2)", params->sriov_max_vfs * 2);
-            return;
+            return -1;
         }
 
         if (params->max_ioqpairs < params->sriov_vq_flexible + 2) {
             error_setg(errp, "(max_ioqpairs - sriov_vq_flexible) must be"
                        " greater than or equal to 2");
-            return;
+            return -1;
         }
 
         if (params->sriov_vi_flexible < params->sriov_max_vfs) {
             error_setg(errp, "sriov_vi_flexible must be greater than or equal"
                        " to %d (sriov_max_vfs)", params->sriov_max_vfs);
-            return;
+            return -1;
         }
 
         if (params->msix_qsize < params->sriov_vi_flexible + 1) {
             error_setg(errp, "(msix_qsize - sriov_vi_flexible) must be"
                        " greater than or equal to 1");
-            return;
+            return -1;
         }
 
         if (params->sriov_max_vi_per_vf &&
@@ -6927,7 +6927,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "sriov_max_vi_per_vf must meet:"
                        " (sriov_max_vi_per_vf - 1) %% %d == 0 and"
                        " sriov_max_vi_per_vf >= 1", NVME_VF_RES_GRANULARITY);
-            return;
+            return -1;
         }
 
         if (params->sriov_max_vq_per_vf &&
@@ -6936,9 +6936,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "sriov_max_vq_per_vf must meet:"
                        " (sriov_max_vq_per_vf - 1) %% %d == 0 and"
                        " sriov_max_vq_per_vf >= 2", NVME_VF_RES_GRANULARITY);
-            return;
+            return -1;
         }
     }
+
+    return 0;
 }
 
 static void nvme_init_state(NvmeCtrl *n)
@@ -7336,7 +7338,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
     NvmeNamespace *ns;
-    Error *local_err = NULL;
     NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
 
     if (pci_is_vf(pci_dev)) {
@@ -7348,9 +7349,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         n->subsys = pn->subsys;
     }
 
-    nvme_check_constraints(n, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (nvme_check_params(n, errp)) {
         return;
     }
 
@@ -7358,7 +7357,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
               &pci_dev->qdev, n->parent_obj.qdev.id);
 
     if (nvme_init_subsys(n, errp)) {
-        error_propagate(errp, local_err);
         return;
     }
     nvme_init_state(n);
-- 
2.36.1


