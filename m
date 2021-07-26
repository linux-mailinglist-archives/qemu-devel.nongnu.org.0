Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5853D677F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:30:26 +0200 (CEST)
Received: from localhost ([::1]:56214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86Iy-0004d7-L6
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868D-0004UY-0y; Mon, 26 Jul 2021 15:19:17 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868B-0007aV-CW; Mon, 26 Jul 2021 15:19:16 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7C399580415;
 Mon, 26 Jul 2021 15:19:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 26 Jul 2021 15:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xzP35CbRRWuuo
 R3gzE4VsQTCJWGZJMrnrDE5SrPKt2c=; b=gCS57NJ0I3HF1z0DggDV/bu/qFpHR
 hiP/AqBoX1TyJ9QiRlYqYG/hyOsDPe6UU7iVLp9/dSVlL5j5Fa0qGTrDUIsuhA7A
 ZjoFNS6cBLeE3ziYTkBM3C2jbsPLVZe2CQYODcwgAGVHBiEm6L5fKpKYFKJq0W7c
 92CiLMvmr+ZLXEBC6L1e0B6WR812mSDgPCH0B0Ad/RXxEGkpYADHrym4mhSqYOmW
 WdMSczZQ4JWURAiPzmFVev2I3mfVEKPI1oZ8iBozovAK/DVqUh2sY+3gFPdLaQMx
 2qqTaWItNkzaBBrll2bEi7U7Z04VL6QyU/SnFALZnWyxK1x6nOgVcLrfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xzP35CbRRWuuoR3gzE4VsQTCJWGZJMrnrDE5SrPKt2c=; b=hq4nyZQ6
 q5tx5tot5l60OTOu088JFLprHq8IVWzwbCsfP++lL3b0MtwHCZ3DFkkBr6P7YdwH
 TGkWvTKT+NGqJZ8de9jsb3yi5xH1RB/orXWVaRbqc3I03AIzaoqmMLqmgo9qrzIv
 sKpQ0QanB70JQha7Kw54X58t0Lgoguddpw9o5E7SwknR4D5QL49704plU0zlyiw/
 ujRRNkhpTFX+e+I5u5p4SQ1uoKKkSB2XM6++4Dq10hNNtxqr1wEhGkOq79qKuwi5
 J1AP/XfW47MdO69UhfzWEF9cvi/BCLkNP6Vwz0A7Uuo3+eUp4HnwN4tWrlFaWh87
 qNN7uLVNW1VWqQ==
X-ME-Sender: <xms:sAr_YNid_aCK1zin9svZeT-D0xqvtJPYfXXNt9okhR-eD9WiArXJ_g>
 <xme:sAr_YCBh4oJYonpRXHmLSCoWzkNYPzuaeWMIuqmLrBVE3RfMof6azUoQkmVqGMlds
 JMh5NxNvq6DNc4SJjk>
X-ME-Received: <xmr:sAr_YNFyhl79sS3zt2GjNmmLKkQTq-EmSTPiloRI50Sg0ONGeLafc7-ytV1VN1OXOP8cubGSHjYQRN9D9l07NlQw-axDHwF941cu460sjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:sAr_YCQV9mW9zfmG3NdZWHUxUDGrhj5uq3FsUkrfMvwsJvQ8e-JV9Q>
 <xmx:sAr_YKwcOXIRLiirVrdwfXk83qFM131eyxJxqqurcswmB8z06tu17w>
 <xmx:sAr_YI5ZiglvCgiHLBQRMouqNIzXECLernAgCKlSXJGPVZr3VCaUSg>
 <xmx:sgr_YFr-HhLNU1uj3TBbuveVbQUi44kJIb0cP8Wq_JdLLPfV7xsUdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:09 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 01/11] hw/nvme: remove NvmeCtrl parameter from ns
 setup/check functions
Date: Mon, 26 Jul 2021 21:18:51 +0200
Message-Id: <20210726191901.4680-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726191901.4680-1-its@irrelevant.dk>
References: <20210726191901.4680-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
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


