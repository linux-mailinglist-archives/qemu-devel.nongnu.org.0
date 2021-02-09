Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B96C3149DA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:01:45 +0100 (CET)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Nxv-00034Z-VE
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUt-00053k-5C; Tue, 09 Feb 2021 02:31:43 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:50669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUk-0005Wh-0V; Tue, 09 Feb 2021 02:31:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D4A88B64;
 Tue,  9 Feb 2021 02:31:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8ouPlu4g3mO7U
 yAf8D0vvMyrjWoFt3lvGyjfTA5sVhM=; b=ANIzcC/i5evfScH6LtfFcwDgRkIRu
 7lq5ROghEIp+O9YxSmAwyxJH5j2r5SYuBuXcGsT5X17hyAYSmTM8UhGyU4uoZqsE
 GqQf+ecdL4rG9nP3U+Bn+cv90SVybymuzo9TvQi7Flbmm3Z9rZG2pKDSqqF/pqlr
 Y7Cs0RxoSZP00F0zNy5CR2wFoz0HrPJUej3jYMu/X/djDEEXBuO9vPquVRtxdZ1x
 1MZqv+Xfktv8qUYai3I0DkdeIcz1OZwN7+L1R+d6juEiGfjypfeUDi6/oIvcCS5l
 20ddz7rcaT2iZU5iCOoMyJTZACHk3MRmJ2oYbSbib3FXsF3qGY1LPjuKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8ouPlu4g3mO7UyAf8D0vvMyrjWoFt3lvGyjfTA5sVhM=; b=RSi6i+Q3
 06iwgL/Gs2d5hfn8GL190ykekR9QEygqaM0b9RjwjCP8PI1MBYE0+DDDjkE9ybkn
 RHXMsk5qj8V7ZLsM5zfK3fzp9salQxtnkTZ7jqABJrirseRZh+5hFw737ATqlMWu
 +LLzVi8XuLsH/jYlgUB9NMjki74kmz8XRkdvNYn/21fmdzvOupgmHILDroPAQIKQ
 HpbW9EWZwg1WKfbRFuCZ7ld0k+k9XMa1grWp8nk7JzuZXR5cCiBs7tN/0etek6nw
 eDds82sNjGbyKH/bKvTsAt7IL0Yp9r42Agn3jlKu05MGpMbOJ8Y0kx/jtdiP7XXL
 iuEBtA3GODpULA==
X-ME-Sender: <xms:UzoiYJH07NH7-hhbsnqYqWihvIbuR4WXw308PwUpMqJ4sfPMHERqKA>
 <xme:UzoiYOWDQMHesxLXIuk9v3j9FZTZGvcoWW13L15eyx4rWFPz8-Q5mv1leT5W5yaRk
 5DaYlu3os4PNDMUDFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:UzoiYLI-dGND8wzmqqxc1gk6KD81H3FusBEtkPEIk69BjsriwU57qg>
 <xmx:UzoiYPEJzjUA60AWxkOTPiQw-ris4UhRL4-zR4CHO4rTBvUzQ66-nA>
 <xmx:UzoiYPWFGGqjavDifMBKjjxAz921Mj0n5Cxv1R3xrDJV5nsFV3WbxQ>
 <xmx:UzoiYLo3WInV8vhUI1GP8DwsT5IPhrMGCcG_n6GJXZ2p7H-LXd2csfRs-84>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0C681108005C;
 Tue,  9 Feb 2021 02:31:29 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/56] hw/block/nvme: fix bad clearing of CAP
Date: Tue,  9 Feb 2021 08:30:12 +0100
Message-Id: <20210209073101.548811-8-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

Commit 37712e00b1f0 ("hw/block/nvme: factor out pmr setup") changed the
control flow such that the CAP register is erronously cleared after
nvme_init_pmr() has configured it. Since the entire NvmeCtrl structure
is zero-filled initially, there is no need for the explicit clearing, so
just remove it.

Fixes: 37712e00b1f0 ("hw/block/nvme: factor out pmr setup")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b9313fdc4762..de52487aaf06 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3038,7 +3038,6 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
-    n->bar.cap = 0;
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
-- 
2.30.0


