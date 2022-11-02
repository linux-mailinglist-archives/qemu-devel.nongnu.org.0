Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901C615DA2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq94o-0005RY-Ae; Wed, 02 Nov 2022 04:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq94W-0005Mr-6E; Wed, 02 Nov 2022 04:26:05 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq94U-00041m-Bt; Wed, 02 Nov 2022 04:26:03 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BBC565C0120;
 Wed,  2 Nov 2022 04:26:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Nov 2022 04:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667377560; x=
 1667463960; bh=8xLxqrpX6zIJEWcgfkPmxHwyDD+zfAbvKyKR0c72f+I=; b=A
 XJ5mH7jXRzVD1ZDd2TL2zetQFOhJCafthna7vq9pWlQCHx0wXqAgyEPFOkzKu0Gm
 azi0wCD7RfmDVPV09QGYx7AfQ6u+gxMJpQybDgSAc1FojrALkc9PqdBACzMXKVW/
 BeFojOmqCdeZTu24hL6eZN+AoWKeq7DgqLiYf0ew3WzgU+bP+zJZEHgZHpgNq+4A
 U1KeZ/6OcxaN/hBLMbCXFbIDyqsNftUYgKG/KAS0RQXs2k4X+zfxdxx+p4otHLHo
 292GbTWTovDkwlTGJBWd7VQV2X0iCW2RI/2WcHm6OQ2P6/3dzk2OF7FSXxL7yjsw
 N+KUd7wpkxCtdAsuTme5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667377560; x=1667463960; bh=8xLxqrpX6zIJE
 WcgfkPmxHwyDD+zfAbvKyKR0c72f+I=; b=evcabwsUJ59DggHT2P1cfnXVi64A7
 BuYWtunBvfnkuSSo+V4tcBtUGpPbuISZR95TUIVqwBLccp99nMSdo8TL6fmnG9yI
 3zSarqPOMO2OtV5AjRAs90kkRcrUu0VQ8HFJS37hIzClBDK/kfRZW8kuN4XeBqTc
 KUsOjp7daAGVez+gN5TnNYdef3d9+suQMeiH8wf89wtCaR3dY1pqvxf6XbE23INL
 hUYqrvsD3PTBBze6k8aO4WfYPeI54byfNZ8gQtVkXGHBwlbQQNaILA1kPM7f+cFg
 GV95EU9fOBqr3/c6JyEgs7UTIZfie4XUADZ17l20p2YtR3NkFMXWV6skA==
X-ME-Sender: <xms:lyliY8pH5nOivYPbXlTXcWcozxRD4bRV6s3J_wQV0-HEZ50MkZtuXw>
 <xme:lyliYyoput_NpOnQ6AjDmDHyoB_ixs0fToAXvLlvyCkvOwsaDw9vgvmy7MiGnNPaV
 vPtRItsoKNBNbPb3HY>
X-ME-Received: <xmr:lyliYxObV9mIU_blrjDcEH-az-WmRm-uZqbtJuYA4BYp-r9zOBiJhnwXZch_SOJl3xPFZ0vKPjM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeigdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lyliYz6FB_QJrBMP6lIaJuPXoIf4BbY_BmkxrvIgQRXGB1Rvz2Yf1A>
 <xmx:lyliY74zVX7JZVd2CCPsh4UKWOJhV-ocJJAy1irTvqqUYsxBKBkunA>
 <xmx:lyliYzhY0k5ifvusRpdU_SGyoPorgx8vrWFcqdo0AIrM8MVyCM0ZRA>
 <xmx:mCliY-2N7rMHwiJ1rtmUrg2JQtZLqjlP7cBNGR48wY-djdhw__9DiQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 04:25:58 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PULL 1/2] hw/nvme: reenable cqe batching
