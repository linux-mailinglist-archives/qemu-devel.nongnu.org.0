Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA33127B5
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 22:56:00 +0100 (CET)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8s2A-0002uY-NX
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 16:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwG-0000Yn-7B; Sun, 07 Feb 2021 16:49:52 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwD-0004Ox-MC; Sun, 07 Feb 2021 16:49:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A2D5F5C009B;
 Sun,  7 Feb 2021 16:49:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 07 Feb 2021 16:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mjOEPFV1yMHyo
 FiNNG/GAUgoKDQMLBUB3VZDSihW4eg=; b=E+Z2xeY5audfPEIY5PiayWXqrgpnx
 1GfJBhaV6vrrj5keGfPeSZmbntQbJx5zghEeomX+Qy9MJvL4kOOhAZNunweHHxR2
 OHIIyYxGuQWR6NuWugsHpFRMpwPI5ncMMyqHNSw8KZ3V0uurCHB7cSSPkSLpbx9O
 wZ5Do8EoiZQCGEQdph+tAjk9pwE5LWUAGYdkswJjeWbhKHpCYPfNPuDoTczbyrW1
 rGx0XwP3mCr7yw/n3HJ85mNAxXAh7ovaVsSKKwJbP0I4+xPbl5D00SUuu5l9suMN
 ZKk5kvI+LBIc6Rs1ul/mSnxiRdeehIfdZ6EqleIPQABFn7cHv+9blD8Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mjOEPFV1yMHyoFiNNG/GAUgoKDQMLBUB3VZDSihW4eg=; b=DDEt6Arw
 6zYbfMTkEqIZ870ezSm+DTIExRUJG3AYz3381gXMo4b/IdfKAiM7L/ARf0RFISdE
 4FANs5+2PcmyX/jkKL6EFOAiBITEhWLHMpMSezJnqHNdoOh+ZjQ64f206kuwnj6N
 JDAvT7YHDqhaqPenYh48gnYSt/D1Y19fwAdu5bu0FIt1tY6onshCLCg48ue1KzFY
 t+x/sSryRd6KiCKAiL0jHFQnTUi2KTIlDPFFxmKtRmytSW/OnwYCi56hqMSiWwpA
 WeU49dolAKNh4w70xlJl+qHc7aytC2rk8aZuNrZhsseerTqzsIMnwbSagNZTY2L/
 mVFO7uaPMNREPg==
X-ME-Sender: <xms:emAgYADGqIYKD0y8XtWjOXLiKlp99FwNEgXSO3wmOIRqXGt5OCqGQg>
 <xme:emAgYChqtsftVkKqu3aOR-bI9NvHzKTZzJWTXOFuM7zqFeWjTItfcUjsRKOaG70-f
 PxtKcs5WrXuQQh38Po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:emAgYDl7S3AREwtR2j1t9bWgkIZIvciT6UOZusRfAQpv-jVDZ_2Wuw>
 <xmx:emAgYGwZSOwrGs1uZs1bMiVu0YtHW0rVisZWbku3kgspbHN24PlWTw>
 <xmx:emAgYFSfXbXbPYj-jeb5gLndAiZ82xqvG7q0bD_vjFAVsAM9PWUBGA>
 <xmx:emAgYGTOri45PMD87gp6Ngwi907etPZjS7xAUPk3CqnzxEAYGkvlow>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4817E1080057;
 Sun,  7 Feb 2021 16:49:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 2/8] hw/block/nvme: remove block accounting for write
 zeroes
Date: Sun,  7 Feb 2021 22:49:34 +0100
Message-Id: <20210207214940.281889-3-its@irrelevant.dk>
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

A Write Zeroes commands should not be counted in either the 'Data Units
Written' or in 'Host Write Commands' SMART/Health Information Log page.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6b46925ddd18..e4a01cf9edc5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2088,7 +2088,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                                          nvme_rw_cb, req);
         }
     } else {
-        block_acct_start(blk_get_stats(blk), &req->acct, 0, BLOCK_ACCT_WRITE);
         req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
                                            BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
                                            req);
-- 
2.30.0


