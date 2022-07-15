Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0BC575DE7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:53:48 +0200 (CEST)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCH51-0003uH-QN
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvY-0000sP-P5; Fri, 15 Jul 2022 04:44:00 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvW-0004MS-R0; Fri, 15 Jul 2022 04:44:00 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D2FB5C005F;
 Fri, 15 Jul 2022 04:43:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 15 Jul 2022 04:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657874637; x=
 1657961037; bh=w7WJGja/gTNFjse+oXXHEZb5x8xH6MrcyzM4dlzQO44=; b=A
 9ORqRuZrRDW8pZ6ez7h1bJNRAmOc3TnKfCF1vBXnNeA9Aix+A20xifhFoGtIL0SW
 zmKuA+2swI3l/I76to+DmJwHb5oqoJhjrq2KptFEzLNREsOoCeX9sP8663cGKwYu
 Imyiqg+VuM1z0Oosw2UEuFrCXEwOOBNSebgdzy88Mg/OEMdklRmiaoFkETpom9gm
 ZVvGnjFaSrE8Nh6LCXv2El4rUEafI+pkhmGlc1gZ0FFqPpYFIPrg7MXweNmupZEC
 ud0uJ2SLCt1QWRNyLjg5OCpHAu9DoMpymXS8zSm+PYFAQUqXWWY3zz+Y3Da926Ln
 7pRYiPICKUgz3tJ8KfCLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657874637; x=1657961037; bh=w7WJGja/gTNFj
 se+oXXHEZb5x8xH6MrcyzM4dlzQO44=; b=x04P9LkC0zCebCp4vtvF8PqOzgxhl
 XM1VczWLJai3Kap6W13izWQ8qn9zz7B6Bh3Kk6o2NzhhSOIoKL42I1zoJAUsQQHq
 fR08D0KsGgOqJVb2kF+R+oDR+uvOuakz3ucSZYoKa+r0GdKF5rCU0T9LUb364yf7
 +3FDWuYfQKLXd/s2kGhSwpuHwqb+1l7JbT1wUfb+RA8KvbjW8nF7NOvQkdHIo7Su
 /05j26rtT7JDx1z7Jq1QeI7OqwONgRwBA1E21EfQTxWbplDUfuaIfLRXxuKChUyM
 kpClJwTNc+nquTrP7x6fl9Q1EgvN/TM/I62bhx09/LH6qy7U/cgG1wOoQ==
X-ME-Sender: <xms:zCjRYkNAWsk1gYXMX0NcN4VPopfR3Q6__rmvRWFz2MYhSYNhCjUKvQ>
 <xme:zCjRYq-q43ANwL0un9LW_xASWyZbgo-BM9mP-Jnh71HtUnnd-ISSv5_MLBfm6m45Y
 KICHyZ2tzuHkoR20c8>
X-ME-Received: <xmr:zCjRYrQ-_a5R4ROv_g4kgwmwELiagi-1t5JwNXq64DtiAddkeSapRCwiwPh2ddmeWNmQzO38DUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zCjRYsvW_DJA7LjfDApgTvSdbq-TJ-AM6TizjBH6R4UWNe8VTmEflQ>
 <xmx:zCjRYseaCSgdeMv2hqCdzzv2x3F2B_rlxXTQhu9PtHo2vYy6Ph55vQ>
 <xmx:zCjRYg1NgG8KWrh0F76LprYS6Vn_EgtytsQLH-kuQy9weli01yCMkA>
 <xmx:zSjRYtVsOJDM9qKNKy2rOk3in0xU-y0WoTTZp5OnWQIuGa5qApN35g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 04:43:55 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 6/6] hw/nvme: Use ioeventfd to handle doorbell updates
Date: Fri, 15 Jul 2022 10:43:40 +0200
Message-Id: <20220715084340.1128455-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715084340.1128455-1-its@irrelevant.dk>
References: <20220715084340.1128455-1-its@irrelevant.dk>
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

Add property "ioeventfd" which is enabled by default. When this is
enabled, updates on the doorbell registers will cause KVM to signal
an event to the QEMU main loop to handle the doorbell updates.
Therefore, instead of letting the vcpu thread run both guest VM and
IO emulation, we now use the main loop thread to do IO emulation and
thus the vcpu thread has more cycles for the guest VM.

Since ioeventfd does not tell us the exact value that is written, it is
only useful when shadow doorbell buffer is enabled, where we check
for the value in the shadow doorbell buffer when we get the doorbell
update event.

IOPS comparison on Linux 5.19-rc2: (Unit: KIOPS)

qd           1   4  16  64
qemu        35 121 176 153
ioeventfd   41 133 258 313

Changes since v3:
 - Do not deregister ioeventfd when it was not enabled on a SQ/CQ

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h |   5 +++
 2 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 55cb0ba1d591..533ad14e7a61 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1400,7 +1400,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
 
     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
-    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
+
+    if (req->sq->ioeventfd_enabled) {
+        /* Post CQE directly since we are in main loop thread */
+        nvme_post_cqes(cq);
+    } else {
+        /* Schedule the timer to post CQE later since we are in vcpu thread */
+        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
+    }
 }
 
 static void nvme_process_aers(void *opaque)
@@ -4226,10 +4233,82 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_OPCODE | NVME_DNR;
 }
 
