Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6801382861
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:32:42 +0200 (CEST)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZc7-0005Zl-O6
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOJ-0003cA-Kh; Mon, 17 May 2021 05:18:23 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:58773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOA-0005tD-SH; Mon, 17 May 2021 05:18:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A62D831C;
 Mon, 17 May 2021 05:18:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 pinW0NmCwac/ePCFB3ZIrfQfbe+ry6QLq23mY5YroBc=; b=KxJT2xUZvdhysGh2
 A7ZIymIudvIDDWv8UqGy/PjbymHt76wpCauuN9IV7Seoih+wgWYwW/Np81T3t0P6
 Ch9bygd75fjqt3+l3khLBfa596bsoqC3wxaRqNwWVU5vnH/Ibx0TeFONlvrYjvT6
 d/arzqyMe+4X4pBzaUQ4jpiVxf4Uq2lf1P63cuCRAUEFt6DLcya3lTBTpJVMGVAz
 j2WqpXmZD2NK0Qqd8A9ahuCC+KWI0VkLudZbPZ+Z1o5RjjWG0HWPQkk0VNHSrcrr
 OkeOlmu9ZkmSw0uToBFqVWkwpX8gzXEU35968q+uLHGW+EZAJer9JeziB8HQLaud
 xM+MEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=pinW0NmCwac/ePCFB3ZIrfQfbe+ry6QLq23mY5Yro
 Bc=; b=dPkAyAByceMZOcqYJhHcmuc4muu6b85ns5YVc6x+Q8vfzOeTtpccY09ro
 CMgZEJiuqmjYxT/6WC0+Z4CxMWP1CSLNqCuoxmTIQzm6P9qXFiBQt7EHkywHtvk6
 5SEk6BoFdgZCQh7Q1/LFsxE93MTII8E/0WkB969DxFG9elabxiFssVB9pglRQlp4
 1HGw8sV/osSlkqdbLrenkjYuXTrc6tvIx9VJK7YhIj9EKF+8c1vqTJf8JAzw5pun
 s4Ky8Ei04foB9c9ZcjV1JAv9Hy8fFKARP/hxbWBbM/5uExP9A0GjjLS8jjYK4wW+
 d3GPS59cxHe4g7l2JE90lwb1lQ28A==
X-ME-Sender: <xms:1DSiYD6AMlWRG5NddOOen4kaxv_-Q-JSpSo0BGL2_BeRaHJlXeWd7g>
 <xme:1DSiYI5q1urxO7sy9JPDGj8zPWkxyhB3N7cPUcj0gITBw3oGX2NSSZghooOlT_Cx6
 REhQkxu8d9KyhAH6kA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1DSiYKdKT_djq1HJweaKrn1twDG9phN39ro2jnTvWfbM-PGBp3IoPQ>
 <xmx:1DSiYEI_rHIdvRgSuQ78KaS6E0alzRZr66wQhCXEtVvGiWc2S4v_tw>
 <xmx:1DSiYHL_R12KtxLIrW1aaFRSdx92MXOkNnreLcMEU8LH5D6GNiFLgQ>
 <xmx:1DSiYIW0N_1mDPPlgFwp65WToM4-CsyhAjDpsolld0U1Fb3pLS1PcKvXiIs>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:10 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/20] hw/block/nvme: rename __nvme_select_ns_iocs
Date: Mon, 17 May 2021 11:17:26 +0200
Message-Id: <20210517091737.841787-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Get rid of the (reserved) double underscore use.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 47 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index acbfa3f890dc..f0cfca869875 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4928,7 +4928,25 @@ static void nvme_update_dmrsl(NvmeCtrl *n)
     }
 }
 
-static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
+static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
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
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
@@ -4979,7 +4997,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_attach_ns(ctrl, ns);
-            __nvme_select_ns_iocs(ctrl, ns);
+            nvme_select_iocs_ns(ctrl, ns);
         } else {
             if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
@@ -5280,26 +5298,7 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     }
 }
 
-static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns)
-{
-    ns->iocs = nvme_cse_iocs_none;
-    switch (ns->csi) {
-    case NVME_CSI_NVM:
-        if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
-            ns->iocs = nvme_cse_iocs_nvm;
-        }
-        break;
-    case NVME_CSI_ZONED:
-        if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
-            ns->iocs = nvme_cse_iocs_zoned;
-        } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
-            ns->iocs = nvme_cse_iocs_nvm;
-        }
-        break;
-    }
-}
-
-static void nvme_select_ns_iocs(NvmeCtrl *n)
+static void nvme_select_iocs(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -5310,7 +5309,7 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
             continue;
         }
 
-        __nvme_select_ns_iocs(n, ns);
+        nvme_select_iocs_ns(n, ns);
     }
 }
 
@@ -5412,7 +5411,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     QTAILQ_INIT(&n->aer_queue);
 
-    nvme_select_ns_iocs(n);
+    nvme_select_iocs(n);
 
     return 0;
 }
-- 
2.31.1


