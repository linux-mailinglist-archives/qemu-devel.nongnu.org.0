Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227C558AF2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:51:04 +0200 (CEST)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Uj8-0000Mg-Ol
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTw-0004dS-P5; Thu, 23 Jun 2022 17:35:20 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTu-0006e8-I1; Thu, 23 Jun 2022 17:35:20 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9AC3E320097C;
 Thu, 23 Jun 2022 17:35:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020115; x=
 1656106515; bh=ezkYm9EDGpTe/unPxklpx6mjGWwbgQ86K8FY51Uf7e8=; b=h
 fwdO3nEB7PLxQXHDKwEGbYnN3/bldzwKX08OEXOXQEsbMQKbJAcpPJwJHxBh4wrY
 1qp38NvxPtT3MyQeV1oPZ41zntsrixMFJ/wNqwMc68XFeAfnfjtycns7PhO0//a3
 5gwAzhwG2ZJfOfDE7nFNPRZ++JpYKSfwzpWDXux00TZdi/TxqaQwMV3cpP14yXE2
 pz/1UJPGT1zwz1CvVjfbEAjlJv18Kc6Erj4mc3KgV3SMvBfTbSHcoeMassXCcmEo
 wgtrR7isHfVlSMw2PGPRMr4RpV8R1kq+15zqhXZ2ZgwxiXdqV2q6mLT9uc/802OK
 j6g1NTbKn3Smblq64w6Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656020115; x=
 1656106515; bh=ezkYm9EDGpTe/unPxklpx6mjGWwbgQ86K8FY51Uf7e8=; b=L
 kaQ4OjifazR0tRnhhVCvx7BmgCPTwJV6ctbvKgqzTc3dzcFwSe7l9I4pA1lroDko
 xf+tiAm2+JsLDWHP4Qahm8a4lsEXeVUPjvTikaToVj6UKA4ggs26mHI4aZlUp6Kb
 u7Nz1ouLDwoa5XwOGpJ2zH2K6eo9HHmoEvy6gn5bnRdtOzzXZ2XZN8zbW/uukERa
 hkemgugtwjkbE8rjSBjYSNU2nE7lc8Ws6DwfY69IlKZLUIdWp5DCZq2sXLvyXSbd
 YuLhXCIVYQrd0rIMMm/ebkAHGXBbmKHDgVb4vfnWz775Ek6aAqraicvsYCR/Yk/W
 pTYs4cpLk1csdyvIElTTQ==
X-ME-Sender: <xms:kty0YnwrNesHKmBDPWT-Yny5VwFdtZQ9N5Dkqdyy-dvrnsuaajonDA>
 <xme:kty0YvQH-9AvBIgFcZ7DgLaOavAuynyARlgCtnxfp0i1dpTIJOG8EO6XsXOzHnPhD
 Nm68Q4mmf-8Cjx_WLg>
X-ME-Received: <xmr:kty0YhXzV2js-NfZnQLzuRkMFP5AdTL7xVEwiPoBSSNC2zvM9fNyZQQ0H2W6ktYC9qZasJuscw7wolqn-dnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhl
 rghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrf
 grthhtvghrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffet
 jeeihfdvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:k9y0YhjKFgStFGLhXEnSsJfHG48dd7MGh7KoiZ4d8QGjLVk8WziFww>
 <xmx:k9y0YpBgqZFsNQrdQUuDr3-rtLX5ilVvXd_sBoc20QcBxCVhnznQPQ>
 <xmx:k9y0YqIZhpcJM7uDS9Itzbsl0gKqOR-EcerISaWuyL8b0eeTotU0ZA>
 <xmx:k9y0Yhaqsyw2fpeijPB36u3ef8M-XZR2ySoafAfidjYFVx-JVPK3Yg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:12 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 06/15] hw/nvme: Remove reg_size variable and update BAR0 size
 calculation
Date: Thu, 23 Jun 2022 23:34:33 +0200
Message-Id: <20220623213442.67789-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

The n->reg_size parameter unnecessarily splits the BAR0 size calculation
in two phases; removed to simplify the code.

With all the calculations done in one place, it seems the pow2ceil,
applied originally to reg_size, is unnecessary. The rounding should
happen as the last step, when BAR size includes Nvme registers, queue
registers, and MSIX-related space.

Finally, the size of the mmio memory region is extended to cover the 1st
4KiB padding (see the map below). Access to this range is handled as
interaction with a non-existing queue and generates an error trace, so
actually nothing changes, while the reg_size variable is no longer needed.

    --------------------
    |      BAR0        |
    --------------------
    [Nvme Registers    ]
    [Queues            ]
    [power-of-2 padding] - removed in this patch
    [4KiB padding (1)  ]
    [MSIX TABLE        ]
    [4KiB padding (2)  ]
    [MSIX PBA          ]
    [power-of-2 padding]

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 10 +++++-----
 hw/nvme/nvme.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e970234a2c87..9f07a730d341 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6671,9 +6671,6 @@ static void nvme_init_state(NvmeCtrl *n)
     n->conf_ioqpairs = n->params.max_ioqpairs;
     n->conf_msix_qsize = n->params.msix_qsize;
 
-    /* add one to max_ioqpairs to account for the admin queue pair */
-    n->reg_size = pow2ceil(sizeof(NvmeBar) +
-                           2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
     n->sq = g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq = g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
     n->temperature = NVME_TEMPERATURE;
@@ -6797,7 +6794,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         pcie_ari_init(pci_dev, 0x100, 1);
     }
 
-    bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
+    /* add one to max_ioqpairs to account for the admin queue pair */
+    bar_size = sizeof(NvmeBar) +
+               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
     msix_table_offset = bar_size;
     msix_table_size = PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
 
@@ -6811,7 +6811,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme",
-                          n->reg_size);
+                          msix_table_offset);
     memory_region_add_subregion(&n->bar0, 0, &n->iomem);
 
     if (pci_is_vf(pci_dev)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index aab4962fb857..d9deb0b1ec43 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -429,7 +429,6 @@ typedef struct NvmeCtrl {
     uint16_t    max_prp_ents;
     uint16_t    cqe_size;
     uint16_t    sqe_size;
-    uint32_t    reg_size;
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
-- 
2.36.1


