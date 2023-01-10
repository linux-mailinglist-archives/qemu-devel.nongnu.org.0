Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF3A6639D1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8tW-0006oA-9U; Tue, 10 Jan 2023 02:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tR-0006kF-E7; Tue, 10 Jan 2023 02:17:59 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tP-0003L6-JS; Tue, 10 Jan 2023 02:17:57 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9D43F320098B;
 Tue, 10 Jan 2023 02:17:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 10 Jan 2023 02:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673335073; x=
 1673421473; bh=sC6rG5Q9JQSYUMhwEtawbN6ktXdXYlNgbWCr3s/NlrQ=; b=K
 gqrCk0K92QAkrc+mYavUQMFa5ThongEvm6+Z6USDta1Ay5taWLRV/yOqUBm6nUwz
 dX7eTxnZw13tI6bhwpqj6H2IWRngyTew+RCIA2QdY6iiamTE1n8QQMiAF0U4R8NR
 +ObEEPyMaYtxoIep40DcF085l1ROqqpZmQ5p5tNJ8SOa6Y5lNcluyYWgRpnUIdlD
 3Mr04gapCkKKrcNDIoXs9bwtDx1OWiq8uJKQG5FEa2s8Wu1otByKs8LH2TiGD/Ol
 fn8LKprzyhmx3VbLvjsrId1HWHPKWIrTHHlnqb+TEs/FGQ2+xFaqlbOXuX4RmHBW
 KQGcX8XlEJEx6gPtONGCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673335073; x=
 1673421473; bh=sC6rG5Q9JQSYUMhwEtawbN6ktXdXYlNgbWCr3s/NlrQ=; b=Y
 vHQn2VBQhDZGi4X1KPpjZ4XrZ13+M8/x6myKfXEfO4o0+3eZlCo3z6MFh3fgpfFH
 Sd4qJbXSOFiDs5MvFENrPQ7cyBxi8jB6ejYdG6vVJn9eUIcWemZROFzjFpAGSY56
 Q/DiarAtYdIT13Es+MIm9ptiM5/WRpX1GYWolY8AB9x21EnWsv4HRSo5Cu+q6Ltz
 rsrdilgAsTzCixKPhPsA/75XNJx/tjuBmMGtOXMEpudGxH1KRvg013IXAp3KGrQT
 DoRW4OOoyb6qOrq/mfKDWnLf3mDRhMzU8IzMTCoRXHYrHiLV060LRUIAd7kek8YJ
 rrEU71CR3iRy4l2Los42Q==
X-ME-Sender: <xms:IBG9Y024aPpLHGm1WR5d-jY9QMFGxVPJZMh8rkbALk0x2odgFNruJQ>
 <xme:IBG9Y_HCHak5a-QsUb88mBFSi0lwY-6VcG1FCBeg2iwam6txA_08mh5A5k_3D7o22
 RmQgR9TlTWh4OVTbms>
X-ME-Received: <xmr:IBG9Y87eXGqpEYo9AiSsd5u3ZzavJVWlrUIdzcOE_2M-57h9a0_B54hZd_nYzcGoRFbB-8cvvm1yRHK7UMQct78NZjCw3mKJOP7pOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeejgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:IBG9Y91dgwhZwQOOPObkE_LoFL97SCxQEIxhOhvzJFThykPbBPeTCQ>
 <xmx:IBG9Y3FJQxCz5YeWmHJJpl_C_4A9-JeC8heTCZoW2CHV32CtaArwYg>
 <xmx:IBG9Y29ntJPMOB45MhWdrPGwCJz4vHRd4zLpB6eeN7FGEQM4kADeHg>
 <xmx:IRG9Y4P4VzcM6RLTGRdEfo1TGKgdcbGapqDwI3490kTW0RHU7v1SHA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 02:17:51 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 2/4] hw/nvme: rename shadow doorbell related trace events
