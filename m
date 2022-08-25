Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84DC5A1A33
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 22:23:34 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRJO1-0007aK-Kq
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 16:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRJFp-0002Sb-RD; Thu, 25 Aug 2022 16:15:05 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRJFn-0000ee-Rt; Thu, 25 Aug 2022 16:15:05 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A4C95C0126;
 Thu, 25 Aug 2022 16:15:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 16:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661458503; x=
 1661544903; bh=dyviv9kRwtNs71EuCAS+nS/5Hdu3EKrmm25W6TTCat8=; b=V
 FOgWbXQVaCpC0qNy228xGFz7X+XIKFYGutSgMiwYroWedKfZD0Ednhnty96q5bVp
 NkzaglLX6Iv2hlA6YOYi8E4J75dKt9phEInzZtf1FIAeeERR8Z14OaMoCHu7gY8T
 HzoOM7QvijnbwtlK+/H0JM3jzPCWLWbd8AIdNSFuSMgicnKoejq9W1xUFK+sGADF
 DX0BskdqwznT8o4nEV6Z6k6M5NsMkzkZDo2MJ31y71iH+ctmnDmUyZmOpwHfBino
 qbcsvZi0uxM2V5RY46HeGm5tDxkhod1EpIzY2jXUvva9sb4zgUlG9MlgNKNB0vvF
 5y2+hvYc5uvdUTwIL3pow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661458503; x=1661544903; bh=dyviv9kRwtNs7
 1EuCAS+nS/5Hdu3EKrmm25W6TTCat8=; b=48q/KOdB1b4Lbaqwsr01JsDCMWC67
 B+epJhdGy68AdBoTaqwmA+8ydoiEyFo+tmgkxQkmv9TbQLd6RtFCI8gVpvmtSxHm
 4iGAsX3imGj2r5dNCubT5gJuEcfV5r+b8AQgq2oNd+IrwmwRsqNiwtpp6p9II4CZ
 lOwPU0+slD116jhrb4UzQaZ/+YmQTxLg5vVtEofluFgnswKnInsVT0SFwrfkvptH
 hNHysEZ02qy08LwRwl+KR86CHw+KPnDD6KfrldKmgVPvkfBlVh4XzDRzb5V8JU/E
 Udeq2Yd8K0TRwbdzqqRMkVA5uEfDr1y+zoLQgcp744R5RJy4Y5mijqTjw==
X-ME-Sender: <xms:RtgHY25Fh50aZWe72aPLi6nKUFG6Nh7rODOkaoR9QqIk3KDq3F_wqg>
 <xme:RtgHY_5_V0g4NOtQ3f-S-V6GQLnXfuZxngAQJOVR7BxfURuYGP7QqH4fvOdDweDkb
 GNd2lmccATwWEZVdKI>
X-ME-Received: <xmr:RtgHY1cLyKOaG7DFlYrNoCg5tU0HYNEB8Q-5cIoVEPkOAozSV_hP7G1OgHCeVff-DrHgex5JeF1eV7gmNDdK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RtgHYzJqdKEwnO4KrVLWRsPXHum7cJ4u6qqq2DeyBp0LKrmz_8YlZQ>
 <xmx:RtgHY6LnVdRyOvUXSJoJV9GP-hrOED8KqfaM7_9o9Cnjxo-e03H0Uw>
 <xmx:RtgHY0zI7RzRObpXyY83JDXMzjEWNIJXRmlDpvIqIxIaq6-AWvlMRA>
 <xmx:R9gHY8hkGKKivhCeHEA6isae8kThe2UrVTXXTD5fMMMTFmPkf5Bokg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 16:15:01 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 stefanha@gmail.com, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 2/2] hw/nvme: use KVM irqfd when available
Date: Thu, 25 Aug 2022 22:14:54 +0200
Message-Id: <20220825201454.259190-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825201454.259190-1-its@irrelevant.dk>
References: <20220825201454.259190-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Jinhao Fan <fanjinhao21s@ict.ac.cn>

Use KVM's irqfd to send interrupts when possible. This approach is
thread safe. Moreover, it does not have the inter-thread communication
overhead of plain event notifiers since handler callback are called
in the same system call as irqfd write.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 145 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |   3 +
 hw/nvme/trace-events |   3 +
 3 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 51792f395597..396f3f0cddbd 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -192,6 +192,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/hostmem.h"
 #include "hw/pci/msix.h"
@@ -1377,8 +1378,115 @@ static void nvme_deassert_notifier_read(EventNotifier *e)
     }
 }
 
