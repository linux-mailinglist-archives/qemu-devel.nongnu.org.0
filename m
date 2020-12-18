Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0A2DE35C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:38:13 +0100 (CET)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFxS-0005iT-3A
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFp0-0003Vw-Jg; Fri, 18 Dec 2020 08:29:26 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:54887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFoq-0002vO-UZ; Fri, 18 Dec 2020 08:29:25 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id E4C34438;
 Fri, 18 Dec 2020 08:29:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Dec 2020 08:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FZ2cT2+OPXRaa
 CjWDHktlCGJWTp/4N3joJPKRgShwQw=; b=CdbhXJANcbZbfb8vG71x/vNJTa2V/
 hOc2kkg5tNDZ7D8NZcUzelJ21Lylz52cNBeuV8jq+yOqLYrSBBSRRcBnzCixbU/9
 E1kebWf8lJksbs8BiwtksQUR01ZOMRB9zQIxPIsEHsblARdclIs8P+X0R8R9CjAe
 MSNsK/69Q96B/1/+vOV5afPd9zCwCU1p5ICn4wB9a5BA8bJHtKsw3NJyiSJncwd1
 u1HvOYw3/VIjOmtteRWusfT0RyQtJbquUw4WFw5DevUxfvQNukoLnKp4DQ1jtUPE
 8dBUuyDhIOYOGo1g2TwtteEvIZknxjdx2mwzFmtfkvhu/SyGOATBon1dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FZ2cT2+OPXRaaCjWDHktlCGJWTp/4N3joJPKRgShwQw=; b=I6bD4wcA
 jbDa/PnQN8ed//Ety2QKEy/o9AsTi84LJReDNzbghtuk42mwkL5KHYBTQeojqmVd
 LTF/VMcfdAbHNNZKNd6sho/VyEnp4clJdwQjpER4qfarnzwHK3nVrAtC+EBlkAsm
 0c1izCevsrSpumL37YlMVyRALPwVTKCMAf/o7mDPVrHRRHUgmrp0nMhlBMGLVF4Y
 rbAMUaPdL7nhJxsTOQixi7DNIrAIeRh7dUpJoXHSqiyACFRu5nb60nV7jP+C0qsp
 vx33VBvI6cEtH3qNT/RKmVZiL0DMHZdVssMosKVmDOi89Ugix4q5il141B0YliWA
 rcqAtJgl6lyY9A==
X-ME-Sender: <xms:qq7cX3TtGKsYW-4SEvibXWmsRingrHv7CK3u_LUBTyBjrIDZh6FapA>
 <xme:qq7cX6WPkfCBuJelYLynWRtt1s8o7Qg0dastRhcK-m18b2ZJmwIyAEzUXaQ9IhO3h
 -Uk0tlLnYCeyaKlxkI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:qq7cX8H9rv07nPpvHJ4cHVtHyvXdKRjmJHWuCGPRupArZbIWhne3Dg>
 <xmx:qq7cX9dCaLLAhwQQBzVVmpADsKxRd_YjeCZB5GsRNoeh7zQ6_e3p6A>
 <xmx:qq7cX1qtPnwVSRR0ZAXMfr6xFridNfJaezyVGEC17QGFK0N5_-kwsw>
 <xmx:qq7cX9EGaw-gxNx6su1RvDzDqd_4e0CUA8uP-YJUz6JnS6olzQCfUA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F2E624005B;
 Fri, 18 Dec 2020 08:29:13 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] hw/block/nvme: fix controller reset/shutdown logic
Date: Fri, 18 Dec 2020 14:29:01 +0100
Message-Id: <20201218132905.967326-5-its@irrelevant.dk>
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

Differentiate between Controller Level Reset (i.e. CC.EN transitions
from 1 to 0) and Controller Shutdown (i.e. host sets CC.SHN to 01b or
10b). Prior to this patch the controller would perform the equivalent of
a Controller Level Reset when the host set CC.SHN to 01b or 10b. This
erroneously entails clearing CC.

For a Shutdown, it is the host that *should* delete any I/O queues.
Setting CC.EN to 0 is not part of the Shutdown procedure and it is
specifically recommended that the host does NOT do this. The host should
also stop issuing new I/O commands and allow any outstanding ones to
complete before setting CC.SHN. The only guarantee the controller must
give is that it is safe to power off the controller when CSTS.SHST
indicates that shutdown processing is complete. Do so by issuing flushes
for the attached namespaces and the PMR (if in use) and set CSTS.SHST to
10b. Specifically do not care about draining since the host *should* not
have left any outstanding commands around. If it did, behavior is
undefined.

On the other hand, a Controller Level Reset is not about being safe for
shutdown - so only drain here, do not explicitly flush.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 69f2fe4bd4ff..96c9f9be3dc4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2262,7 +2262,26 @@ static void nvme_process_sq(void *opaque)
     }
 }
 
-static void nvme_clear_ctrl(NvmeCtrl *n)
+static void nvme_ctrl_shutdown(NvmeCtrl *n)
+{
+    NvmeNamespace *ns;
+    int i;
+
+    if (n->pmrdev) {
+        memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
+    }
+
+    for (i = 1; i <= n->num_namespaces; i++) {
+        ns = nvme_ns(n, i);
+        if (!ns) {
+            continue;
+        }
+
+        nvme_ns_flush(ns);
+    }
+}
+
+static void nvme_ctrl_reset(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -2297,15 +2316,6 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
     n->outstanding_aers = 0;
     n->qs_created = false;
 
-    for (i = 1; i <= n->num_namespaces; i++) {
-        ns = nvme_ns(n, i);
-        if (!ns) {
-            continue;
-        }
-
-        nvme_ns_flush(ns);
-    }
-
     n->bar.cc = 0;
 }
 
@@ -2473,12 +2483,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             }
         } else if (!NVME_CC_EN(data) && NVME_CC_EN(n->bar.cc)) {
             trace_pci_nvme_mmio_stopped();
-            nvme_clear_ctrl(n);
+            nvme_ctrl_reset(n);
             n->bar.csts &= ~NVME_CSTS_READY;
         }
         if (NVME_CC_SHN(data) && !(NVME_CC_SHN(n->bar.cc))) {
             trace_pci_nvme_mmio_shutdown_set();
-            nvme_clear_ctrl(n);
+            nvme_ctrl_shutdown(n);
             n->bar.cc = data;
             n->bar.csts |= NVME_CSTS_SHST_COMPLETE;
         } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(n->bar.cc)) {
@@ -3110,7 +3120,8 @@ static void nvme_exit(PCIDevice *pci_dev)
 {
     NvmeCtrl *n = NVME(pci_dev);
 
-    nvme_clear_ctrl(n);
+    nvme_ctrl_reset(n);
+
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
-- 
2.29.2