Date: Wed,  2 Nov 2022 09:25:54 +0100
Message-Id: <20221102082555.65165-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102082555.65165-1-its@irrelevant.dk>
References: <20221102082555.65165-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4817; i=k.jensen@samsung.com;
 h=from:subject; bh=gbnlPUK127yqI1HOvqFGHCKnZDa/WzT8JtP+0nXeMq8=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNiKZIdBzATmwXxEOxIiiCVB4Ju43p5ZJey3f53
 doLg+PhQyIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjYimSAAoJEE3hrzFtTw3pWh
 UIAJjOtkKvdWDhAFsRI4bTOfTzV5tAkA1QsUvTb7+BBSyNjbqb9j3wxLNgg0ejBLHhOjLGZrpN0S9L
 /tDzr04HCzf/+/qlBWiAvAN+gJscl7yo5WQ4fab9q7InIQpj1okoXVTvccKtMzXWoqenqTDkH2Bw5e
 kGX2JlJkobeFqSkAZIn0Qql/neRQTsWsmcTsVnVbhmvWZvpDOPSGTFCTyPgrfnuS2fIIMyLGyKoLxa
 wwanrnDnJA/FXr/3qbRJmnJmozHvEe4sgVfg27JsXtyB62/bPEVW33LQBDczitUY7ADbtD8cJ3spTX
 /coQXXgHFxOVkZmwujYP3LSYpsPISb4oOTbqck
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Commit 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell
updates") had the unintended effect of disabling batching of CQEs.

This patch changes the sq/cq timers to bottom halfs and instead of
calling nvme_post_cqes() immediately (causing an interrupt per cqe), we
defer the call.

                   | iops
  -----------------+------
    baseline       | 138k
    +cqe batching  | 233k

Fixes: 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell updates")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 26 +++++++++++---------------
 hw/nvme/nvme.h |  4 ++--
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba056499..73c870a42996 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1401,13 +1401,7 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
 
-    if (req->sq->ioeventfd_enabled) {
-        /* Post CQE directly since we are in main loop thread */
-        nvme_post_cqes(cq);
-    } else {
-        /* Schedule the timer to post CQE later since we are in vcpu thread */
-        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
-    }
+    qemu_bh_schedule(cq->bh);
 }
 
 static void nvme_process_aers(void *opaque)
@@ -4252,7 +4246,7 @@ static void nvme_cq_notifier(EventNotifier *e)
         nvme_irq_deassert(n, cq);
     }
 
-    nvme_post_cqes(cq);
+    qemu_bh_schedule(cq->bh);
 }
 
 static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
@@ -4307,7 +4301,7 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
     uint16_t offset = sq->sqid << 3;
 
     n->sq[sq->sqid] = NULL;
-    timer_free(sq->timer);
+    qemu_bh_delete(sq->bh);
     if (sq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &sq->notifier);
@@ -4381,7 +4375,8 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
         sq->io_req[i].sq = sq;
         QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
     }
-    sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
+
+    sq->bh = qemu_bh_new(nvme_process_sq, sq);
 
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
@@ -4698,7 +4693,7 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
 
     n->cq[cq->cqid] = NULL;
-    timer_free(cq->timer);
+    qemu_bh_delete(cq->bh);
     if (cq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &cq->notifier);
@@ -4771,7 +4766,7 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
         }
     }
     n->cq[cqid] = cq;
-    cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
+    cq->bh = qemu_bh_new(nvme_post_cqes, cq);
 }
 
 static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
@@ -6913,9 +6908,9 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         if (start_sqs) {
             NvmeSQueue *sq;
             QTAILQ_FOREACH(sq, &cq->sq_list, entry) {
-                timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
+                qemu_bh_schedule(sq->bh);
             }
-            timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
+            qemu_bh_schedule(cq->bh);
         }
 
         if (cq->tail == cq->head) {
@@ -6984,7 +6979,8 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
             pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
                           sizeof(sq->tail));
         }
-        timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
+
+        qemu_bh_schedule(sq->bh);
     }
 }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c223..7adf042ec3e4 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -375,7 +375,7 @@ typedef struct NvmeSQueue {
     uint64_t    dma_addr;
     uint64_t    db_addr;
     uint64_t    ei_addr;
-    QEMUTimer   *timer;
+    QEMUBH      *bh;
     EventNotifier notifier;
     bool        ioeventfd_enabled;
     NvmeRequest *io_req;
@@ -396,7 +396,7 @@ typedef struct NvmeCQueue {
     uint64_t    dma_addr;
     uint64_t    db_addr;
     uint64_t    ei_addr;
-    QEMUTimer   *timer;
+    QEMUBH      *bh;
     EventNotifier notifier;
     bool        ioeventfd_enabled;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
-- 
2.38.1


