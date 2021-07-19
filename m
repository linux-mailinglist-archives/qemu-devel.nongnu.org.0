Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1213CEF62
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:52:03 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5c7G-00039e-O6
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2T-0000OU-6k; Mon, 19 Jul 2021 18:47:05 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2Q-0005PM-KC; Mon, 19 Jul 2021 18:47:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D836F580A37;
 Mon, 19 Jul 2021 18:47:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Jul 2021 18:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OhZ6ofxlqPTA+
 L1nvLlyBND0iE654oumdgMX/5x9EdY=; b=cKX9dN4U9KWf7GmVHnWdzMVHQTXSR
 Cy3WGtLU/H0tMrcoUZeRneKS6L1r1c753eHyyBgQdD7Eo1nlXy900fObiwakL0yW
 8s4qX5lHdk2MGQoNijT1/HmX/lSLdxnJtW0CjbIsbpJUFCgwEkuh2P8Eapu+upjk
 tQ2mvNAmyjXWB6JkZ0801l/PzPzVH2RrZS9H9NZgRlAoJMTG9rJhjdcLBWNmUXks
 WoTWFAQJcMzt/yDVXvkUuHIW3iDJZCAYWwctJ+wFST5NO4VkH6zzwV6hk3BsNXzn
 KcR2UtK9Fykxdk2V5op4hhnpGrucn+VQxCxNy3WlJpTLOf2nrU1ANEqNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=OhZ6ofxlqPTA+L1nvLlyBND0iE654oumdgMX/5x9EdY=; b=FOl1dvMM
 Qy9vSQOSxhQdBCyrCMGTkzibrHZGW+aZdvDsR/iLdoxqEuy8gZqbop53HHPX1oen
 dYtghHhfUMAQ+pXyxtTknv2mO9hZMugLrWWpesTzmka3Hjnp4ELamNl3ipOw+qUn
 febv8pCpT694Tx96WaZTh6XGgOVGVDx4Q1dGKgZQO7GZPxB7g5RL8OaCXjDC6EZR
 +JMEK1ENKUpDiYwlNdAeUe19HdlNV2mE/xhBDCz8FvIdz9HGngOLjX3bk3piKydt
 I9+nPEYn/H7wyU0IXqAKt4ghPyloYHCXMTj+UqhpMVxjGbMBgix75x6FT6rtj/YL
 krerSO4Ll2UgEg==
X-ME-Sender: <xms:5QD2YNz7-g25dEglJFg79_puV7D-S1R6iJZMWsyfo04tirfcsCB9Lg>
 <xme:5QD2YNQA67DyTQsUuN4kM0uUmHPb9M4jq84SJY4p63CuL5qHGe8w50CtpsjNUZEqd
 Kt-gZ19QzcEdZSkvTQ>
X-ME-Received: <xmr:5QD2YHUqngl2_d_AGWfFE8JNb2BMltYTg9cPuO3A7YxmfbWIQ2a91z1QKIs-3pfkqIU4Q21ZwpJsRx-fKyedjRjbJOrdDiFTxpa5j4CK8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedugddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:5QD2YPidPBHNOiHL8pWLqeJvAx9C45EZK9M4HqgUG_eEpvZksJUWcg>
 <xmx:5QD2YPDWn7kH42Z-PmUKGKccqHM1YZQoV9Oc05y1xd9RT1lrHvi7SA>
 <xmx:5QD2YILAUGrZ4UjfL9WdOFzXAsnXAJtScx1idofc7zQscScYejA2Qw>
 <xmx:5QD2YPwS-5Of3U6b2SbI3Ix3FhaFCfYVyErJIM_oEjN1gA0htzz8lg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 18:46:59 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/5] hw/nvme: fix out-of-bounds reads
Date: Tue, 20 Jul 2021 00:46:45 +0200
Message-Id: <20210719224647.68559-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719224647.68559-1-its@irrelevant.dk>
References: <20210719224647.68559-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
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


