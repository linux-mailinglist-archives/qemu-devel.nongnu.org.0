Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A3314A34
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:26:26 +0100 (CET)
Received: from localhost ([::1]:60080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OLp-00006l-Fa
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVy-0005TJ-Sa; Tue, 09 Feb 2021 02:32:50 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVk-0005vc-EU; Tue, 09 Feb 2021 02:32:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 86DAABA1;
 Tue,  9 Feb 2021 02:32:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=OUIgikpSSyhYa
 JlBx2da4txrGgX8x8sNFwPAUVqAuk4=; b=P+HI2GYMPGHEUXeiXNi9XAqBaB+VH
 8CFa/S3Q1CRmnFR8tcUnLecZF2IMgRI3rCkFvOoOiMfLYj1elA/L7ZLDd8iABOnG
 rBN+29s0zNi1FUvQ/TLOucaBb1kmk5bLmN41BAgfXNUnQnSfTtvt/TP1aZMv82ZI
 n+frrt6KX5qlgkIjfHPu2ye+z6nde/Kkz4hc5cC9BFuoPgcjBPYTERYWRxMrwmm8
 44z1q3jcjasDEOOyN6oXLxIl4UF4FefIZUC4jAPNDWQG0xjN7g0xL5eaqEaiqxUW
 QBVdxFP/8wSuxN9BC2n9ygUa46CSAfo8VH00XjWCZhmA7aj6sOWBurzhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=OUIgikpSSyhYaJlBx2da4txrGgX8x8sNFwPAUVqAuk4=; b=PIj9LEBk
 g8JloFXwwCuARV+1gTM5XT9ZCLUIi4FQOt9FxrNACR7ESQbOqUF97GljYDNkVzPl
 HHzDspofaGMVDAyZyfJJONUzzox63NqXN6w6E1LHqY1HzZ28XzJ+beMHGSsrDWRY
 R9fpmOdrvqMyIFzCZWtqdCGpwb0D8c5E+96qkwhbUtTJ1lycQPmWoDIxDTB6mhhx
 l8ija6lXBBUKHXYzd1TBEyukFWIBNkzjZrGr3CFCkMZm/bGB3f43ng2SfOPxC4K4
 NDz2gqJg2/SlIvy7TK0BsMyEv3700hP3GA+nvojgGgZKFw82HtQWwzabPJaRqj4+
 IIHJacd/cl3bxg==
X-ME-Sender: <xms:kToiYPzJZ1P8qILRFBtYoMj7eel1ZOiFGfUdcDEtoS1YKNEH9D_MNQ>
 <xme:kToiYHSE78ZdTRHIkpaY4UsggZOKkAvyJhJnc14-46XorB12WPDMdFEEsV4eCQzib
 UDti-URbPcmy3YjOic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduhe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kToiYJX1S49GLiBFQRaC5xL4IN7hZaPaIM4h9w_6u2-KlWsZoT4f0Q>
 <xmx:kToiYJjaOiK9dIPVdnh7KwoxKfsq9y-8y3c8fXDTVM_VcAX4xQ0MuA>
 <xmx:kToiYBBn1wN24NO39OHdJb1uLXFFlLyA67x8A83YxVksAKfqnASqqQ>
 <xmx:kToiYLAT09gYC6DLlUckTMEEUZ7NKFmp19m24Zh3denQwnR-2DbqmA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7FC71080057;
 Tue,  9 Feb 2021 02:32:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 45/56] hw/block/nvme: disable PMR at boot up
Date: Tue,  9 Feb 2021 08:30:50 +0100
Message-Id: <20210209073101.548811-46-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The PMR should not be enabled at boot up. Disable the PMR MemoryRegion
initially and implement MMIO for PMRCTL, allowing the host to enable the
PMR explicitly.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f8dd771925f9..d773796051d6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3848,8 +3848,16 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -4225,6 +4233,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
+
+    memory_region_set_enabled(&n->pmrdev->mr, false);
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.30.0


