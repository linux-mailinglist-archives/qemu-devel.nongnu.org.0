Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947323BC8AB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:49:58 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hiH-0005DX-Hx
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hTI-0000o2-Bt; Tue, 06 Jul 2021 05:34:28 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hT6-0000hX-OA; Tue, 06 Jul 2021 05:34:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 101CC3200957;
 Tue,  6 Jul 2021 05:34:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 05:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=XMXOaewPT5IBD
 3TV5oW0AHys5ixknygn+zoTN/HKF6w=; b=DVkxywXzOGyzm0xX+0oNPyopDJDA4
 TAA6UoQnQntnzsq8jGVrYVCPtLvUhvsv3wFdnaEKXtxI/sM5CU1WJ4bBMLC0lH9y
 RHPbXZ0r6gvdHtN0Zi5/aJUkNWxjiWmrEjdGzeYPkuXXEI0efZ1HW4rqzWrg6H28
 u126Of+ogvz6FBXmk3rlPtlTkk7sgASlGC7L6P49UTODoIshn+bfGV8Y8Qb56QMi
 4Lgf2mGP1pi0Mz2lnRk/13sEDMfTCNV/YO4ALwFZ7JKyql8CknomJBRMF7HIFv5Q
 F3FBPE/K4WeNB+SZhEpfotTejT5H6+OhV3TOlxFAq/s8k2ui7jXy0SFkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XMXOaewPT5IBD3TV5oW0AHys5ixknygn+zoTN/HKF6w=; b=o8R715xb
 Iz9k20Gjr/3109WRRnUwIwhRhicSWmyT/BTZ82OGwmWwVfk0BPqiY3EaoChGUg04
 cYd4KoybZPDYNWtdncMHU9AALs1otRtiPLs1mPxT9VXPYA/KR2+A965sf62tRKbK
 odkBdqSvVMBRbos13RBI33sHVWAMopVt233pdctsC8u48UR6al9BBw9NX7z25foG
 FkO7nXcMi/jeL8eeaX/JeG3XLRFNRG7vTkxLkUWb2g0li8osV1lsqDwF8eIZs4o3
 A3SXlO4IIemf9Qh9SHcOZc0yBibs0PbLacMf0DNIQwDlb16K/YA1saparyZAg1sB
 GJglU2i1li7hRg==
X-ME-Sender: <xms:kSPkYNfq494uIK2CfjCBCTLqQgcRc38Srq9_C2Ji-8c1wMl4dtymPw>
 <xme:kSPkYLNDMuQr3wnHGngnwQ35UvB4WGliUtYjkgOyIAekrhsduDvEYpEmU2OyYe7WY
 JSG0M7xayWNcE_Ei-M>
X-ME-Received: <xmr:kSPkYGj9neydR81iX-s-e2KMzd3mLQkduozSB7q_maal05nC85i4Kz-KQ_-Okxk53XuYf2o6nY5f1V2BCzV5Bm08LsmcYYKJhMWHjImaPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:kSPkYG_Bs8HxOqx_gmGWEwu_d7-krOaVCjJY1DluutoIGReStsHxUA>
 <xmx:kSPkYJva6sko73bwsawWPjgviQeHSXAyjtOrkmtQxUyoo6LTMepm8Q>
 <xmx:kSPkYFHyMGu4hRbFk5rMN7jX-Lr_kDbWOE5gfflzb3rOL1dHfbS5lA>
 <xmx:kSPkYDJw5K7ANV_t3AH_M1BXLe8Eko7mnKTtcXQHzsVFouii0BGVcA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:34:08 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/nvme: unregister controller with subsystem at exit
Date: Tue,  6 Jul 2021 11:33:57 +0200
Message-Id: <20210706093358.1036387-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706093358.1036387-1-its@irrelevant.dk>
References: <20210706093358.1036387-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Make sure the controller is unregistered from the subsystem when device
is removed.

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


