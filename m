Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D032D3BEBA0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:54:12 +0200 (CEST)
Received: from localhost ([::1]:58146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19sJ-0002nK-Mg
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o1-000050-Nx; Wed, 07 Jul 2021 11:49:45 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o0-0003EN-57; Wed, 07 Jul 2021 11:49:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8393232009A5;
 Wed,  7 Jul 2021 11:49:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 11:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xzP35CbRRWuuo
 R3gzE4VsQTCJWGZJMrnrDE5SrPKt2c=; b=GlRyqTVhypCgoyNdxT3/mw3uYMj4t
 4xkreiVFxPZf1Rqi4iO/MY3g9tiW7mG8AKmqBuuecthxxdT9/Bdd/gn1ucefZIsp
 GQ68A9XZa23XJsUNJ24XBQOg60X+28LVGf0xZ0+8ItftF4rf6hOYbCNt9aaw4/yD
 NvFnYKcRcG0Iygad37w7MgsuHI0rcKiVduyJ6aQtudKHv0HsIohgV5uKateuEdu4
 HTPbVfLbg00gZTnMeQ7xNKA/6lZXUJGp8sHz+NZCz7q93E7fz6znFvXgzdyUStKi
 eSgUdvKv/JjjTFsKeBKpnc0194oTZdYfIX3MPIgvSIhSfgVq/gkRBdduQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xzP35CbRRWuuoR3gzE4VsQTCJWGZJMrnrDE5SrPKt2c=; b=iYSJ86gf
 XHICYmLuh97hR/qaSyP/pIHS/KQVzqH/T/7N2pVnVLfIobIMPrbrvL1XDyg+fFrZ
 Qxi7QQufwq7TJGCXgBKunK7QmsKEFmQ+9FVnLEbd5aYQ5sGdsLZyxmT+t/XcUe5E
 3E/Tf1w/szSqbrsmS+zi9q54p2H7pCLCp3ta/1EH3K6YEjViexNIlrqL00dTyWw1
 PKYSgB50qbRsk+5QBCm5QRuMtYK06riYKTtBsK8qo62HfnhzVBJBsh5npMcq4rHW
 7mTS8zHHBg8Zpc+jKQcW4+tc5IJVCzrz2xLdfUbDY/rUFYIiq+mpqDceXwYbp/BP
 g+31CmxrW98sYA==
X-ME-Sender: <xms:Fs3lYLqIDEs_Y-ibaBJvoNc9GchY66SRdSg09Vlzt9uuNWOZIBNKIw>
 <xme:Fs3lYFpvm9baLl47CoWSasyTKCKdCqD0MDC2nkwVWgwakw4db8Kl2s9482LkS42PI
 hFRiS3gtL7fwWnwWGc>
X-ME-Received: <xmr:Fs3lYIOdkbBNl7pPl1jc4BWbFu4pzyVui6kWXDCmkiB5jeyoWFv4CI_sHmRu_3RdYhxrc9cogdYLEe8NJ2TeBxZta54SiJRbEsGji3Dw6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Fs3lYO4uKxXnezATu0sOb0Yqvl4LlobrCy5KCePQ2w8bEbhSgQTZXg>
 <xmx:Fs3lYK6TOLMlo552ZJnIgD2eIXi2S2nfzfYVmx0gpjocOfAFAqaLpA>
 <xmx:Fs3lYGjRE61nNBYHcPYmplXcn2ftvZbeHRXYuRD27X8U3jFvKNFHjw>
 <xmx:Fs3lYF0FhBB9lns-RkYed6oHd2YFNQcHTblW1PYF_NkDtlMN5Amfeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 11:49:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/nvme: remove NvmeCtrl parameter from ns setup/check
 functions
Date: Wed,  7 Jul 2021 17:49:33 +0200
Message-Id: <20210707154936.200166-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707154936.200166-1-its@irrelevant.dk>
References: <20210707154936.200166-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The nvme_ns_setup and nvme_ns_check_constraints should not depend on the
controller state. Refactor and remove it.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h |  2 +-
 hw/nvme/ctrl.c |  2 +-
 hw/nvme/ns.c   | 37 ++++++++++++++++++-------------------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 56f8eceed2ad..0868359a1e86 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -246,7 +246,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
 }
 
 void nvme_ns_init_format(NvmeNamespace *ns);
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 629b0d38c2a2..dd1801510032 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6498,7 +6498,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
-        if (nvme_ns_setup(n, ns, errp)) {
+        if (nvme_ns_setup(ns, errp)) {
             return;
         }
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 4275c3db6301..3c4f5b8c714a 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -346,8 +346,7 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
     assert(ns->nr_open_zones == 0);
 }
 
-static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
-                                     Error **errp)
+static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
 {
     if (!ns->blkconf.blk) {
         error_setg(errp, "block backend not configured");
@@ -366,20 +365,6 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
         return -1;
     }
 
-    if (!n->subsys) {
-        if (ns->params.detached) {
-            error_setg(errp, "detached requires that the nvme device is "
-                       "linked to an nvme-subsys device");
-            return -1;
-        }
-
-        if (ns->params.shared) {
-            error_setg(errp, "shared requires that the nvme device is "
-                       "linked to an nvme-subsys device");
-            return -1;
-        }
-    }
-
     if (ns->params.zoned) {
         if (ns->params.max_active_zones) {
             if (ns->params.max_open_zones > ns->params.max_active_zones) {
@@ -411,9 +396,9 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
     return 0;
 }
 
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
-    if (nvme_ns_check_constraints(n, ns, errp)) {
+    if (nvme_ns_check_constraints(ns, errp)) {
         return -1;
     }
 
@@ -465,7 +450,21 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     uint32_t nsid = ns->params.nsid;
     int i;
 
-    if (nvme_ns_setup(n, ns, errp)) {
+    if (!n->subsys) {
+        if (ns->params.detached) {
+            error_setg(errp, "detached requires that the nvme device is "
+                       "linked to an nvme-subsys device");
+            return;
+        }
+
+        if (ns->params.shared) {
+            error_setg(errp, "shared requires that the nvme device is "
+                       "linked to an nvme-subsys device");
+            return;
+        }
+    }
+
+    if (nvme_ns_setup(ns, errp)) {
         return;
     }
 
-- 
2.32.0


