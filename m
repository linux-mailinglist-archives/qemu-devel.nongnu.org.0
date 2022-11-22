Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4146336DA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOQ3-0002Um-FZ; Tue, 22 Nov 2022 03:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPw-0002Ro-Kx; Tue, 22 Nov 2022 03:14:08 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPq-00032D-7O; Tue, 22 Nov 2022 03:14:08 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6385E320024A;
 Tue, 22 Nov 2022 03:13:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 22 Nov 2022 03:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669104837; x=
 1669191237; bh=DlHke+ZGmp4Kp0kN5AHVCi+UWrUQwSr8Y4wjV05omHQ=; b=P
 740Y1+co/BnaHNOXuurLcSe8n+eYlrmCwKaB+Um18SnuSH9WKQ0xl1i7QTUN6n7Q
 35XLwcAmMmx0Tm4GEr7JeHPN+Vorx9L5mWaMX6l0shyeGtDeKB/cfaz1v8DS+5gx
 HsdQ1UtrO5NIQTEXYsahL2tsTU/K47Mlj79o3hh6QOtThxs9xywnJcmJvD2scgLW
 Ojc+/TlsECDAt+wWW9KdqO8J7ZDomRZ8ZUv1YGkMaLXShVv1h+RAjZkZqyapp9io
 80BrqOlr0miAw4KGGVffE+N1HdW740kCCD3phSoGhdgeWyVIe8pi952Hzi/C5+pV
 knRPEwQ1LtdzY23nD+RxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669104837; x=1669191237; bh=DlHke+ZGmp4Kp
 0kN5AHVCi+UWrUQwSr8Y4wjV05omHQ=; b=izvod/zasqJn/wee9mnJ4202GCg9q
 STW9prEY1KXX/czfsFm3oO+EsGCaexyoZhHJcUvUGZ53l7LY6UEL1mXSSkXc5gZO
 PSWxQl/8sGyRqhF5bH3vTNB19zsqxq5EZXaqFtoYcKe80MMt8fOmyyxgbJ/gBbXF
 Pm3O+Q+513y8E+5FgcKSX6nsGry7lfNbhlt32x82B/SJPZaRt0dWj3os/npwzQ5H
 JsltYF7cdeMmPCUz/MZU7XcIvrEkRg961hhNksezyBoadcI2z1I+PNXU4QBrVW4J
 oSX43IUzicXddU+EG14TmOfCGnuCipojeoI36Bg++tp/tZvQ/NEoKuNmA==
X-ME-Sender: <xms:xYR8Y-VUL4AbxNp5Rm0dYI5GRmxLEluAVYyBwAI4wbj8zoDU9bLLfg>
 <xme:xYR8Y6n_fjvVPJTLMzokvxD1-2te8ziFUSheuaL_98nta-ZTizUGI_NzZYEySGN6B
 7JR_yCrOhHFdAvrZmc>
X-ME-Received: <xmr:xYR8YyYJ8aMJQ2_1Z8kFG76040WgiKScnOeAe6Gc8jIndO3CTPPeS3wTz0Ra2ZxuyFhMKyg6E7mN_UL4ckpqM2mhUo39qO9y2fBG1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xYR8Y1V1xAP-YrC7CuVHCPwEgJJgVbxLSrYliKiW666db_w3Hh72pw>
 <xmx:xYR8Y4kXsDgcCBIsUxfk2ig2sIGTIv-kJtlLjLquuXoceoVmaZG4jQ>
 <xmx:xYR8Y6e3UVlSz8lyATAlIEyWKIsOOmlUKsyzvVRUkGoGvNy3QIfWnw>
 <xmx:xYR8YyjLZG6t4QBYiCt9XMcNCAr5FIjWnzhazuGItPk_Hy-6EOw3BQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Nov 2022 03:13:56 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 2/5] hw/nvme: fix aio cancel in flush
Date: Tue, 22 Nov 2022 09:13:45 +0100
Message-Id: <20221122081348.49963-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122081348.49963-1-its@irrelevant.dk>
References: <20221122081348.49963-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550; i=k.jensen@samsung.com;
 h=from:subject; bh=z21NZQE0tPSmiRSuuRtkPPRRr3BOvzupV5f9QANkoS4=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN8hLvNlduUWPQEm7WVuKb5rIL2pNL5WRuLp5Ff
 Dt+qBGbnIYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjfIS7AAoJEE3hrzFtTw3p15
 gH/RTvZ/ex1DzYef2+9OfFWL0lB826lKQZzzi8pAA1wfhxFSTH6pL6Sto+Pz/Sn7PuMeWLon2ldEG1
 guem1kXQifS77PeSrkRCp9xfLjRiw+nljDbI/eC14jz/M3ViODHqM/H+4idWGs32+BIKn5PZ7gBw5M
 8twpQIC8Cb4vdbxzqGdcM+XVGlrZVsSFsm5kAcLyFT18THBTfGsWy+7ozlEe4aa8IOX5sfp1iLIwxE
 a0bIp2U0HQkY9ulDvM1U3K/q4sAyLPjaEa8br/kNwpPStgac5BrqzAO4hEY+ss/mwNbQHPrx10GF61
 Ta9RETIfJW1lZb+KoXLcEEYJ4SBnWbB7rY+7gm
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

Make sure that iocb->aiocb is NULL'ed when cancelling.

Fix a potential use-after-free by removing the bottom half and enqueuing
the completion directly.

Fixes: 38f4ac65ac88 ("hw/nvme: reimplement flush to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 26b53469328f..fc129b8d1a93 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3160,7 +3160,6 @@ typedef struct NvmeFlushAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     NvmeNamespace *ns;
@@ -3176,6 +3175,7 @@ static void nvme_flush_cancel(BlockAIOCB *acb)
 
     if (iocb->aiocb) {
         blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
     }
 }
 
@@ -3185,6 +3185,8 @@ static const AIOCBInfo nvme_flush_aiocb_info = {
     .get_aio_context = nvme_get_aio_context,
 };
 
+static void nvme_do_flush(NvmeFlushAIOCB *iocb);
+
 static void nvme_flush_ns_cb(void *opaque, int ret)
 {
     NvmeFlushAIOCB *iocb = opaque;
@@ -3206,13 +3208,11 @@ static void nvme_flush_ns_cb(void *opaque, int ret)
     }
 
 out:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_flush(iocb);
 }
 
-static void nvme_flush_bh(void *opaque)
+static void nvme_do_flush(NvmeFlushAIOCB *iocb)
 {
-    NvmeFlushAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
     int i;
@@ -3239,14 +3239,8 @@ static void nvme_flush_bh(void *opaque)
     return;
 
 done:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
     iocb->common.cb(iocb->common.opaque, iocb->ret);
-
     qemu_aio_unref(iocb);
-
-    return;
 }
 
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
@@ -3258,7 +3252,6 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     iocb = qemu_aio_get(&nvme_flush_aiocb_info, NULL, nvme_misc_cb, req);
 
     iocb->req = req;
-    iocb->bh = qemu_bh_new(nvme_flush_bh, iocb);
     iocb->ret = 0;
     iocb->ns = NULL;
     iocb->nsid = 0;
@@ -3280,13 +3273,11 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     }
 
     req->aiocb = &iocb->common;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_flush(iocb);
 
     return NVME_NO_COMPLETE;
 
 out:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
     qemu_aio_unref(iocb);
 
     return status;
-- 
2.38.1


