Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2D6336DC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:16:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOPt-0002Q5-UC; Tue, 22 Nov 2022 03:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPq-0002PR-BT; Tue, 22 Nov 2022 03:14:02 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPl-00031p-Ud; Tue, 22 Nov 2022 03:13:59 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DB5FC32001C6;
 Tue, 22 Nov 2022 03:13:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 22 Nov 2022 03:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669104835; x=
 1669191235; bh=3+KyPd3/F33HrzHatyV1ldrp07a8kLbMWZ3urEk3Q18=; b=M
 1jnVVGWKf/fb2GXvtM4XtRmoeCgT8lVXzYGKZee+85k9psWmbaoPS67VkQbmedys
 SHCvVPfkqMmLuTbzJMaRYSY3oGNbAoT/4mG+MiOZMVIoIsCDeDHqPcANDp/v7+bu
 tRZ8BF19g8pwbMT03TJk7lNGKcsgAev6ksTfUXzCBrYTEw5/ksY80G6txv9znq4T
 6cKOsun9DNV6wRBA0wNkTgG0Nq7YLgXukUJVR4sAAZyO4XjoWIkQOsHSL0mtN3ZQ
 7RlexX5T3BPbsZznECCoe9ppl+RiQEbl7bEIfgubg/OfGUyFTP3cHIfJacCkpGK2
 +rv1nYgGlb1OREVmhASPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669104835; x=1669191235; bh=3+KyPd3/F33Hr
 zHatyV1ldrp07a8kLbMWZ3urEk3Q18=; b=B80/iBJUMaGXV+hOmtWK+hmVIkWmf
 RUC9PnF22decdwPQk5tblMUZH7gAK3UQke70CGtiXJVi9S8cdYxMGIJbdPYv8bNX
 qZpW4H3E92rb+XlUPMo7hsXkeQOoBlf2Al5Fl7YFf6nBcegJHKq1NbeayhIfwPz4
 2nUri7Ba9YV97e/xIX9zHpOaSMsQGeN+Dh2HcHDbVq9rdyeKRJbg83qQkB3OEcNy
 nz/Q8eVbRbAV8pP/55OA85uof2Kr+Qbb7Y3V3GABFRh2oYXUiJ7JKiwReq3N5h1Q
 sUU7X+/YnnJf+Gx7xqJ8v+FWgU2wY5MMBffw6wGSXE1dsxOcieb9BFQ8Q==
X-ME-Sender: <xms:woR8Y-iFqZlNOLJhE2uiVMYxtzz8WHrcsgoj9r5ulqBnDZia7ytJjg>
 <xme:woR8Y_CPUqVDBwDwVj-oL-PEeIXUna2ELCUzMH5-GZE9qyFLYmOYQ4Vuc8k3KhipP
 Xjlm_PMsRQVYBsvkW8>
X-ME-Received: <xmr:woR8Y2FBGVo1vTAxycK2o_qUHuSQrG86SYACCJON3AghN6yUU8Fe0WrVvVz2cEnktTuL6kuZB7LLcRAU5hwaq3JlAPKaz3AnwVnF8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:woR8Y3RozbX-1T9N5nsWz6KHRAztXm5LKI09lbSDUZebIyRiw_Xwqg>
 <xmx:woR8Y7x1gROV9u3VhaGb-l4ypDs9G5vmPH4RbDTwXMCr3QjfWQs9Yw>
 <xmx:woR8Y16lHLBVsox-JF1f8kfB6YkOD7BhP5H3C482ig7lydptEGpOqQ>
 <xmx:w4R8Y9vCLiFmXDOV9syal76-Lj4Ea0vZfrtDFgViYJAiNiP7G0x6hg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Nov 2022 03:13:53 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>
