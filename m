Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493473127BE
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 23:02:12 +0100 (CET)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8s8B-00061R-5u
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 17:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwG-0000Yp-BO; Sun, 07 Feb 2021 16:49:52 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwD-0004P2-OF; Sun, 07 Feb 2021 16:49:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D49B5C00C4;
 Sun,  7 Feb 2021 16:49:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 07 Feb 2021 16:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2PhCT4QDx/Cfe
 zlPE+O1m+SGecb7qZUE5kuJ9OR+OMA=; b=JXRegwHT3ZG4hBIenJnwLPZIX+omA
 N81EINpIF91o9ndEDKKAIM+dArsmy5BcGeLoHaUwBx/S5HADf47dYOjuBEveTbEh
 UV1rVxtt/k7wxcxBpJ23K1ITEfnHJydFJywWqpwH0GKkxNrSD3viUzUy12xeWhHW
 /OCifgJIuH9ShpEjiJiG50L+um0ZhWaNjZLjVuDWSj8yBQEa0yguOhqkrJfRYb1U
 opZ4mYkY6Gzh8G61qeiNw2C0o+/qU1kQGx33XBm6hkzwCb0q8Nbl20iirB1hJhSm
 H76cSzuUz7ErANyuU+fyZsiu0wvnBs/KGnen2DVenw6ePD6TmZ1JAjF3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2PhCT4QDx/CfezlPE+O1m+SGecb7qZUE5kuJ9OR+OMA=; b=dTMqvw5R
 6ZolW/uMZ5XcHVfUQPuXzF2dbUDLNJpKr3hzt0ge1e1O5zNlZ6+5k8+7nMpGYoGo
 9/rzOrUOZL/6ROnY6vciFcoryUD9DhZd0eYZgOJ3ORMIZ/of0Q6qSvz4ghp00lJ2
 2wk0w510VOpxQvxaU8glRBGKH5WWQFDeVCD7DEHbmE6cKwHwWgrFljpQYziY7n6+
 nfO7gUKYrFVad8SzVnbq66pOm2CHO9AjlBSLrvcpPaK40SMhaPfy8MfyqKEQEIsp
 D4aHpjeQN3NPqvm2AOGM12I2xN2+VgH2izFm8o6tqCNBNGfTN8AzS9zvEUw+Eg4O
 3u/tVJ3i3sJs2w==
X-ME-Sender: <xms:fGAgYA3_a9za0Ey0je1vZQZiEvOd-lTommgnntzSH59VNIi82BR7wQ>
 <xme:fGAgYLFiE4_31HXtv8rRTVGxhInOwRi8lLwJd8u7Rrku1iudkX3o1Evsb71uV0rpA
 s5vPXUejUk7ugwGo8o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fGAgYI5jeMaS_U4CgmsI1vJE9_Nbc8Ley9f-TP1DhRf76BPg_Gh7tg>
 <xmx:fGAgYJ1jf9r08AAs4dpXXICgmEBgl7EXUommmW2ucCE8leVsvlfk4g>
 <xmx:fGAgYDE8vLLQRG_S2PF5THugQzZc4lnOGnCNB4PJqDnkkYnzQoV3Cg>
 <xmx:fGAgYC37ToWaiWvK2jD5mrSiHNtILF5NMDIZ04idZRVC_qGwdgrnOA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B46A61080057;
 Sun,  7 Feb 2021 16:49:46 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 3/8] hw/block/nvme: fix strerror printing
Date: Sun,  7 Feb 2021 22:49:35 +0100
Message-Id: <20210207214940.281889-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207214940.281889-1-its@irrelevant.dk>
References: <20210207214940.281889-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing sign inversion.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e4a01cf9edc5..29902038d618 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1150,7 +1150,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
         break;
     }
 
-    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
+    trace_pci_nvme_err_aio(nvme_cid(req), strerror(-ret), status);
 
     error_setg_errno(&local_err, -ret, "aio failed");
     error_report_err(local_err);
-- 
2.30.0


