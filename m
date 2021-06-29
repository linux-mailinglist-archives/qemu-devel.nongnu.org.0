Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFCD3B7885
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:22:20 +0200 (CEST)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJJL-0004kE-Dh
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIno-0002Km-9c; Tue, 29 Jun 2021 14:49:44 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:51035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInj-0005pK-8X; Tue, 29 Jun 2021 14:49:44 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A24D32B00ACE;
 Tue, 29 Jun 2021 14:49:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Jun 2021 14:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 4uWHX8U2/wU4Mw7pC3WfZ1ZOMuA1lqM3FW8ByWTKxuI=; b=EQxykCYhiEZKKzc0
 3Qj20hyAZxuSvsZ3F+CZqehhjFkogOai262Ii1W51fKQJngNMijpLVC8s8QGFafH
 /HsMKHC32EfEHPndBXPYXT5Cg5Fcl3ZCCgZFZMEQrOpGndsG3hgG8Nbyx3FYw9gC
 H5CEXCe00h8ajcBu4ABS0Mz9/oN3dPUzXuNx0XhP+Yr7Z+kYgLi3wqYSQtYzDgCB
 B1TPo09ILQ0RP51LX5hgW/+KywfiAa6Fa+EuxnCp79UVhWDwWaJxk+eS5lrB7N4d
 NPyL62QmfCblZHcM35DwcSDQo3Z4bHSV6SAShhsYCqM6ejGgoavjPmjFk/QULsQD
 g548Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=4uWHX8U2/wU4Mw7pC3WfZ1ZOMuA1lqM3FW8ByWTKx
 uI=; b=VnXMk7lGkXqaIt9tafN1JlbVdlPPKRQYULmQBr2VW/J2cyFJHtAf1vpzw
 ROFTfLJSJVrUVWDNesrdeiLxuiv8BvHZnhY1TDM+9+i1UdjfJlzDg6GDWa7yIScZ
 kn0C1J2h0pVKMSHQfcUle0LmdnS5tXLLMqiC/7o+tsD3He42PldeJIpJ4hldgCZL
 YVRRfIonbelr+lx4nhiBhx9kkaIILt3Dowy/yBcb3+0Frf9odT5YHJyxRIa0GxTp
 fabj/R2qXFaYoScI6GQi8su8M/qu8Q+evHuE7lobh3BDYvKAYK1wEx+4evH8mNEd
 V1wrP/dTdGnLkc0fnEvCkwIDoWSHA==
X-ME-Sender: <xms:IWvbYI_jDGat9SIc9cRW8d4ZmQXtDan3JkTe2P6o7nCGDFF4YMmY0w>
 <xme:IWvbYAt6uRlkXhg1xAfbSbLKE6zL4J35XUDeSrkeBPS1x9VAzX7EczWJnySnTE2td
 POnwrkfYYbijRfS52Y>
X-ME-Received: <xmr:IWvbYOAwI5v7Xj7zPsDVe5M3DkpGq1Mw9_tk97EBy9JFjRGUMD2ZNFm3DcPxXxeKtKX0QKZlryXtFFaDTCBwvfxDEETMPKR2LEgA4YUwiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:IWvbYId7SD9M-s3h_Ufn3J-b1saM0gXjNhCG94vI1Gd3Viz7IPfhsA>
 <xmx:IWvbYNOmjz82-jPb2XKQLN_0or9HF-BuGYcwQUlFnqWdiIjbrIwKwg>
 <xmx:IWvbYCk2dmXbu4n5FG3XrFPmbV_84n1Wp23Z3ss-tUGyAY-MOX-BYg>
 <xmx:ImvbYBksm29IH41b2fHeE_O97y7gH6a0GGUh-vKfd21DYIkTs2Z9xYZrjvw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:49:03 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 22/23] hw/nvme: fix pin-based interrupt behavior (again)
Date: Tue, 29 Jun 2021 20:47:42 +0200
Message-Id: <20210629184743.230173-23-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Jakub=20Jerm=C3=A1=C5=99?= <jakub.jermar@kernkonzept.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
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

Cc: qemu-stable@nongnu.org
Fixes: ca247d35098d ("hw/block/nvme: fix pin-based interrupt behavior")
Reported-by: Jakub Jermář <jakub.jermar@kernkonzept.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/nvme.h |  1 +
 hw/nvme/ctrl.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 2509b8b039ef..56f8eceed2ad 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -410,6 +410,7 @@ typedef struct NvmeCtrl {
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
     uint32_t    irq_status;
+    int         cq_pending;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5c6c7d3455c3..629b0d38c2a2 100644
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
@@ -1253,6 +1255,7 @@ static void nvme_post_cqes(void *opaque)
     NvmeCQueue *cq = opaque;
     NvmeCtrl *n = cq->ctrl;
     NvmeRequest *req, *next;
+    bool pending = cq->head != cq->tail;
     int ret;
 
     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
@@ -1282,6 +1285,10 @@ static void nvme_post_cqes(void *opaque)
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
@@ -4297,6 +4304,11 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
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
@@ -6039,6 +6051,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
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


