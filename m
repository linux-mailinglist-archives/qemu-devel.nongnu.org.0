Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20334574493
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 07:37:45 +0200 (CEST)
Received: from localhost ([::1]:56510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBrXj-0001Uo-N5
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 01:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oBrV0-0008GQ-BZ; Thu, 14 Jul 2022 01:34:55 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:40687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oBrUy-0004N6-2J; Thu, 14 Jul 2022 01:34:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DD1ED3200933;
 Thu, 14 Jul 2022 01:34:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 14 Jul 2022 01:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657776888; x=1657863288; bh=BbJk4TzUiI
 wgalk12IjsiqtyA2WUKLVgzCtw4uwy0TY=; b=Yk7H9z2cKmbW37XeAeeUqb5J6J
 NmgeSwJZ+48EcglOndiM9N5SeHromVrTZuCTneOoW3KMfOyqsoxTnkzxdzX5NuUv
 fxy4HmuVUtBpTNZ6k6eHb1C1MLoqmvdoIYLcYzf0/SGPq87bSoa7WdXBSNrgGZJ6
 i5eafYJZPpLNnMIplJJJk34U2WKPgQyePNYyg02eiHfiM8VRzGcLhWJaBzpHunLX
 BQt6wuVJyQKUddrtacBmtLR2rK2LtZ3Hq+ZJ2LVJQyF91nFTh9R8iMFiI6qrpcrh
 ueU8EvywUkJaOdncEAyoBrBF64suv9jStDGCZmZ+vfNLjRZHBptTlOOE6cxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1657776888; x=1657863288; bh=BbJk4TzUiIwgalk12IjsiqtyA2WUKLVgzCt
 w4uwy0TY=; b=ihLalliUoRSWr+4cw+aAHwP6cGC1WJV1dLlnOUJkpr8Bv2+cUad
 J6+kR6pPXZ3QgMjeDdBZKx0XtcP2cTLy7fFHxldjUw6mHpV0SlvR4DB+xgrZDv5u
 3eUEookLEVf5NPawtDNPFqRciU0nngBJmufxxgqxudiP1rSPQDzNPq8jpKfdu4oi
 zJb7wGJUWticjj+JUaZ7cL/pjBr2cJMahe5D6gFaxG/6G4qy4zW9JwXFYK7+T4Kh
 P7EbqK+iSKp7XB3vOEVtOZnWMv9dSQK5PR8bTUPWdtbkCKbe8gI4tcvTEs9ttz5R
 mo5BdvolbEvrFUXWs6fW628boLz4k0Lvozg==
X-ME-Sender: <xms:96rPYo05GYKADkTbnF1OnaaQOH2HKqJ4vzezoAH0oXE7afUVbeB4YQ>
 <xme:96rPYjFLZKrryKOy1RiX4Wl2zua5sAEesFdLHbDNtYBJM18RN6KHTMIsKm1Tf-T2A
 ne3Kb62eOn6ZhiSTww>
X-ME-Received: <xmr:96rPYg5izm4jW5wpjLDHM6twIrTCEEHzaq5QVN4keQitddWip42344bI-EB04AstvD45kDgMM0kGyKeITV0sJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejkedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:96rPYh3Aw2eYIeLvfgO3PVEiJSknFRKMSXHxHCNMeFg6VTbU-ZApfg>
 <xmx:96rPYrGe8omO_O8-rruqqWnkvj-YBAJuy7sGOAyH6Mmv6zg8MuP4aA>
 <xmx:96rPYq8z8wDgFpLrpbiCrGB4jTHgirEb6sXb1DEFemu8oK_AL9bX3w>
 <xmx:-KrPYviTPkC0q22eUTP8y9pcsnwyNQSvBDEfIzsjxwM2xSbuFnyY6A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 01:34:46 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: add trace events for ioeventfd
Date: Thu, 14 Jul 2022 07:34:44 +0200
Message-Id: <20220714053444.883737-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Klaus Jensen <k.jensen@samsung.com>

While testing Jinhaos ioeventfd patch I found it useful with a couple of
additional trace events since we no longer see the mmio events.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 8 ++++++++
 hw/nvme/trace-events | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 533ad14e7a61..09725ec49c5d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1346,6 +1346,8 @@ static void nvme_post_cqes(void *opaque)
     bool pending = cq->head != cq->tail;
     int ret;
 
+    trace_pci_nvme_post_cqes(cq->cqid);
+
     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
         NvmeSQueue *sq;
         hwaddr addr;
@@ -4238,6 +4240,8 @@ static void nvme_cq_notifier(EventNotifier *e)
     NvmeCQueue *cq = container_of(e, NvmeCQueue, notifier);
     NvmeCtrl *n = cq->ctrl;
 
+    trace_pci_nvme_cq_notify(cq->cqid);
+
     event_notifier_test_and_clear(&cq->notifier);
 
     nvme_update_cq_head(cq);
@@ -4275,6 +4279,8 @@ static void nvme_sq_notifier(EventNotifier *e)
 {
     NvmeSQueue *sq = container_of(e, NvmeSQueue, notifier);
 
+    trace_pci_nvme_sq_notify(sq->sqid);
+
     event_notifier_test_and_clear(&sq->notifier);
 
     nvme_process_sq(sq);
@@ -6240,6 +6246,8 @@ static void nvme_process_sq(void *opaque)
     NvmeCtrl *n = sq->ctrl;
     NvmeCQueue *cq = n->cq[sq->cqid];
 
+    trace_pci_nvme_process_sq(sq->sqid);
+
     uint16_t status;
     hwaddr addr;
     NvmeCmd cmd;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index fccb79f48973..45dd708bd2fa 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -104,6 +104,10 @@ pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
 pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
 pci_nvme_shadow_doorbell_cq(uint16_t cqid, uint16_t new_shadow_doorbell) "cqid %"PRIu16" new_shadow_doorbell %"PRIu16""
 pci_nvme_shadow_doorbell_sq(uint16_t sqid, uint16_t new_shadow_doorbell) "sqid %"PRIu16" new_shadow_doorbell %"PRIu16""
+pci_nvme_sq_notify(uint16_t sqid) "sqid %"PRIu16""
+pci_nvme_cq_notify(uint16_t cqid) "cqid %"PRIu16""
+pci_nvme_process_sq(uint16_t sqid) "sqid %"PRIu16""
+pci_nvme_post_cqes(uint16_t cqid) "cqid %"PRIu16""
 pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
-- 
2.36.1


