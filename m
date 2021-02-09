Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A5314A7E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:41:31 +0100 (CET)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OaQ-00032V-Tv
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW7-0005Zm-Iq; Tue, 09 Feb 2021 02:33:00 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:54425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVw-0005rI-Us; Tue, 09 Feb 2021 02:32:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 21D4198E;
 Tue,  9 Feb 2021 02:32:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=NrVWDaVT+3VTu
 J9vQAD7AHsGTiPQ2AG76IAsmZqrs+E=; b=nJRh8juEi7XI1SU96ubtIxK/v6Dqu
 D0qE7bT9SgNEL0Z+cNZyEPD3lNZZ8N1kQU33tjbXbCwmc6a6xK3pazVFHDcFNwuM
 KllrOMpOisR7HcNNrgZH+NjrP2OaixhQePNPyJICB+Izwt04zl6UTynHi3G/5ajS
 rSGBU4EuuJgmu97sr06za6/QjnvyaWPno3NOHxLYXtWcRUmZl5z2zOhy+BS+2Xou
 zUNJHJPRyXthJTNB5PqFToqRvr/b3XcyDTB/Tag39zmpku7jk/JNjUXVXnHiEESU
 UsLeJzFEq+X/GGIqCr5/LUIqggCbTsbQL731uD95amzBGwz2L16Hcpuxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=NrVWDaVT+3VTuJ9vQAD7AHsGTiPQ2AG76IAsmZqrs+E=; b=lRhTZFtN
 iJ2yGtcCI64fyJkJyqNcbq5YIDbiHBtYIpecEnkaDHHQek8duP+5EAqfwf0ETcog
 sYmv0HzNfnVgnr4m6V3wxIJ1bGlpRr9r/fkb2A4Kx/+NOArgKEnPMLyrbaHkKAi5
 40QxhLysbuISMWKGP3PLgHPGVd4zNVQOZdIGlz8LAHV3DIdeSmwvCS/z9TomEI36
 7bvxUciLqQ8ZOJmVdh7F4Dx4eoWh+fSu3/QqbBTMyHscY9MUwc4XBlaMssFQKBQ5
 dzCZlBqvSzwVxRijwjYMX+c1P0bAtALCbtTwourG6LoHi+sTKUdvWiUDIjwJnaXU
 gtRtUhoP+sJWqg==
X-ME-Sender: <xms:iToiYNSi5aq63UhGHMjCFKbrd4lOnmt9X3TK2L92hB70whBqHx96KQ>
 <xme:iToiYGzodk9FO4USlekdW2dQ66ICKwjZnl23pxFWrM6Tt1m0ilY2rcjVxwKQ2-ytj
 B5JSnpJUNYXgVtr6Ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedufe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:iToiYC1WYo3r2-oDET8_hvKbFC4w9-ynUkYNw4Bopt_pSvAQChdWYw>
 <xmx:iToiYFCLqkiFncpEZrKlUsu6z-hfry2OZVOZl7o9GHDN_tkssA7bXw>
 <xmx:iToiYGj1yjM9bpJWUV9D5wi_v2HZHSi8lt6PhvGAloGXPyPmmZKpAQ>
 <xmx:iToiYLax-X8nQS1ei9QA_fwCwo3MJUXm9cdAecjC3oUG4Nuy3Adsvw0Klgc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D247C108005B;
 Tue,  9 Feb 2021 02:32:23 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 40/56] hw/block/nvme: indicate CMB support through controller
 capabilities register
Date: Tue,  9 Feb 2021 08:30:45 +0100
Message-Id: <20210209073101.548811-41-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Maxim Levitsky <mlevitsky@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>

This patch sets CMBS bit in controller capabilities register when user
configures NVMe driver with CMB support, so capabilites are correctly
reported to guest OS.

Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Reviewed-by: Maxim Levitsky <mlevitsky@gmail.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 10 +++++++---
 hw/block/nvme.c      |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 854fb2abb6f8..151921da21f9 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -36,6 +36,7 @@ enum NvmeCapShift {
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMR_SHIFT      = 56,
+    CAP_CMB_SHIFT      = 57,
 };
 
 enum NvmeCapMask {
@@ -49,6 +50,7 @@ enum NvmeCapMask {
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMR_MASK       = 0x1,
+    CAP_CMB_MASK       = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -79,9 +81,11 @@ enum NvmeCapMask {
 #define NVME_CAP_SET_MPSMIN(cap, val) (cap |= (uint64_t)(val & CAP_MPSMIN_MASK)\
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
-                                                            << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val) (cap |= (uint64_t)(val & CAP_PMR_MASK)\
-                                                            << CAP_PMR_SHIFT)
+                                                           << CAP_MPSMAX_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
+                                                           << CAP_PMR_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
+                                                           << CAP_CMB_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2785127037db..5f12ac1200ec 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4374,6 +4374,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_CSI_SUPP);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
+    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.30.0


