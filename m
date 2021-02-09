Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A168B314AB1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:50:10 +0100 (CET)
Received: from localhost ([::1]:48850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Oin-0002Fa-L1
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWE-0005dR-Jv; Tue, 09 Feb 2021 02:33:06 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWD-0005yH-0Z; Tue, 09 Feb 2021 02:33:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 116755DB;
 Tue,  9 Feb 2021 02:32:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9iwH69h0Kt28j
 7vZUyPsjhpMppd9+crokvq6IGeTJbk=; b=FlSrBXfNikn7ff7HA6IEyTllUOVp4
 Ar2KJwPM3xEc4PBrUlI7edHF0xdlO9OgBRxJHTq1hkSSv67h0hr96yNM30yOu7X7
 1+fz0Nnhbhhc1iSHVibRxzSBM7VpyipwExjGoFZnAVuXhqs6rQA/Fbdtd4dNYJ84
 DMjeAMi6ZDkFxSfRa26N6LTGLcyegeQAaUrkED0aNiJFmvsAOhbUyuyx/6OiDk87
 Oc91lsfCMcqnGrtHvz+yoKqT17ESYXrqm7c++DmmzGjOOO4i+DpQ1E3z6T8FGmTz
 R4krz4dUtvnEWPwWWqwPXFZAEm4qVjqeRzwRVtqdnOM5Habyi89WxLANQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9iwH69h0Kt28j7vZUyPsjhpMppd9+crokvq6IGeTJbk=; b=jZgOrJhy
 la+S3V7tuxOe41sFrk+o2ohtSddOW7vEWhMM/Zx5t67f61aMssXwxEKA9MMTPOAw
 X1Fu8Tc8pTTmtTOp2db/mRUQMLIu94vGjkcHHNS6JUq0E994lqFg1nO1CrVUPSSg
 opAjLnUCZIxnZvcr0tAaGP8aRc0HpXWlBEYorfASawNfznttC8I2pPHmIfvQYwJ/
 e4CunuQAAA/HEE2D2ln7QflwWmst8cqqVVtq2Uk3hLj3QsBkY+fbL0WaY2JfN+sK
 K2ikkixIh7zfgtjfkeSmYsD7b2lWYxvgPqyz5YFtusi7+4s5ZJLIoTB90pAcEwhg
 0fcHwaiJXHzEaA==
X-ME-Sender: <xms:jzoiYDwkNuBjUQEyTcW1nc10EiyRCCw9pS542TT_6vpp2iMqt-3_Hw>
 <xme:jzoiYLRx4dKchvl33vs-iNTebQew0h1v-iM5gGQJVJBcyVA0fjmx_L9hf50g-XTq_
 BUnzldFNfg0U4yd0OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduhe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jzoiYNV5dTcwY7A4b_LKhSEQGzeLyiscaeLp68ghBOv_vsAFgWbz2Q>
 <xmx:jzoiYNipuXN0PsvlnfrgQXQoCBy_Yi5vCAvWGKeibwcrFYhcexlAgg>
 <xmx:jzoiYFAlCTQtzOk2sNF1ML9AeVJcQtfSOOQ9XVH-TvFvaR72iReiXQ>
 <xmx:jzoiYJ2B-kvGXoxNFbTXDAq5Pfma6szvMAFo1GXY9Oz9OHyqYlHIwCzoOOg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F2CE108005B;
 Tue,  9 Feb 2021 02:32:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 44/56] hw/block/nvme: remove redundant zeroing of PMR registers
Date: Tue,  9 Feb 2021 08:30:49 +0100
Message-Id: <20210209073101.548811-45-its@irrelevant.dk>
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

The controller registers are initially zero. Remove the redundant
zeroing.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0057a02402b7..f8dd771925f9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4217,43 +4217,9 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* PMR Capabities register */
-    n->bar.pmrcap = 0;
-    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
-    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
     NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
-    NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
     /* Turn on bit 1 support */
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
2.30.0


