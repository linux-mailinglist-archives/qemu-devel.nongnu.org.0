Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787E2D2761
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 10:22:02 +0100 (CET)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmZC5-0008LF-EQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 04:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmZ7N-0007ii-Ah; Tue, 08 Dec 2020 04:17:09 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmZ7J-0005kJ-Ik; Tue, 08 Dec 2020 04:17:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DE9983AA;
 Tue,  8 Dec 2020 04:17:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Dec 2020 04:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=6c0PcrUb+n9MIK/aQZxxCQRBiX
 LJlTsg/U6vzaqiwRU=; b=I0D2QlQlGsnqTW90gr8o0OlOnZBPvBHEgD7RLTDUVR
 i0yz0DZ/EdHMc+AlUeECbn7nJUuO8C2ha7gxxgKYG9SetyRaqcyARCUK0d3mYr4V
 ZxDgpFLZGA/4OF4aL8Q/9isFirGHk3+uvT/5kAIKR8mGvAss6wd4zKxhZYZHQkcW
 QCzB3vf9lDy5rR0o+U04T5HdIrtrTQro7NGbbqbz1b7x+mKjH4s26FJ9fg9+oFwO
 uVABfcyfZZiO8YQ5IUGVOg9GsyupwRWnazEbINZsc4QeIZeujL9gTRrmtHllRDz3
 ylqkpA700wyg5j2TBZk7eT7WFCJT3+bKQQ9byx4GXLYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6c0PcrUb+n9MIK/aQ
 ZxxCQRBiXLJlTsg/U6vzaqiwRU=; b=BIAZMNOJRkTEzmEZWLmjT+E7ZbZoogVT9
 5urTlhA5gbuPkMHB0wI9tzx099ySnujX8QiZ+1Nmvezghb8Lcf4y9JhdkeKSGXOz
 zhbeeQ9/NqdLlKoUp9KqjHbFIVQ5xHnGlRcR5dVSZ+N9ljQUxrFFrvMgJLPMK2iY
 UpruBFm6eIFAXFO0h0oI4IHWhKt14dwO9hdhyJO+YxqpNQNkLsg4vZPgbzTTg1Wj
 0RWTaNWumkN8jy4EKuFBu+XfdYSzkIayGB8BX1O/zhNjhX5JaXyZgWeKW4N1jg4i
 1+5PG886xzkl+4WwrzOUP6oV/4osGpYpo33knpNeTOhHeFPkueeBQ==
X-ME-Sender: <xms:jUTPX3cv-HidEko0iEK2cSYEfnrEFrmRvmTe19ICV33WwTyN2-QQ8g>
 <xme:jUTPX9M7-7c8VZR-c1FzqNkJHz6vnf6ItGtETLqql-C1PT4bL28mhOj7LyZOkUoTM
 B1maU6xMi5UMqmedZ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejiedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefveelvdeikeduueffteeggeefhedvffffjeeuueeludehvdegjeevjefhtdetheen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jUTPXwhjnCVVI9TcEmhrnzb7I9uLmGXvZVMGuHbZ2mgSGFfttJ0m-w>
 <xmx:jUTPX4_G0gRGkD3FW0foEOkUMZ0wImh4jS15kW1bo4CTZFp6cUiecg>
 <xmx:jUTPXzvJOraf1OB4AciD2U_nPIsIYxyVAwhtvV3UA9uH9XH1BYT92w>
 <xmx:jkTPX9LjJ4VEkXjiEdm8r2rHDyOlve1LoVkAvYjZh0lEl9wt5tPwLw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EFF8A1080068;
 Tue,  8 Dec 2020 04:16:59 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix bad clearing of CAP
Date: Tue,  8 Dec 2020 10:16:58 +0100
Message-Id: <20201208091658.41820-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
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
---
 hw/block/nvme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8814201364c1..28416b18a5c0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3040,7 +3040,6 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->psd[0].enlat = cpu_to_le32(0x10);
     id->psd[0].exlat = cpu_to_le32(0x4);
 
-    n->bar.cap = 0;
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
-- 
2.29.2


