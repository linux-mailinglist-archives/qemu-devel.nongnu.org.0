Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCE3C3F41
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:42:13 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gHD-0007KR-PZ
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3P-000459-4K; Sun, 11 Jul 2021 16:27:55 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3N-0002wi-LS; Sun, 11 Jul 2021 16:27:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DCFB33200201;
 Sun, 11 Jul 2021 16:27:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 11 Jul 2021 16:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wG7Zr+dwuhEwF
 WP/4Iw9tSJ54oGJFx3b2RiKRyjEeY4=; b=lUgJKWzdc96HJfauWtje5NcXH3q1N
 xN+yuJNMz5zB8W1UFWgoPD6RKGAAL/fK5psOqADsUC2ZbQ2lp29ITty7yhclBezs
 dLXQ/aDigZ0hHTZMrpr297kdjqMy3M+bn5r0LP/OdfhIVwU0tGikWLh/kAfPeHpj
 9UyLTl4pzWFo6wdozhrJU+ZkLQbnFHHXJMgtT5R2zBmREhiYq8Zi/FeGBaP7DNTv
 M/Q6/GOoWFKJJjQPR88Ja5W/ey1qbAimqfme3yqoV9JNkXqKVsg4zeYmhBzAMHlX
 El1CBew+g15nN1OZmPohqKOrXvCajR2pP3xXEZsDv7DRGcopobyIZb1Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wG7Zr+dwuhEwFWP/4Iw9tSJ54oGJFx3b2RiKRyjEeY4=; b=AJ6WVAi4
 49qmCi/6rMQgOEQygeQ0aJMpIjz68PE9KLgTV6xiezyoKT2Ecwfmb8GrhYMBlzKF
 UHYASo251dHj7byUC4AnGWcVh4X8Zy8WGRh4mfX6O4KED5xZGdlO3IN0/qW79HA6
 znYh+lIfRz6kxpptv+5MYgmbqlMBkW8A4aPkoyuKZXXrKJAl6RuwfrnscrAGt+wq
 1eqb3lrd/HVIZoBpI+wdC3Jq5T1M5ubu6MPtqP2hfTj6LRUPUPXygYLcWv2OrEUT
 nV1LNVUr0TSbNzhu9+LCpPidxrrHO0mJ26LdAnWN5EijG8MpcNnNF+9G2/UVhnFm
 nI8GKIXmOejzzA==
X-ME-Sender: <xms:R1TrYMwjNwjH7fx03KGOAuQE9bHBwCu8JkoNUOxh_x22HrhYkchz4Q>
 <xme:R1TrYASiqTm--jDxvDm8RUnWXdqxYzkupFn8zyBsKadYcjqY7octs0Q4MvsPkzaPB
 8jffZwgFnVAqkbGgUA>
X-ME-Received: <xmr:R1TrYOXr2b88pcvwBAMjhgfsipmZ8trX-AGIjLR7DoLwJ9ZTdFUzt8yyebQbrl1XUgNPphau-6_ppG0I-vXK0u488D-61z1mLWLfcHvpgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:R1TrYKiauMsfFWsiYgN4meDQmoHx_9OvxGS1O1L2Nf73lDqJBKyN7Q>
 <xmx:R1TrYOCNsBf9RZh0H1HXGP5EB5c8g0_nDPRpmyrj1uWdUz5D79YSvA>
 <xmx:R1TrYLJECkFzJCbjKsNIPo6qcmAW3XcwwKPqKu4RoTdT622EWi1KWw>
 <xmx:R1TrYF6LVYpQtnD_WaYD4rNX8J-H1pFkKKXu0vwgEGZPDKYZm1HFKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jul 2021 16:27:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/6] hw/nvme: unregister controller with subsystem at exit
Date: Sun, 11 Jul 2021 22:27:33 +0200
Message-Id: <20210711202736.591334-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711202736.591334-1-its@irrelevant.dk>
References: <20210711202736.591334-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Make sure the controller is unregistered from the subsystem when device
is removed.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h   | 1 +
 hw/nvme/ctrl.c   | 4 ++++
 hw/nvme/subsys.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 0868359a1e86..c4065467d877 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -50,6 +50,7 @@ typedef struct NvmeSubsystem {
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n);
 
 static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
                                          uint32_t cntlid)
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dd1801510032..90e3ee2b70ee 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6523,6 +6523,10 @@ static void nvme_exit(PCIDevice *pci_dev)
         nvme_ns_cleanup(ns);
     }
 
+    if (n->subsys) {
+        nvme_subsys_unregister_ctrl(n->subsys, n);
+    }
+
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index dc7a96862f37..92caa604a280 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -32,6 +32,11 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
     return cntlid;
 }
 
+void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
+{
+    subsys->ctrls[n->cntlid] = NULL;
+}
+
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     const char *nqn = subsys->params.nqn ?
-- 
2.32.0


