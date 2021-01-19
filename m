Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2F2FB559
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:28:37 +0100 (CET)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oFY-0000DR-Nc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2l-00028u-3n; Tue, 19 Jan 2021 05:15:23 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2j-0004KS-He; Tue, 19 Jan 2021 05:15:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 86A7CF68;
 Tue, 19 Jan 2021 05:15:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 05:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VxNa3lFMhIDIg
 pdLWLi1i1ctxHPRsKmHk2Yj177+KUw=; b=PJ47a9V/KVwlflDNivohVm6xp86uR
 rHWqgoe13sc84QY4B+UbNKIGYeM9YE/Ry0/W8Y5GMtrwHmerfDPjSTQ4CKsF2GZr
 GetcUulhfkOqCyExEKTQo6O+3FAlmNmLA4OSD64DB1IwuBcgpbCGOv+eTD9OiZoL
 VxNTUlY0i1cHGdiRdkXqZmYOogV1KEjExP8Sbtd2r3hnDvp+4CTLsnTxehymymy0
 NIUwUeRNvLsaGs52JG2nrSGiATtjwSNdXFKITuoIjrV1uquGIYYI2N3FabzsLPno
 pXQe5Q5raTyJMm5Y9BuOWrxq95JXBuAmh5+aXe3+OauBgpPLh2A8op1Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VxNa3lFMhIDIgpdLWLi1i1ctxHPRsKmHk2Yj177+KUw=; b=Mdw/zxAc
 Llnc3xMVE3CIS0U7Fk1Bn7YGGolAFgskcgvS3O/PyCuz909EML8yPZrgAiafIOu8
 g6D2Fl/xMbIP6f968vmOuKOkLFa5sM5VrUOuejsSMbIldRj0Q5QUpCea+N2xLqDW
 NtRTLHIC66DiQ06BLyMC+U80NAOC2BHUX30wTWfNmL3XsIyVVH5TrbMjzm14unkh
 5+tqU+KuhTvvuf/YvI9xkbmA9Nk7CGjddpEUFU/PrUWa1C/XRST2GRYZqbCRrz9c
 gISqtFqtPhMjxenhr7Qn/Ha5iZNqkD0VHT8ZHo4Zw7lRjy74VqwPuKGqzrNN2M+W
 OimYigZIXsu+2w==
X-ME-Sender: <xms:N7EGYFcY7J_aUOTsiseXtkqnHz2txae96dw0PMDfeTcfdeiF1piWBg>
 <xme:N7EGYDOjjl9XGhdgN3EfgJwoejxy-J2Wwxdal9EKpSuXFIr4MWoYcfsU7eyZXf87d
 ZVM_uezfHESTIe5nkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:N7EGYOimv3otAlNUGVggqLZSxUxuBFW9oskJ3trcWoKVFQT3ZCp8HA>
 <xmx:N7EGYO_sUcaJRiZ5nC1mTFtHZOww9puiaLZeNwooIyYxkvUxHpbh4g>
 <xmx:N7EGYBtgWPb6VHZzT5HyFeMSAvbpsybWciQqKLicrMcATF8HhOcNQA>
 <xmx:N7EGYFhB_MXqpZkCOaNzsa1ukNjm3p6gNHo5P7cu9KpfFaqv127j8A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC5F324005A;
 Tue, 19 Jan 2021 05:15:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/12] hw/block/nvme: disable PMR at boot up
Date: Tue, 19 Jan 2021 11:15:00 +0100
Message-Id: <20210119101504.231259-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
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
index 85b6617a0ce0..2a0d7e926bbf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3819,8 +3819,16 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -4196,6 +4204,8 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
+
+    memory_region_set_enabled(&n->pmrdev->mr, false);
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.30.0


