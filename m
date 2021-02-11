Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086A318C5F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:49:21 +0100 (CET)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACLP-00079C-Vf
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABgw-0007Cy-7a; Thu, 11 Feb 2021 08:07:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:55113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABgt-0003VS-FP; Thu, 11 Feb 2021 08:07:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DAEE5C00F8;
 Thu, 11 Feb 2021 08:07:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 08:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=yr39mdGQTNlqSYbBDGTDo+wgEC
 tJHZp8I7IuZiqtFAI=; b=gbr55G+mMJI1YwAvQXqdd1JhzWQcGXjn1VRPAjQsJx
 h2DOrqibpO/ikMBsnRPvDNtkjtKdTwCSi60dFhWnJEsrHkn26UgoOKvHI6rMYHuQ
 DbRu6zf80CTGQwKtiu8XKeymy8LTrha0AdjFkTm7+D0WdWlxV0LNSm0TvVc+MoJ2
 gi4r4ThFTcvhL4H+KfBVgm5dSd8IdamcZsRR1XsaMR73zqFtQVBl+SyBUodZ48fT
 xZ2DN7l5ocOg6eNLAE+xCsoL9bCJm6lDwN9x+U3O1jSgxvScaeureCA9JRvFu3TU
 fhTRYubnVjP6Vy+AjueW/qj2fLaOMtatM2/74ukwHhjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yr39mdGQTNlqSYbBD
 GTDo+wgECtJHZp8I7IuZiqtFAI=; b=N9HnWYtsPtyKCBt/6Et9gGrGGnAGgtCP2
 xlMeZ70tUlKaK1/ttuXVmk5sPF/pU79fmdyLTQYjgDn6R5s5YJ4V6eyvyfNSxbp8
 iHU1Xu50mSY27FulyGO2ISd6MUfsGXsj50hcNaWpKaJezzJtk5+ziYQgChkBE0af
 wR7RIragaaeOQbUeNsjx1BoMPYcpja5HwzwMzdrPR+7iW2OnMWdwPakkUo8H79zF
 to5SxV8+Xi1FILeDxVvHs+g9NYKrx//vlkCVFvL7maFcJPjchopjahluJWqCvboH
 Cc5WkMUlUeqM0ONUkZ46JRCWYuEuiUP1qASv8rbe8dnYEzoA5Jrhw==
X-ME-Sender: <xms:CywlYEHGO1vApevRfyPVQDBCUFIdkej5ZczNGLhaphjlSZ3CW4lmWw>
 <xme:CywlYNXrc_boq_0kdeSJefoJcDP2_9nlsiWrW0NchVmAb-vQkVU5SfM8CdPRA7Xb0
 b3TT1Mx6BD1dtaL8yI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:CywlYOIf-SpnnuZ-m3lubxBJkcZCqojfd2n2CHsDbvpLy3MgA_KllQ>
 <xmx:CywlYGEL88MhnFJZ1YoFpC6guyXdFrhoJWET8CErmn9l19cqAE_jMA>
 <xmx:CywlYKXCZKLPILNPXdh7oNgBwRyTSrOFj3mh4xgYOFwaG_xvK3BBKA>
 <xmx:DSwlYMduk6mguU2uMNtrHAxm_ucnAj2VyANJepC3P4a-PbSLp1Lfow>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0E10108005F;
 Thu, 11 Feb 2021 08:07:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix error handling in nvme_ns_realize
Date: Thu, 11 Feb 2021 14:07:21 +0100
Message-Id: <20210211130721.997302-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_ns_realize passes errp to nvme_register_namespaces, but then try to
prepend errp with local_err.

Just remove the local_err and use errp directly.

Fixes: 15d024d4aa9b ("hw/block/nvme: split setup and register for namespace")
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index dfed71a950fa..93ac6e107a09 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -358,17 +358,12 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     NvmeNamespace *ns = NVME_NS(dev);
     BusState *s = qdev_get_parent_bus(dev);
     NvmeCtrl *n = NVME(s->parent);
-    Error *local_err = NULL;
 
-    if (nvme_ns_setup(ns, &local_err)) {
-        error_propagate_prepend(errp, local_err,
-                                "could not setup namespace: ");
+    if (nvme_ns_setup(ns, errp)) {
         return;
     }
 
     if (nvme_register_namespace(n, ns, errp)) {
-        error_propagate_prepend(errp, local_err,
-                                "could not register namespace: ");
         return;
     }
 
-- 
2.30.0


