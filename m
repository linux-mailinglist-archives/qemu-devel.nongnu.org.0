Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41722F9C27
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:03:33 +0100 (CET)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RNk-0001CK-84
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R86-0000oK-AR; Mon, 18 Jan 2021 04:47:22 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R84-00017s-On; Mon, 18 Jan 2021 04:47:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A80B5C0097;
 Mon, 18 Jan 2021 04:47:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=V3wtdgABk8Vyu
 hYVIxZbuF3R8610D5En464gP+b4gnE=; b=V1hWvyTQqsB09Uyl2zBr9rDCHwWr4
 7GDffY67OiUoG2LyYVdBHxbZX8VzOc4DAav5ccGGm5OXxjdSCXJsZdSmCUwb9YO7
 NHwnDg7CTIHd24q/jUI42pQJufNyqhe4Hn+x0+mQQ7AF1CF0WNPxgb1XeyxjP2aB
 epbE+anxwnTwkgRYWjJPg5sWVeGlSGhXhTLNy5cgr0YMX6ZKfI3Z3Y9nHwAn90LC
 QCrKoQkoEpVh3JI03VpaCyxl8i/XB0o5/kBFsBCexkdJhrTOZCtz1Xk1fEb+EKxf
 U7Or0jp9ank28bAVy38RgIOkmSWbp5zxO3TWbZGxCakQT43DaIK3XsNYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=V3wtdgABk8VyuhYVIxZbuF3R8610D5En464gP+b4gnE=; b=jt3cdzsC
 iYg6b8P4UU0bvv79JLXJ2u0PBWTJXms9BWXRkXhJGU8vq9+vGXm8ylObjE5IWDGs
 DFnYps6FCt4u4ZulucMbv4YQKUIYa5ouQZDHGs4SwknMnpFqdncynvGO+v7TIQwD
 Gwe3nObrcDJY8a7ImTthd4JbCCkOs/ntV6k7Ai88PlJ0Qeo+DMjt2ejnPMrQsWPm
 w9oKbg95umnUeSwP3t5vupVgnQxZvLwcTM10YraGJg2Du6fC4Jps6WjwRokcBkew
 fp1ZzkvNEbslbVIJGpzDO6Y/cgpRK/sevDsjIhXaSjvIMkYL1ZOup7ZUyfAeJySQ
 OeBJ+Nih8ceE8w==
X-ME-Sender: <xms:J1kFYJz4fholSnEbHTyQqkeLf4BpybecnHs6adC10oBzz_qeOMu2Hw>
 <xme:J1kFYJQeMhu8rH5wQjgwndGA5vuqzCtt-nNdBmKoMOizgw5JqCe-l5HuAcqTUDIpD
 vmX6W-v_x3XSoL4fho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:J1kFYDVVoBtQvTrF_njQzRoWVvsi0wGby1OUXDLM5qa5UcmPzZJhDw>
 <xmx:J1kFYLhRkZe3eF8u-Fe41nluvAjZC1UtxyYnDBM9HXbhQ44kQCJodw>
 <xmx:J1kFYLDfLjrQYoCw4yf_Bxp-KzocU6pCg6fKfnvGltunzTImhnmwSw>
 <xmx:KFkFYN28S4qaenKopbE9yMZMjcvJJxcUZB7uIfU0RPYLJ0mxpHuamg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA69824005A;
 Mon, 18 Jan 2021 04:47:18 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] hw/block/nvme: disable PMR at boot up
Date: Mon, 18 Jan 2021 10:47:01 +0100
Message-Id: <20210118094705.56772-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9ee9570bb65c..937a6ed0a70d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3810,8 +3810,16 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -4186,6 +4194,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
+
+    memory_region_set_enabled(&n->pmrdev->mr, false);
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.30.0


