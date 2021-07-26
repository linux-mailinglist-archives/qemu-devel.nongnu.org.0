Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062C3D6778
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:25:58 +0200 (CEST)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86Ef-0008FH-33
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868K-0004Zp-Gt; Mon, 26 Jul 2021 15:19:24 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868H-0007gR-KB; Mon, 26 Jul 2021 15:19:24 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE209580412;
 Mon, 26 Jul 2021 15:19:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Jul 2021 15:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wG7Zr+dwuhEwF
 WP/4Iw9tSJ54oGJFx3b2RiKRyjEeY4=; b=HlCrgHrH/hBR4HyqsPvg4NLSFMK4Q
 oLBLigrQpzY5jGjk60KLwLKKgpFp92Zfa17g+RURzx42Es1aPpZVzOGhDlHk2FcR
 81apMIhaFbvoYacDtxifZTLcTCL5iaibksnZnAYLTVTYa5iZ65fpBkGop4ks+4JG
 7L1bo60SvJNHe0kzzpW22aIVslfKJX88uDxlGNbLiH5fd0pDTgFw7K8l4rsC+NGE
 1gsjmNeZ9pt48/auBOHXrlOilRSPLI/xa46o+mtTynoPL4YvEOO57FBbNnNzXpeq
 bRCou3n4QV85xUaod8DN1IgTBNCiDr/sQgAKgV7zj8KwxZbbKZoMnM1EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wG7Zr+dwuhEwFWP/4Iw9tSJ54oGJFx3b2RiKRyjEeY4=; b=wWGiKKO+
 tf5NWrH24ntt4I0yzWnPKN/sMlEybhB7xG5ME7gDPfwJ4HF76RJOr+4oy9FGL4s/
 F67vneg4FU+7C5pzIYuTYNXKEJKo1EGtbtXngTJCliRBsPUdG90peb/GaWtVgVWv
 f9Nn98z3IqiimFNlXD6P4hRL7SnK6xGRCcuFHfPpkucVBf5wJxRitsPqFV8uH02A
 8sCsIZF57h/F7LHn/h/zX/XAhObu4w6Jqbu7bbcK4KnKhlbhNh3pXRLSNEatZssW
 ThdyKD868p7I98Qqlfr65gRcg0Ojl3aTMQN4ANhw8XYnHxAZSJh+dba4fVbDfvis
 Rhv1BTkfFKHyHg==
X-ME-Sender: <xms:uAr_YOMQNs-ErBsQZbwekHUeWOSLf4PGEdE-Q8KTxTbejuIEVZSQZg>
 <xme:uAr_YM8-a4CRO-iUO7DGvi90E1PAW2qYdzNskdnl0KyzJeUxeEfl-J3IOjjZGRbOz
 vMyEFCn0G6BcmtQBzg>
X-ME-Received: <xmr:uAr_YFQQTGie8C-fK9p3VNj4GTdu3RhrvhDb3wEpNam5J9U0k6mhHX24xPlbHnqIEF14TdH2HmDJSCWLcbUQjV5bLS2roGAAgFQP1XRSDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uAr_YOvXYekme26N9a_6bfZfkOPMqc8AjK7P5rK7saOgx8gDkrkHEA>
 <xmx:uAr_YGfVjVlkhmYVaBnoYFemWG6UGab5Z9xnRSIhsZh_IxEfBjpATQ>
 <xmx:uAr_YC0D-RxyLHOeSYi8PHpVjYOF31_J2qbfE6CgORuWv8wW1O4GeA>
 <xmx:uAr_YM0jPJLLfyatcQrXs99n28Mw9-5ROEDhbTxlqP0PPeSWNAOz4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:18 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 03/11] hw/nvme: unregister controller with subsystem at
 exit
Date: Mon, 26 Jul 2021 21:18:53 +0200
Message-Id: <20210726191901.4680-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726191901.4680-1-its@irrelevant.dk>
References: <20210726191901.4680-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
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


