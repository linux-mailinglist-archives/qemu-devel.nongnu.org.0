Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E53339DC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:23:42 +0100 (CET)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw0D-0000cG-Pp
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXg-0007fJ-Mb; Wed, 10 Mar 2021 04:54:13 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXc-0005EN-Rr; Wed, 10 Mar 2021 04:54:11 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B9F15C0150;
 Wed, 10 Mar 2021 04:54:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=U3XFZKcHaCB1J
 baduMA0HjLrKExKXD+kY3/SkYJLjy0=; b=rsc/132OfuBOfJyusPubJoYJtR0xR
 RqhZ9BxyGsrVf78N9QlExohqOjP8DYWPfdR6SgwBmJWkPeZIV3Syf3+PrTu0ZN+W
 MUlLeYQ+HxYxixl/3p2Br4hgvAX0UB7f6NdhqzA1REpZHwu6AQt3F15+4SBQYfXz
 8jeUge5djy0PduaEZdP8c6va6qQvi6Gj4XSRKkfzfnuxMmG0Acedo4CUY7bW4/rR
 WXkict58g+qNhJrwNJzvzjxeHTkNQGTz62/PKPoT20O6lwZL7qugddyjES2INuvN
 aHOQ2QzWNdUFgQxFFfg4B+/alzDs/RGmb/hAcZsm+Hol8Ewl3wbR5UuiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=U3XFZKcHaCB1JbaduMA0HjLrKExKXD+kY3/SkYJLjy0=; b=biVU9afc
 C2DvDoACEL4m7fEOwDRHLCHzwUYgzZOgDh48UV5fF9ev3tLuyXQ9krrgGBWla4VG
 iGP7b1nbi1omLJzXOB483JCjvQ6sE3hioKDQAUQ1TFJL4+5rxXL8ieiSQOg00+ty
 f0mDt/vgFD/JLNM7Ccd0PL2qi9hNm0j67368vUBLuXcPb6i5rV9mrJZtJijloe43
 kgPppLlhxqk4+NfeEmScVSFX6YvriLYpEq68HMtGh5qN165o9SRDMjVRTOGESQYa
 7qgM8qcShNSlSHZVkkp28tWkEFL53HPFJCbjRtt04AgEH4Th7x6cl4w6X3+6i/FF
 N3PfaDR+oCcISw==
X-ME-Sender: <xms:P5dIYAYtxBXXJxO2ioLMvv6gzLmf0PS6SaW_T5o10avjkMbFXFryeQ>
 <xme:P5dIYLareILDEb8LE774JUMpTbKTjnDmYbCQr9Uu8so2SMAVfrPXLVytu5A-Jb9Dp
 E76DWaxNmVl4iomZmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:P5dIYK_4zg4m3tjAK4_XjI9zr9GKJwN6OJXmwxGX0v4AjUwAD5DZ-Q>
 <xmx:P5dIYKqIxIlLFZ7AjGkZFqm7v6J-JRos3Kk2pQmmTHGWBkrMw2KVbQ>
 <xmx:P5dIYLqwcuBUunGVpgMczT_bCsJaI5eq1NRWuStOl9OG3BDGZKwPVA>
 <xmx:P5dIYHKP3BKe4c6iEj6r_PEmbN8thSpAZ33ZzoLLGpf7ej5QunhnQg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C482240057;
 Wed, 10 Mar 2021 04:54:06 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/13] hw/block/nvme: move zoned constraints checks
Date: Wed, 10 Mar 2021 10:53:45 +0100
Message-Id: <20210310095347.682395-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
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
index 5995d475ecdd..192c6c923ab4 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -214,30 +214,6 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
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
 
@@ -386,6 +362,34 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
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
2.30.1