Date: Tue, 10 Jan 2023 08:17:41 +0100
Message-Id: <20230110071743.63507-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110071743.63507-1-its@irrelevant.dk>
References: <20230110071743.63507-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4145; i=k.jensen@samsung.com;
 h=from:subject; bh=cZVvWQ1M4Gk3+MbyEfMBTWwAzk5N8QmkSWZJbn5g/HQ=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO9ERdyRYF/sm8TqKgesTv3CmaUISl+WniiiZtk
 ypnrVkqkQIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvREXAAoJEE3hrzFtTw3pbF
 kH/2LQzFEoPXdDhddFqsjUNNEUl56JCBJ/LLmaeNjlN4Kia+3Rx5Gq5CxJ4cWGJzKhtNsuaxjccsvX
 4Rq9Fvd1/Xqoottf7AaTsMa6jdmzZouu72z5uGObWVQd5//ghSKASIYFU8bHmuN4v5Fl2FSH6SETGl
 xKkok6rt/4GWJq1JJ9952B2fPQ10Oag7Zry8f7pTxHmPcKfW9YZlJyGItWsazUZZAjXl1aZ7IRZSbH
 RbjBNopgb4CP01RTTmHwcxLT9bmO22K0MDKAviyLY+FTFzrCcg6EZ3jUY5q9VbGHfj8W5wwl3e/olG
 ++Y3/Ok9WZ3qPZJGDvA+qFqyImsOrIRjED1bCL
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Rename the trace events related to writing the event index and reading
the doorbell value to make it more clear that the event is associated
with an actual update (write or read respectively).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 11 +++++++----
 hw/nvme/trace-events |  8 ++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 78c2f4e39d0a..cfe16476f0a4 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1337,8 +1337,9 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
     pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
-            sizeof(cq->head));
-    trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
+                 sizeof(cq->head));
+
+    trace_pci_nvme_update_cq_head(cq->cqid, cq->head);
 }
 
 static void nvme_post_cqes(void *opaque)
@@ -6147,16 +6148,18 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
+    trace_pci_nvme_update_sq_eventidx(sq->sqid, sq->tail);
+
     pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &sq->tail,
                   sizeof(sq->tail));
-    trace_pci_nvme_eventidx_sq(sq->sqid, sq->tail);
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
     pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &sq->tail,
                  sizeof(sq->tail));
-    trace_pci_nvme_shadow_doorbell_sq(sq->sqid, sq->tail);
+
+    trace_pci_nvme_update_sq_tail(sq->sqid, sq->tail);
 }
 
 static void nvme_process_sq(void *opaque)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f48973..b16f2260b4fd 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -84,8 +84,8 @@ pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint32_t dw0, uint32_t dw1, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" dw0 0x%"PRIx32" dw1 0x%"PRIx32" status 0x%"PRIx16""
-pci_nvme_eventidx_cq(uint16_t cqid, uint16_t new_eventidx) "cqid %"PRIu16" new_eventidx %"PRIu16""
-pci_nvme_eventidx_sq(uint16_t sqid, uint16_t new_eventidx) "sqid %"PRIu16" new_eventidx %"PRIu16""
+pci_nvme_update_cq_eventidx(uint16_t cqid, uint16_t new_eventidx) "cqid %"PRIu16" new_eventidx %"PRIu16""
+pci_nvme_update_sq_eventidx(uint16_t sqid, uint16_t new_eventidx) "sqid %"PRIu16" new_eventidx %"PRIu16""
 pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
@@ -102,8 +102,8 @@ pci_nvme_mmio_start_success(void) "setting controller enable bit succeeded"
 pci_nvme_mmio_stopped(void) "cleared controller enable bit"
 pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
 pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
-pci_nvme_shadow_doorbell_cq(uint16_t cqid, uint16_t new_shadow_doorbell) "cqid %"PRIu16" new_shadow_doorbell %"PRIu16""
-pci_nvme_shadow_doorbell_sq(uint16_t sqid, uint16_t new_shadow_doorbell) "sqid %"PRIu16" new_shadow_doorbell %"PRIu16""
+pci_nvme_update_cq_head(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
+pci_nvme_update_sq_tail(uint16_t sqid, uint16_t new_tail) "sqid %"PRIu16" new_tail %"PRIu16""
 pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-- 
2.39.0


