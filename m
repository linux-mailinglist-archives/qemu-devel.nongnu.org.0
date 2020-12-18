Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269DD2DE39D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:01:14 +0100 (CET)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGJl-0007JH-27
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFp5-0003aB-AP; Fri, 18 Dec 2020 08:29:31 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFoz-0002zq-71; Fri, 18 Dec 2020 08:29:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 71C2658C;
 Fri, 18 Dec 2020 08:29:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 08:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=MOdIXX00WFb0b
 mEFsN9aJKc+Kg6JMbbXnRjJB19cN50=; b=HQBjPLwmfVf/oXvOBQnyNFeFIbHT5
 8pTslXtOk1RIAKWqAcagxtpaAe6pmzTy2w6/lw+dZlw7mQ9wv/J0Mtf+UI2ogTOg
 XJ5PJTXLbXdvFs/4p4KiZ+JdNtjwEs8Mkh7c0Oz/aOZFRt2sT9QvKnNmVqVe2JEg
 6Yp5G1voAslplJIUvt9S6cKSO4I3sAQtF9Y8G0EMMQG/9HJHGqQ0h0IUwXS/ggNB
 kbgd3gt44tvOjf5uxB+V5rCBx0UqIAIYTVsAEebuB5dI+ljf/OI2W/9+fNLoAlbj
 /AgNeRgbbEN0aIR77nXrnQ8wxHCETP7vaTPycpLODk8xjeTCyPfeXcOrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=MOdIXX00WFb0bmEFsN9aJKc+Kg6JMbbXnRjJB19cN50=; b=TgPM+4A5
 NjLb2ExPtShUOxL5YtZNW8pbLogsQTkgKtSv9XEdKfZCOmPWr+Qt/LA3MTiWVc7x
 9vOF3HrJqzt+YcjciOigOgIZhKacBX+Q84GMqVyzQ3H6oc1FMFguopu5gnEEpCz2
 cZjtq6EGmO7xqRtJHNUmYyCjQdckzDUBqNfGeVMYXMrJCnGifcxKp79S5VjjIZfa
 +ksL0y5l/UsVIJ0zaBwJZ+kZflLOeDQiJzrpugPquXJ353uCWPbI6cKWcCQXGG0k
 9cPeXMOFCRdC97HpIGdvwBouBMCDMdyvdOlHbnxWYXFWailpyKj5LV3eDDa/cwMA
 hHbS3+cCfQ9ctA==
X-ME-Sender: <xms:rq7cXw4jLSrtQH-lDhdV5w5arncL6Hi4EojRMf9ZTxA6fEl2yaxWsw>
 <xme:rq7cXx6dlD_sSUBmaB8hNOYgFY4jFEI-vHrt6zfTye9cKmIPhl7oN9z-yNeNQwXRC
 S7OceTOpveQeOARkSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rq7cX_cxeGq9gtBz46eoLm7O8tsy5b-ika7HKinEIYyBajEo3ds66g>
 <xmx:rq7cX1KcqNg3SORCQSG3BBN-jxW8zw-0g9UNMuZFxQ0j806Pnlohlw>
 <xmx:rq7cX0L_FzAITNo2rIj8injDRuNACq-S9tdkCiTAGSk4Ax7dL1CD9w>
 <xmx:r67cX9qq97EMs5HHr52_AWEKX6upPV6yEt1UCN0LZusgzgaWENow-w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA16E24005C;
 Fri, 18 Dec 2020 08:29:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] hw/block/nvme: disable PMR at boot up
Date: Fri, 18 Dec 2020 14:29:04 +0100
Message-Id: <20201218132905.967326-8-its@irrelevant.dk>
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

The PMR should not be enabled at boot up. Disable the PMR MemoryRegion
initially and implement MMIO for PMRCTL, allowing the host to enable the
PMR explicitly.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 58e86bba0316..c04d6e69e4df 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2549,8 +2549,16 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
                        "invalid write to PMRCAP register, ignored");
         return;
-    case 0xE04: /* TODO PMRCTL */
-        break;
+    case 0xE04: /* PMRCTL */
+        n->bar.pmrctl = data;
+        if (NVME_PMRCTL_EN(data)) {
+            memory_region_set_enabled(&n->pmrdev->mr, true);
+            n->bar.pmrsts = 0;
+        } else {
+            memory_region_set_enabled(&n->pmrdev->mr, false);
+            NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 1);
+        }
+        return;
     case 0xE08: /* PMRSTS */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
                        "invalid write to PMRSTS register, ignored");
@@ -2918,6 +2926,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
+
+    memory_region_set_enabled(&n->pmrdev->mr, false);
 }
 
 static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.29.2


