Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20636336D6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOQ2-0002Tt-LM; Tue, 22 Nov 2022 03:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPv-0002RC-FP; Tue, 22 Nov 2022 03:14:07 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPt-00032v-MP; Tue, 22 Nov 2022 03:14:07 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id AB2E132002B6;
 Tue, 22 Nov 2022 03:14:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 22 Nov 2022 03:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669104843; x=
 1669191243; bh=19+JcQJz8OGRNx+DEe6qd8mFw8jZ5kXEzjb0xplNbBU=; b=o
 mexs6sukAqIgdfVobiBOtjaglo9fJvcra6nYN5LfAO3uULyyLZCUMxT58mecvXSq
 KK3kO1L/dWAvIsUGUD7ewRC9BiWIWLS2tFmAiKjPuDL67R4EmDrQ2EwYLjOlti+a
 7i0R7FTHgFqcxL5/tBJdkwgpIUi/TzGQy06rbvZtIbQX3GqYTL9UOD2XR6+G1c2S
 Y48O+E4hPr+mUahml4ecXPGp+jmge3r7WO5sT45P4K6Ppb55yz8lYTUCAdqk9kMp
 ZBeyLeMxHV2UyBPKu2GSZ6t5aHs+G37LIdDZQwza9HuWf+z31ZpA9YdcSzuXeWF3
 0kF2+sXuFFfSxuyxk4WgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669104843; x=1669191243; bh=19+JcQJz8OGRN
 x+DEe6qd8mFw8jZ5kXEzjb0xplNbBU=; b=lLqHNX+sP5dhbrecdaXX2LyHnVN/o
 gHxSdGAlthaECTdmunB/kuxSJKFeRio6fKbmmvV5e+JkZWF7UrWCzliyG03LUP41
 qPDXhSc1h0ECNoZ+u4QEBFLe7etoE3sabDf9ogwRu/2XG/WX1XhbjjUmHgii9pWn
 NUT96RdxNh7W1GPSLGuJEaN9cZ+aUcNkKistRWJGfLfoiHlqXVQQr3Wu5+dupq3U
 2sENdRlki8d3ArogPwAnka+tO1Yw3Fa3f6Ro7B9Zl2o7k02Hq4xCGbmEv1Ag0eDZ
 JveNfVLH9Ixp6RCEqJCaylltnDytTvkEMaYW2JArfnd5/2NtVi5SKjSRA==
X-ME-Sender: <xms:y4R8Y09OAPC7UwZlLgydUyicFieM_5mE84fnFB8JxKKBGzwpioQ-qQ>
 <xme:y4R8Y8ttRnHUx13Z-hv8Rh0eOTNrAgD8t9BJyOu4qjthq7cRcjQy9jWAZgpjAUow6
 gnHUn96iI6Xkt6yOUg>
X-ME-Received: <xmr:y4R8Y6B5Jbqy7c3yf80t3LIi8fJCztTgD9kJbqq42cLk1x43qgUq66b9tvnnvr82JOVRlhdIN3YbHC1nQiyVHEIvc6dQUligT3-Yaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:y4R8Y0f1nRFt-i4sOuZRI9SiS0zPMG-fvCj1w4q9647s0OZ1RbkU5g>
 <xmx:y4R8Y5P9VlZLrfsy7usvjOBfjuLrfEYsSd6_ld-n1xF6nyTCa7U-vQ>
 <xmx:y4R8Y-mlRqksY8Rg7ZjyGGSfCg8vyYdXnDxTWUzpf5fnmDj3oWu8Kw>
 <xmx:y4R8Y6p_fEoP6oumN1IMpvAo5Czp0eElySOF9wOxIa-0RVlQ2Skgxw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Nov 2022 03:14:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 4/5] hw/nvme: fix aio cancel in dsm
