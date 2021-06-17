Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5F3ABC91
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:20:46 +0200 (CEST)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxZF-0004BT-RB
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxMe-0003Fh-L3; Thu, 17 Jun 2021 15:07:44 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxMd-00038D-1K; Thu, 17 Jun 2021 15:07:44 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 44C205C01C9;
 Thu, 17 Jun 2021 15:07:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Jun 2021 15:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=3mSDNuRqjjILD
 ecg4FdYMuDAbsIqEkKgQQYi4orBLYU=; b=U7OIfigpCRKuJiibAaoRiH7KCKP+G
 T9ddn9/42tMQNMWI9Q+p9hF7jO6Wi5RDbGLS7H9LbZJIe1JcVY96eSG+T4giCcRf
 GWCnpAjVuM8vQQOy6b5u6H+iOawc3z3pW1gv3aQvK44Y3q3uk35QAmqSs3U0SPb4
 0+PP3gwaR30bekTDDda4n+xCYdfYz3HaQY7sjpopLaV41B0FZpeOp74snTAqhjEs
 q5J1YhNtu4tJl3ne9lg2NscUB77LKGhK/D0BLFdG7RROmhFkl9GmCMimpnbpdemA
 Lhn8Lj3E/bzmhK9PrTL2ABhlRzC8VGy6oJZkI8tt2r/eGW3NstkaxJnKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3mSDNuRqjjILDecg4FdYMuDAbsIqEkKgQQYi4orBLYU=; b=No1DF8cS
 NhJ0zTX/iyusO28GMOhDIxLhRyLI8qQFx82vF/GVDPp9etjCQG54ibXwjNrMAUJs
 ze8+Un94enHYwN9oGiF9bW1rdCwjBi7geOqjMUUJC1sq8qAWd2hj6zb9gRZIK2Sf
 Unw4mPO3cPd7WcGJVR/805i8NzgDfUaQ+910M8n2n/JtgrmWN17VNQI5vScI6Hq3
 qd7iKEZYjuDPjURSrfvPYYq+0h1qJVnTXyLpakx8v7ECBPAdkcHNLeS0pf7/NtL5
 I4uhda21DAC+qphEfUKaTrnh0bfB8Utke8/uT1bzsiacglAyYkQSFkRpJ9XKOKGf
 QVOrJNAvo+cEkQ==
X-ME-Sender: <xms:ap3LYPifcz8L8yOUEshuvTipABM9GCEd4hXF5bpcxJBAtMAJaWXMQg>
 <xme:ap3LYMAIirZaOIcB9bBKuhaqNwP0Kb-RvSiEwW_YEq3Jd32lRhNq2XuiDIru4HkkC
 8UsZ8nF7QiKxlPzaRE>
X-ME-Received: <xmr:ap3LYPGRAkVYx-yzeyrPE4Dn2vbdmLT9o2tsf3iqzZF0oxCMfjRuX7rugv4o4H9Q7l1FbJXJEOHBHbNcECmss1uZs8627d6xQs0DzxXKtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ap3LYMQVRn7JpC-t_ztD9i7A3FF-yX-wpuD7sUcDS43Pu0_yyzqSdw>
 <xmx:ap3LYMwgWQCMGorbv9dra4thGVuGGuVp6wm6zoz9iLUPFTbeXYlvow>
 <xmx:ap3LYC7bYN6fJPRaPT5J3LnsQBwnsWRAT8c2pamzYUsu0pG44xnw9g>
 <xmx:ap3LYLnYrUPymNXoKin5Bq-XLwsqvD7ZhtSJt_FZDmhY9-1lFbjKoA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:07:20 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] Partially revert "hw/block/nvme: drain namespaces on
 sq deletion"
Date: Thu, 17 Jun 2021 21:06:57 +0200
Message-Id: <20210617190657.110823-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This partially reverts commit 98f84f5a4eca5c03e32fff20f246d9b4b96d6422.

Since all "multi aio" commands are now reimplemented to properly track
the nested aiocbs, we can revert the "hack" that was introduced to make
sure all requests we're properly drained upon sq deletion.

The revert is partial since we keep the assert that no outstanding
requests remain on the submission queue after the explicit cancellation.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ec8ddb76cd39..5a1d25265a9d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3918,7 +3918,6 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     NvmeSQueue *sq;
     NvmeCQueue *cq;
     uint16_t qid = le16_to_cpu(c->qid);
-    uint32_t nsid;
 
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_sq(qid);
@@ -3930,22 +3929,8 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     sq = n->sq[qid];
     while (!QTAILQ_EMPTY(&sq->out_req_list)) {
         r = QTAILQ_FIRST(&sq->out_req_list);
-        if (r->aiocb) {
-            blk_aio_cancel(r->aiocb);
-        }
-    }
-
-    /*
-     * Drain all namespaces if there are still outstanding requests that we
-     * could not cancel explicitly.
-     */
-    if (!QTAILQ_EMPTY(&sq->out_req_list)) {
-        for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
-            NvmeNamespace *ns = nvme_ns(n, nsid);
-            if (ns) {
-                nvme_ns_drain(ns);
-            }
-        }
+        assert(r->aiocb);
+        blk_aio_cancel(r->aiocb);
     }
 
     assert(QTAILQ_EMPTY(&sq->out_req_list));
-- 
2.32.0


