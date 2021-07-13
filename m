Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D053C7760
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:38:48 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OEw-0006pp-U5
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1L-0007Re-4G; Tue, 13 Jul 2021 15:24:46 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1J-0003RS-Fk; Tue, 13 Jul 2021 15:24:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C4C44580ABF;
 Tue, 13 Jul 2021 15:24:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Jul 2021 15:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=JVoCoMF6CeZvD
 w1/2W09XQ+dmID6Hr903l4AIV3b4DI=; b=S4QEG6SDweRXhPmgP8RbvwWFbpCpg
 NgKWbSZt8W6EdxpvVmbSl+1rArwxdzdCkIDdLI1OWoNi5QSLATs7R0D01HZDvnX9
 xOLA9nYK3hlX7LeFdinfmLt6ZxUt2b2X/vz4OLrPw/mJ2F13rHsbKCl5aFPNsGgH
 oMTv1bsRAAEhTQuUYe2S5bDtSvBHpWsy6JNPNfsPTsXk8X0MIC8qX9hA3RJBDPkZ
 B2aGapV3/e0X7wml0DF6LlbvgJp4uiJed/y23Wo0hFJS3bYIrpTrAfr2sQNd4nz8
 YfG7MWBxXD9kJY5noFjVluAjzi8wb5JgCfl2xPDoYJCF/XhhRIhLnTiVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=JVoCoMF6CeZvDw1/2W09XQ+dmID6Hr903l4AIV3b4DI=; b=sXI2OkTA
 U/iXnwacW8E7lqvMtIKHjIJBpQEKlhihFgZixdDwiZuwv3IBXY/X0EEOjMP7jBvl
 eF60PRf1acT6HLxwEsHy9yStdpYcVLyXm6QvoYRi43/cPXOrwmZwGosse7BTKBLX
 MUYoacEHpKS9DlOkufb2KDbKCQjsymWgVYvo7kLXCZOQ2ljWIOwRG03nF/LaMm6c
 8RL6yey6Fmm4ow6WDq9nNui0RRlehOUj0Jr5NwQS5AngCpKZL1L2/N21+nyU2mUU
 UtA3SHMpHwQZ5/fvHc5KUPqYtLY1wxxohUAcIKvdAUJRlHG/jSmEBCeBlZDW4Luj
 r7x/qdl61ALHqQ==
X-ME-Sender: <xms:eOjtYHVeg1VPsCqx0IZ-hySCq9_4IknIxkrKF83OpYW9sM6gIzGX0Q>
 <xme:eOjtYPlxnkENy0OFnyU__G44zu3YmwymRmAjH_D5KOmdG8BF0VU4a3m1IPwpLEvsD
 bDixqAwu71VMp7MsW8>
X-ME-Received: <xmr:eOjtYDaVyEFcF4qxHwvpVtXbdqe8lcU-5GBEqPNINbU_pSDg2pccuxrtblHWG-4Zf-O83xNuofJ9qvSSeMyIC185xbZUz04VszAcPHbclQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:eOjtYCV4Id-clmcPkPefsmGKTPOHP-x1mXH0iC2txnsTz77ULfBm2A>
 <xmx:eOjtYBkqkSdGq0Iq_WIVW2iFB6n4l5727p7fyhHq9JxEOwo-Evt3MQ>
 <xmx:eOjtYPf-k0IHuRQCyuTFWZsSeXkjcxm6jFns8xAEI361o6_N4opmqg>
 <xmx:eOjtYE8ZH8dmspT3XCMyBZwWWhZcM1__w48Xws9qWvpv-wrEG0b3IA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 15:24:38 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/nvme: fix out-of-bounds reads
Date: Tue, 13 Jul 2021 21:24:26 +0200
Message-Id: <20210713192428.950160-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713192428.950160-1-its@irrelevant.dk>
References: <20210713192428.950160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Peter noticed that mmio access may read into the NvmeParams member in
the NvmeCtrl struct.

Fix the bounds check.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8c305315f41c..0449cc4dee9b 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5968,23 +5968,26 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
         /* should RAZ, fall through for now */
     }
 
-    if (addr < sizeof(n->bar)) {
-        /*
-         * When PMRWBM bit 1 is set then read from
-         * from PMRSTS should ensure prior writes
-         * made it to persistent media
-         */
-        if (addr == NVME_REG_PMRSTS &&
-            (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
-            memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
-        }
-        memcpy(&val, ptr + addr, size);
-    } else {
+    if (addr > sizeof(n->bar) - size) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
                        "MMIO read beyond last register,"
                        " offset=0x%"PRIx64", returning 0", addr);
+
+        return 0;
     }
 
+    /*
+     * When PMRWBM bit 1 is set then read from
+     * from PMRSTS should ensure prior writes
+     * made it to persistent media
+     */
+    if (addr == NVME_REG_PMRSTS &&
+        (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
+        memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
+    }
+
+    memcpy(&val, ptr + addr, size);
+
     return val;
 }
 
-- 
2.32.0