Date: Tue, 22 Nov 2022 09:13:47 +0100
Message-Id: <20221122081348.49963-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122081348.49963-1-its@irrelevant.dk>
References: <20221122081348.49963-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3627; i=k.jensen@samsung.com;
 h=from:subject; bh=O11j7sDiUuM+RZRBMoCDohuJayZJWfGJA8VTmkgIIV0=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN8hLyFjy6L5vC8VpnA2G1Ps7IBctGgL1MhOv0S
 SLq+efDdfYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjfIS8AAoJEE3hrzFtTw3p8j
 QH/RKLhm3J1V1/Fyky1KrJxymjtgzGto0SLsmjKGoGxQT5JmM0qBwFUNhrWSxYniUeB2f25tASWUCD
 aHzfxu3X8wtNbbPycdzU37kVU2PKYvZlMHbkL/YWjE4Tb59zEPflg4QBm8K5intJ+PGCzTZorcYpKl
 omb1X/J0ZYVAAM7Tqz8pQSe1lr4YDx/QkDvDJ7ny0kVVtns1ED76zDKSITJ7p9wMMwHlXV9q99F+pV
 zBNDrfGG3Pi0pQuFc1B0L3rfTZ73oD7EzB97WmuWGv32VRyxg7a25lLxM7h8Wg+QSVLzNO1lLCL67Y
 sXh6YreuiXMwrn3EbUaCegQfpz2CEvL419lqou
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

When the DSM operation is cancelled asynchronously, we set iocb->ret to
-ECANCELED. However, the callback function only checks the return value
of the completed aio, which may have completed succesfully prior to the
cancellation and thus the callback ends up continuing the dsm operation
instead of bailing out. Fix this.

Secondly, fix a potential use-after-free by removing the bottom half and
enqueuing the completion directly.

Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 558ccea154c2..458c85d47cce 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2329,7 +2329,6 @@ typedef struct NvmeDSMAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     NvmeDsmRange *range;
@@ -2351,7 +2350,7 @@ static void nvme_dsm_cancel(BlockAIOCB *aiocb)
     } else {
         /*
          * We only reach this if nvme_dsm_cancel() has already been called or
-         * the command ran to completion and nvme_dsm_bh is scheduled to run.
+         * the command ran to completion.
          */
         assert(iocb->idx == iocb->nr);
     }
@@ -2362,17 +2361,6 @@ static const AIOCBInfo nvme_dsm_aiocb_info = {
     .cancel_async = nvme_dsm_cancel,
 };
 
-static void nvme_dsm_bh(void *opaque)
-{
-    NvmeDSMAIOCB *iocb = opaque;
-
-    iocb->common.cb(iocb->common.opaque, iocb->ret);
-
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-    qemu_aio_unref(iocb);
-}
-
 static void nvme_dsm_cb(void *opaque, int ret);
 
 static void nvme_dsm_md_cb(void *opaque, int ret)
@@ -2384,16 +2372,10 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
-        iocb->ret = ret;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
         goto done;
     }
 
-    if (!ns->lbaf.ms) {
-        nvme_dsm_cb(iocb, 0);
-        return;
-    }
-
     range = &iocb->range[iocb->idx - 1];
     slba = le64_to_cpu(range->slba);
     nlb = le32_to_cpu(range->nlb);
@@ -2406,7 +2388,6 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     ret = nvme_block_status_all(ns, slba, nlb, BDRV_BLOCK_ZERO);
     if (ret) {
         if (ret < 0) {
-            iocb->ret = ret;
             goto done;
         }
 
@@ -2420,8 +2401,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     return;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_dsm_cb(iocb, ret);
 }
 
 static void nvme_dsm_cb(void *opaque, int ret)
@@ -2434,7 +2414,9 @@ static void nvme_dsm_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
@@ -2468,7 +2450,8 @@ next:
 
 done:
     iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+    qemu_aio_unref(iocb);
 }
 
 static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
@@ -2486,7 +2469,6 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
                                          nvme_misc_cb, req);
 
         iocb->req = req;
-        iocb->bh = qemu_bh_new(nvme_dsm_bh, iocb);
         iocb->ret = 0;
         iocb->range = g_new(NvmeDsmRange, nr);
         iocb->nr = nr;
-- 
2.38.1


