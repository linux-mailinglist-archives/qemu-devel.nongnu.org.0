Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200460632E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:34:32 +0200 (CEST)
Received: from localhost ([::1]:54316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWcu-0005Xz-7K
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:34:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWXB-0000hs-Ba
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olTpy-0002QG-Vg; Thu, 20 Oct 2022 07:35:47 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olTpx-0003RV-6U; Thu, 20 Oct 2022 07:35:46 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9BB2F5C00C1;
 Thu, 20 Oct 2022 07:35:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Oct 2022 07:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1666265741; x=1666352141; bh=OdbL/FCTK+
 TvhNXRLqVPCw/xMTe7FnAmaLw53aTu0vs=; b=Ijq3tLGbyC+jydixYF2CUtOAgq
 0cOVBmplm7P7mi45EDvYoqAM00X96xpI6XFNuDwmZAVaEgp5uI0wCRwx++2jEcvo
 LYz0282ZvxjSyO5eWKDFZR9cxypq9muuLN/pQVxX0LkHmYCuBA6yd3GzNuSok4pi
 TCV1IIqbkUK1VkN9CVKC8L+cXnCsP759IWXAuy2g02VfQHP7PQiYHHLfmFcEBNKg
 +TGJvIY8t7hccQbfd7Pjr26W7FSfZlY14CRBNJsjw30rW2745FaVYYexyfGKYRB5
 FlftI+ZbY+CktnIH1sOxmqRhrWkUoqkk6/BQTIuHB7JiVaRlqn8BU3CbbF6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666265741; x=1666352141; bh=OdbL/FCTK+TvhNXRLqVPCw/xMTe7FnAmaLw
 53aTu0vs=; b=CnJEYd+IKfz/eZPGjvz1ztVRO30gtAoeg2Odj4plgTl8f8XRLR+
 F04lZRGW4U+THeIZFxFPflCKs+qOQQhUqZNHy6RKMXX01XaPdIEf7ICRi5AoU+Kk
 laz0IJAJW3cDCP2ZiN43XfjLwZDylgn+v5yN0cx+d17GpVMvUuzlAEfUJFvXbai8
 IKk1CmooUty7NxTTXwEtCKz3YWPca7sXWWAhRisEecMxCv4nn1GX1g/I/2Tpjm3D
 gI2soFw0cdwsHuyyVejFBaym0lbHJp3bCaqChDthx2E/9I7iJZTYk/xYsTPVnyD8
 +DCIDvKTlgQ9464qpasGZNosgC2aDA47hmQ==
X-ME-Sender: <xms:jTJRY7nPRI57iG0xfqjy-EjIoE6kO2ojJoAI3qd49qsHhNq6_r-80A>
 <xme:jTJRY-3Dbpq2pF5uxkonC0RjkBf2SfEziWRt1KvKnFnqqkc4W_DdyWWvQZONPQYCx
 MdaX6VNus0s1jBE7E4>
X-ME-Received: <xmr:jTJRYxqyDGGCBimcKX4qYsUanuJHmfh6c7u2IbTarbeZM5ORqwl50jl80H5C5rINHQHGcA7zTMiN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jTJRYzmdRrs0bIbECOElw1ortefdG8WIiK_FFr4m4CnpxOiPeYMqSA>
 <xmx:jTJRY53rIckbgnVzSg3_9_6v-xm9eGVM0kFeHRTieGcKNcI0pF43Sw>
 <xmx:jTJRYyv8wvgmpxNSJ8YOXHHxYTI2dhTNQf86mPlWfWySzWoSWFKJXA>
 <xmx:jTJRY0Sm1WGJRwRjm7JlrrHICxEBlqsob4zkSNC3ND8pUdNWZndOLQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 07:35:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: reenable cqe batching
Date: Thu, 20 Oct 2022 13:35:38 +0200
Message-Id: <20221020113538.36526-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.37.0 (Apple Git-136)


