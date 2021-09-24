Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357E0416C8E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:09:45 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfL6-0000Az-3i
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezP-0006VM-40; Fri, 24 Sep 2021 02:47:23 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezG-00015r-UF; Fri, 24 Sep 2021 02:47:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 255D8580D26;
 Fri, 24 Sep 2021 02:47:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 24 Sep 2021 02:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YhkaJ7cPt1uYG
 utd+x2G39XivILcz7tL4nQNT7E6cns=; b=NhrUpicCWuzmgA+xbQ3nWv1KhIzWy
 j/jmaIoDYFwKMoBFPsgc8XFYxWPSrWH14TV8sorjHkiPbv4xykP2ceeDJ2IZDXeM
 bD+Pau1rBY+VFxa2hyO33mrsIkElRLnLvSwEPxVvQmgaAwZSwgxvQsf/jtLdfX+9
 0nY2xk5vAi23+rwlfw4LAELfCFBbrkvEooNyOT637jB0nUaVmJ/KBsdCC1RBWuG+
 0L6MkAlo089VBnN12jhhexIgoLIM5IA0R6EVaAlNtcuT58i6LdEczlfz7OXfIEJU
 f/mhO7fbDCSm4lgSGURgsPRCH+/mLWog7E3+yw9u/McXz6q6FrX85oKyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YhkaJ7cPt1uYGutd+x2G39XivILcz7tL4nQNT7E6cns=; b=EmlO6m3g
 ggvsc4XmiWwGupKd4skI0vLvgRNZAtC84RyHHEBgM3sRIdbkk8S2DDA/al2Q0Rlu
 7tLOH5Bx08ftuYW6dZvEiiOb3xXpzrZe9cN7LsTFODKw/ra3zwbTKLLeih8ag7Rk
 IIQLwN4Zz2dSfe3Afujdh9LXGrxEc5ZZx25Z5R0yPGZ4j8eJZTCv3wlbaGOfAGwN
 bBe+PFBPhgxY4EjbyB636UtcqtONBA/mLOUoiX9khCsGJJWzUbw3qyeisdtXUm3t
 6bBrkj13o+VEPq+0pjuIpiyu/Y0m+puZGkiAQVK6ke44PJI8+6TPIEcbl8TwsKG9
 77xOkF1B3Xq0ZA==
X-ME-Sender: <xms:bXRNYX2D5YcxCdAnCr9XvYvZGopNA24LJ6sR7xgK7b1eM84j7tKCEQ>
 <xme:bXRNYWFmDfazvLlH3mw4JLNLBDwhhawiAR1sR4UnmvLbO65-7yTae2_0G2DAFtpid
 QS4urGCFBFwduu2-Aw>
X-ME-Received: <xmr:bXRNYX4VfEQmaMlDClgWBaImO739XupEJd3fvxk8POly1Nwt-NvOk-yhUSUMua4ceg4dlJoRPASenQuIVKo9zHrjET9oBP2wgYuGOB3lyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bXRNYc3GL_1KOxkWOyKtn8aszKk04EBJxCeBil6ecA0UzjY3IOKWEw>
 <xmx:bXRNYaGXMwH_sIJFg4RLsjys3Bj7LOiSstJxqv46OYcCoyxewJTebA>
 <xmx:bXRNYd_RhMQQ-FxLPNFa_8B7BirfnzonD78l7HkqAIc_o5xZa5I6Xg>
 <xmx:bXRNYV8a_-ZCu-qznFXYMfhWoz3qMf7ZHZbriJjwjJkaeqxbS4cVKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:47:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/3] hw/nvme: fix verification of select field in namespace
 attachment
Date: Fri, 24 Sep 2021 08:47:00 +0200
Message-Id: <20210924064701.283182-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064701.283182-1-its@irrelevant.dk>
References: <20210924064701.283182-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

Fix is added to check for reserved value in select field for
namespace attachment

CC: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 15 ++++++++++++---
 include/block/nvme.h |  5 +++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ff784851137e..dc0e7b00308e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5191,7 +5191,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
-    bool attach = !(dw10 & 0xf);
+    uint8_t sel = dw10 & 0xf;
     uint16_t *nr_ids = &list[0];
     uint16_t *ids = &list[1];
     uint16_t ret;
@@ -5224,7 +5224,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
         }
 
-        if (attach) {
+        switch (sel) {
+        case NVME_NS_ATTACHMENT_ATTACH:
             if (nvme_ns(ctrl, nsid)) {
                 return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
             }
@@ -5235,7 +5236,10 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 
             nvme_attach_ns(ctrl, ns);
             nvme_select_iocs_ns(ctrl, ns);
-        } else {
+
+            break;
+
+        case NVME_NS_ATTACHMENT_DETACH:
             if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
@@ -5244,6 +5248,11 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             ns->attached--;
 
             nvme_update_dmrsl(ctrl);
+
+            break;
+
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
         }
 
         /*
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 77aae0117494..e3bd47bf76ab 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1154,6 +1154,11 @@ enum NvmeIdCtrlCmic {
     NVME_CMIC_MULTI_CTRL    = 1 << 1,
 };
 
+enum NvmeNsAttachmentOperation {
+    NVME_NS_ATTACHMENT_ATTACH = 0x0,
+    NVME_NS_ATTACHMENT_DETACH = 0x1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
2.33.0


