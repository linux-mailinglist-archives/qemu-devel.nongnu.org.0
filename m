Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D553665582
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:55:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVul-0004Jt-77; Wed, 11 Jan 2023 02:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuY-0004FZ-Cl; Wed, 11 Jan 2023 02:52:39 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuW-0006B4-Jy; Wed, 11 Jan 2023 02:52:38 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 92C1D320095E;
 Wed, 11 Jan 2023 02:52:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 11 Jan 2023 02:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673423554; x=
 1673509954; bh=yy8JJfEpU2SzZjOLtXC9HKHw5xPoepkZ9hRJ5KsAihs=; b=b
 ItV66aCOiKaE5Y4fKUS/q0j4PnDbqvxC06pLuR5jmGCftXgjAPSRoXspcH3s7EeU
 4vSQFR4Mj95HUxSWuhdiIadpDoFtwDdMfbEjUEnaqnGam7pvn86V/7URxBmY5YEE
 USpvBmqAvVyaU4N1BHA+SkQVOXHLM9yodAwWYD+yhk7j5Bgof1n+rPueGWbdQvBZ
 m0tgrWerNS+LZZ3QTLAT2I2CTGzCFwCrj2bifoEXWGsV9PQfUr3S4mUXt9A8Bmhj
 SDQYtGlCh+t3DH+eVI1bBjdvXDHTi5/HtIXPghzCMIumVRnu+ytiE/9cQIqeT4H4
 cKpM9LbnCpEYuxIkHalGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673423554; x=
 1673509954; bh=yy8JJfEpU2SzZjOLtXC9HKHw5xPoepkZ9hRJ5KsAihs=; b=W
 AFhfj+5xYY7BsFWYwVZ1u5LzQ2vCubMtsRaumVbFlb/6DrphKlEdQ00/miFJaDPW
 PsVAoWW87DJVTMdel3qxQpmU8GwTfr13ZU6iSWnhMCD7NmTJpAmuGmGg4853mFwy
 GXEOHEjnssLcPwvp/5TBv0ugPXRPidur4ZaTnZqPYg4qaf6xW4lKraB94M2OAGDh
 RcB1P5aflyw3IZk1AbMB2y1vzzr3xbnGn6ZIDK/s4D+lqJK7WSdrICNn3W9AHOCz
 hgLycZnkxClzGsyHZCka+CzS1qve7I+uvQTv3aXVpM2g4/hyRZDZPSAH2EJQZmz+
 gFkFdNJ3/ThiRmhmznDDg==
X-ME-Sender: <xms:wmq-Y6OZPhhpCYMp5ue4KdLR5vz7BF_v3OxXl0zweNHUmpM1akq3tA>
 <xme:wmq-Y4_46dTEwFW9bVKvq3zRQEOGqqn6irE8RyKWWDY9bwzaPypNE9nGYNEkmmIx_
 WGTD1uop07gOSfWsb4>
X-ME-Received: <xmr:wmq-YxSnI_rmDH9p_RxjqTO4mIq0TFVvy-Z5jQzsTxB5Xkun8wGG4TgvatRVjbnd1BTaYhfS7g8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleefgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:wmq-Y6uHnSywpGNIMSISwMKZ1NJ-Y7SdkItRD-oDioz6W-86_4Y7gQ>
 <xmx:wmq-Yycq3h5qGOVu5yArWNSoz4IllKWg76TJquzBYK6-X5rPFGblow>
 <xmx:wmq-Y-2YUe34mOOL4h3O-HpGdwyK98OhfDAOYanIu6n7nIGLI2PPFA>
 <xmx:wmq-Y6StYQ7kOMcKf05ANMLsPh4ccNj_fqkH58odf7xUZpSRp0aREQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 02:52:32 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 5/6] hw/nvme: clean up confusing use of errp/local_err
Date: Wed, 11 Jan 2023 08:52:12 +0100
Message-Id: <20230111075213.70404-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111075213.70404-1-its@irrelevant.dk>
References: <20230111075213.70404-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6714; i=k.jensen@samsung.com;
 h=from:subject; bh=y9p/LzRpNTe3Yz/ddOsHqjB/L2i++1ytQ11SKHteeK4=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO+aq2emw1nDJ9ae6mUp/cNpfJz6aaNOTQHDTTZ
 Z1vrAQ9+QokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvmqtAAoJEE3hrzFtTw3plc
 4H/A7cv9Nms1UCqbFOYzXZLawQCkMl6tQDArpfl+TEmCvG2IqmuOYmffDUUXJAqbxJqxYe9GI1wKTt
 piQjx6EiZFrmS9gzmH88EMU0b3ERee6xCwKOm7z7WN8AUc8C6yqRESHTMwAt67BRdEYmAu7R8Tlmo9
 f0NtWiYJSqVuxwhc13FbxX/ERKhKhqUyhTIWPN5dmuQzJ5cOYKa0mudft1KOxeGNev0ErzPgBWvbmA
 3ZZ7XcL5YW+Kp19e7ImWOUjtwfDHSCIC1kDM31h25cgUBrpGAdaFtRSjwekcy6C94I7s8btYXczh2r
 5qV7rFpjOqzajEYKanWA61R4Am73tu+Ajxu63j
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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

Remove an unnecessary local Error value in nvme_realize(). In the
process, change nvme_check_constraints() to return a bool.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 226480033771..b21455ada660 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6981,7 +6981,7 @@ static const MemoryRegionOps nvme_cmb_ops = {
     },
 };
 
-static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
+static bool nvme_check_params(NvmeCtrl *n, Error **errp)
 {
     NvmeParams *params = &n->params;
 
@@ -6995,38 +6995,38 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -7035,64 +7035,64 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -7100,7 +7100,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "sriov_max_vi_per_vf must meet:"
                        " (sriov_max_vi_per_vf - 1) %% %d == 0 and"
                        " sriov_max_vi_per_vf >= 1", NVME_VF_RES_GRANULARITY);
-            return;
+            return false;
         }
 
         if (params->sriov_max_vq_per_vf &&
@@ -7109,9 +7109,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -7512,7 +7514,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     NvmeCtrl *n = NVME(pci_dev);
     DeviceState *dev = DEVICE(pci_dev);
     NvmeNamespace *ns;
-    Error *local_err = NULL;
     NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
 
     if (pci_is_vf(pci_dev)) {
@@ -7524,16 +7525,13 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         n->subsys = pn->subsys;
     }
 
-    nvme_check_constraints(n, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!nvme_check_params(n, errp)) {
         return;
     }
 
     qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev, dev->id);
 
     if (nvme_init_subsys(n, errp)) {
-        error_propagate(errp, local_err);
         return;
     }
     nvme_init_state(n);
-- 
2.39.0


