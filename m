Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D63D67AD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:49:59 +0200 (CEST)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86bu-00009f-J7
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868c-0004tg-69; Mon, 26 Jul 2021 15:19:42 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868a-0007x1-Oa; Mon, 26 Jul 2021 15:19:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 09FF2580415;
 Mon, 26 Jul 2021 15:19:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 26 Jul 2021 15:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UpwXF+l7PVdDF
 I199VbEa9H5egyyWOLIXp+Scgp7TlU=; b=FINWI5Owkhx0AbxsKexga1tOJ74RX
 AR0J/wlEtl2woimhHtC6q22r5ha9hWpFpoIpE9YMuGeOIthWxJ8CIZRY/xTZIDPt
 8UiChqWYkFm3QSGe316gDJ/UYVYGO0ULUh0QZfClwiRXhynJ7PwRAXBSb0M2DY7Z
 J3p890Wp3nGa6K2y9x92c+NeUA488jQCsD0LPdueD3/ZDQzgEYahtvOYhdMP2kH4
 meaJV7FzojRRVo/xQU+53XErYnzfcLvrC1X+5UuwtUUS7YeUmvtil0LEcjmWchQ8
 8ULuVGLee5R6trTsmNVL5XylUDAlbyJFWesyC7p4nqMgRm+xtdawPsvlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UpwXF+l7PVdDFI199VbEa9H5egyyWOLIXp+Scgp7TlU=; b=Zdp2cbPH
 Bv7rXkhZZxzupqXgoL/OX/9tOsjGg+72OG4cwCzxtNeY27O3ddIxYbZYoyXhj7TF
 DYyrxS4LO38FtWxsdMM2bctJECBhQ4n9nC4F59XUFpzvQtAeDx2HAJEpONXvheOp
 As28PNl5FicO856YvIfRUaSmGmSyPbpE5bHXD1pb9W3LbNvJii73YeHOn/GpAArv
 lSy4l7qUWjsHvDz0Jl74iMxjbdLYZsaQiQidQFebhP27SODHBMySVWmkVBQMzxxy
 hQCS0kWaIw1SCLECuzmkzyy921bXNa+cZ3kWFTJobtl2BvCEYk1EPkhBEcif9rCF
 Xe5MixyIWwhC+g==
X-ME-Sender: <xms:ywr_YBOV5Ftjta0tx1MLdVErfUM9tZX3L1cp6Fc74YhBewD3MvqR8Q>
 <xme:ywr_YD-nvK2w_grXiZB6ZgpZX9g_9fEX9YP-Xv-mMzX9xg_nCvhJAYttctSsV1Bu_
 bK7qmDhEct4wne3l0M>
X-ME-Received: <xmr:ywr_YAQoCj_BOGx8NcGcFEu7X49yrY_9GFDYd8gPVbJf-ZkNjSpg08NDK4MT_fMPTS9PI41UpHXA0_UpPs8J_rUhAMGR_Fa5e2UfvrzXjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ywr_YNsN2pc4qKFJGl8Y4TibxwkDH_eAsGfblIRhCneLvhDX6V5oiQ>
 <xmx:ywr_YJdscnxdMoVSR7aJe-EoNyX9WViZqHKFMqqXOiY_WDPzCR0_Jg>
 <xmx:ywr_YJ2CYlj4r3VfwpDkxCEnmoU-U-fwcfNzlmQb0fzTqqsqbai-aw>
 <xmx:zAr_YJ12woMMNbGwxP3vL03kr-yXeyWtLWu2bw510n29nayhWO51Ew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:37 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 09/11] hw/nvme: fix out-of-bounds reads
Date: Mon, 26 Jul 2021 21:18:59 +0200
Message-Id: <20210726191901.4680-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726191901.4680-1-its@irrelevant.dk>
References: <20210726191901.4680-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
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
index 23ff71f65c0e..10c2363c1d4d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5969,23 +5969,26 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
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


