Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E2646FA1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 13:28:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3FzP-0008Rh-3Q; Thu, 08 Dec 2022 07:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3FzK-0008P1-1s; Thu, 08 Dec 2022 07:26:54 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3FzH-0005C0-40; Thu, 08 Dec 2022 07:26:53 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AF2F5C00D2;
 Thu,  8 Dec 2022 07:26:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 08 Dec 2022 07:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670502410; x=
 1670588810; bh=JIeKfguJSvrgUhTEg2e34dv3VKyTozj9fM1LttwM22E=; b=F
 n1gMoFWgdUSTxf/uFgLR/f/eRn+OSZOoMOKhj9weWff4JCDyNy1gtkgeb+hn3Mp6
 aIA+XWkuv+bLDGIGpaepj2j0ORx+0DLN35zmJlMSVLcu8TKy2WfCJKuRIURnyunD
 timqzSzdU3ybfYgLZ9Sogqz+zC0QPGBHj1ben8q/aYQDoCZRNMfyKPOUM1Lo14uZ
 NtreQDhu27YkUQyn7ckChkSaEkHHUGBG0xVNyyjZmOdIjoPmL1wSqVgilYyiA1HU
 P3heUgKewG4x2xKnWqoZ98N9I6zv+iR4YbXkq8Yu5LypKuOsaGlk+iGpOfIpfVaU
 7lAt5UmRbLopoVuSQi+Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670502410; x=1670588810; bh=JIeKfguJSvrgU
 hTEg2e34dv3VKyTozj9fM1LttwM22E=; b=NGrSQ4kYleCv08+Pn2o1zyw/IhNSS
 cp2E/HPQi4e1VX/zOEEYs9h3R45303XHcb54bhyHfid7+yz9v3w9LT602r/Zu0R4
 t229EvzWFJmtmFB/mpIi+7Dhrv60gGPqxpG/UkaN/PCZCbeqZOiEQ3m8XHXHHc8e
 O6zlWiuPz9IqD27uYdfovaBuex84ds1kJTnwoipa/ojFxNCU67c8uqzB1EQ1Z9T+
 /G3/aw0ECj4RAZOmWEHdM4dGFjjDeQEW8bm4dI4cr8RY/ogulVzyQVsmSIzThE9G
 4tTx7QUVgXpLnarPGXThqu/ZQZU7a5HS46BF71CPrJ9w6mD2Y1MElYh2w==
X-ME-Sender: <xms:CtiRY8snVSpfypz0zzaSXjyBNZT13s9Bv1aRugShNBZ6LmlnhTYdug>
 <xme:CtiRY5dvHIl0eATmvG_jEkiZyXnB1pHGnTv1jQDc3x2qg0js53kJi9bpJkH1FyLMO
 s_8UZwSuQwuNRDCAEQ>
X-ME-Received: <xmr:CtiRY3yF8bVb5BfuglvKXukXmMaO8gwqEClbjmhWUVKPzgmLB4Bfe63jERbcUnrTBX-uV3Spq_1lW7w6OUIf2GEwz59_xj53MsQmFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:CtiRY_Op9lAaTcwVoQKR90uqeDilph9s1q2pe8yo-WStzErGExcqeg>
 <xmx:CtiRY89y_rctJ8tJPcJACLJdqr7d77t-Yfk3YCS6CL1ZD4mcUSEeug>
 <xmx:CtiRY3V4N8xljsbfvxrkx0Hn9iatHDkFvSmJLthTHKFzYrEIdkxlRQ>
 <xmx:CtiRYwa80ToarL_E5rcfDc3trvmv2wvLLmt4Wk8zM5paEHaDYE1o1g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 07:26:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 2/3] hw/nvme: rename shadow doorbell related trace events
Date: Thu,  8 Dec 2022 13:26:41 +0100
Message-Id: <20221208122642.80574-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208122642.80574-1-its@irrelevant.dk>
References: <20221208122642.80574-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4041; i=k.jensen@samsung.com;
 h=from:subject; bh=UosRnHKGmo/xC0PH2S2s2Othn36I78LHfhF8dCRCg5Q=;
 b=owJ4nJvAy8zAxej7cL1hrj/vS8bTakkMyRNvMJ0OdeG+WlmmvuiuRyODxodV+9MlP2RZiXItNdRh
 NnqaebuT0ZiFgZGLQVZMkSVIw3hV6aM7zxa5px2AGcTKBDKFgYtTACYSHsb+P63C+2xUTt/3x64d13
 ojHkgHH15wZH69TZCDS8Yu0bPBnYvy8r/+vahUULeQ7+KJrTd+vnJ4XrOV6fPF7r6lpn8KRbKaa9te
 X7ubY60icbJlxolIY+moL4XaF1kayxlsXsfd0jiidXflhe+a6n+lOng8uSbxmb8uyUhLPhqyXlycqU
 yg+aa0wAerZ9w7UmwljjgsjFJNSZZWrzhz81Gv1hVFl5oP96d6Pitv7L29ZFfsn3y9qDf6rmEFz4r2
 PI9J+G7qINa7/ssWqbK2iJ8MZQtTn6pNuMK8bkN76tWUl+p2OssdVPhfy3/646qU+qi8vNOMe5H1Jl
 vFBU4xPRONPdde33LH64AMf6xh/AMARTulgw==
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Rename the trace events related to writing the event index and reading
the doorbell value to make it more clear that the event is associated
with an actual update (write or read respectively).

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 11 +++++++----
 hw/nvme/trace-events |  8 ++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6b70c1e39831..cfab21b3436e 100644
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
2.38.1


