Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F83558AE6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:44:04 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UcN-0006XM-Kx
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UU1-0004k3-4x; Thu, 23 Jun 2022 17:35:26 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTz-0006fK-Du; Thu, 23 Jun 2022 17:35:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8FB883200959;
 Thu, 23 Jun 2022 17:35:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 23 Jun 2022 17:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020119; x=
 1656106519; bh=SR+ZHQlbF+eJKjbFaAHZZQT7pYhR+T55DYI4EXrTytY=; b=S
 Y+7BqQgHm7BIGbP7eNylkK+d65eqVqaqjbPhihaNQkjXdMj3P0/ghTMfvR295j1e
 0Sr9CG3ry5qcM2Ok+7QbW8Z2XbfAuZRc8Q/GEc4AghAeYNUWtq7g5tBOB3WwuF1i
 d6Akts5WQeTEntbbI7HdqC44cf+05/l+VDPKCjZYe3Q0eTYMNTBsn4rFgtzhuZgT
 vvREWJz1llKEjaTk0vve6k7RQZX6EnXe6kz0K/hAosCtO7iRLGSM1sAJGh1jBjI9
 N3f61eLqafvmmay6rvQxFKtaC8FIqosTu4MKjsxW3Mi1+nNPems+lyU7CpKV0aro
 QDKZqwiFfdfxUHJt9YKmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656020119; x=
 1656106519; bh=SR+ZHQlbF+eJKjbFaAHZZQT7pYhR+T55DYI4EXrTytY=; b=u
 terYj5QqtBa5P/U/74I3dU+DYjBtdBxPssQsFxfMPgS36cXrJUFBGEUF6LSNp7/n
 G+WjkJZAX87TeBS2I7dvINmkK/hEgFujS7L8rWfquvcTQPd3ci3MXDss6cQslQeC
 VbLHWlgBicOyunX6GtnBXO8vLL47LZj7tFa+MWY7cj+orlyceFzsqqARGRC9Mvgb
 W+HeBGA0pS+haZg/4wR78KfxBC9V+ujfcv084qvq8HEjG9p+Z6+3IlJCxsrOwrPv
 52Cb2j7/twXI62avEMmhK/OWKN40FSaV4hFSTsJCY+kQ8EqkIsMSzfPCWHQPtsxa
 x3ggIh4vYslxYnEJF+45A==
X-ME-Sender: <xms:l9y0YihEmTz6_GRVPxuwovk1R4OYBWHVUUwROu9fsymm6MiIaQA4uw>
 <xme:l9y0YjARVE3u2Xk61plUW-zPCNmZDHwc3HcZ6qmM-lxF7FQOf2ZneAjl7SPN9G7rG
 Ccnfbgbq-mPQeQOZnU>
X-ME-Received: <xmr:l9y0YqHJ3OMd1TWK4XpUuCN7bYgjmUtuqkw-1Wd8fSJPv0RNNgVdPAeV61UewEebeDg4UydbkosEHC81FjR5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhl
 rghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrf
 grthhtvghrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffet
 jeeihfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:l9y0YrTrdyU3snho0KsVENnqz63qfMV7rCHh5qVpIxW7-Lc-dTM4sA>
 <xmx:l9y0YvzXBlDZVabgR4J0Fmxhshd4n4-xY6wf0I_tfxw4amhocpUz2g>
 <xmx:l9y0Yp76LF5Hvr7ZxqkLxqzYyOmxEfH-WkVbV1844Qtz2meogbWxLg>
 <xmx:l9y0YkKPPmjlJ7w4K3zK364u63hsOfqKcMEBxdkO_7yhdX_E7Bg9NA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:17 -0400 (EDT)
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
Subject: [PULL 07/15] hw/nvme: Calculate BAR attributes in a function
Date: Thu, 23 Jun 2022 23:34:34 +0200
Message-Id: <20220623213442.67789-8-its@irrelevant.dk>
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

An NVMe device with SR-IOV capability calculates the BAR size
differently for PF and VF, so it makes sense to extract the common code
to a separate function.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9f07a730d341..3315e5c3de0a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6730,6 +6730,34 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
     memory_region_set_enabled(&n->pmr.dev->mr, false);
 }
 
+static uint64_t nvme_bar_size(unsigned total_queues, unsigned total_irqs,
+                              unsigned *msix_table_offset,
+                              unsigned *msix_pba_offset)
+{
+    uint64_t bar_size, msix_table_size, msix_pba_size;
+
+    bar_size = sizeof(NvmeBar) + 2 * total_queues * NVME_DB_SIZE;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
+
+    if (msix_table_offset) {
+        *msix_table_offset = bar_size;
+    }
+
+    msix_table_size = PCI_MSIX_ENTRY_SIZE * total_irqs;
+    bar_size += msix_table_size;
+    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
+
+    if (msix_pba_offset) {
+        *msix_pba_offset = bar_size;
+    }
+
+    msix_pba_size = QEMU_ALIGN_UP(total_irqs, 64) / 8;
+    bar_size += msix_pba_size;
+
+    bar_size = pow2ceil(bar_size);
+    return bar_size;
+}
+
 static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
                             uint64_t bar_size)
 {
@@ -6769,7 +6797,7 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
-    uint64_t bar_size, msix_table_size, msix_pba_size;
+    uint64_t bar_size;
     unsigned msix_table_offset, msix_pba_offset;
     int ret;
 
@@ -6795,19 +6823,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     }
 
     /* add one to max_ioqpairs to account for the admin queue pair */
-    bar_size = sizeof(NvmeBar) +
-               2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE;
-    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
-    msix_table_offset = bar_size;
-    msix_table_size = PCI_MSIX_ENTRY_SIZE * n->params.msix_qsize;
-
-    bar_size += msix_table_size;
-    bar_size = QEMU_ALIGN_UP(bar_size, 4 * KiB);
-    msix_pba_offset = bar_size;
-    msix_pba_size = QEMU_ALIGN_UP(n->params.msix_qsize, 64) / 8;
-
-    bar_size += msix_pba_size;
-    bar_size = pow2ceil(bar_size);
+    bar_size = nvme_bar_size(n->params.max_ioqpairs + 1, n->params.msix_qsize,
+                             &msix_table_offset, &msix_pba_offset);
 
     memory_region_init(&n->bar0, OBJECT(n), "nvme-bar0", bar_size);
     memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n, "nvme",
-- 
2.36.1


