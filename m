Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7293C3F38
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:34:50 +0200 (CEST)
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gA5-0002Kc-Rh
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3J-0003rx-MQ; Sun, 11 Jul 2021 16:27:49 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3H-0002se-MU; Sun, 11 Jul 2021 16:27:49 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D6D033200034;
 Sun, 11 Jul 2021 16:27:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 11 Jul 2021 16:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xzP35CbRRWuuo
 R3gzE4VsQTCJWGZJMrnrDE5SrPKt2c=; b=fsT44sRagz6IJe6yuT2O957nS/kBD
 L0X2UgviCbAz1vdkctdnTYBPxHkvNj4VI4863ALjSxjZfkzqNJ7SVKwPWabyJN+V
 KE6uk7EFCayfuzjZD4DtZGSreWEcujXUxx6xExbJeNdNWdR0zHE3p3s9ApO+ez7m
 nRAflslZ9kpPfH0MBGnQ4/6E4TjPhthEoTmPjl1mCdfALxM5j+T02ALIX6bDjzJI
 CCv5/ylG/ku5lzcUyMPeH7jjIKfRIRF2J5MTtg//E7oezqfntlmvYB/0bsQNngI+
 Oo75MXfS44r/V5EIlloGHC9x6InhSw3J1MThdVI7Ce1pytuUonVclnqcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xzP35CbRRWuuoR3gzE4VsQTCJWGZJMrnrDE5SrPKt2c=; b=Dya1vZ7o
 Iv+bkmVmNAVhku2Y37cyhs6yinIedK+w/7yZglOllRxN/aW8Rzc9rh9QuJ6kymnV
 q+6SNUCp7o0BA3kOjNmN65nTep1orVX9DBWRgTpnMi/uIX2WPKxTtadh+5brDWTd
 ZtxgYXGtj8aK729avlKlwS0S9psWqnMI3ZM+9RWTSw/bePNEx/3Ko0lab5h4Vn5Y
 MEc3xnrhRSVxLi9D2qhSBeUu848a2D3fvlI6tGy5PUU27Rk3JiOxjstOZkpYrQQk
 ul+yKGOzVEzEdnzVeN/3D204Zj6M+xauC96A8B38zFkkLbF5cqO8zaJZ/GWR470t
 KtocURH4mJWfhw==
X-ME-Sender: <xms:QFTrYKV2FGdtaCVwMwAxK4_N5qwiWKmWFXE19YS_9m85ZIlvLSG9Hg>
 <xme:QFTrYGneYASElJqZMyQdOBiIHO4Wc0rWPjhdJm8NLP0clMfayuxi4tU5cNwJNDiCv
 IeUDBeKMaHmNqjhUPg>
X-ME-Received: <xmr:QFTrYOZgPfPzevQ8QNAi3FoplpgwkvX9UV3Ezw0xY4h-ABRVNNrfp2-06ietGL3SJEG49_rrhbAH_YMOC9Ybp81lqqTMH4BQocj0YasjEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QVTrYBVSHMOTuggyrZ-ju6IPi4vt5blsHLnmaOcEPoS8LEye5BANHQ>
 <xmx:QVTrYEmVbaK6x8JeGRa_RFvrnm3tKJcTmhs_S2G63YHnCfZd67As7w>
 <xmx:QVTrYGfC-greO8J6UMIqCARyYNpWjg0bTw_tphhRdNks0Apj-wodvQ>
 <xmx:QVTrYDs3TOGYgmC8uQqNMcdq6bJbwQyXyGyZAkAtoI2MnzghG3lOuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jul 2021 16:27:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/6] hw/nvme: remove NvmeCtrl parameter from ns setup/check
 functions
Date: Sun, 11 Jul 2021 22:27:31 +0200
Message-Id: <20210711202736.591334-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711202736.591334-1-its@irrelevant.dk>
References: <20210711202736.591334-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
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


