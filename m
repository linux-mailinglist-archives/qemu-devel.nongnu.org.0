Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A015358DAE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:47:32 +0200 (CEST)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUacl-000567-6G
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUaSu-0001Wa-8V; Thu, 08 Apr 2021 15:37:20 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUaSr-0004hx-E9; Thu, 08 Apr 2021 15:37:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EAB45C0114;
 Thu,  8 Apr 2021 15:37:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 08 Apr 2021 15:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=WqfbdgGajSBzv
 VknFlJCVClKavQRLg//HWbdfVracZI=; b=BrpVKy2wQpBg1hTAdQShrniTi9VRz
 744lDNmVDlQnDMpxDRXasLBwjTbfuxb0wTBkVj/v47BCzfzMXAaOUK4vxn6c4GUN
 ePeHVFoRKmu1Kh3DZza9iP/XbMGMM6OUoLqFcC6EYOQcdCUeAfbI91tQYKV6oeZu
 MrAOy1FaMTKZBkFC/pS+Iqn1jMWMYLbCJzgb0AvzmP1EH+337iGfPGSuu1Z/cFz7
 pUKACgv8JiICJCIcEcxglw3K5n694+lmC4V6i26Dy9MZNoYkMBz4my4Fa34+LXAy
 4OlO87Bx2dVP17d3a9mhVs7/QUirG2OZd7a1yxwB+Jbv5unEHoZ20a6Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=WqfbdgGajSBzvVknFlJCVClKavQRLg//HWbdfVracZI=; b=Cw5A2CWB
 2TeDLHi+yfbXKMspTSwrF7o7tOoJRcdr9vhC5oFd4XTw3YcVjdZLksN3ktozFrEO
 RmHxC2Vazqcfro13lsQoO3txPsv5ggy5o0N1XohE3qPc+d07ibIsC9DYEgAnejoV
 tn/8y3+DmRZ1G6b9bsYRRtkIGJU+pbh8qjUNOITdw0DvY0Ll54G7h6TAgyByu4c/
 W1/cd4tSJ+5DpWxkJWUHCto/IvEkL+xLwLjNeQn5tWEoC/g+AzD30VJn92V7oplf
 gTw16BWHYfBCx0T7PcmC7a3AqyGirEHB7my8nhKpSo0yBBOPx+eIxaX/xcPmvlq9
 bnp/D1SuBle4aQ==
X-ME-Sender: <xms:a1tvYNV4hGXOvOrL8QtQgi3WUBr4UydPoMoTATnYfA1D8ShP9RsKzA>
 <xme:a1tvYNnsSKDqMVangZhaS2tA9SDjXmAnmIg2Pkmv7Vcgs3TPAjcU9t4uMlVy-2xgT
 VOEtfGscDjcfKwBlIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bFtvYJYmREF655zVBQYU3mH9JIKjNflI6ZLfWs0XFSdEhHawFH79_Q>
 <xmx:bFtvYAWe2u9IMD8A3BIQVz6lVeoQU3VYtQTK97-EMErC8GS6O_M5vg>
 <xmx:bFtvYHmK7ciBVQpdZoWMbCetsiqk1B87_Sx3CZfJ_oVl-QHx7yv5eQ>
 <xmx:bFtvYFa9hRtDL9y63qsPRqmW8VnMvR_rQ-r9meUcZ-4I9KOgew3IEA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFA5F24005B;
 Thu,  8 Apr 2021 15:37:13 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: drain namespaces on sq deletion
Date: Thu,  8 Apr 2021 21:37:09 +0200
Message-Id: <20210408193709.435939-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210408193709.435939-1-its@irrelevant.dk>
References: <20210408193709.435939-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

For most commands, when issuing an AIO, the BlockAIOCB is stored in the
NvmeRequest aiocb pointer when the AIO is issued. The main use of this
is cancelling AIOs when deleting submission queues (it is currently not
used for Abort).

However, some commands like Dataset Management Zone Management Send
(zone reset) may involve more than one AIO and here the AIOs are issued
without saving a reference to the BlockAIOCB. This is a problem since
nvme_del_sq() will attempt to cancel outstanding AIOs, potentially with
an invalid BlockAIOCB since the aiocb pointer is not NULL'ed when the
request structure is recycled.

Fix this by

  1. making sure the aiocb pointer is NULL'ed when requests are recycled
  2. only attempt to cancel the AIO if the aiocb is non-NULL
  3. if any AIOs could not be cancelled, drain all aio as a last resort.

Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
Fixes: c94973288cd9 ("hw/block/nvme: add broadcast nsid support flush command")
Fixes: e4e430b3d6ba ("hw/block/nvme: add simple copy command")
Fixes: 5f5dc4c6a942 ("hw/block/nvme: zero out zones on reset")
Fixes: 2605257a26b8 ("hw/block/nvme: add the dataset management command")
Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Cc: Minwoo Im <minwoo.im@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 94bc373260be..3c4297e38a52 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -470,6 +470,7 @@ static void nvme_req_clear(NvmeRequest *req)
 {
     req->ns = NULL;
     req->opaque = NULL;
+    req->aiocb = NULL;
     memset(&req->cqe, 0x0, sizeof(req->cqe));
     req->status = NVME_SUCCESS;
 }
@@ -3681,6 +3682,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     NvmeSQueue *sq;
     NvmeCQueue *cq;
     uint16_t qid = le16_to_cpu(c->qid);
+    int nsid;
 
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_sq(qid);
@@ -3692,9 +3694,26 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     sq = n->sq[qid];
     while (!QTAILQ_EMPTY(&sq->out_req_list)) {
         r = QTAILQ_FIRST(&sq->out_req_list);
-        assert(r->aiocb);
-        blk_aio_cancel(r->aiocb);
+        if (r->aiocb) {
+            blk_aio_cancel(r->aiocb);
+        }
     }
+
+    /*
+     * Drain all namespaces if there are still outstanding requests that we
+     * could not cancel explicitly.
+     */
+    if (!QTAILQ_EMPTY(&sq->out_req_list)) {
+        for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
+            NvmeNamespace *ns = nvme_ns(n, nsid);
+            if (ns) {
+                nvme_ns_drain(ns);
+            }
+        }
+    }
+
+    assert(QTAILQ_EMPTY(&sq->out_req_list));
+
     if (!nvme_check_cqid(n, sq->cqid)) {
         cq = n->cq[sq->cqid];
         QTAILQ_REMOVE(&cq->sq_list, sq, entry);
-- 
2.31.1


