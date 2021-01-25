Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5D3022C7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 09:26:54 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xD3-0005RY-0m
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 03:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3x8s-00046c-Qx; Mon, 25 Jan 2021 03:22:34 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3x8r-0006Yr-3Q; Mon, 25 Jan 2021 03:22:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E3C675C00CE;
 Mon, 25 Jan 2021 03:22:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 03:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zdqJ9jrxaBFA2
 4yNUAI9V7Ld1She2fQCBl/Mq8kcpvI=; b=D3vrh25JW4xd+9/uKVrYLoT5ezNrO
 YYvjgu55U29Y1EU6KTbtrcBRtZusq999ICVSerIAiDlAypKPbe7dYCrXvLXr9/pX
 EvQQ4bggcVXSvj8qhIdBjPeiXVM7tcETEVxZc7fuoqofLQzr35PBWibLa0cChqBT
 5DaOgOrRwk7/BlQnzMuhW7NHxoBDet49euYFqEwFukX562ExySUc/jv7WSDFTFKd
 1hebSwHG3NukBvEsjk11iRca4oXW4FmcXT+l7NnZLsVpTI2GaQSvgl7Yb74JOOGR
 aBMry4TUW6Egs3PH5po29ZAxjzmOli/aKW7hQ1mb0kgC3RtPOdvcUetNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zdqJ9jrxaBFA24yNUAI9V7Ld1She2fQCBl/Mq8kcpvI=; b=XQFn4Non
 gHxRHDrlFwbbyrHWNYoN0mzRgBEIH9oPpdU9NfwVskr0rtD1meChNSCzyIaKKB9E
 sZEOddpUr6SpeLcleWSUVt+G4HMKz5NTM/Nk2n11cXKbsDDYf4pSXwQCBn5ZpkTd
 lOaO35ZRqqgSFLVQhm8IpYDsvgVKdLpC28/srIjvzU4LUn9elT4egQCMYadYh/xN
 4HgAMsg/ZXQ4yrhntscdGJNdIOSR5vZzAJHrVWlnXJg+bckDfP4l6NnL+b7z7grL
 K7AK733meHdip/9LtYrlVULQNwPqJV9SGMlfec3xyGzzIXjy8Fzf/HAj4rm27zA7
 p42pPRFI8NZ3Uw==
X-ME-Sender: <xms:x38OYOlLVqkcKahG4UySG0OOfN91BhRzLt-17aaAOmfkiV0AMqLSog>
 <xme:x38OYF3Es_JBjB58ghUrA5F6UzHeVhRQZaKoovpRnUJXnXLYtLD5l2SR_jBZ4M3Ts
 w0-mrGabAwZ5nepSDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:x38OYMqBEnw3dW9mkjxwAE8MD0yie3LvBYuaRU3p_TLQf1Wfk1hPTw>
 <xmx:x38OYCkrmItxF23kaXbFtNKBWZd8zJFRswbTvKwEg605il7zv8Ttmw>
 <xmx:x38OYM36oLp3SZHvP7HLhLMX4V84g8rY_L_22Np-tlRlpRvOAjThtw>
 <xmx:x38OYA8Ewb0GZJ-9gThtInk-ThhRoSvKL5j_suECxwxPeSU8c1yzUg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA36E1080059;
 Mon, 25 Jan 2021 03:22:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: fix set feature for error recovery
Date: Mon, 25 Jan 2021 09:22:25 +0100
Message-Id: <20210125082227.20160-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125082227.20160-1-its@irrelevant.dk>
References: <20210125082227.20160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Only enable DULBE if the namespace supports it.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 21aec90637fa..e7983ff422f2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3396,7 +3396,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         }
 
         assert(ns);
-        ns->features.err_rec = dw11;
+        if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat))  {
+            ns->features.err_rec = dw11;
+        }
         break;
     case NVME_VOLATILE_WRITE_CACHE:
         for (i = 1; i <= n->num_namespaces; i++) {
-- 
2.30.0


