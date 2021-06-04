Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479139B3A8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:17:02 +0200 (CEST)
Received: from localhost ([::1]:56040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp44j-0004b2-1P
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hq-0006AJ-Tf; Fri, 04 Jun 2021 02:53:22 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hp-0007UJ-Bd; Fri, 04 Jun 2021 02:53:22 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A23CF5C0183;
 Fri,  4 Jun 2021 02:53:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Jun 2021 02:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=x9FBgPafdBo06
 8BWa6Ub975vbv9lj7osZprVgyerY30=; b=AvRB4LeiDyCi6pPAEmYddxn/8VMit
 DIa7etNMfIdqbjhPBAb+DBmD1MQtsuzp2jLKaHHV5swO41l0tQ/yw0txgg4sUI1i
 Tui6CbH+3+wpnxf22xd77qWdXfGw+y7UJ2TRoVwXLpWDTr+jC8wHT7c3zOCkpy3F
 gHC6ENIzoNA7nDdfH7cfPPosaMBpCFSEDhx8xtDjZzH0/E8QDqRPa6T+cwLSXyqv
 Yb9YVj2VPfnA1wQER4ylMwSQuEClQ27Wi0idqfeA0zsFpMHLIBFKA5iSDWijkK5w
 xFMn8cGjVBcNkLFOanpa4LCrd6ITQL0TbYFNP6/00xy2zdkuJzV3FZ85g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=x9FBgPafdBo068BWa6Ub975vbv9lj7osZprVgyerY30=; b=vdmOievN
 wUTYaJlO7dOkm6otd2nmhyKF+qDUDhCwSp3OE1wWJLY0bwZidfEPcqkH0BzMgBBy
 80yIAVG8yAejg3OAW4d3WYeI6Oru+YzxGUl68yAuI37Pohdpl9LCWQfYa7PMt9CP
 YOGGHmURpPpkVG7BBw8FNXar3vTk3oeGKdZJkV43Hal7aWxENamlVbAazahWX2eM
 YW1dNDMVMf8b+HvNqU75MR9yoBPWxlPTTQFNR3KXZdClUGDfswWi9+vLejinLN68
 zFjxV5C0o8WRTHSQWbSzQ4O5zfow6URYLrA0IETQatX0WJUYrMLIXsFALw79TXvF
 To8cf85R+1umCw==
X-ME-Sender: <xms:zM25YGsGVSOFb6Ozy38HHUzWfhECSuG2dfJCkICiLz6X7MYJmtsCnA>
 <xme:zM25YLf5kWulYIpy4X954UdQ-G_8Z_T5MrDtrVmkmK_Q0Il-aiOmX_ITxbawWJXVv
 m2jTNF-5DqsUFtWcpo>
X-ME-Received: <xmr:zM25YBwVltHdFOvte4elR2TChrqUYmUfsGhVrLVufw47PrdWKC8J_oTjBYcbJBKGQZGRvc0f1EATBRrgbPq6kT8BDOKLfiVZU3sPnJfrWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zM25YBORkRZ0rfuneNosfFuyhltHYUUVt7wJcM1oKIRSxrVThiZ9jQ>
 <xmx:zM25YG-bGdgesWaCmRRn1THqRQxLbPYNRwyV0ENe9DymxuoC02EYWg>
 <xmx:zM25YJWExxHB40ZosRa6IGCj9MlAvPBB0ubmWBfwOohuf_FI-MPq6A>
 <xmx:zM25YLNfWS26NagpPePd3Ocbbug8Rmjv654tS_JxVU16VWHTdYh5xg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:59 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/11] Partially revert "hw/block/nvme: drain namespaces
 on sq deletion"
Date: Fri,  4 Jun 2021 08:52:37 +0200
Message-Id: <20210604065237.873228-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
References: <20210604065237.873228-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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
index ee77abd19661..d25c5d8187e9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3886,7 +3886,6 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     NvmeSQueue *sq;
     NvmeCQueue *cq;
     uint16_t qid = le16_to_cpu(c->qid);
-    uint32_t nsid;
 
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_sq(qid);
@@ -3898,22 +3897,8 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
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
2.31.1


