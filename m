Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3109318EBD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:35:04 +0100 (CET)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lADzi-0003ZU-CT
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADmv-0003cI-6Z; Thu, 11 Feb 2021 10:21:49 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADmt-0003k7-Nf; Thu, 11 Feb 2021 10:21:48 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id EE6E15C00A4;
 Thu, 11 Feb 2021 10:21:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 11 Feb 2021 10:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/qiaKh/Umj0v0
 u+CwNpOqgCztOzHKADBAylv/jX6NO0=; b=KSwWcyF+VeaZ1APqiVZtM7rLL1pF4
 hQRF0AUYApY6hmCUYhNxfHFUPkMSWj+mowiensG8QiQ/seAHhRJgEp5pf1gn+a6o
 2ycKBKHn48e1SDq51c4uqdlI1XfxjVGLMXXJ3dyImsPyBatm+qLQoEizUasccFIJ
 FegsfIjJF/XgahTjQj4pWX+Y97RkWtWxQUj2kwdE9t252z3bXDB2mRMstiYhnOv/
 0tAV1P0ZfErQBUuc5Nc0Td6W5FlNGZnLnnastZbPAn3QocRWzLv9Xar4Wac2IS+Y
 t+KcpwoR+1AlFPmJ32SxhpZfJN/Xp85xWznzSYcVD9mm7oCy/aUn19sLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/qiaKh/Umj0v0u+CwNpOqgCztOzHKADBAylv/jX6NO0=; b=iq8nCxv6
 qXWksR/9bEzL+yXKXBifIUrHnT9O+Q1skbW0r89cDfMYn+DYLe1RHNHl1PVXq9Z1
 +9S9KOHrgvtE+aQxwO6JlpiWTqhinOMc8yoTfoGjJLoFt0bptFm5L5UiOeiSEjLj
 6+NX/fFlQA1gphrEHXmKlhsazvD2FkmMU335lR3s9mO4A+MZTlDSCF2WKmnrAwo+
 ldKS/PTcVY1TGJKJHYkiFWiw/JvoE4zOFfe1qlBXKPdtZ/WQrmpkH2pDv/R5wKyj
 0EeAEol1yK8veDSBg6Xhpj08ffJ7euPfS25uPrBVmPwRafuzo1JCIQCxUYE/hDhC
 k1613lCsT2uHNg==
X-ME-Sender: <xms:ikslYGKUSJ14O8aBM8xxh0DpYSHaQAXaiOE0xmnFg1UEKFBjt2sB0Q>
 <xme:ikslYCclJ5EbJwOUFrAON2lomdQSMnA5TUFGq9FxW-c0dpEZWhESZbMmq3df3pG_U
 lqbWqI9Pzd9eZd18XE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ikslYF2OlOb59WAuzz4IgDftG0PVubOsFjgeBFZg09L-42p2XQ95Bw>
 <xmx:ikslYDgjtjoIRTjDMG-p-ciUc0C9NXjMGHu5wK7GgrkAfrgaekrWTA>
 <xmx:ikslYDRXT9_nMWO3YFrFYRHmaYABtOj06RZtl9Ux-M1PsO_NyGSlrA>
 <xmx:ikslYJ7Psv545eJsLBXprmA-KV-QGFj2iddnzqD3GCWJGCY1PRgGaA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6DBFA240062;
 Thu, 11 Feb 2021 10:21:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 3/3] hw/block/nvme: fix error handling in nvme_ns_realize
Date: Thu, 11 Feb 2021 16:21:39 +0100
Message-Id: <20210211152139.1004257-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211152139.1004257-1-its@irrelevant.dk>
References: <20210211152139.1004257-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_ns_realize passes errp to nvme_register_namespaces, but then try to
prepend errp with local_err.

Just remove the local_err and use errp directly.

Fixes: 15d024d4aa9b ("hw/block/nvme: split setup and register for namespace")
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
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


