Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B566557E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:54:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVuj-0004Io-LU; Wed, 11 Jan 2023 02:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuP-0004Dd-9Q; Wed, 11 Jan 2023 02:52:30 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuN-0006A9-Bu; Wed, 11 Jan 2023 02:52:28 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6AFE4320096B;
 Wed, 11 Jan 2023 02:52:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 11 Jan 2023 02:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673423545; x=
 1673509945; bh=sC6rG5Q9JQSYUMhwEtawbN6ktXdXYlNgbWCr3s/NlrQ=; b=n
 o7YYNsGOhuUDpUcGIq70TneHpja/UxcVXTbLND/mQtQ+wNCrAFebJswmUKgCyf37
 PSbfuUZlTDTGmj9QNAm+B6ukHCuykdN+ebuAxGtcspAAOqSjKvoUmUWp7VAvbV8c
 lWg2cQx4awhyNGFsEPla5ce8BEOVmnodO3N8gSj7s46HIIubfdFvPdJpoh2Agmwk
 apcFKFi4ELmnTXfFuecz8dl1VDAI60Ou1Zri87TskHD3Tm8P/vh6ahww/n0PgqSG
 q3tdGlT2PtrXtpKU+RQK4JFyAMUZB1ijW9WeVUNvN7zSdH44jBfqBHqUv1D3eBUQ
 x/VbQQoeCx0ElBn6KQ+wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673423545; x=
 1673509945; bh=sC6rG5Q9JQSYUMhwEtawbN6ktXdXYlNgbWCr3s/NlrQ=; b=C
 tq7n4zt5Vguhc0ZYYijvHJcwFG3VyA2VmXiSK5dq1S8hCxVNJ0MDyeB1eaNrU568
 tUaJJV1jFKni3ctRCy3ww/FkSdHhL2XanloM1Cge8DA5rH2AVr37VobAkPkl5kZq
 jsaHaaKUtUo1KnPZ9+WcjgJPU3mE+HufP7MBTe+PwBp1YHhfkKWRpdaTkErUoyIW
 +XfCSyBfY9WIIxD65Hkb3qmLoAtQIqhPi+qLdzQ/cePf38bjBd8hQnpDE+3tjK1q
 XSdW075cn8UlDyOq42ISutuTTXqQtf4bHb2cYrz4SzxFNhoT/3mtBvfaAcUf7NOw
 nomjR5BECDoxn6CjXHrmQ==
X-ME-Sender: <xms:uGq-Y2JmG6H6UzjDgvft6-DVYC6JiZU89z8ds7iWzChYCnESKEMhKw>
 <xme:uGq-Y-K_9Nx-eI1n0f4OKbpMP3ueiAq8VOjzEwLp0cIPvK1Lj0nqEMjhYUxJxFK1u
 XbTwr_PkNZVRG6Btuw>
X-ME-Received: <xmr:uGq-Y2sXU9CeFZX4TxajO8FfMiUs1OOSz2LxRZrTvXPf6HipDwZGxFwOvJZcMeYsn9xsapKFpAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleefgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uGq-Y7aG8v__TUEdRpavt5krHZZYC_th4IIBNvXblvthBy0l4lY8Ig>
 <xmx:uGq-Y9ajVh8VDMS15YiWQGpoqbPM8J1wQG25a3bCfS7CDGPCOe0hYw>
 <xmx:uGq-Y3CiRE3uaxG8yWwrpXKRVm0zNP5xytDOPx9lxZSg_6LjTWBpKw>
 <xmx:uWq-YwwaR0yEUAR0iB1neOHDa2W4HS_LrE1mR11E0lJX6bC4pv-W9g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 02:52:23 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 2/6] hw/nvme: rename shadow doorbell related trace events
Date: Wed, 11 Jan 2023 08:52:09 +0100
Message-Id: <20230111075213.70404-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111075213.70404-1-its@irrelevant.dk>
References: <20230111075213.70404-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4145; i=k.jensen@samsung.com;
 h=from:subject; bh=cZVvWQ1M4Gk3+MbyEfMBTWwAzk5N8QmkSWZJbn5g/HQ=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO+aqxyRYF/sm8TqKgesTv3CmaUISl+WniiiZtk
 ypnrVkqkQIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvmqsAAoJEE3hrzFtTw3pB+
 8H/3BuMeHW1/Tl9wfowVSOJL0if/ysf7pHBv/Wkz5ThV52TKZHhLpHzRQnFtmwlUVP18YOpX2kdWzY
 hqM+2FyvzaFw4qPLClXLKC9lpXvCkkt4kEASwu1ZhIxAnVL8wPzLrwVA3TvKr8NMR/4vBHrkce+k8v
 MTmc0h4675gi89CI6bJJ5mzZiXqD9PLkFLtvKwbWKpPwng+jfmtKHVCnKfco5eilJITzYxbxpks5jc
 YsslOg5up4hjkawfpkgLKFJFr/9wog4eo08eq6I27nUQOO+3dek32RoZmGvqb7VMNCahRQIr/Z+TXX
 rB6vGos+Q2yPHe9jaNt2ugNfij5N2czCsSXK7H
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


