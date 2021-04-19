Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F3364B42
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:39:24 +0200 (CEST)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYafz-0004JM-G9
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZe-000102-Nx; Mon, 19 Apr 2021 15:28:50 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZb-0005JG-5D; Mon, 19 Apr 2021 15:28:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8CD6721E0;
 Mon, 19 Apr 2021 15:28:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Apr 2021 15:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=St0xHPCxhgNl0
 y3EzysLOR6jGtY8wtwks7ZgZHpVGDg=; b=ILa+VYWcghrCeoR3JVOzrRYH4aNpZ
 AAxoOQsubSPNMpCI92LLGZ96a91zWsI3WoiRZ4r2bPFXFH2L1SLbCA6So8HBp7XI
 RRor9yfZoXP0mQLHymUs7hHbGrX8zrSoh/kBWkmRGZlawxyxSWg51f3/6oMoSF2n
 GdfpRzbPwk1GCorrMGd5GuP0ynK/bvEQaHs3XjsN9fOjDCzUpbpcv/Qx6pUX36o4
 RtSgCaI4N03tpF0sZVfEus3glGekJig8Vfo5k60Vo4GFMYbyyXe0L//rzyB9GEe6
 tf5NUG56ycmOlccnhZXOFuP0RU7uYcKURdjSBTlIEwGPPMYc8RX6C/ZjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=St0xHPCxhgNl0y3EzysLOR6jGtY8wtwks7ZgZHpVGDg=; b=qPWn/ubm
 DFn1k62aOobdy6Hej1BsI+gYnuK25/i0q6T3oI0p03VHSsDbvBPmOcNA3Mc+4WBP
 FaDxrparvX+YFRzO1Xlv1Zu+ULU5esCVfMIlasyxqQHNK6MeUNxQ1y1H+rp9r0B6
 UQhBdml29DgUXw0RxeXFa8bIaanZ+NP/fWW80Jz1Ow/DzW//VPx3bxXQzd/9qQ57
 3smEc1Mg1fTKYpBDVTEgfQkyFuDlaQFjcBUmdC+TIGQi4oITBMHos469vFBPjNL8
 g+chMtHqrrFtb4b5ghmNjmoWCW7qhAgB7BMbvoVZSvDhWjJgSkTYiAHA5pB2HRR4
 FoFzEh7GcZ3UYQ==
X-ME-Sender: <xms:1Nl9YLGLWF0ULrg5IDGMLmYNF-5lOvs-TkdJhIAbfr32tdYwziWDBQ>
 <xme:1Nl9YNNzsZMelbDt3hPYfMRWxKm_Q7mcw-b-zuqs9Ttg8GlIdmSPh1IEKq3izra0m
 fnj6GuF_NMd1m-pj8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepge
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1Nl9YKvzTWm12P81ebLaRHhh2BCs5nwD7RKVH8n84A1SC688oFA-iw>
 <xmx:1Nl9YLIxY9cFVGymg-RNW4hLR_S-Yit4XlA2MPDLzlyo5cf27MquwA>
 <xmx:1Nl9YAduQpy5V4rBD_jEHiO-U6TTgEUCTNmApNcT6SHI2fd6myZA0Q>
 <xmx:1Nl9YOUfWydpYpswdyPkucv0XrSXrUWHYkEDSgPOuujTDSO-NjxMYg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A452108005C;
 Mon, 19 Apr 2021 15:28:19 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/14] hw/block/nvme: move zoned constraints checks
Date: Mon, 19 Apr 2021 21:28:00 +0200
Message-Id: <20210419192801.62255-14-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Validation of the max_active and max_open zoned parameters are
independent of any other state, so move them to the early
nvme_ns_check_constraints parameter checks.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 52 +++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 2041d8138420..861b87f22bd8 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -210,30 +210,6 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (ns->params.max_active_zones) {
-        if (ns->params.max_open_zones > ns->params.max_active_zones) {
-            error_setg(errp, "max_open_zones (%u) exceeds max_active_zones (%u)",
-                       ns->params.max_open_zones, ns->params.max_active_zones);
-            return -1;
-        }
-
-        if (!ns->params.max_open_zones) {
-            ns->params.max_open_zones = ns->params.max_active_zones;
-        }
-    }
-
-    if (ns->params.zd_extension_size) {
-        if (ns->params.zd_extension_size & 0x3f) {
-            error_setg(errp,
-                "zone descriptor extension size must be a multiple of 64B");
-            return -1;
-        }
-        if ((ns->params.zd_extension_size >> 6) > 0xff) {
-            error_setg(errp, "zone descriptor extension size is too large");
-            return -1;
-        }
-    }
-
     return 0;
 }
 
@@ -403,6 +379,34 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
         }
     }
 
+    if (ns->params.zoned) {
+        if (ns->params.max_active_zones) {
+            if (ns->params.max_open_zones > ns->params.max_active_zones) {
+                error_setg(errp, "max_open_zones (%u) exceeds "
+                           "max_active_zones (%u)", ns->params.max_open_zones,
+                           ns->params.max_active_zones);
+                return -1;
+            }
+
+            if (!ns->params.max_open_zones) {
+                ns->params.max_open_zones = ns->params.max_active_zones;
+            }
+        }
+
+        if (ns->params.zd_extension_size) {
+            if (ns->params.zd_extension_size & 0x3f) {
+                error_setg(errp, "zone descriptor extension size must be a "
+                           "multiple of 64B");
+                return -1;
+            }
+            if ((ns->params.zd_extension_size >> 6) > 0xff) {
+                error_setg(errp,
+                           "zone descriptor extension size is too large");
+                return -1;
+            }
+        }
+    }
+
     return 0;
 }
 
-- 
2.31.1


