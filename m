Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E305A1A30
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 22:20:12 +0200 (CEST)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRJKl-00064B-8S
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 16:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRJFo-0002S9-Pw; Thu, 25 Aug 2022 16:15:04 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:55567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRJFm-0000bB-CJ; Thu, 25 Aug 2022 16:15:04 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 82AF25C0114;
 Thu, 25 Aug 2022 16:15:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 25 Aug 2022 16:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661458501; x=
 1661544901; bh=xnJ3Awr29DMs94xZ92A8LbHOx6edFKph7lH8aZdp/Yk=; b=2
 bneAhtZ6hSY3zs6nNX3bvcBaFk43Uy1RZ/aXRRNhfoMJ6HXgixKvzGlDA1BAQULx
 Ma0VZ82OmSa08z25fTSpsHImvJT/405x36YE3xPWTa8HCEnOjZgolwCquafBc1Ov
 WmjD1u+UyqPbraStVqLsgmVqjRMRgq9hYw1tT28uyqqPDJcYo5YSGpo1GAJOObyd
 A99kpl9Qfs7tqnJY2IimA3QlAcE+SVYkWsZZaPInGH+U8WZnpvfajy3TqoC1HJo1
 uL/zkuPlFEjJrgLCi4FeG0MNvZPv6e9WxjI8RXH4BxJJYbKAn4XMxWHAP3YhX6AW
 tEfOpRKH1m3Ai1eX3/Z6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661458501; x=1661544901; bh=xnJ3Awr29DMs9
 4xZ92A8LbHOx6edFKph7lH8aZdp/Yk=; b=HsJIHpF6upVvsBAnt4pZgPCO+aUMD
 7DspiurYaBym7n6PrtFRysg5FwKtmE/3TJ7HyPQjYKAm2FXmJg8oydqZ3W9Cajc8
 GbKEa58tdpQ38ZLbt94JvsFCQtopD8hR6hWHcZ0Yb81dzYKcFfJkWp/Gj3zNVo4g
 t10/av4s0JE0+5WHTFguUS5OYVkTK2gs7ic1PWymLgl3FIdrMhczK5l8c1R4TfMG
 7b36Q2L0rXAKFOSm/c1fMRc9QZYXnXvT5y03UWrhwqhYqTG0JjG2zV/xSxW11SXB
 GBcgi5NgwkfTnwEKWWV1t/uA4xdRFw8kiL7qRJbeLRwe/XqeV7nrMnbJg==
X-ME-Sender: <xms:RNgHYwrjfpV3NxkK_0gdzX1VBtFD1BPm1aq-rmlF0Oln06qMwzPtTg>
 <xme:RNgHY2rDL-h5bcy6UUZMhBPeqtx3mnOXdmo4z4qSm7rYcdS7bgn1MfVCQdOV1jNbG
 svguU24wdsxWYY8Efs>
X-ME-Received: <xmr:RNgHY1PI_853o0V8XgTHXyTyziGG5dXj8OUxF02VdAWKo7AhaR3ZevYCYbmKkywy6QVbR9aSkXNKA10SmaZt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RNgHY35JStz4Ozj9oFXFP1K22nKuAoE2gxH5p9gNp7f5chXYMnbOqA>
 <xmx:RNgHY_5CFMqHelb9ERjZD06BBom3sWL92eAFDS6HKH1WvmV7apw8mw>
 <xmx:RNgHY3hW38UmqvuWSUGdhN-fXvvfttFGNgQ5p4cXmAEFFn2gdDRo5Q>
 <xmx:RdgHY1TiFSOFT3I_oHph-pF4jxCxKUAytxHzI-pi4Bv74vPkHqMjfg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 16:14:59 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 stefanha@gmail.com, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 1/2] hw/nvme: support irq(de)assertion with eventfd
Date: Thu, 25 Aug 2022 22:14:53 +0200
Message-Id: <20220825201454.259190-2-its@irrelevant.dk>
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

When the new option 'irq-eventfd' is turned on, the IO emulation code
signals an eventfd when it want to (de)assert an irq. The main loop
eventfd handler does the actual irq (de)assertion.  This paves the way
for iothread support since QEMU's interrupt emulation is not thread
safe.

Asserting and deasseting irq with eventfd has some performance
implications. For small queue depth it increases request latency but
for large queue depth it effectively coalesces irqs.

Comparision (KIOPS):

QD            1   4  16  64
QEMU         38 123 210 329
irq-eventfd  32 106 240 364

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 120 ++++++++++++++++++++++++++++++++++++++++++-------
 hw/nvme/nvme.h |   3 ++
 2 files changed, 106 insertions(+), 17 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba056499..51792f395597 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -526,34 +526,57 @@ static void nvme_irq_check(NvmeCtrl *n)
     }
 }
 
+static void nvme_irq_do_assert(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    if (msix_enabled(&(n->parent_obj))) {
+        trace_pci_nvme_irq_msix(cq->vector);
+        msix_notify(&(n->parent_obj), cq->vector);
+    } else {
+        trace_pci_nvme_irq_pin();
+        assert(cq->vector < 32);
+        n->irq_status |= 1 << cq->vector;
+        nvme_irq_check(n);
+    }
+}
+
 static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
