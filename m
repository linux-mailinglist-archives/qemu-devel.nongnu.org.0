Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0CC35BA9B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 09:09:40 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVqhX-0005d7-2G
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 03:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqa1-0001KQ-6a; Mon, 12 Apr 2021 03:01:53 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqZz-0000xU-6B; Mon, 12 Apr 2021 03:01:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3961458083C;
 Mon, 12 Apr 2021 03:01:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 12 Apr 2021 03:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qZSzm+tovoA8d
 CMHk+Jdzm94xRHG3eleFyAGs9vwcKU=; b=KXXTLsUeX4A8xqqY+SHm2iZFtgn8V
 D/oPyHicXvgerOtdfN1w/ZfFVkbGERkDRWPtKriSHvQneW9PRA1zpZtksEeiEGdd
 c0jTMWsvZhDSJRWsSfIH7/zCsrhzYML27CGtIg4F/9oCKNqZNXDzapUx7OLdiEPt
 C0+k6jOYWFoh6qCdwWUI1kQ65SluVZDLRvtAGzffmYoNqBCRTITmsNr/sPGxed3k
 tGn9P8xrrZUWaBdrkhzVgKininDeXPZ7PgNW5kzWBtbJUuDdjlASBz3h7YUUABx0
 2++PzKUvDv97qS97/+ui0BCXle8JwGQ//Wlk2eAwrqV+CMppHhFByYQHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qZSzm+tovoA8dCMHk+Jdzm94xRHG3eleFyAGs9vwcKU=; b=jeaAAilw
 jldmnTyU+cvjgtsQCEHOxNtiiGZlEqBlJwXS8eiaiwXGDcT25L96Kpo32VJ6qPWv
 85EOJvbHVAfnqmZrxSmUoaaV2L72LvhZHjZrATCUmLJrWW5C74UrD1a4CrO1VzSL
 JBs7CpouiWLguMA52pXgFwrJZaG3WxG5pSzimsdTXg5n0u5WQ/QZu733lbyUK8nc
 1clrabLlUkqBEaovgeBxFX9DJxK3rWZWcdWT0znpUnCWGUcIse9MDUDsNbdgPZHX
 spTwQbbWjMTuSq386pxNtY3RaoSErhQfJOae9sngZZ1qtlbdxCDWEVnGDNNZV0VW
 GpNfjo7Lk9T9/Q==
X-ME-Sender: <xms:XvBzYJVbXWFLMePRss2I1EaVof5Evmzr7fZeXHSsEdiLbRciuqiHxA>
 <xme:XvBzYJn4WUCdDrxbiOABSOPgM1zig3rfHFNXBQe_RSrpSVB6uqOB5B0DBIMyIiOAu
 APKW58dqTUNYMsmyLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XvBzYFanFA5qyyy7coOBoJR2DzK8dzxSDa_KomCX4WFkYzrreb1D_g>
 <xmx:XvBzYMXvTalpzHCxMcMcastylF9JUQfxxu__niYl6d0rgYtQv_CLDQ>
 <xmx:XvBzYDnZeTfbEwmP46WlyrKzsPv4cZxWIb01aiqLREFzhE_xMI0_oA>
 <xmx:XvBzYF4RNAdiwWX7NDpsDwcD95lu9uizVUSqQKu2qPHdQKgeq-NvIA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B399A240057;
 Mon, 12 Apr 2021 03:01:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL for-6.0 4/4] hw/block/nvme: drain namespaces on sq deletion
Date: Mon, 12 Apr 2021 09:01:41 +0200
Message-Id: <20210412070141.521593-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412070141.521593-1-its@irrelevant.dk>
References: <20210412070141.521593-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im@samsung.com>
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
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 65bb2cfc21d7..624a1431d072 100644
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
@@ -3687,6 +3688,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     NvmeSQueue *sq;
     NvmeCQueue *cq;
     uint16_t qid = le16_to_cpu(c->qid);
+    uint32_t nsid;
 
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_sq(qid);
@@ -3698,9 +3700,26 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
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


