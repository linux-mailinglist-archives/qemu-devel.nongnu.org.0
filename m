Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BB6364B07
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:14:10 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaHZ-0005hQ-Fp
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ7-0000Kd-Ep; Mon, 19 Apr 2021 15:28:13 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ5-0005Gl-MQ; Mon, 19 Apr 2021 15:28:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9000221BC;
 Mon, 19 Apr 2021 15:28:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Apr 2021 15:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 cODf2O4lH97r3C18vks/nogbdNmtYB8aJeNua4Kg1yE=; b=WVQ+iFhjLHwxthUc
 w7jHhh1N+m56eKSI2R/qmOVqhxQiGGbvWS5RkIKkQJUlG5Hho3OM3/5TCytG4oJz
 TZMdBs6SHcyGHop2aKng04cLpr/SopOquzFfl0G3LDod50zpSbNmh5fn/9GX0yP5
 kR6fKyGDoDX1npDg2iy7QetMt1FoGQIaxK6yqSl3DNgoPaHyzt6kXRuNuVlamrH/
 vSeMfVP8yWzPipY4abPZy5AVc/9Kv/jXj3dzhoVf9TCb6kaxa2VDFJoh3PbNMl4S
 ZX8zxepHARq9IzpTBj7ES5xGQC4D2YO7Q4jyAOTHFE0RzYg/TmZeGAHpa7hat0/E
 MwnJ2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=cODf2O4lH97r3C18vks/nogbdNmtYB8aJeNua4Kg1
 yE=; b=WSwe3d5O0C+3nGtZTjPxCj68QSEz42v4bBCJlEk1vcvrlCsJeDjYtca2q
 /CLHMP7U3a5fIM0rxUAreWUqS6WF+U6JHiC3vSPo2UDdXZYl6Rb0ngtvscAiOju/
 OElII6oEzNlY1FBl93uafq0QaSCBW+7BOLZp7P22BIVcDlqB1P8AgPvnPCCLWhwA
 DLnD18lazRZnZTjd4jl88bDi9RRWFU7TmDwnv6Z60gahzIVAg+3AQWsryD2Iv7Gh
 EHU13yX2x0hrZKXCwsIiiUqiUPf7uC2zbYTspnVrKTqWFzgiWopM+zGBXtTJfoAZ
 PZ2MojfddZSNDLijaeAlZdhGiyVfQ==
X-ME-Sender: <xms:yNl9YLrvU1kevNnJ18_24nBFexo4QhRnVyjWc7SD9MlS1W2S1w9K-g>
 <xme:yNl9YH4yZLx2X_WVL9i5c5jtDDjm8EDj41wgibp8NCGUuTd4xVLoBQgkKS-w0z4Pa
 Z6Qjbp0VZeX1wXMC8E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfh
 ffdtgeenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:yNl9YKePcvcQWMyqpb1QJDKli0XdePdPfS-i5coQgo5pIc30HbtHxw>
 <xmx:yNl9YE6ieheM8CnqmHr1sazXxSXB6FjYRelUWkzxHyJXPTBEy9HDgA>
 <xmx:yNl9YJsDprj4t5MXtC4nA99_o4-vOX7B1X5_aXUsmBw2Lj1K84rxbA>
 <xmx:ydl9YIW0qsjAbaliKv8ltBBF_SoHQI1AkpaHq9PMLJttMPHqKpciQg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 781081080067;
 Mon, 19 Apr 2021 15:28:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/14] hw/block/nvme: rename __nvme_select_ns_iocs
Date: Mon, 19 Apr 2021 21:27:50 +0200
Message-Id: <20210419192801.62255-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Get rid of the (reserved) double underscore use.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 47 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d1b94e36c6fb..f8209a92302b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4916,7 +4916,25 @@ static void nvme_update_dmrsl(NvmeCtrl *n)
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
@@ -4967,7 +4985,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_attach_ns(ctrl, ns);
-            __nvme_select_ns_iocs(ctrl, ns);
+            nvme_select_iocs_ns(ctrl, ns);
         } else {
             if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
@@ -5268,26 +5286,7 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
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
@@ -5298,7 +5297,7 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
             continue;
         }
 
-        __nvme_select_ns_iocs(n, ns);
+        nvme_select_iocs_ns(n, ns);
     }
 }
 
@@ -5400,7 +5399,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     QTAILQ_INIT(&n->aer_queue);
 
-    nvme_select_ns_iocs(n);
+    nvme_select_iocs(n);
 
     return 0;
 }
-- 
2.31.1


