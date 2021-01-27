Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD579305CFB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 14:22:25 +0100 (CET)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4km1-0008KD-Qf
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 08:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4kfF-0007SW-Fj; Wed, 27 Jan 2021 08:15:17 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4kfC-0000ff-Bz; Wed, 27 Jan 2021 08:15:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 973E3EAE;
 Wed, 27 Jan 2021 08:15:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Jan 2021 08:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=JTXajVu16svdd6jD5HRi0+16ZJ
 vVl3ij2UxeDbUY1NI=; b=QGZDNAOzWuLvKcgdRYtlT7Z0Ps0tiL/z3DKAiUxirk
 QZo4r0yTmFMNLbHrEVARl+68uCLhzaphZFu4csotk7vU/ObdN+HZ7iy7HZu9t9sO
 PjE8HZRAVFq/o5h9lPlkIoH09wclE+ZjLFtDZKnTxR2wWxJCQV7SrTsFFxTghM/I
 J2l46RGh4kDAbAxuUtCqqvX2C+MCd3Xnd2gBSBvRX8/QMF5Vu8E8BlVjFP/reJ7g
 VRQ1yhotwh7urQpgcvLq0/lud1WONrmAQI3xX8PjThjp2i9mZ3v4mCQqHDQ0NY0b
 oDLqAAOKd8fASBT1cRQ5tHprhHGAanbEamzjLyNjEAug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JTXajVu16svdd6jD5
 HRi0+16ZJvVl3ij2UxeDbUY1NI=; b=phWAr1I0gxKiSxHrqw7lW9ce5Pj76bsia
 TvxALy2QSFhlYGHqot6em7gRE4Lu89Kr/bFZoruadUeT4ZHBx4+xnWKLsCArZdcF
 PfsqWNJ3wkhwKJJ76xZow+Dpu/+rxjpG+qYVTO393Y1x/WOhRPIrOF35TH5PpNmF
 QqPgJF3pxWYqZX70T9gsw/jvY4tBy5zjH/JFOlxbqeT1MuWOH1iko/v20/w+dMlE
 6NCtGrEliJdklbF7xTgEpH1s6PuonnIStzo7db9/NNtoaeqYw1IBXMMDMm0Bng5X
 NgqcNGwI3HanKVM5dqBDDd1I811xio/99m2y86X60K7oZkF2QIQuw==
X-ME-Sender: <xms:XGcRYKsofUT9u2UKakEBrOmrUhNlvVHM06F2PX9SamrBwSok051yDA>
 <xme:XGcRYPcObqs93rrp0SulqXKvbl48IPGWxhslLTTCezH1Nxwlslb6FVWy62miVXEm_
 7LBEjRdmEPNLs6U2yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XGcRYFyhYtRPddl1o5zYV699mi3zPt0-7Rjkh9VGPoqbG2Ggivya8g>
 <xmx:XGcRYFPIqtgHO9l0rsSwmVpBlNCsCfPCFdgi494mZgxBrGwcpZI0aQ>
 <xmx:XGcRYK-heZOtwO1Uhc6f6WS_W6ef5mDbIL2WyxLUxYoe0FocdEbOnw>
 <xmx:XWcRYOYRHg4mtGN5Eh0Q9h-_hus3YT5c1acD3ilfk8ulU4LxLdIoXg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2102624005D;
 Wed, 27 Jan 2021 08:15:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: drain namespaces on sq deletion
Date: Wed, 27 Jan 2021 14:15:05 +0100
Message-Id: <20210127131505.394550-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

For most commands, when issuing an AIO, the BlockAIOCB is stored in the
NvmeRequest aiocb pointer when the AIO is issued. The purpose of storing
this is to allow the AIO to be cancelled when deleting submission
queues (it is currently not used for Abort).

Since the addition of the Dataset Management command and Zoned
Namespaces, NvmeRequests may involve more than one AIO and the AIOs are
issued without saving a reference to the BlockAIOCB. This is a problem
since nvme_del_sq will attempt to cancel outstanding AIOs, potentially
with an invalid BlockAIOCB.

Fix this by instead of explicitly cancelling the requests, just allow
the AIOs to complete by draining the namespace blockdevs.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 316858fd8adf..91f6fb6da1e2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -403,6 +403,7 @@ static void nvme_req_clear(NvmeRequest *req)
 {
     req->ns = NULL;
     req->opaque = NULL;
+    req->aiocb = NULL;
     memset(&req->cqe, 0x0, sizeof(req->cqe));
     req->status = NVME_SUCCESS;
 }
@@ -2396,6 +2397,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     NvmeSQueue *sq;
     NvmeCQueue *cq;
     uint16_t qid = le16_to_cpu(c->qid);
+    int i;
 
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_sq(qid);
@@ -2404,12 +2406,18 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_del_sq(qid);
 
-    sq = n->sq[qid];
-    while (!QTAILQ_EMPTY(&sq->out_req_list)) {
-        r = QTAILQ_FIRST(&sq->out_req_list);
-        assert(r->aiocb);
-        blk_aio_cancel(r->aiocb);
+    for (i = 1; i <= n->num_namespaces; i++) {
+        NvmeNamespace *ns = nvme_ns(n, i);
+        if (!ns) {
+            continue;
+        }
+
+        nvme_ns_drain(ns);
     }
+
+    sq = n->sq[qid];
+    assert(QTAILQ_EMPTY(&sq->out_req_list));
+
     if (!nvme_check_cqid(n, sq->cqid)) {
         cq = n->cq[sq->cqid];
         QTAILQ_REMOVE(&cq->sq_list, sq, entry);
-- 
2.30.0


