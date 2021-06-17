Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C53E3ABC39
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:01:09 +0200 (CEST)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxGF-0000bA-UC
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxBE-0006fl-Lt; Thu, 17 Jun 2021 14:55:56 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxBC-0003t6-1z; Thu, 17 Jun 2021 14:55:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id D92115C01B3;
 Thu, 17 Jun 2021 14:55:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Jun 2021 14:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=riD9Mt5YY8L2hU5Ss5xPAKV54D
 T0/V1ne08m7zDToqM=; b=ZmbNf7E6duo5tyTyNcEsRbbrALDvBPkkDXIbOzFfNn
 EjuQbFmwcCOJ2sytpoanJRC3IDRXLScqflRnXbzZSb3QlgT1BEJN8RLYh5Sw9l0H
 CPVKeJ5/eeuHfBpxHqj8qT1tYtsGgvzpKE4SoGntsDPAkQtGpISfpdual87wCdy4
 bZJaOjGWNM+P6OAPSgYxRVdXYeVEOGQKRUfg9is2E7y4nVmWht8jytmbtDGyf2T5
 wdXKr83UE0YmbEV89+nJppUEG8T/e6qa0lawvn/fp39fB2TJhW08utFuZfaUs1fw
 RRVfkM8dC6JDKDv3XsC4QNeGX4nOzd/NbFYxOffBe1fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=riD9Mt
 5YY8L2hU5Ss5xPAKV54DT0/V1ne08m7zDToqM=; b=uL5PwisKdBHNecoTV1nn1I
 S5Dg5NDcWynpfcRcp933/A1L15gXKB6NFCP6494X/0gTH4NFLw6H/9fAEy+i5gCx
 NNgVNkugVbFIcvfC0OYU3aHCCIR4wVtSm4Fe+RPpAK0LX5lY5wY42dKWXjUSfxPc
 9kTuBB7eC9AKE4YCU8e0wryljwowxnQC0NF7vi8fdonnFy6QtrYiXFjRt0otLXLK
 iDwRJF722KZk65T6hR0grOksvUzi6G33YwU6uXP9v4aGg+TZvCKOGokBWUxueSfY
 2k9kqcBmSfmKQrtWIhls/NMhhoMSb2Lk6/3ILoUFRYe1p9a7sgpQDxTqEbmoM/tA
 ==
X-ME-Sender: <xms:sprLYGgdbxrx0f_uWL2JTzRLl4tfmm2Tbn9yzZB8Y7WzmjYk1g5AjA>
 <xme:sprLYHARkan28EEBvqHJfolNmAIe_ctx3Iusgsce6KW_VD0mjcDLnjVpgUV0OtzuW
 d3au3-41BiAf91u-AI>
X-ME-Received: <xmr:sprLYOFkD7P4bcbcu3xSb8MJf_RjWkE2ktcusFlO-csFAxIFHjF2PrQadGy4pcP-EHk3pK3ZiZ6rg9u5tiJXQqhf2W19UXdmESnxSeGPTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgfdvtdetgffffefgveetgfeifefhvdejhfdvtdegffdvudfgledtudelueel
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:sprLYPSFf3SVVh4duKptS94iwl1BvhZMLQh2MAuq7f4zKzvbe_Rk5g>
 <xmx:sprLYDwF2X10IfwWWgZCnlkqb4s_CkHzghmQ0bjhY9kwsNYGlmbuXA>
 <xmx:sprLYN6-UexyDt7y4nhi6-7Z-3qJ_E1GNINiNI6FMdZc_dD_WsHYPw>
 <xmx:s5rLYFuOI-nobxO3hzt8AGC0pt6Vft9A43MvZ4I16ufwR6siC0p-Pg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 14:55:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/nvme: fix pin-based interrupt behavior (again)
Date: Thu, 17 Jun 2021 20:55:42 +0200
Message-Id: <20210617185542.106252-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2:
  - only refcount for CQs with interrupts enabled (Keith)

 hw/nvme/nvme.h |  1 +
 hw/nvme/ctrl.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

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
index 7dea64b72e6a..b8d4f9ce8532 100644
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
+        if (cq->irq_enabled && !pending) {
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
+    if (cq->irq_enabled && cq->tail != cq->head) {
+        n->cq_pending--;
+    }
+
     nvme_irq_deassert(n, cq);
     trace_pci_nvme_del_cq(qid);
     nvme_free_cq(cq, n);
@@ -5758,6 +5770,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         }
 
         if (cq->tail == cq->head) {
+            if (cq->irq_enabled) {
+                n->cq_pending--;
+            }
+
             nvme_irq_deassert(n, cq);
         }
     } else {
-- 
2.32.0


