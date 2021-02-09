Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7F314A61
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:36:42 +0100 (CET)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OVl-0006aA-JU
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVz-0005UY-G6; Tue, 09 Feb 2021 02:32:51 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:45391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVp-0005oB-32; Tue, 09 Feb 2021 02:32:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3A19CB76;
 Tue,  9 Feb 2021 02:32:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mdUz6xUssgtkW
 /6nDJBshwOO9SX08i0jnYuE96Ljb3I=; b=kOmrEXDSOgSiZKAz1Z0NA1Rzc8jTd
 WU99a7p82PxfCBCKO6AJcGzGgsqTs2Of4CAS1cK+m9e+hbZ8PabIOD3ffoSCBTWB
 XZi5x9bZJtKuHD1mfjhzG7VBwygh9YElD2FOoFaYN6Yud4dNVzFIVo8XynyGXC2n
 dW1FdeK20O33jx1VAhmQdGzsfnklzoTFi9kGWd1TGKVkD27HHxIfHTu2hLNwEBD7
 WBpXCoseU+BRDwXJ61F4qhanJzqDTtDIM18cHbBOwPQuwCKy1FQyxgnsZYa+uWI9
 UwzHu2coD7cK4q+G7d6dsBGhwDFqW/gXEF0cJ2JjBOEQsEhLkvytdQiGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mdUz6xUssgtkW/6nDJBshwOO9SX08i0jnYuE96Ljb3I=; b=YuiEswfy
 EF3x4rF1egIK2lLhq0dxAb7L1Scz+S8/vyckep/zIK6jUIXHnBoI+OJd/h4CX8gK
 bTTgcBqY1LXDvz4kqiHWFfklcmGN0NiJ6ZwBVEAKcE3hAtByUbZvfIMUxHxIuuIE
 1VK9y2Dj1v88ARPGvhuCXx38GAQrSVj+H1aNSUcPXUq4YPJh0U/rHwk62TaP30Un
 JzD15fOQo5GWSL7Z0TwPQ/Ma6UDA1THhCga8sFQR/hcT7eKWSIxaFEHo2r1ZXMaO
 989P+kYDOSBcK2wsqN88S8ywAq0TqDmoZoJQvIcgVvcfJiVgUJxb0Nhtpl2qtd9n
 cg4w1wouUFa3Aw==
X-ME-Sender: <xms:dzoiYCOY9UvrcunhIcAjx4xQFfYrfYDJLtjgRD4a2pSDxlXRdhqWOQ>
 <xme:dzoiYA9Ve-A2Ke_BfEHJI0T9lv8j61qsaM0cPELlaTtzp-mEP6C7aUShA7YkCbu04
 fpl8MyR3SD358Uyr8o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:dzoiYJQJI8Z-EX2RgxQHtTE4BDoFQvM6K3R2LCm5UVJkc5l3pZgoXQ>
 <xmx:dzoiYCt42UjgxwsnG6y8eOLZ6_Lwlei_KwePz5UU36PBcjtvcWr4CA>
 <xmx:dzoiYKeQdrStHMwa8pvhQnCE_3ub3HpNhw-9wIatc9pz7_0Mv6dv1A>
 <xmx:dzoiYBx_t6MWd2ipKKzW1rtx3p4Eg-dT4b_c8BlgtomEWCjGwdIkciwDv-E>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64FD11080057;
 Tue,  9 Feb 2021 02:32:06 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 29/56] hw/block/nvme: remove unused argument in
 nvme_ns_init_zoned
Date: Tue,  9 Feb 2021 08:30:34 +0100
Message-Id: <20210209073101.548811-30-its@irrelevant.dk>
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
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

nvme_ns_init_zoned() has no use for given NvmeCtrl object.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 9be170abb78d..d35c2925ecb8 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -205,7 +205,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     }
 }
 
-static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
+static void nvme_ns_init_zoned(NvmeNamespace *ns, int lba_index)
 {
     NvmeIdNsZoned *id_ns_z;
 
@@ -322,7 +322,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         if (nvme_ns_zoned_check_calc_geometry(ns, errp) != 0) {
             return -1;
         }
-        nvme_ns_init_zoned(n, ns, 0);
+        nvme_ns_init_zoned(ns, 0);
     }
 
     if (nvme_register_namespace(n, ns, errp)) {
-- 
2.30.0