Subject: [PATCH for-7.2 1/5] hw/nvme: fix aio cancel in format
Date: Tue, 22 Nov 2022 09:13:44 +0100
Message-Id: <20221122081348.49963-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122081348.49963-1-its@irrelevant.dk>
References: <20221122081348.49963-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=k.jensen@samsung.com;
 h=from:subject; bh=lnx6TbWpGhaiSLBof2jEUOUF2JEh+epoiDka2ev9uhc=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN8hLuAf/gQk+PFysS7hkpMgjI38Z8kdjQ1eMbZ
 tiwf4K6l7IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjfIS7AAoJEE3hrzFtTw3peK
 AH/i5tx055k7C8ofZTUKUeD9fFbPKPtmKSTIq+72CJult8c2sBbhygkVdX2bO5pxjv5djaK2XuGXft
 5Tr3UFPj5D97022D39mPO1zGGT8k23+fa+J89688KWRq1IiKjXbiB1ZcB47csrIkwCVRgLsu/DiZL5
 C1b1l3GsYehOpyhmEIjc3b4MWHtHP7MeiihYtISAlKs+oXWdY3rtHNjmo7J/WrqAfZIQ7MAcYK7hjx
 HA5Cnw3pC1iOWSF7wkghPVPW9RIRciA4WlNpVXMlwxxGNxKF8Qz40s6/o3WdeVaAH/6xJZ7rFm1QlG
 wI+bHOllTMsdmX59hGUO2B24b2FeM/RNt9Oq6u
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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

There are several bugs in the async cancel code for the Format command.

Firstly, cancelling a format operation neglects to set iocb->ret as well
as clearing the iocb->aiocb after cancelling the underlying aiocb which
causes the aio callback to ignore the cancellation. Trivial fix.

Secondly, and worse, because the request is queued up for posting to the
CQ in a bottom half, if the cancellation is due to the submission queue
being deleted (which calls blk_aio_cancel), the req structure is
deallocated in nvme_del_sq prior to the bottom half being schedulued.

Fix this by simply removing the bottom half, there is no reason to defer
it anyway.

Fixes: 3bcf26d3d619 ("hw/nvme: reimplement format nvm to allow cancellation")
Reported-by: Jonathan Derrick <jonathan.derrick@linux.dev>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac3885ce5079..26b53469328f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5756,14 +5756,15 @@ typedef struct NvmeFormatAIOCB {
     uint8_t pil;
 } NvmeFormatAIOCB;
 
-static void nvme_format_bh(void *opaque);
-
 static void nvme_format_cancel(BlockAIOCB *aiocb)
 {
     NvmeFormatAIOCB *iocb = container_of(aiocb, NvmeFormatAIOCB, common);
 
+    iocb->ret = -ECANCELED;
+
     if (iocb->aiocb) {
         blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
     }
 }
 
@@ -5787,13 +5788,17 @@ static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
     nvme_ns_init_format(ns);
 }
 
+static void nvme_do_format(NvmeFormatAIOCB *iocb);
+
 static void nvme_format_ns_cb(void *opaque, int ret)
 {
     NvmeFormatAIOCB *iocb = opaque;
     NvmeNamespace *ns = iocb->ns;
     int bytes;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
@@ -5817,8 +5822,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
     iocb->offset = 0;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_format(iocb);
 }
 
 static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
@@ -5842,9 +5846,8 @@ static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
     return NVME_SUCCESS;
 }
 
-static void nvme_format_bh(void *opaque)
+static void nvme_do_format(NvmeFormatAIOCB *iocb)
 {
-    NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
@@ -5882,11 +5885,7 @@ static void nvme_format_bh(void *opaque)
     return;
 
 done:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
     iocb->common.cb(iocb->common.opaque, iocb->ret);
-
     qemu_aio_unref(iocb);
 }
 
@@ -5905,7 +5904,6 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
 
     iocb->req = req;
-    iocb->bh = qemu_bh_new(nvme_format_bh, iocb);
     iocb->ret = 0;
     iocb->ns = NULL;
     iocb->nsid = 0;
@@ -5934,14 +5932,13 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     }
 
     req->aiocb = &iocb->common;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_format(iocb);
 
     return NVME_NO_COMPLETE;
 
 out:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
     qemu_aio_unref(iocb);
+
     return status;
 }
 
-- 
2.38.1


