Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679A8649DF1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4h3A-0000Zv-Sb; Mon, 12 Dec 2022 06:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2o-0000Vz-R8; Mon, 12 Dec 2022 06:32:28 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2n-0000Kf-9H; Mon, 12 Dec 2022 06:32:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 784965C00E2;
 Mon, 12 Dec 2022 06:32:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 12 Dec 2022 06:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670844744; x=
 1670931144; bh=ywVj1WQrBqf/jjrsMoCRj00Qgrvf0S9EkuFWlVJfFoQ=; b=S
 exmuQHwZghQ862wrCPwpH4n0buDyGBwsSyoeyVXauatF7clStYZz+LBklZ1CDUem
 5qqT4mfS19sQgN2JLwyDCG0u8/HBPK0V6wfAuCRVHdyRaRIt14BTJhZqpyPnx5I+
 G5R1mkKUVmlyDTbyj+pAsIJsQfZExBPjtwj9arBdAvwWlvgg8+5p0FgiVBnLnqFg
 qtNK526dKI3C9lwkzumjxi6EweQT+YzqfWNHrYI9dgWtC6UlmPRupIgOT48zrbJ6
 0i0yOo2nLXwUmF00ondbVRW8lvp5X+Fup8q/PcZEPEP6dmlDu13NsBMAHt+2G31g
 x1SJImUEJ+k4FDqcBYBIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670844744; x=
 1670931144; bh=ywVj1WQrBqf/jjrsMoCRj00Qgrvf0S9EkuFWlVJfFoQ=; b=R
 ue+4OLkEJS0Dd2JkgswSBo7me/9UKjLn7foQyNs4aKUwH4caMAwq9u3d4ErNxQj9
 vP0Oa3nFdr/V/IDOBIEE+d2V/nZiB7h4M3hRj4k3QTCflW1fDlIzAP1guuWVYTY7
 YqUeIaGpEkTzYYy3voVhySKTy/8AR2LYNO1jSYkp4z82rt+bsmUOY8FNY0qxqPbT
 Cfh+N/wCSFnoe+46iW7m0YSF5VxkFwGZ19Yxs51IlABc1zdDkR46J/i6BDkbDHD8
 02f2hmD3U6GbDUmvF3qhYwhK6+IfST3ZiDTtbyX6W5PiHKO93jIOan7rpSJkiEyU
 Gq62QCdvGdTDO0374wRng==
X-ME-Sender: <xms:RxGXYzDNpwk7IKAiJPPMeU2r9YsfsR2jNaHMnUd_sF9hrzcp359T5A>
 <xme:RxGXY5iZAe_M_hJuU5DScIfpiU3uV4-XO11e-9ktqa3BwCry_CMA57ybnULOH0fZG
 nLZ03AX0Q-g-CJsqdQ>
X-ME-Received: <xmr:RxGXY-lNLZOG__3Sq2h1NsbTIzEeGdvUR0R7tevR4vjHjEmj7PxFVjseP3zt9f-eYnnwb_QU3HNpQtJql7JXUkDzI2bKTjrLhdExFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepfeevtdeuteeuudffvefggfdtfedtueelfffhieegffekgeefjeefffetjeei
 hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:RxGXY1zu-IPrz4VZIOuxxGmMACu_8HpoeDV2-ONux6sDROwOihDpgQ>
 <xmx:RxGXY4TpN5jJ4bHwkbTivjJY_v4_zhz6c6BiVT91iv0oIJwh2VMVjQ>
 <xmx:RxGXY4ahMUqEVTqtpFcvEZ4I8dEbeiJ_GOvauYpaFw2eZ81iEOwwzg>
 <xmx:SBGXY3HeYmgzHDQpNTptW4BluErJ_3C1NLpez1XGofHhou7MtlAiPw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:32:21 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/4] hw/nvme: rename shadow doorbell related trace events
Date: Mon, 12 Dec 2022 12:32:13 +0100
Message-Id: <20221212113215.33135-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212113215.33135-1-its@irrelevant.dk>
References: <20221212113215.33135-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099; i=k.jensen@samsung.com;
 h=from:subject; bh=N2PUz42ZQqJ+DBcFpFxR1tE5k9Erfcus0SAQB1SKFk0=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXET4fxaAeV+23kgFTE0fos3Fph08Dj8OCP2/5
 GG/HV3MFnIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxE+AAoJEE3hrzFtTw3p79
 4IAJ3xIsiuIptot3CTc9tbbwt4WjBe+NRAOJVEwO5U8vC2dTXm1hMk7ZAnteEznBy907jUU0uOZecc
 Y3Hsv/CSQh+BfxVjwUsiq6dQv0J4fyVXY7B+2YyxRg7nOcmHiYTgzGfJOD3E41FSc7N/01tVJqxiTT
 D8QrTiNoDkyzFHTgmHhjm+zjQ+SM+tUIHDESTcofW23iIQcBhLHZqp4JPc22xmlZASPg0OI308/o5x
 4vXR+mN2YFSl0ix80EIJxselYXqpauJCUgtf4R23DYp74/TIlyyeJOge+vQ3tdrc6ELtCBAjgYzPCb
 UQZYLjgQFBDvgl0oU0PAb+HKeuFQ3O9MjHbKi9
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


