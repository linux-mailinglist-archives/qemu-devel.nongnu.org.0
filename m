Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42A3022C9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 09:27:13 +0100 (CET)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xDM-0005ft-GW
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 03:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3x8u-00046w-8q; Mon, 25 Jan 2021 03:22:36 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l3x8s-0006ZZ-0Z; Mon, 25 Jan 2021 03:22:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3DFC05C00DF;
 Mon, 25 Jan 2021 03:22:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 03:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=f0G59iqwrj5Vf
 Z0TqNozV6E4r78+iF+wO37wu5NAMmY=; b=tyLe3CX8oq1a0dVMj6iErKJfTSgGN
 /onzzO6a6n/vi2PnjqQw7tEku/eHrqn7BdDa1VAUMvtqLaqFji3WUBlmaISVZyy0
 4HFcsPFwrUFElB0bfTyZ5HsuOGln/zIA2xLGrYXeJL0jg2/JSULzDN43kS/WpniB
 DjgmViXQAHf2GBPgX+8lVg6XVzmtV+R5LLv8uSyfImvfFNp8geHUn3Na/M+sjS0W
 z4tiA2+dXyHKgwK5hZ9oDVRbYqkBDAd9WJvNzeihS/aaf0pJchPU9SL4ZVl1ybwI
 Xn0o22pfq85jFf8aDEkqEo7+52pgCkD/p+V5wKtxCJN+fUXS9UPaKSYCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=f0G59iqwrj5VfZ0TqNozV6E4r78+iF+wO37wu5NAMmY=; b=gTNRe6U1
 US3oDtpSllAuzzkutWs1a/hiy2RpMmzTEPGu+YmKfiFwOXaXY9eLYQ13bZX/R8bS
 iD8ff+EvWvGAh3ioRVovDQ+LrkXeyiZiuJqw7iqW8ybF9ZNswXbCd1THFRZxjqSY
 ElZIL4fJ0aOVKjXUTDiyUqLh+DIQcGo4o05eLLKltBwESWQwNRHmzUwhBi+ZUK34
 DZAEYoVTC+7LlM6EAHVb/7hTtpoMzKgKExQ34CJ93Bnv2v+hne1BvDiwm4ygdAwT
 9e5rhLgBYx40qvz3JqaotnwdXeKbmbZO2zFkzkBIGLOJ1Z9MUiLfO2OViGIm+YKg
 fKFwq9345Tg59w==
X-ME-Sender: <xms:yX8OYLvNagtlf-X5w23kXLX1y7OOzTUdNgF-q-qDZ37FKII7qovYcw>
 <xme:yX8OYMe2qeuKoF-OrrjN7m3ulur2W75GyBcQWO2LwWX5g4VoFe1hrl8UcxYFv8fI4
 AfsuWJB7YTikrdOwus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:yX8OYOz0TdrLEVFC7k1og8KRLVIn4CBsdIME1l-DQBas3r-S-RtqPw>
 <xmx:yX8OYKO8sLNpdUbxwF7JK7FldEkBa8llIY6X63QZ7USg-zxl0WJM3A>
 <xmx:yX8OYL-HQsjrg5XjENsL1COM0Zl1DqcQw7n99N_A58Qi6aKOpU3-Nw>
 <xmx:yX8OYGn8V-PopeEmyPUo02JL-Cv-poe_4Vjf9gB2OU9wyNnW7UTrUQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 121611080059;
 Mon, 25 Jan 2021 03:22:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: fix set feature save field check
Date: Mon, 25 Jan 2021 09:22:26 +0100
Message-Id: <20210125082227.20160-3-its@irrelevant.dk>
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

Currently, no features are saveable, so the current check is not wrong,
but add a check against the feature capabilities to make sure this will
not regress if saveable features are added later.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e7983ff422f2..1be5b54e0fed 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3324,7 +3324,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
 
-    if (save) {
+    if (save && !(nvme_feature_cap[fid] & NVME_FEAT_CAP_SAVE)) {
         return NVME_FID_NOT_SAVEABLE | NVME_DNR;
     }
 
-- 
2.30.0