+static int nvme_kvm_vector_use(NvmeCtrl *n, NvmeCQueue *cq, uint32_t vector)
+{
+    KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
+    int ret;
+
+    ret = kvm_irqchip_add_msi_route(&c, vector, &n->parent_obj);
+    if (ret < 0) {
+        return ret;
+    }
+
+    kvm_irqchip_commit_route_changes(&c);
+
+    cq->virq = ret;
+
+    return 0;
+}
+
+static int nvme_kvm_vector_unmask(PCIDevice *pci_dev, unsigned vector,
+                                  MSIMessage msg)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+    int ret;
+
+    trace_pci_nvme_irq_unmask(vector, msg.address, msg.data);
+
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
+        NvmeCQueue *cq = n->cq[i];
+
+        if (!cq) {
+            continue;
+        }
+
+        if (cq->vector == vector) {
+            if (cq->msg.data != msg.data || cq->msg.address != msg.address) {
+                ret = kvm_irqchip_update_msi_route(kvm_state, cq->virq, msg,
+                                                   pci_dev);
+                if (ret < 0) {
+                    return ret;
+                }
+
+                kvm_irqchip_commit_routes(kvm_state);
+
+                cq->msg = msg;
+            }
+
+            ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
+                                                     &cq->assert_notifier,
+                                                     NULL, cq->virq);
+            if (ret < 0) {
+                return ret;
+            }
+        }
+    }
+
+    return 0;
+}
+
+static void nvme_kvm_vector_mask(PCIDevice *pci_dev, unsigned vector)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+
+    trace_pci_nvme_irq_mask(vector);
+
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
+        NvmeCQueue *cq = n->cq[i];
+
+        if (!cq) {
+            continue;
+        }
+
+        if (cq->vector == vector) {
+            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                                  &cq->assert_notifier,
+                                                  cq->virq);
+        }
+    }
+}
+
+static void nvme_kvm_vector_poll(PCIDevice *pci_dev, unsigned int vector_start,
+                                 unsigned int vector_end)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+
+    trace_pci_nvme_irq_poll(vector_start, vector_end);
+
+    for (uint32_t i = 1; i <= n->params.max_ioqpairs; i++) {
+        NvmeCQueue *cq = n->cq[i];
+
+        if (!cq) {
+            continue;
+        }
+
+        if (!msix_is_masked(pci_dev, cq->vector)) {
+            continue;
+        }
+
+        if (cq->vector >= vector_start && cq->vector <= vector_end) {
+            if (event_notifier_test_and_clear(&cq->assert_notifier)) {
+                msix_set_pending(pci_dev, i);
+            }
+        }
+    }
+}
+
+
 static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
 {
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     int ret;
 
     ret = event_notifier_init(&cq->assert_notifier, 0);
@@ -1386,12 +1494,27 @@ static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
         return;
     }
 
-    event_notifier_set_handler(&cq->assert_notifier,
-                                nvme_assert_notifier_read);
+    if (with_irqfd) {
+        ret = nvme_kvm_vector_use(n, cq, cq->vector);
+        if (ret < 0) {
+            event_notifier_cleanup(&cq->assert_notifier);
+
+            return;
+        }
+    } else {
+        event_notifier_set_handler(&cq->assert_notifier,
+                                   nvme_assert_notifier_read);
+    }
 
     if (!msix_enabled(&n->parent_obj)) {
         ret = event_notifier_init(&cq->deassert_notifier, 0);
         if (ret < 0) {
+            if (with_irqfd) {
+                kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                                      &cq->assert_notifier,
+                                                      cq->virq);
+            }
+
             event_notifier_set_handler(&cq->assert_notifier, NULL);
             event_notifier_cleanup(&cq->assert_notifier);
 
@@ -4764,6 +4887,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
 
     n->cq[cq->cqid] = NULL;
@@ -4775,6 +4900,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
         event_notifier_cleanup(&cq->notifier);
     }
     if (cq->assert_notifier.initialized) {
+        if (with_irqfd) {
+            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                                  &cq->assert_notifier,
+                                                  cq->virq);
+            kvm_irqchip_release_virq(kvm_state, cq->virq);
+        }
         event_notifier_set_handler(&cq->assert_notifier, NULL);
         event_notifier_cleanup(&cq->assert_notifier);
     }
@@ -6528,6 +6659,9 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     uint32_t page_size = 1 << page_bits;
     NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
+    bool with_irqfd = msix_enabled(&n->parent_obj) &&
+                      kvm_msi_via_irqfd_enabled();
+
     if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
         trace_pci_nvme_err_startfail_virt_state(le16_to_cpu(sctrl->nvi),
                                                 le16_to_cpu(sctrl->nvq),
@@ -6617,6 +6751,12 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     nvme_select_iocs(n);
 
+    if (with_irqfd) {
+        return msix_set_vector_notifiers(PCI_DEVICE(n), nvme_kvm_vector_unmask,
+                                         nvme_kvm_vector_mask,
+                                         nvme_kvm_vector_poll);
+    }
+
     return 0;
 }
 
@@ -7734,6 +7874,7 @@ static void nvme_exit(PCIDevice *pci_dev)
         pcie_sriov_pf_exit(pci_dev);
     }
 
+    msix_unset_vector_notifiers(pci_dev);
     msix_uninit(pci_dev, &n->bar0, &n->bar0);
     memory_region_del_subregion(&n->bar0, &n->iomem);
 }
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 4850d3e9653a..b0b986b02426 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -20,6 +20,7 @@
 
 #include "qemu/uuid.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
 #include "hw/block/block.h"
 
 #include "block/nvme.h"
@@ -396,10 +397,12 @@ typedef struct NvmeCQueue {
     uint64_t    dma_addr;
     uint64_t    db_addr;
     uint64_t    ei_addr;
+    int         virq;
     QEMUTimer   *timer;
     EventNotifier notifier;
     EventNotifier assert_notifier;
     EventNotifier deassert_notifier;
+    MSIMessage  msg;
     bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f48973..b11fcf4a651d 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -2,6 +2,9 @@
 pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 pci_nvme_irq_pin(void) "pulsing IRQ pin"
 pci_nvme_irq_masked(void) "IRQ is masked"
+pci_nvme_irq_mask(uint32_t vector) "IRQ %u gets masked"
+pci_nvme_irq_unmask(uint32_t vector, uint64_t addr, uint32_t data) "IRQ %u gets unmasked, addr=0x%"PRIx64" data=0x%"PRIu32""
+pci_nvme_irq_poll(uint32_t vector_start, uint32_t vector_end) "IRQ poll, start=0x%"PRIu32" end=0x%"PRIu32""
 pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2=0x%"PRIx64""
 pci_nvme_dbbuf_config(uint64_t dbs_addr, uint64_t eis_addr) "dbs_addr=0x%"PRIx64" eis_addr=0x%"PRIx64""
 pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
-- 
2.37.2