+static void nvme_cq_notifier(EventNotifier *e)
+{
+    NvmeCQueue *cq = container_of(e, NvmeCQueue, notifier);
+    NvmeCtrl *n = cq->ctrl;
+
+    event_notifier_test_and_clear(&cq->notifier);
+
+    nvme_update_cq_head(cq);
+
+    if (cq->tail == cq->head) {
+        if (cq->irq_enabled) {
+            n->cq_pending--;
+        }
+
+        nvme_irq_deassert(n, cq);
+    }
+
+    nvme_post_cqes(cq);
+}
+
+static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
+{
+    NvmeCtrl *n = cq->ctrl;
+    uint16_t offset = (cq->cqid << 3) + (1 << 2);
+    int ret;
+
+    ret = event_notifier_init(&cq->notifier, 0);
+    if (ret < 0) {
+        return ret;
+    }
+
+    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
+    memory_region_add_eventfd(&n->iomem,
+                              0x1000 + offset, 4, false, 0, &cq->notifier);
+
+    return 0;
+}
+
+static void nvme_sq_notifier(EventNotifier *e)
+{
+    NvmeSQueue *sq = container_of(e, NvmeSQueue, notifier);
+
+    event_notifier_test_and_clear(&sq->notifier);
+
+    nvme_process_sq(sq);
+}
+
+static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
+{
+    NvmeCtrl *n = sq->ctrl;
+    uint16_t offset = sq->sqid << 3;
+    int ret;
+
+    ret = event_notifier_init(&sq->notifier, 0);
+    if (ret < 0) {
+        return ret;
+    }
+
+    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
+    memory_region_add_eventfd(&n->iomem,
+                              0x1000 + offset, 4, false, 0, &sq->notifier);
+
+    return 0;
+}
+
 static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
 {
+    uint16_t offset = sq->sqid << 3;
+
     n->sq[sq->sqid] = NULL;
     timer_free(sq->timer);
+    if (sq->ioeventfd_enabled) {
+        memory_region_del_eventfd(&n->iomem,
+                                  0x1000 + offset, 4, false, 0, &sq->notifier);
+        event_notifier_cleanup(&sq->notifier);
+    }
     g_free(sq->io_req);
     if (sq->sqid) {
         g_free(sq);
@@ -4302,6 +4381,12 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
         sq->ei_addr = n->dbbuf_eis + (sqid << 3);
+
+        if (n->params.ioeventfd && sq->sqid != 0) {
+            if (!nvme_init_sq_ioeventfd(sq)) {
+                sq->ioeventfd_enabled = true;
+            }
+        }
     }
 
     assert(n->cq[cqid]);
@@ -4605,8 +4690,15 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
+    uint16_t offset = (cq->cqid << 3) + (1 << 2);
+
     n->cq[cq->cqid] = NULL;
     timer_free(cq->timer);
+    if (cq->ioeventfd_enabled) {
+        memory_region_del_eventfd(&n->iomem,
+                                  0x1000 + offset, 4, false, 0, &cq->notifier);
+        event_notifier_cleanup(&cq->notifier);
+    }
     if (msix_enabled(&n->parent_obj)) {
         msix_vector_unuse(&n->parent_obj, cq->vector);
     }
@@ -4665,6 +4757,12 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     if (n->dbbuf_enabled) {
         cq->db_addr = n->dbbuf_dbs + (cqid << 3) + (1 << 2);
         cq->ei_addr = n->dbbuf_eis + (cqid << 3) + (1 << 2);
+
+        if (n->params.ioeventfd && cqid != 0) {
+            if (!nvme_init_cq_ioeventfd(cq)) {
+                cq->ioeventfd_enabled = true;
+            }
+        }
     }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
@@ -6039,6 +6137,12 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
             sq->ei_addr = eis_addr + (i << 3);
             pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
                     sizeof(sq->tail));
+
+            if (n->params.ioeventfd && sq->sqid != 0) {
+                if (!nvme_init_sq_ioeventfd(sq)) {
+                    sq->ioeventfd_enabled = true;
+                }
+            }
         }
 
         if (cq) {
@@ -6047,6 +6151,12 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
             cq->ei_addr = eis_addr + (i << 3) + (1 << 2);
             pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
                     sizeof(cq->head));
+
+            if (n->params.ioeventfd && cq->cqid != 0) {
+                if (!nvme_init_cq_ioeventfd(cq)) {
+                    cq->ioeventfd_enabled = true;
+                }
+            }
         }
     }
 
@@ -7554,6 +7664,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("vsl", NvmeCtrl, params.vsl, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
+    DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 0711b9748c28..79f5c281c223 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -376,6 +376,8 @@ typedef struct NvmeSQueue {
     uint64_t    db_addr;
     uint64_t    ei_addr;
     QEMUTimer   *timer;
+    EventNotifier notifier;
+    bool        ioeventfd_enabled;
     NvmeRequest *io_req;
     QTAILQ_HEAD(, NvmeRequest) req_list;
     QTAILQ_HEAD(, NvmeRequest) out_req_list;
@@ -395,6 +397,8 @@ typedef struct NvmeCQueue {
     uint64_t    db_addr;
     uint64_t    ei_addr;
     QEMUTimer   *timer;
+    EventNotifier notifier;
+    bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
 } NvmeCQueue;
@@ -417,6 +421,7 @@ typedef struct NvmeParams {
     uint8_t  zasl;
     bool     auto_transition_zones;
     bool     legacy_cmb;
+    bool     ioeventfd;
     uint8_t  sriov_max_vfs;
     uint16_t sriov_vq_flexible;
     uint16_t sriov_vi_flexible;
-- 
2.36.1