-        if (msix_enabled(&(n->parent_obj))) {
-            trace_pci_nvme_irq_msix(cq->vector);
-            msix_notify(&(n->parent_obj), cq->vector);
+        if (cq->assert_notifier.initialized) {
+            event_notifier_set(&cq->assert_notifier);
         } else {
-            trace_pci_nvme_irq_pin();
-            assert(cq->vector < 32);
-            n->irq_status |= 1 << cq->vector;
-            nvme_irq_check(n);
+            nvme_irq_do_assert(n, cq);
         }
     } else {
         trace_pci_nvme_irq_masked();
     }
 }
 
+static void nvme_irq_do_deassert(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    if (msix_enabled(&(n->parent_obj))) {
+        return;
+    } else {
+        assert(cq->vector < 32);
+        if (!n->cq_pending) {
+            n->irq_status &= ~(1 << cq->vector);
+        }
+        nvme_irq_check(n);
+    }
+}
+
 static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
-        if (msix_enabled(&(n->parent_obj))) {
-            return;
+        if (cq->deassert_notifier.initialized) {
+            /*
+             * The deassert notifier will only be initilized when MSI-X is NOT
+             * in use. Therefore no need to worry about extra eventfd syscall
+             * for pin-based interrupts.
+             */
+            event_notifier_set(&cq->deassert_notifier);
         } else {
-            assert(cq->vector < 32);
-            if (!n->cq_pending) {
-                n->irq_status &= ~(1 << cq->vector);
-            }
-            nvme_irq_check(n);
+            nvme_irq_do_deassert(n, cq);
         }
     }
 }
@@ -1338,6 +1361,50 @@ static void nvme_update_cq_head(NvmeCQueue *cq)
     trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
 }
 
+static void nvme_assert_notifier_read(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, assert_notifier);
+    if (event_notifier_test_and_clear(e)) {
+        nvme_irq_do_assert(cq->ctrl, cq);
+    }
+}
+
+static void nvme_deassert_notifier_read(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, deassert_notifier);
+    if (event_notifier_test_and_clear(e)) {
+        nvme_irq_do_deassert(cq->ctrl, cq);
+    }
+}
+
+static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
+{
+    int ret;
+
+    ret = event_notifier_init(&cq->assert_notifier, 0);
+    if (ret < 0) {
+        return;
+    }
+
+    event_notifier_set_handler(&cq->assert_notifier,
+                                nvme_assert_notifier_read);
+
+    if (!msix_enabled(&n->parent_obj)) {
+        ret = event_notifier_init(&cq->deassert_notifier, 0);
+        if (ret < 0) {
+            event_notifier_set_handler(&cq->assert_notifier, NULL);
+            event_notifier_cleanup(&cq->assert_notifier);
+
+            return;
+        }
+
+        event_notifier_set_handler(&cq->deassert_notifier,
+                                   nvme_deassert_notifier_read);
+    }
+
+    return;
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
@@ -1377,8 +1444,10 @@ static void nvme_post_cqes(void *opaque)
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
-        if (cq->irq_enabled && !pending) {
-            n->cq_pending++;
+        if (cq->irq_enabled) {
+            if (!pending) {
+                n->cq_pending++;
+            }
         }
 
         nvme_irq_assert(n, cq);
@@ -4705,6 +4774,14 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
         event_notifier_set_handler(&cq->notifier, NULL);
         event_notifier_cleanup(&cq->notifier);
     }
+    if (cq->assert_notifier.initialized) {
+        event_notifier_set_handler(&cq->assert_notifier, NULL);
+        event_notifier_cleanup(&cq->assert_notifier);
+    }
+    if (cq->deassert_notifier.initialized) {
+        event_notifier_set_handler(&cq->deassert_notifier, NULL);
+        event_notifier_cleanup(&cq->deassert_notifier);
+    }
     if (msix_enabled(&n->parent_obj)) {
         msix_vector_unuse(&n->parent_obj, cq->vector);
     }
@@ -4734,7 +4811,7 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
         n->cq_pending--;
     }
 
-    nvme_irq_deassert(n, cq);
+    nvme_irq_do_deassert(n, cq);
     trace_pci_nvme_del_cq(qid);
     nvme_free_cq(cq, n);
     return NVME_SUCCESS;
@@ -4772,6 +4849,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+
+    /*
+     * Only enable irq eventfd for IO queues since we always emulate admin
+     * queue in main loop thread.
+     */
+    if (cqid && n->params.irq_eventfd) {
+        nvme_init_irq_notifier(n, cq);
+    }
 }
 
 static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
@@ -7671,6 +7756,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, false),
+    DEFINE_PROP_BOOL("irq-eventfd", NvmeCtrl, params.irq_eventfd, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c223..4850d3e9653a 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -398,6 +398,8 @@ typedef struct NvmeCQueue {
     uint64_t    ei_addr;
     QEMUTimer   *timer;
     EventNotifier notifier;
+    EventNotifier assert_notifier;
+    EventNotifier deassert_notifier;
     bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
@@ -422,6 +424,7 @@ typedef struct NvmeParams {
     bool     auto_transition_zones;
     bool     legacy_cmb;
     bool     ioeventfd;
+    bool     irq_eventfd;
     uint8_t  sriov_max_vfs;
     uint16_t sriov_vq_flexible;
     uint16_t sriov_vi_flexible;
-- 
2.37.2


