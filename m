Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F583623BC4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0yi-0000ID-3f; Thu, 10 Nov 2022 01:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot0yX-0000HR-Kr; Thu, 10 Nov 2022 01:23:45 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot0yV-0006oS-F2; Thu, 10 Nov 2022 01:23:45 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 366A05C0165;
 Thu, 10 Nov 2022 01:23:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Nov 2022 01:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668061420; x=
 1668147820; bh=sgioLd2MkKpqwtbF7s9cz970hEfW7mt5iQrKUNfw5KU=; b=M
 wgrodXzESsxAbqg5q2wMUa9fRlW0g6/ZHz60eSwtWGvthnffYJxZmuH/rzlkznub
 7YhqRs8V/96IAULqA8uqyJE1RRlCnNLpddJNaMJcid+R5W0eMkJ1uFfXcJDAP9+0
 niKWu0KxgufSMOj6C9jGtQOhQgEt+UjakGlIa9WtC5QAy/mEuJZwzjw3x08bphD0
 SlcxIW4l+W0CAoYDAiCSHkOoF1fjYKdNJw8OsduJ2n3mN985egLpp5W0ahhTHYWS
 MClhWVrElbfX0khTsQufJfcafMG3oR0xt40+q14fiIDrevSHGfjxkeed0fuzoIh9
 qVJBUsiDQrnKvW5mTZeYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668061420; x=1668147820; bh=sgioLd2MkKpqw
 tbF7s9cz970hEfW7mt5iQrKUNfw5KU=; b=aa4n1L2jfCbxIg+JCnQ6XH5d8lUAF
 Ewit/JhUih6aAMxRHp04anjvibBj05Cq8fCFApQV4Gd94vpc2TcK9XJsqWtiVhxj
 AXx4tYGf5kZJp68BYMlqZnz0eqgfQrWrn1iuy8/nzS6BCS68ZgrqDR1tfo1dHUOI
 57yk3VHmK+Bjs8frZqcKNE2ggJLJeD6mds3ONSpnHiqNQYkdHa1ov8j+Rnf09N4E
 1CqSRWIaCSYoyn0nYMQBtgjkv4/XDgWZx7lmQZhWzsdyqa4dpM5Tz5G6O5ccf5mI
 DuJ+iHjhnQz09aIQzkhbwuasobG6UMnV2mcEk9j6aFRu9vsTWQRIeeQDA==
X-ME-Sender: <xms:7JhsYyBiDuvAzrEoUGGWZX-Q5UUxOMhmjeV7O_j66t0yq4T92QXkkQ>
 <xme:7JhsY8ijvn6BWxk8TnSKdDogFMrh9Aj5P86eBaKI7_d8sR4jJssIIo0AWokmRPJ9U
 YC3VkW7mvn1PLftyEc>
X-ME-Received: <xmr:7JhsY1nEEaLx6TcmigcB3WJv0acAiPCUtOvDJZVGRCh2f-lV3Nbwu4Il1vEgOyWFMGqQkfxaYSrTPHviheBZzs42URrlodz3fucKxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeegvddtheeukedufedugeeigfdvhfetgfegtddvfeejheevgeeijedvfedttdel
 heenucffohhmrghinhepqhguvghvrdhiugenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7JhsYwz852w9qYiCc1Xzi2r9njK8axEovEKfcSKn6sm2GiPeYXLsrw>
 <xmx:7JhsY3TdjMqCnhupBpLWEJDw82AabCT29mLbYzUAmT5QlT9fPYzQiQ>
 <xmx:7JhsY7YexwzvrOSahmTlJ41EUdc5b9_PWwVS9FoUVnLvDkNQ8GHuEQ>
 <xmx:7JhsYxdltLHIRIK_EjF9oSHET6HV8FT6wdtIJxLzCUV8YUcdZyX5JQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 01:23:38 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 1/2] hw/nvme: fix incorrect use of errp/local_err
Date: Thu, 10 Nov 2022 07:23:34 +0100
Message-Id: <20221110062335.18401-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062335.18401-1-its@irrelevant.dk>
References: <20221110062335.18401-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6666; i=k.jensen@samsung.com;
 h=from:subject; bh=VhWa9wmAJgXTuIehLSpLWthbtZo4skKBJL5rS+4ZZJs=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsmOa5LjPRmT4kThDzJX24aZcpcF1MWMHVGtop
 /N6LZGBeBIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbJjmAAoJEE3hrzFtTw3pU5
 oH/2wsppDMkW+2S7avLA7PZ38arlPPVjl1+/p9cPQ64IWfKtMYSFO2UR52mzsAMw83zQQwXhC9HR0M
 h4TqNp1Ov/o/dWkgO2SlUETwX53wVeFNzzefpBsHZKiqZL2HJsaV2OVdKA6TPmK2PmIYCcy3gSFZbh
 +cAdWa2gFvb0lx6mI5P+UfFtf2fHn8/kzDQjsf0qqghTX0IFhc9+nI9nMKj+oEsg8mpFcQBcoyXpZg
 0UAIl+2T1zatag8KCopPwO8H6hhO5i3nRlGJZKWTbwPJXOuajJoXa8gT8lBXl1GxcQzVWP5iuZDcnm
 UpUfloLI7Uv8aMi/+PeH6sewOpPFj+hc1cQKQi
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Make nvme_check_constraints() return a bool and fix an invalid error
propagation where the actual error is thrown away in favor of an unused
local Error value.

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


