Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07A368219
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:04:39 +0200 (CEST)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZZwc-0006jD-Jm
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZZqv-0004n7-9M; Thu, 22 Apr 2021 09:58:45 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZZqs-0007Wx-HY; Thu, 22 Apr 2021 09:58:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 792F31362;
 Thu, 22 Apr 2021 09:58:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Apr 2021 09:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=GsK+ACJGs/Ugc
 x0dfxXfO3PtTcybUP67agVL7RKo6pY=; b=F//74d5dY0cwCzXOt3b/jn88UdrJL
 yPofROEGz6aJzeU1Is3N8ds6YirVX1bq6EDV3i2DrTiWmYsKDtPfudXeBLA7canr
 eykB+UIh3KIcGYcLvS32DJhEPctGPYUrvo7dMU1YRubw+Exe1dwIotVgj6mswrFP
 Dk4qd5AOphpI+bsbJmaRTH6q1srUVmp6Pt2w1Za5X26IwOYheuECTDGNT0AJAce8
 3RrRHK3PZU/iiCGhShdQc1LKqstkXiyE9L8VH+OfCcD7e6wrx6um0jbHL62Uk3Wb
 zXKP41QRONhfOh5RQWGt+Jnl8bGPpvHAxEAAFVerlAX/PhyJa3aWW8azA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GsK+ACJGs/Ugcx0dfxXfO3PtTcybUP67agVL7RKo6pY=; b=aKB8Jd1E
 8T607Ql20DJm2TE9keo3kBaNPGvj30OLAEzdUTaEuAK9AfLWTghEnKCG3ST3wOyB
 xB2hvjV7WyCWMkAgLv/VQ0FVobDPHj6GMkB81KYToxdbb+arCsEOj8369D6QwAT/
 6GmCALk/uIqMwUedVAoCRX4pySdNFSgH/KtnL+MUrtwY6WTCD94575YDQtTDbHgO
 7FJbUnlqNQecYEy7qZX8T3wxN7lqwckwH462XpeSkjjTijC+xpzbZJcqNj+nipUy
 5U/HbhUuiSu8qKW2LxBEwkd3tlNRF6L7IFX9U0QZa2UNx1KB4SGAsgwhOXAMl8fH
 VUgoyBxDfkaT7g==
X-ME-Sender: <xms:D4GBYIA8Aw5F0yIqotL-jORk1Iryk_aWYO-kntkC0xuOu9La41L5Iw>
 <xme:D4GBYEJ1UIFUBHZndBYdHBUKQ0sUw-PEjU3QR64WHg7pUpS97SB9chJ8TUX2bxTqO
 ZbAdwhyDvSAPlkKu0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:D4GBYLkwRV_FVxS1mpNAyD9pEySilHjGS-3PxI5FYtWovTmYVWkQpw>
 <xmx:D4GBYCH9RUfLw7aFcSambXLL9r9fJ05z6ML3s_lt_oXuuWVoSrl1eQ>
 <xmx:D4GBYLHwbht8B8h48zyZw92QZjniDHviVGjyfmdt4kI0xdqqzSeQ7w>
 <xmx:D4GBYPshkW-DlQNOV1eRuekMrwlXSdGm2bKOmmUQAGpteKeR3Y-RAg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id F11151080063;
 Thu, 22 Apr 2021 09:58:37 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-6.0? 1/1] hw/block/nvme: fix invalid msix exclusive uninit
Date: Thu, 22 Apr 2021 15:58:34 +0200
Message-Id: <20210422135834.406688-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422135834.406688-1-its@irrelevant.dk>
References: <20210422135834.406688-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Commit 1901b4967c3f changed the nvme device from using a bar exclusive
for MSI-x to sharing it on bar0.

Unfortunately, the msix_uninit_exclusive_bar() call remains in
nvme_exit() which causes havoc when the device is removed with, say,
device_del.

Fix this.

Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d072..31a1a59d88c9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -6235,7 +6235,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     if (n->pmr.dev) {
         host_memory_backend_set_mapped(n->pmr.dev, false);
     }
-    msix_uninit_exclusive_bar(pci_dev);
+    msix_uninit(pci_dev, &n->bar0, &n->bar0);
 }
 
 static Property nvme_props[] = {
-- 
2.31.1


