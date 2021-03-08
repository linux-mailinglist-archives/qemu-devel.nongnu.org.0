Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F25330F52
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:34:46 +0100 (CET)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJG21-0006do-Fa
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwJ-0003xu-BQ; Mon, 08 Mar 2021 07:24:47 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwH-0007FZ-N1; Mon, 08 Mar 2021 07:24:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8CA3B32BC;
 Mon,  8 Mar 2021 07:24:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8zXaYJzmqLk7d
 Ba+35vM1k/3bvkEcxp12F98Lbyfo84=; b=AGGkOyXrXSxn98EGOf7aH/3gxho0t
 CEJ16erTXzIIUG88fateiAUEM7BfOJMxqSIfZX8kwQm1Ng02ZOteOWgx2L0KjCbF
 +2LTIQQJujRTI5qI0tRyB9lpIX4qwnrBaQt62Rm+zKry4iWfjggNYTkPcOecvD/v
 RD5cIb0DqsvuS6wlBlHQ3EBOOBURcd6TtkUrzgslcG8rk+YJmmsmArqe04+rNFYr
 3oYvAYeFwPGhdOWprWTIiJCLOrfD9txZT1qyim8SYwtIIf/ZOZ4fkHT/BBvRV5SJ
 +GdxpFaOEFkOjphgeMd4FQsOtHQXkMkv3yVsAV5X+eeUE5v+oBElCM6Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8zXaYJzmqLk7dBa+35vM1k/3bvkEcxp12F98Lbyfo84=; b=fsIPdJ/1
 fg387+yEkfmFWPkxsi2i2IjqqQNZGG4lpvBAY9hu3irNdTnpC5lT92pgssPwPSWe
 ybpr4TCJVN7tksdNVXan4pWAO1SMTBoxmn0TKeT+GQWY7q8rEAe2VYimBu/tjZCS
 cM0F6UBm0EGy2DcjcjGzb+ENf4jJCUgTeeQh6/mCyzlbgFcqqThDzwJbE/R6p1KG
 34rjPvs7zICEnHHBaxWfXZXyzhQznL3E0ZN2qkoJIT4vCr2EugRORya0f9TPBZgz
 Xiibhbih4/0loQCHX2c5tB+sLNv47osnwhNR5qptNa4oOKRJojEu5pQFXfZaxR/h
 hjKQEb9l3R6frg==
X-ME-Sender: <xms:axdGYBkxlFyilQMhl4k7zVIGOIEQGGioQ51tnkCkzua0GrMKVxFUuw>
 <xme:axdGYM15N8iCW96BZZA9kwWc_kYL7DpBcGYGNBFM5DdYJBsgCB1g5cdYeM3OUk1FC
 Ls-nD5Y0BRdUeGcq3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:axdGYHpiaR0J4Xu8ZyFN8qVAiKdlA_ScNqn76YA3R1o2gh9BJ7drmA>
 <xmx:axdGYBn2sw0Ot0qQQDezuzi_TVGwsTy5629A_BVsUPAqgOyQGns7HQ>
 <xmx:axdGYP0CCk7IxV_jL4dHTEgp0GBfjn-vsPkP43RWY3gFitTfHGm74Q>
 <xmx:axdGYILdfeG4pUrt7GRHwAF7u0CPla5RY14eCJu0H-TVzBYwE7c0PS5mRws>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0C971080066;
 Mon,  8 Mar 2021 07:24:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 35/38] hw/block/nvme: refactor nvme_select_ns_iocs
Date: Mon,  8 Mar 2021 13:23:10 +0100
Message-Id: <20210308122313.286938-36-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

This patch has no functional changes.  This patch just refactored
nvme_select_ns_iocs() to iterate the attached namespaces of the
controlller and make it invoke __nvme_select_ns_iocs().

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3bfe10f5b517..3f86da6ebc5c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4033,6 +4033,25 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     }
 }
 
+static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    ns->iocs = nvme_cse_iocs_none;
+    switch (ns->csi) {
+    case NVME_CSI_NVM:
+        if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
+            ns->iocs = nvme_cse_iocs_nvm;
+        }
+        break;
+    case NVME_CSI_ZONED:
+        if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
+            ns->iocs = nvme_cse_iocs_zoned;
+        } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
+            ns->iocs = nvme_cse_iocs_nvm;
+        }
+        break;
+    }
+}
+
 static void nvme_select_ns_iocs(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
@@ -4043,21 +4062,8 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
         if (!ns) {
             continue;
         }
-        ns->iocs = nvme_cse_iocs_none;
-        switch (ns->csi) {
-        case NVME_CSI_NVM:
-            if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
-                ns->iocs = nvme_cse_iocs_nvm;
-            }
-            break;
-        case NVME_CSI_ZONED:
-            if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
-                ns->iocs = nvme_cse_iocs_zoned;
-            } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
-                ns->iocs = nvme_cse_iocs_nvm;
-            }
-            break;
-        }
+
+        __nvme_select_ns_iocs(n, ns);
     }
 }
 
-- 
2.30.1


