Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8033AB138
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:19:40 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp7b-0003CM-3z
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltowm-0005Ra-35; Thu, 17 Jun 2021 06:08:28 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltowj-0007PD-7Y; Thu, 17 Jun 2021 06:08:27 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 86B5A5C0060;
 Thu, 17 Jun 2021 06:08:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Jun 2021 06:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=s/fDCfdL04kp7Lw+29+pCG1GKE
 /Kfa9r0bVlLHmB8QI=; b=JaoVln4nL9iv+O9YwD7y9J5poyAG/dmq0ojWDNLfBR
 qQ2TqFY+TyHdBIoFtpEll86lHfNvLKQNy6xHVdXCoL2RjfBGpeUQjM9c/hCgOa+s
 o3WmyZoYQD4w23T1Fqm4fV2XL7OR515uw1aWvVAAx2mRFlugRpekhwLxgmSDQ6Po
 amAY5Wm4I4R/PFMQ3LrvRBzG82+XP+dS2p55cN/X1LM/FaF4E45tJgo8c67xWrSx
 4eXEWDAwnWKe2z5RSCxJOf/LoYoPg2VWFyo/8zrXZ9aJNtUo8jZZS2/F/gAi5MSb
 2xrzQS7UHDJiFyE/0XjyvGx0Mw5ixvQdnE85q1e+EnYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=s/fDCf
 dL04kp7Lw+29+pCG1GKE/Kfa9r0bVlLHmB8QI=; b=t9y3C591zzuZ4XUeDSIA0L
 n5lHOq2Sw8hbdNNAUm5LEoFql7BcgpZAgxHVkKxohZudynPoJS6Cj2pjXGA3MPw7
 4BHhRxyGEQmsapoKv2LOw48xaXptM+RthAX9yhaLCSQAXvEVAgVvQxtQwZ7V2wpr
 6KGwnGNWl5xU7D66avTitSovR77KkzDIXHwTgBT0Eotuln1dHePCyesAJDgWWo2f
 oDr6qcrEgaIfGIXq21R/ZMEWJOjm7gXC6dnv2OGVDQUt9tFSbFNN0/nihqlr6qSr
 /01A5G2uhB0ZaPb/zS5k2MUzzr3GjgU9FLUcx92rKCmqYUVGzOy0k/C3v0KW+brA
 ==
X-ME-Sender: <xms:Fh_LYCDnt9QVUuRhgZBZp4H7T_w5pC_mrj-JbdlXj8w0elELjh5Ndg>
 <xme:Fh_LYMhEauVujPtVyZ05T-nwonTRbFsoJfTGOffpm9_-sTReZV_7Jg8MbCL_Yy2Qg
 Ny0jS27eoN09O1GKVs>
X-ME-Received: <xmr:Fh_LYFlRy_euLQ-UXKjl18Y8Jjez2P2dChnyCamRFuO_yahJh41uBm0bqM6rZJMtMfZEuj5lkwHYL6TJUxlx3ZKch4q5JPifsnXLXakKEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephffgvddttefgffefgfevtefgieefhfdvjefhvddtgeffvddugfeltdduleeulefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Fh_LYAwFl51KlnWeAm6okOQGOIngPCdp8Hd285h2HwEVVi6tyKx-_w>
 <xmx:Fh_LYHSyKRN4Wu8v6REK9CP9KUBNFOISBaqYcz_IvOOb40VMJA5yng>
 <xmx:Fh_LYLbP6zrfucgvsJ5uMN3anpH8Lw2lafyTJK3Mhfd_sPpOy5ZdPw>
 <xmx:Fx_LYFNRfbsMayBj6K3opsGJOx2jAwIV1X8Z5_OSuvSv9ow8zlrmEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 06:08:21 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: fix pin-based interrupt behavior (again)
Date: Thu, 17 Jun 2021 12:08:20 +0200
Message-Id: <20210617100820.75510-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub.jermar@kernkonzept.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Jakub noticed[1] that, when using pin-based interrupts, the device will
unconditionally deasssert when any CQEs are acknowledged. However, the
pin should not be deasserted if other completion queues still holds
unacknowledged CQEs.

The bug is an artifact of commit ca247d35098d ("hw/block/nvme: fix
pin-based interrupt behavior") which fixed one bug but introduced
another. This is the third time someone tries to fix pin-based
interrupts (see commit 5e9aa92eb1a5 ("hw/block: Fix pin-based interrupt
behaviour of NVMe"))...

Third time's the charm, so fix it, again, by keeping track of how many
CQs have unacknowledged CQEs and only deassert when all are cleared.

  [1]: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>

Fixes: ca247d35098d ("hw/block/nvme: fix pin-based interrupt behavior")
Reported-by: Jakub Jermář <jakub.jermar@kernkonzept.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h |  1 +
 hw/nvme/ctrl.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 93a7e0e5380e..60250b579464 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -405,6 +405,7 @@ typedef struct NvmeCtrl {
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
+    int         cq_pending;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 7dea64b72e6a..9419f67c4e88 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -473,7 +473,9 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
             return;
         } else {
             assert(cq->vector < 32);
-            n->irq_status &= ~(1 << cq->vector);
+            if (!n->cq_pending) {
+                n->irq_status &= ~(1 << cq->vector);
+            }
             nvme_irq_check(n);
         }
     }
@@ -1258,6 +1260,7 @@ static void nvme_post_cqes(void *opaque)
     NvmeCQueue *cq = opaque;
     NvmeCtrl *n = cq->ctrl;
     NvmeRequest *req, *next;
+    bool pending = cq->head != cq->tail;
     int ret;
 
     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
@@ -1287,6 +1290,10 @@ static void nvme_post_cqes(void *opaque)
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
+        if (!pending) {
+            n->cq_pending++;
+        }
+
         nvme_irq_assert(n, cq);
     }
 }
@@ -4099,6 +4106,11 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
         return NVME_INVALID_QUEUE_DEL;
     }
+
+    if (cq->tail != cq->head) {
+        n->cq_pending--;
+    }
+
     nvme_irq_deassert(n, cq);
     trace_pci_nvme_del_cq(qid);
     nvme_free_cq(cq, n);
@@ -5758,6 +5770,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         }
 
         if (cq->tail == cq->head) {
+            n->cq_pending--;
             nvme_irq_deassert(n, cq);
         }
     } else {
-- 
2.32.0


