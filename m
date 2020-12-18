Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1722DE360
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:39:47 +0100 (CET)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFz0-0006vN-DV
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFp5-0003a4-6a; Fri, 18 Dec 2020 08:29:31 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFoz-0002zp-5J; Fri, 18 Dec 2020 08:29:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D84053D2;
 Fri, 18 Dec 2020 08:29:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 08:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=46UU4TRHgM8BH
 SJGK66IYFmvqtldxn3q/vTPgMRtzL8=; b=1nlduHLduE3JgD9xyJhGFTaaqOjMd
 soxSLBTXx/4K6mFFgodC5C1t3B9NyU7HGURz2MIp2HdkZ51LsMsL0UrUyY2CbDSb
 tUzeeiJXYm6kqRrPrAEQk1Ge+KvunZ2G5bmXbCYCTzoC78Azs8xs/eQM0VlNiE0B
 C9GKc/PMNr4KIA6PUrxDMVFfxw7WbYmy2CKRobTg4vuFI5CIyUWT5HoDFSWq7u5C
 JyYDTJYFTYpiVNhihDRBRyyoNcMaHXQ/u33/iG8AN9qiseXIacZqbE3EEYv/eB2Q
 jwPH7fzLMnll8D58gXeudfsqUKO/CuStnYPsPQdnQZKsxfeXzx4LuALkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=46UU4TRHgM8BHSJGK66IYFmvqtldxn3q/vTPgMRtzL8=; b=Nu/4obRo
 gbSpCHxeVCCF3Xla+cGYc+kgh3eQCzyo/7WmXSV8Ip5Bh62JpmpXypB7hgEx8IXn
 OZvTKouqL8BkzxiXVNZWk4KdJM/lTtyRhmXkEniGLcQVq/kCdDOegDiPGTHxXyFl
 NSNdJNYmo2u/wa8gdwjujJfK0U3k/L08r5CibfYJtov4xtZmbASdkTjr9LtjcLe3
 hgLmcJzuvLD8jlvKP65oqQO6CuTv75EEwODyFRxdpeIHr+tINR0anTxrrq2A77fk
 M5ePYNkePmJRTX2Lh2bew6x300ZVGTo2xBHI7nMj0+dBCZIvPwoaoWoTHAOKJj9B
 3N0C4YMAsHn/Ew==
X-ME-Sender: <xms:ra7cXw84rcRb67JYRsQ5YlO1iBEAZrEjh7tMOpwsk8Yne9tw6l9ZjQ>
 <xme:ra7cX1HY0k6Xz4ExHcc73j9i4MPjZobWsJuZMhtc0bP0kW0R5zZbGJCk7nkYA1V_d
 URrAFWSVmQPYZVsQFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ra7cX6dxhuk6TT6ad7xctgUMBdGQGNeSZnO95DKuUmU1qEFyQDaADA>
 <xmx:ra7cX-mCg1f4hTi8Euya4Wchcn4Eh3_RGi7niBZXjSvA5SsWTMfMng>
 <xmx:ra7cXxqzLtRJsP6z8Kbba3P8SZdnB74gOxQQlhw0JL7tXHkc6h0tSA>
 <xmx:ra7cX4AMPfiSSiVeL1ath_qbCkij4SnIX_f8uAjhkwyEiLSSng0dDQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3463824005A;
 Fri, 18 Dec 2020 08:29:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] hw/block/nvme: remove redundant zeroing of PMR registers
Date: Fri, 18 Dec 2020 14:29:03 +0100
Message-Id: <20201218132905.967326-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218132905.967326-1-its@irrelevant.dk>
References: <20201218132905.967326-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The controller registers are initially zero. Remove the redundant
zeroing.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 96c9f9be3dc4..58e86bba0316 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2911,43 +2911,8 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* PMR Capabities register */
-    n->bar.pmrcap = 0;
-    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
-    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
     NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
-    NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
-    /* Turn on bit 1 support */
     NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
-    NVME_PMRCAP_SET_PMRTO(n->bar.pmrcap, 0);
-    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 0);
-
-    /* PMR Control register */
-    n->bar.pmrctl = 0;
-    NVME_PMRCTL_SET_EN(n->bar.pmrctl, 0);
-
-    /* PMR Status register */
-    n->bar.pmrsts = 0;
-    NVME_PMRSTS_SET_ERR(n->bar.pmrsts, 0);
-    NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 0);
-    NVME_PMRSTS_SET_HSTS(n->bar.pmrsts, 0);
-    NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 0);
-
-    /* PMR Elasticity Buffer Size register */
-    n->bar.pmrebs = 0;
-    NVME_PMREBS_SET_PMRSZU(n->bar.pmrebs, 0);
-    NVME_PMREBS_SET_RBB(n->bar.pmrebs, 0);
-    NVME_PMREBS_SET_PMRWBZ(n->bar.pmrebs, 0);
-
-    /* PMR Sustained Write Throughput register */
-    n->bar.pmrswtp = 0;
-    NVME_PMRSWTP_SET_PMRSWTU(n->bar.pmrswtp, 0);
-    NVME_PMRSWTP_SET_PMRSWTV(n->bar.pmrswtp, 0);
-
-    /* PMR Memory Space Control register */
-    n->bar.pmrmsc = 0;
-    NVME_PMRMSC_SET_CMSE(n->bar.pmrmsc, 0);
-    NVME_PMRMSC_SET_CBA(n->bar.pmrmsc, 0);
 
     pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
-- 
2.29.2


