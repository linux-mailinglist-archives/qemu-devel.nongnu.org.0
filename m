Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F60649E2B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:51:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hER-000642-P2; Mon, 12 Dec 2022 06:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hEJ-0005xY-9B; Mon, 12 Dec 2022 06:44:19 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hEH-0003MD-JU; Mon, 12 Dec 2022 06:44:18 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BFD375C013F;
 Mon, 12 Dec 2022 06:44:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 12 Dec 2022 06:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670845456; x=
 1670931856; bh=ywVj1WQrBqf/jjrsMoCRj00Qgrvf0S9EkuFWlVJfFoQ=; b=h
 zIER92NmbH/XQQMJKcWYKs37+PFxLMLhi4xmhWf/ci0ToabEfHON+kcStZXrjaBn
 TiJ6fvSthd9uyrzesbBEvQ+ipK0dbD0MTdVWVNykGBZuGRULz8C/htqPHBul06P9
 LHHU/lKc0H1izwKx7hv2UobBRZ5SoxIGY9avkq+iuw8WFy0/MicbYv10Y/5PhD5O
 7hBYpcc5668FV7RdoEPPOowjijO5XISsYJ1ApbsOgjaOfLA/nXq5ZhB1JLAj/YhM
 gRASrsv5jBkzE3c7mmdseBi9PtjPB1bENNMflgaSsnjw648G8sKWWNoxRStw8SBt
 jSKgk8QiFtYQUpRLwXEQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670845456; x=
 1670931856; bh=ywVj1WQrBqf/jjrsMoCRj00Qgrvf0S9EkuFWlVJfFoQ=; b=Y
 FpxJS+WlVunEGF1MWoiWpwIUAfyGdMy/wW+mG6XCMwMlrGU1hkBRUXym5o0ANUJb
 lyWuiedYIzddaZ7RjMci0g45pdTV0F/ExA9wvJZClkr1Lz1w6S/g36uLTq3Brkcf
 gioqw2oZQFE1/z4RaIcZgvDfR7GpAkX2VyBhJaZTb73PF8O/bXErfcx+SFJ/WEsC
 AtqyqpANcPIZOb93zKR0rT5BAMuZWrilvUQ7ZXMS39RlYP1jELGCmD9D+ghoKcDc
 2m8Kvrkxc0wJvv4N3Zqg7Y6Dk4UnOpGth9b60pSMn0/6bsDlwi5/xq238O5Kf/7a
 qVTHtMPGE2Gj8yeeHaeLg==
X-ME-Sender: <xms:EBSXY6rv0Aj01mGGtrqF1NjLJA_xyroFO__bl52nmAVeMcGIW_yYLw>
 <xme:EBSXY4rj9hxpNWDiAM8-zRl4o-E9Srg78EzXdsWKQp37gyU_cZRtsMwFSKqV3JWjJ
 Y9DA7giyBWqaNjoJ8o>
X-ME-Received: <xmr:EBSXY_M1JYwAuXzz4OpTAZz7UHeJg8ogaFVBeYY-nOHM0lhvSk6Mne3nH_XGy7ZZL2Ciq5YFgLDijT9Cz5z9sKROHNP2lwoacR64fA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffetjeei
 hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:EBSXY562N9Vq5i8chQHIprTtf2-QoNB7e42WixMJySg0tfP0_Wz9qA>
 <xmx:EBSXY555tnCPOC-e3BabofSbqPbY9eUx7E5T94CJUYvjC7dumN4otA>
 <xmx:EBSXY5hYhJEwXvDjmCpNBpkN5GESUo7CGiu8u3BUzIuS5BAcHKe7pQ>
 <xmx:EBSXY2uTYeOCk5_jgt23t756Pxbh53USq4TWbCy6hskn_ydHZ8ZLYw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:44:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 2/4] hw/nvme: rename shadow doorbell related trace events
Date: Mon, 12 Dec 2022 12:44:07 +0100
Message-Id: <20221212114409.34972-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212114409.34972-1-its@irrelevant.dk>
References: <20221212114409.34972-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099; i=k.jensen@samsung.com;
 h=from:subject; bh=N2PUz42ZQqJ+DBcFpFxR1tE5k9Erfcus0SAQB1SKFk0=;
 b=owJ4nJvAy8zAxej7cL1hrj/vS8bTakkMydNFOOSPLpALf7t9EmOwsPuLzYWZ7f7M/Yeb7PN/SuQf
 Dy9mndPJaMzCwMjFICumyBKkYbyq9NGdZ4vc0w7ADGJlApnCwMUpABOR5OBgWG6t1F3EpZ+99Hxe0I
 PKyskJkRM3/X2bl6t0Od/d9B6LVtwMvtXafjd57nIZf/186H7aJbu/tiG7LSfq80fK/lzwuGjnsy82
 qotLQstnHrXs+VVarnR/Ak9n48+bXXaxVotb7OQ3ZZVdXh1kNevhNx6LDbu4oy2T06zXHBI3VoiPvP
 VrjUuhv8pFvdLynQfPRvaLPK8zmng52HaLgLjU/ONyDfMVQvoV+PcsrTbeJVqTfqeij1lPSVTriLHW
 S7nKIr1yoZc+T/6u4zC8vNTmztdXBV4CmxhZzpq3aDz6d/B+scTsgBeCBUcW/2H7rR9eIfcgJ/FiSc
 uWS7rKiUIiNT16kRofH7+e8OWSvgoASaCfSQ==
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


