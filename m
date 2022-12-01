Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA9163F5B1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mly-0000LE-0p; Thu, 01 Dec 2022 11:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlv-0000Hk-DA; Thu, 01 Dec 2022 11:50:51 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlr-00011N-J2; Thu, 01 Dec 2022 11:50:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C8925C00ED;
 Thu,  1 Dec 2022 11:50:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 11:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669913434; x=
 1669999834; bh=aBsAVc1/hgYoS+bVs7/fs4McPqJCjBQnvGS+rGu+Sgk=; b=o
 QGj3QfNJVGRiXeznDsn8NvZIRfC5ICZMPku+NR45Y8kioD9MXshdJfEAITArf8e3
 CVfDD/0/GJcPTAPNQu7YoppAy/dFOTscisKMb6JBQXfblNwF4vzF6aHbZOGoPVTo
 bxSK6E6ZR6PteoY8Ao0WWXpi1zt8HbDBf47JyfApnbDNp71vAwsf0+PQpE0sJh8/
 H07chvKtoXlgsEZskWOvpWU94fXELDD/JtNmty1xLIaw+JrBVb0RbHap6YpZIqrV
 FX26UuvEpOCRIxomogm+Gd+AFmFUAdLxzc8wC9WRW7mACO3b7YKgTHYThYjq4V3O
 totdHsDWqCsxE803PqtuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669913434; x=1669999834; bh=aBsAVc1/hgYoS
 +bVs7/fs4McPqJCjBQnvGS+rGu+Sgk=; b=prO6yo9yhql+He4fhCsgUzUaSW/tc
 Z5a7+VOEXCcl1k80qck61MtmjuniD8FtyCAtvvUd78Ui+VUuLqkgcXm0yMJhNEbF
 oP1n6uhTN77K3ULooRQLQyMG/o/nJm7aoGiOG79mzEp4foF8pIIsC5PuaSEC6B6r
 RdRLlps/XrjPzKrNRFoVkZNKHDQ2wo2rxKb3zit5zyCAMeg4ubZUkZv7Q6yvb8ZK
 ilVsKPK1kkfr9fXadrxptNsud8RXEhCXsZoA0zSvvWeIDxvJ8+sRcIyTRPEUZSAQ
 AcCq8kfD4hsBIdfZul4M5lU2P6Hy3pDnI3B+CIp1q+g6FOQfK/0/trq4w==
X-ME-Sender: <xms:WtuIY5FlPpHMCKxHwTnlOUOQnIa0Zi5ehrwF64nbFJ-K5_myiJhD8g>
 <xme:WtuIY-Wgc47ZYmtq_E2lNQmREYfN-dGTPaeE7p2jGSACRoqYHESqyjleaoqjcDZI7
 uqdf8AZ9RnMHzCKNSg>
X-ME-Received: <xmr:WtuIY7KXRWrpSapHnowNQj4pHa3abu57PPFXdZw0lwkwKN1q6wcS0M3X6M3MaSVLm-PfpBfh6sPWvfB5fVJDCTx4htAtjQq4eslp-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WtuIY_Hu5j7N0-U5i2Q1cTP6WJHRG-gQPqp2sMVV0DKRWUabtfZuhQ>
 <xmx:WtuIY_UGcMOaur2NApedxMhci2_y0gtvKBPlWtBPHi08KUs1XzHkXw>
 <xmx:WtuIY6OwtT2y2iK9t1peNUYQOIqNIGeyB0WS_T5T-UK2dxhStz0s0g>
 <xmx:WtuIY6RnWHdB2HHkDvycClTd7kd0rFVvF-FuWj6VV8PaiByA9f7Wqg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 11:50:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL for-7.2 3/5] hw/nvme: fix aio cancel in zone reset
Date: Thu,  1 Dec 2022 17:50:22 +0100
Message-Id: <20221201165024.51018-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201165024.51018-1-its@irrelevant.dk>
References: <20221201165024.51018-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276; i=k.jensen@samsung.com;
 h=from:subject; bh=j5bs7aBpIoAuFdyTRJ7E5AynZMWe6a8pnc+NNpwHg64=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOI21BG5RWpZ8GiXSBWupcbBMAHZ7MljYU1xH2M
 kPtBmFUAEokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjiNtQAAoJEE3hrzFtTw3pJp
 cIAJkJvhlphpX74JJyy6a2ZZu7Gl8C0K9/3hJSVJRp7OhaMOu47mNtYu8gUr7hEunEcbhdOKKYTsV/
 JliF2SA+4yvgPxRd7Lazj3ENQGGxU0iVbegPtlxjA4D8xNP/nsgKkPd3L0DzkN2sSE9OZFeAzX9PRj
 5CNm+LjlLl1qAjM4QNM9jA7ZaFz6os61PIaT9yvtGAseWBERrNqH3Yp3RWfQ7N5u5sUMX/EjyVZogV
 p/bHA7t27auqiZ6Mq/wtpY5n4Bp1OSUzXcjGtQpZTC3DZCd8JX2Koo0WFxsf27s0roI+hbxwGC4fVH
 /olm76sq2clZIbxcRCRjFeXo2A8+rB8GOvtaps
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

If the zone reset operation is cancelled but the block unmap operation
completes normally, the callback will continue resetting the next zone
since it neglects to check iocb->ret which will have been set to
-ECANCELED. Make sure that this is checked and bail out if an error is
present.

Secondly, fix a potential use-after-free by removing the bottom half and
enqueuing the completion directly.

Fixes: 63d96e4ffd71 ("hw/nvme: reimplement zone reset to allow cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fede5af6afd0..bf4abf73f765 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3712,7 +3712,6 @@ typedef struct NvmeZoneResetAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     bool all;
@@ -3741,17 +3740,6 @@ static const AIOCBInfo nvme_zone_reset_aiocb_info = {
     .cancel_async = nvme_zone_reset_cancel,
 };
 
-static void nvme_zone_reset_bh(void *opaque)
-{
-    NvmeZoneResetAIOCB *iocb = opaque;
-
-    iocb->common.cb(iocb->common.opaque, iocb->ret);
-
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-    qemu_aio_unref(iocb);
-}
-
 static void nvme_zone_reset_cb(void *opaque, int ret);
 
 static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
@@ -3762,14 +3750,8 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
     int64_t moff;
     int count;
 
-    if (ret < 0) {
-        nvme_zone_reset_cb(iocb, ret);
-        return;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_zone_reset_cb(iocb, 0);
-        return;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
+        goto out;
     }
 
     moff = nvme_moff(ns, iocb->zone->d.zslba);
@@ -3779,6 +3761,9 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
                                         BDRV_REQ_MAY_UNMAP,
                                         nvme_zone_reset_cb, iocb);
     return;
+
+out:
+    nvme_zone_reset_cb(iocb, ret);
 }
 
 static void nvme_zone_reset_cb(void *opaque, int ret)
@@ -3787,7 +3772,9 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
@@ -3835,9 +3822,9 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
 
 done:
     iocb->aiocb = NULL;
-    if (iocb->bh) {
-        qemu_bh_schedule(iocb->bh);
-    }
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+    qemu_aio_unref(iocb);
 }
 
 static uint16_t nvme_zone_mgmt_send_zrwa_flush(NvmeCtrl *n, NvmeZone *zone,
@@ -3942,7 +3929,6 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
                            nvme_misc_cb, req);
 
         iocb->req = req;
-        iocb->bh = qemu_bh_new(nvme_zone_reset_bh, iocb);
         iocb->ret = 0;
         iocb->all = all;
         iocb->idx = zone_idx;
-- 
2.38.1


