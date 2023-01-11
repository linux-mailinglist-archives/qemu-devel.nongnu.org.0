Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D866557F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:54:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVul-0004L3-Se; Wed, 11 Jan 2023 02:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVub-0004Gf-36; Wed, 11 Jan 2023 02:52:44 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuZ-0006BS-DA; Wed, 11 Jan 2023 02:52:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7638F3200975;
 Wed, 11 Jan 2023 02:52:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Jan 2023 02:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673423557; x=
 1673509957; bh=vjeDkWjxBs7VsJWlOzotXPoP3gq/Ilv2bcQxbwCNcME=; b=t
 +9PkO78l1BX2se/EKpyDQd6SoArZ3PFSAHfeOgtzxYxBmGgtY9dmZTThJWhWPceu
 piU+kexiXqJbzp1xcXiwVmBXDIgmEo9Lrvjn41osGArbt4airGZao503xsEr/9wa
 bfjxisetoRLJY/0ezRu6mdS4RiOUg9KtGsdX3kso3zUtR55rhXxFlVqLwFlyfSTt
 wdXGcLPGSeUjY8aKqyCJFWB9ka/W6PojZAmhGQZ1j2IMVA3ihQTiz7KXsJfYusfK
 TyXeJsnnG3oFC4SjW/FAgJSwQrUdsl5nrbq/4jm9TJ+vkTufbPa+ntX0tep0QFSN
 S/rqkBeHUHjTUJ+J1J51w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673423557; x=
 1673509957; bh=vjeDkWjxBs7VsJWlOzotXPoP3gq/Ilv2bcQxbwCNcME=; b=f
 jxRJMeiXo9H2uQ+Pq68efqnS1cgLBajuvOI4QgNKmFrmr8dFkdzNTDDIfjl/cXmp
 W7e66bHBWHkXxjrGdujdnDEhOY7qZ50VBahFjFwtuBUNVzQcjbK5HZnDOILnqTYs
 GezIFeyKhl69XirmcODVtJ0/zsS6ppv0lw+gx2AaQHVtRRjzccQjWwx5JhPuRvYB
 avdT9CPmdHz5+5kGPQGKOevD+il503gJ+r8AI7aMiqoBrKfyAc+i1ivDKu6RVy6h
 CraaPcCXCO5PZMKgL/Ux/JO7DVIxasj2E16zt/bBy4Gn9ecA6bhGNdyvtd2X0sz9
 9WBRWe0HpwIM/uWHRfXOQ==
X-ME-Sender: <xms:xGq-Y2JUT3kS3MXxDCWEdU3sjDeWwBh9_6Bj7qOAe7Mw5kr2L9OeoA>
 <xme:xGq-Y-IV5frCxwH7G-q8-TdK-GqQsbrEJBF4mi-5fbt3YEo7DY6FLxKzlmQYsKDce
 a1ZwYroMeiO8zXuPsI>
X-ME-Received: <xmr:xGq-Y2u168Rl8L-ci3DQfeVdI-e2GJDPxTmmwG3tmt10tJJiGe_-xc_96m3s2F7it8nZZbOPym4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleefgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xGq-Y7bM4eorKRz3mcThuEJMB6oXCYp8B_upEm--r3gfskvlWZd-sQ>
 <xmx:xGq-Y9ZxG6gp0mf1z8jXrDDZLOjA_DWzNVbMph7i48z8U1mAlPILhQ>
 <xmx:xGq-Y3BYJELhl9rqNx7EOjcHB9YKuct711gN0lfBu0F_dlEbtyu03A>
 <xmx:xWq-YwyA8_wKXQCtfD-XnGJT0pedGPp0MZ3KS2BqWFdwKfgcUlVXPA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 02:52:35 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 6/6] hw/nvme: cleanup error reporting in nvme_init_pci()
Date: Wed, 11 Jan 2023 08:52:13 +0100
Message-Id: <20230111075213.70404-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111075213.70404-1-its@irrelevant.dk>
References: <20230111075213.70404-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2383; i=k.jensen@samsung.com;
 h=from:subject; bh=1AIzeG5STgVzfWyY2WYSKJ+KnIk2c8TjTwlw57Nz8Nw=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO+aq3VMzeVXFN0k4VkIwJpgIcehfIaHYGkypfi
 IGHDNZtMLokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvmqtAAoJEE3hrzFtTw3psh
 gIAKy4o7iKIVzOilD8q03HAurnpnVdMTt57OutmwOyu0GypgM6eGnm1ZpmrosN2bF77ln4kXJ1y5e9
 NCd+C7KsiLMGBwW3TGHrqFov2uR4y3OF2uO/SKfaEHnoxYzgL0xVEIyfrR5+bwJxN5PdTBRdMeBsy2
 7pbR1LtTHzlUEJjQrcWRYH0j6poMhhRk93AwPuGkMEQ+icqBIgBCgXBWrrDs/3no/9AjF5LQGzf7/P
 54rVUFJBwZK7pCGFjS8DnTaFW7EX518XsQ+mlFLuQRJvujsMu+ALuXn7l7WZZV/RRRAx9kN27gsJ8t
 8maVZEYH05FmFAE/cNiquyS6jJmt2JjZ6VH6Mw
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Replace the local Error variable with errp and ERRP_GUARD() and change
the return value to bool.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index b21455ada660..f25cc2c235e9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7290,15 +7290,14 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
     return 0;
 }
 
-static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
+static bool nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
+    ERRP_GUARD();
     uint8_t *pci_conf = pci_dev->config;
     uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
-    Error *err = NULL;
-
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
 
@@ -7335,14 +7334,14 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
     ret = msix_init(pci_dev, n->params.msix_qsize,
                     &n->bar0, 0, msix_table_offset,
-                    &n->bar0, 0, msix_pba_offset, 0, &err);
-    if (ret < 0) {
-        if (ret == -ENOTSUP) {
-            warn_report_err(err);
-        } else {
-            error_propagate(errp, err);
-            return ret;
-        }
+                    &n->bar0, 0, msix_pba_offset, 0, errp);
+    if (ret == -ENOTSUP) {
+        /* report that msix is not supported, but do not error out */
+        warn_report_err(*errp);
+        *errp = NULL;
+    } else if (ret < 0) {
+        /* propagate error to caller */
+        return false;
     }
 
     nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
@@ -7359,7 +7358,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         nvme_init_sriov(n, pci_dev, 0x120);
     }
 
-    return 0;
+    return true;
 }
 
 static void nvme_init_subnqn(NvmeCtrl *n)
@@ -7535,7 +7534,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
     nvme_init_state(n);
-    if (nvme_init_pci(n, pci_dev, errp)) {
+    if (!nvme_init_pci(n, pci_dev, errp)) {
         return;
     }
     nvme_init_ctrl(n, pci_dev);
-- 
2.39.0


