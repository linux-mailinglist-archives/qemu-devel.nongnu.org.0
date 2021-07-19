Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8CB3CED8A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:29:57 +0200 (CEST)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ztk-00072y-2N
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYP-0001Hd-5B; Mon, 19 Jul 2021 16:07:53 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYJ-0001Z0-QT; Mon, 19 Jul 2021 16:07:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E92B158165C;
 Mon, 19 Jul 2021 16:07:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 19 Jul 2021 16:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OhZ6ofxlqPTA+
 L1nvLlyBND0iE654oumdgMX/5x9EdY=; b=ggwt4VKpP6f729RXUtru8k3y0bIRj
 r3vYcJGK0G1GJbeD52Ag+hqzcVfJLp61g9XqFOsIPpURLGQ1jypZ+/KVENZVZK28
 m2Q1LMRABvfW8/06qEy98lNKwAGJDwWR1wwzOyQJRxjSPrk6H4uhwJNp9H4wCsgc
 3YPa4mroBM+LEEQGalTBw9/Jhc+b8tnFcv5C++GrwhK8b7kgciXJM8NgDpJXWJVv
 R26gE3cmVr+EDlS5g4qkmISz9lqsYxsDkF+QkKtwVJ+W+420kwd/+J55qxY/iTFY
 Fm4M9Rsqoe8LEYRY8gDLuKXKgqy9jjADSlFPUl8OHlsFsTDJkWW/3m/dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=OhZ6ofxlqPTA+L1nvLlyBND0iE654oumdgMX/5x9EdY=; b=nXMI8FOm
 l9fPnTiArF4vW8BNM9d+hxIT+qI3Nn4uISElzBiTeUZlkat4WClgeE3+io9YKCQQ
 f3fwEk39P6aKU/7tBcs/X8ZRN4qunpUZnwSD2XSAY767eyxjcNRTipgMPhifjpe/
 Psww8EGdqIPURvl9t0+H2XhLvoFG24ghdIY+oYWE52vvaAeph5ilysGtA/GKS5VL
 59A6ZqbKRysqtWTI20T5s34cKpxF+rrJIoBWNxS7CchA3nqCScNtPk9nrsBpogGk
 qHWpHvUkue76U4IfEPwUB3RJ9a1r+QJo0MZQR4z8H/YZ2K6cAzE20Gzg0DVKcQxP
 8afALX37t/31MA==
X-ME-Sender: <xms:ktv1YIaCT_0F_17iMoBJOulMqLq1GcxhxXx7Mb3O3mVB9BG1KxaLbg>
 <xme:ktv1YDYTnRnvImgYPSyg9RCfNWeJIzvRd1mIesPI4fsF7m5Ny-Z9JI7gMmpMIS-kG
 WT65gzhHc1mmGL-vPA>
X-ME-Received: <xmr:ktv1YC8KTIgU-2UDiR3M5IwKmDlQqMKfh-hQ8_dGYxIZlFO_QVOpeE2N5SCikU4DSbE5pxIaXBgbiw-HMG_NSKkuJA7Qw1edams7DablpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ktv1YCr8vcN9EOIn7yt9L4AeBOmL5f89fZkSRIqENSbjlGBgAeS4pg>
 <xmx:ktv1YDrebSdaxXbtzyG5fxzrO0uj0RaVH50fGPLL0L0KxKrSOxwPFQ>
 <xmx:ktv1YARXzimQS4qjXtDotdzu5zTtJa5ETScd1iwKC2aq4Dkm34Kd1w>
 <xmx:ktv1YM5a2aBqT8m2BjavcorULNldWHCSgAPsoyz68Ksxj3Z2TWctmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 16:07:44 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] hw/nvme: fix out-of-bounds reads
Date: Mon, 19 Jul 2021 22:07:31 +0200
Message-Id: <20210719200733.28502-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719200733.28502-1-its@irrelevant.dk>
References: <20210719200733.28502-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Peter noticed that mmio access may read into the NvmeParams member in
the NvmeCtrl struct.

Fix the bounds check.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


