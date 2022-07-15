Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9571575DE9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:54:14 +0200 (CEST)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCH5Q-0005Le-5F
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvR-0000Zd-5p; Fri, 15 Jul 2022 04:43:53 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvP-0004Jm-CB; Fri, 15 Jul 2022 04:43:52 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A3F145C0213;
 Fri, 15 Jul 2022 04:43:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 15 Jul 2022 04:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657874629; x=
 1657961029; bh=pJsCBghtqEJcMHzFDiEzSrpJTFpyXYPSwCA+ejttbWg=; b=G
 iDYWgjTE+coPbqUiO/lgA3260MUS0aboW066VRUN9DR2GeYqN5golQqn25f3ZqX/
 5E6HX7Awd8QOm8LxXZetfIKeakL00PrbgfePdigAvu7Zp1qRjZmjI/5lwRbbfdce
 jXrr3Si12yX9h0SFq2lmVfbyRK+LBYrzvZRUEEq/ioy6YiBLE9Od9lEDiS8BbUqu
 4Gbx1blntg3gXJL552YbVbLdXqS4UxC7NEPNeeJ7KTjKT4v+uKIPaLIbwVVRwVu6
 8wWd9Q5GtoADrmWxlU5lxVZ8ChDmD+W0VU/VWJtN7gDreyC9llxi4DjkEOoQQgAs
 /QUoCtfSDgCwrC+5ojmkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657874629; x=1657961029; bh=pJsCBghtqEJcM
 HzFDiEzSrpJTFpyXYPSwCA+ejttbWg=; b=lRMMKyIvzDXHTmtR5pCP8NQDOIZZX
 XVO8ySdNgE4MRWq0Lqm87eRGCCKHlYCUtMd8BCLP5rfNnktdEQV4XLUuSxij7Nel
 aWznR/C0QS+ZbRHiCNCznLTo1cXuHHC92Mt2jVSJ+adAfvNtAkwzn0AErfpkLYDx
 lDDImC9eScS0y1KSXlvfiCEDXPaMRyc+VMDINtypj9+JWiGhEI/Nc0/qtSCQukq/
 OFr59Kzqs2wL83o6rmZvx2Q5klICPfh6uiHoActO1hZn7aNqsAuw65j3B4R6b5J+
 H7FtqyUOkiDkSUurAu5z81fgkbMDSfFqZqAY7/AFVvBSvd09f7tT6IlHQ==
X-ME-Sender: <xms:xSjRYhDUa--FVOzIFiYX0Cg3b7fK4hWvd4KAYsHGal9bxr7JbUIdVA>
 <xme:xSjRYvjGJXjnbZE6SyfXPuZ7F-DvgwLmU1tfMYuCxK1XbPLwGwouRAPD7t5IYsdVm
 8Pvg1yXEOgqLh-47vw>
X-ME-Received: <xmr:xSjRYsnf2Iw2bmzWPsQd5R0jjpOGXiaG9HfCSbmdEkLqX2jdKXCQJgjHqKUUcppgRm-JdmNKtb0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xSjRYrxKlbGFTKeDchQl1lPIk4z3r-P0ge3_fg3JlTk_NXJOnvIR0Q>
 <xmx:xSjRYmR-Secf3PiKqg6M2Zz_CVtfV19a68sFzUW8aWPOQ2mJnvbBNQ>
 <xmx:xSjRYuZE7z4HXg6OQdKW3rIJxI187Zp9_QcpqnFohQH4MEqVBAPdcA>
 <xmx:xSjRYrJxXKLR2eb0agspzcjwNyEYCY8s-uhaCckhh3vI1sHjHE1XRA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 04:43:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 2/6] hw/nvme: Add trace events for shadow doorbell buffer
Date: Fri, 15 Jul 2022 10:43:36 +0200
Message-Id: <20220715084340.1128455-3-its@irrelevant.dk>
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

When shadow doorbell buffer is enabled, doorbell registers are lazily
updated. The actual queue head and tail pointers are stored in Shadow
Doorbell buffers.

Add trace events for updates on the Shadow Doorbell buffers and EventIdx
buffers. Also add trace event for the Doorbell Buffer Config command.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
[k.jensen: rebased]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 5 +++++
 hw/nvme/trace-events | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 46e8d54ef07a..55cb0ba1d591 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1335,6 +1335,7 @@ static void nvme_update_cq_head(NvmeCQueue *cq)
 {
     pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
             sizeof(cq->head));
+    trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
 }
 
 static void nvme_post_cqes(void *opaque)
@@ -6049,6 +6050,8 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
         }
     }
 
+    trace_pci_nvme_dbbuf_config(dbs_addr, eis_addr);
+
     return NVME_SUCCESS;
 }
 
@@ -6111,12 +6114,14 @@ static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
     pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
                   sizeof(sq->tail));
+    trace_pci_nvme_eventidx_sq(sq->sqid, sq->tail);
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
     pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
                  sizeof(sq->tail));
+    trace_pci_nvme_shadow_doorbell_sq(sq->sqid, sq->tail);
 }
 
 static void nvme_process_sq(void *opaque)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 065e1c891df4..fccb79f48973 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -3,6 +3,7 @@ pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 pci_nvme_irq_pin(void) "pulsing IRQ pin"
 pci_nvme_irq_masked(void) "IRQ is masked"
 pci_nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=0x%"PRIx64" prp2=0x%"PRIx64""
+pci_nvme_dbbuf_config(uint64_t dbs_addr, uint64_t eis_addr) "dbs_addr=0x%"PRIx64" eis_addr=0x%"PRIx64""
 pci_nvme_map_addr(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_addr_cmb(uint64_t addr, uint64_t len) "addr 0x%"PRIx64" len %"PRIu64""
 pci_nvme_map_prp(uint64_t trans_len, uint32_t len, uint64_t prp1, uint64_t prp2, int num_prps) "trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64" num_prps %d"
@@ -83,6 +84,8 @@ pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint32_t dw0, uint32_t dw1, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" dw0 0x%"PRIx32" dw1 0x%"PRIx32" status 0x%"PRIx16""
+pci_nvme_eventidx_cq(uint16_t cqid, uint16_t new_eventidx) "cqid %"PRIu16" new_eventidx %"PRIu16""
+pci_nvme_eventidx_sq(uint16_t sqid, uint16_t new_eventidx) "sqid %"PRIu16" new_eventidx %"PRIu16""
 pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
@@ -99,6 +102,8 @@ pci_nvme_mmio_start_success(void) "setting controller enable bit succeeded"
 pci_nvme_mmio_stopped(void) "cleared controller enable bit"
 pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
 pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
+pci_nvme_shadow_doorbell_cq(uint16_t cqid, uint16_t new_shadow_doorbell) "cqid %"PRIu16" new_shadow_doorbell %"PRIu16""
+pci_nvme_shadow_doorbell_sq(uint16_t sqid, uint16_t new_shadow_doorbell) "sqid %"PRIu16" new_shadow_doorbell %"PRIu16""
 pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-- 
2.36.1


