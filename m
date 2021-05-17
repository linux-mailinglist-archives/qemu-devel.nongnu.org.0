Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4015382939
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:01:35 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lia46-0000zJ-Nq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOg-0003zd-Qo; Mon, 17 May 2021 05:18:46 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOf-00067R-3J; Mon, 17 May 2021 05:18:46 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 363725C0046;
 Mon, 17 May 2021 05:18:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 17 May 2021 05:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OjjOCTGGyGxca
 i3HzvKQum9is7s3hqHrEO3Us4Ph/bc=; b=ZsFgvcJJsf0spVLVC72JzbtlVklxm
 vDMXvbHw5rl2PCJdqvUdq4ytg9WWp+ceb+7lBBhkLp20dSjevZMUTHQSi+h004oi
 dFrOfEQ+AHwrWvWDhS0qQj7rrLiiFUtppCuedo/OuaGEeLlczoWE48ADyssvE12K
 qvn6HqVravLPzurYqb8V1D8iI4lxYVNA8DyP13y7s0MpVOQ4Gnj77H+l4RXuJ6X0
 pI2HAPia12Yb0jJt0MBizfL9fH09PJn8eFUc6CmBbEB8wKx0F0G31fwpIrB5eojr
 9iynBahivBHHkB44fxCBtiBxq9+EL+068g6vAlc/QzV+Vy5TmteatKSbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=OjjOCTGGyGxcai3HzvKQum9is7s3hqHrEO3Us4Ph/bc=; b=W2KdLe1o
 DI6vk17KN62Egr7QBUQjMptE51/vil8sd75tmDb1n4PzZow5Kl+V1BkF4nq82RPs
 hYQQ+/LXPqR0q717YxYFxDEPdXairV992C+fFci51N1WWJFRd7LPy9L/QVnJ+pg6
 /kPznoP7vFQlqbJEd4PdgFnTR37jkC+gBwUQLVC7WdGmIvYgl4Nd31vrhF0ZKHqC
 RcQ48VPHubucDO6ScVl1r0gxeVfUAf+6BH/BVffNSmNt+kc3Y8Uan3Xt6TlzmcuE
 eF7nYcRuU+WQhOvK/SgoJmdz/1dhpC3iMQImMnOqsVpoSf1Zrz76bSb+i1spawPf
 BG5qpt909oq03g==
X-ME-Sender: <xms:8TSiYHkVYji6afft2XnZOTF3fAzYjv0vxfmowwOmZGpTXeUk4UMSig>
 <xme:8TSiYK32jyLUajkAsM2jBslHXCVDRtA8djWI9hpXgRxTYQTI77cx2HQq5VQCZlP6V
 Eop8nFF5jZ8PRVtaYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:8TSiYNrNx3MN50j9pzO7iLEPq3OzqljmOrSfGr_tN03NSSNhfcsKWA>
 <xmx:8TSiYPnt3-R1H_wgz1gD2_8G0uK5nep47YpF3Ra8sPTorb9y2_58EQ>
 <xmx:8TSiYF3N9S6u4sdqCNo4gt71rg_iycEl1V0h4RbE6xg3B08XNCFtgA>
 <xmx:8jSiYCmGSH8bKjNkVsHaYF8lsDBpwD4cxpMPB87aIrTToT_l5JgHsg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 19/20] hw/block/nvme: move zoned constraints checks
Date: Mon, 17 May 2021 11:17:36 +0200
Message-Id: <20210517091737.841787-20-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Validation of the max_active and max_open zoned parameters are
independent of any other state, so move them to the early
nvme_ns_check_constraints parameter checks.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.c | 52 +++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 008deb5e87d1..992e5a13f538 100644
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


