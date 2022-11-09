Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749F62294C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:55:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osiif-0002a2-Vq; Wed, 09 Nov 2022 05:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osiid-0002ZC-Rr; Wed, 09 Nov 2022 05:54:07 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1osiib-0007vG-RE; Wed, 09 Nov 2022 05:54:07 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0BA0E3200AB5;
 Wed,  9 Nov 2022 05:54:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Nov 2022 05:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667991242; x=
 1668077642; bh=oLXqTGheG6ALxYmdT4gDwH5AD2rgIi5FRcTGJrij16g=; b=q
 2tYbHSueCsVH708JzQXFltbPLEA4ewuePpHGhobHWSUMWbFDQemzR8usCbqe3t+G
 GZ0lCvaMHlM0ntHC6x0/bHEEKM8CNnKLWI1nttt1KYPMWnirsyUSUUSOyuDvh6Yc
 eIULVIc74rpd8p7lTc46SevsoIT6YLx8hJH7QDA+HLFoIjMi+fKk7UolPLtVtATu
 Psz3sMiJNWk5wXi0tIQTEkYiJSPcmdby8rq2RxZ+vk85WvnmJntOcWgrOphm1XJg
 5oYfTdxUdNNr+oZ5BVt1hqxLBX2bb8WxPiJoxl2yqESv1bqM6ydHE/c4Bjnnpm8L
 Cb/p0tfk4ruPTrnYMf8VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1667991242; x=1668077642; bh=oLXqTGheG6ALx
 YmdT4gDwH5AD2rgIi5FRcTGJrij16g=; b=MsBs97leaxB9DO1x1q/Ydh5bObn2d
 l7FnJVcoye/ExpUFPMap6bz/YJOixq2Lf5KzA+w1wAdb50Vp2ObD4HQ6pTy5x1s+
 1DSFPdPNPOMS+ICCrb/6cPv9ua7j+pK+BUt91HF6d0VxR7Ucj71fM3kPgGhF1gYw
 l/c4yCZHeyyhxLPBQyA3OAdz3zDkiHGT5kKKFNNiRkMjkgVq0glJgi0qUsWXTFXS
 dz21Mw50fFX5j7NBe01vH0mZXS/Zpug8B+IwFpiH9gT9c/DzwivOyswJwVudk2IN
 Ek/dOyT0x1E1fPYRhNznenaxFFEa4IG3AfYiHU34PSNGQD1iMG3vV/TZA==
X-ME-Sender: <xms:yoZrYxMYlhpNYH3YHR1avEwEiNQPvdaM8728glLg4hf9Y3MvzZ_nEw>
 <xme:yoZrYz9uAx_w21XAoTFNecPL5jTGs5yN8tCEDy4pUPa3oqZwkmGLAScIUovirrOsg
 GwPLSd4KSPg-HWh1-w>
X-ME-Received: <xmr:yoZrYwTj9oRL4hbQB39gO_Gi6BlsFxYo-FM-LhCwm5AkuH6a35PSduOd7qwCj8Qd2Eyliu4F_kQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeegvddtheeukedufedugeeigfdvhfetgfegtddvfeejheevgeeijedvfedttdel
 heenucffohhmrghinhepqhguvghvrdhiugenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:yoZrY9usp3EfykmYYRzJgzPFHqrTRzkTJQfiYMDDjQ-cHXcNFq2bwQ>
 <xmx:yoZrY5cf2YkxYXi3Pq8xQLuPF9tXv-O2SX12w6R9Vue0g65dH0PA-g>
 <xmx:yoZrY5257lVIZ4Q1_VNZkUltVR3ati52CUyzK5S2Pik_2ylLSDeFjg>
 <xmx:yoZrY97VZ5UTAtNR543f_qmvY7PvoVFDv02P5O4lvJFY1oGHGLqfHQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 05:54:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 1/2] hw/nvme: fix incorrect use of errp/local_err
Date: Wed,  9 Nov 2022 11:53:56 +0100
Message-Id: <20221109105357.30430-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109105357.30430-1-its@irrelevant.dk>
References: <20221109105357.30430-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6528; i=k.jensen@samsung.com;
 h=from:subject; bh=Kmhwob+Klxsbq7mZ2l2FJHeOcd9hQltrXSxvKfvjF9g=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNrhsU1b/tXZnDu3obIMZ65kaFGQbF+exL33LpA
 O7TEQLFl74kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJja4bFAAoJEE3hrzFtTw3pRQ
 QH/2rRjF1KshRdY6I3Ms15zXUIICe5sUKtdfM4+97WjRgANle3xwNFL6NvBhraRs+NluYszmqQlsVu
 /AnCIhfmjSbtksink7yi//sciO4INeuao2HiFZE26HnM53e4Ygo4XR+mivVs/xxPMHmsSBCc6y6LA3
 WcT9YjKcvDafQ4/iPVlYjb1Cefmk+smLE3LIxP63r/Njwl7+AMITQUqW92HRbRMqtLajlYc7cyDIx5
 +NTMXPj9YiJEpfCwP2t04oQnPJ6Wi6TufWkGc0YdiVwsLnGHXd/uhpu63xYy50WzmY54lYoFAX5vFx
 2QqaIDOxQnA0bnYtiZNEBhmQw8E1WYepwNB6Z8
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Make nvme_check_constraints() return an int and fix incorrect use of
errp/local_err.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac3885ce5079..4cc6ae753295 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7035,7 +7035,7 @@ static const MemoryRegionOps nvme_cmb_ops = {
     },
 };
 
-static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
+static int nvme_check_params(NvmeCtrl *n, Error **errp)
 {
     NvmeParams *params = &n->params;
 
@@ -7049,38 +7049,38 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -7089,64 +7089,64 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -7154,7 +7154,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "sriov_max_vi_per_vf must meet:"
                        " (sriov_max_vi_per_vf - 1) %% %d == 0 and"
                        " sriov_max_vi_per_vf >= 1", NVME_VF_RES_GRANULARITY);
-            return;
+            return -1;
         }
 
         if (params->sriov_max_vq_per_vf &&
@@ -7163,9 +7163,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
+    if (nvme_check_params(n, errp)) {
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


