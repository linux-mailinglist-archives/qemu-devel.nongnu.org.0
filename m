Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FF63F5B6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:52:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mlm-00008L-0b; Thu, 01 Dec 2022 11:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mle-000050-Eb; Thu, 01 Dec 2022 11:50:34 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlc-00010r-C1; Thu, 01 Dec 2022 11:50:34 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 67B8D5C0196;
 Thu,  1 Dec 2022 11:50:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 11:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669913431; x=
 1669999831; bh=7CgD1ROYjnt50Y1SYrZ71snDk8kbGY2eFrwxVc383X4=; b=j
 zEibpbxCK8ETlLf2BdfdsMniAnQKladxwg1hZVvvhO8WdQldTlhuGw36Ui1Kb9Io
 2Y47UInpQYz+iYroAm0UFJO5diiJsQtqaHdF29CzUoNbHPLhOfzRF5CTjzNVx0vM
 d6ky3uXC36pZiWeyCqIs5DtKNeLmQ1WCXZMRU256VU51gESFQCmneFsgk1Eesfbm
 OJz9HGsRMtJltoz5T1bfg+HUPjTNbd8N+cskAjD4Drlk6m6B/m8DWd2KMPWxZgFN
 xxCOa9JMWD+N2GAXK+i10TkaXvTfuiqA5g5pAneM/yRZS6oqtPhq1Wf1vCAmM66Y
 iNztcpnPFEHDnzSvH/CHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669913431; x=1669999831; bh=7CgD1ROYjnt50
 Y1SYrZ71snDk8kbGY2eFrwxVc383X4=; b=O/6eP9skoG0yvo6ZkaW+vFJiMzFEs
 BaO48Uakl2P5d2tWJGku/xvWO2GO09BN1P71UaP3hm9rsXFziBr7F8MgNGVCJnSI
 oAETvl8ZB9bJYsOoC+oTm7KX7wu58NtksBiiHmAGVx+Sn9ROgXsgGpdpBstNNUmo
 J83esfjuPeXrgrc/AJRiYxJrohFK5jGswby7wZ6TEyVHqI1BRAdHwzbi1SkMIhwl
 qV8lUT8ggpiED33oMYVz5Jsf13WQw3Whlf0I0b6p8qPqAhZl5C48ZI66qz28QMcz
 Jw2gfEkczaU86LH8VoqK76XntGn+AUOqM2TmWLMyIQ5Yl0TI1XRUCX9hQ==
X-ME-Sender: <xms:V9uIY5L-P0VPYSOE9YD-0ls8kKbBxrhk0mayIQaV3BAQjiig_lR4XQ>
 <xme:V9uIY1KshI2gqXJIFoOZtaFm8rpDdA3luyDs8s5RJqthiI2zdaiSvreUZsd93lBTX
 pIqGRob3ooL5Ur1F1g>
X-ME-Received: <xmr:V9uIYxtjR2OgSqWVm8XPZQ-Z9owTfv0Z-DtqZdzsZ-TbcgqwH3hwDoBKGv5PEfCDcGBGsXNRdQQbeVvvdmPT1tcO9Go4jNYZ0vPBFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:V9uIY6bgNnSBlbXv_WUInb6X_3YIftmkm0CdCTmUH1S0ccaI6-Ukuw>
 <xmx:V9uIYwaPfhKNkD-JnCG21sYenHhVBiQ3DLY4sO0KeCb_sU7yQVqw7A>
 <xmx:V9uIY-Dl0CLTEesqts_sRwDWsR3sFCh-Dt-m4cHjR08V0Oq2bKFW6w>
 <xmx:V9uIY3VXGm_FyEAHvvArhAW2LvJVsVI95xIHkVVq3UvyA50GEyd3LA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 11:50:29 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>
Subject: [PULL for-7.2 1/5] hw/nvme: fix aio cancel in format
Date: Thu,  1 Dec 2022 17:50:20 +0100
Message-Id: <20221201165024.51018-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201165024.51018-1-its@irrelevant.dk>
References: <20221201165024.51018-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3896; i=k.jensen@samsung.com;
 h=from:subject; bh=xDv6JgPX2pJUd/Z1/825ymV6rZNZamjT491djcIWwOo=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOI21DKWp8TT/yntJaHHyUdAlqCDQ4ShEstFyt+
 7yfPwJpWIYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjiNtQAAoJEE3hrzFtTw3pxM
 kIAKrA2l6zvFdE+l5FaeAcKNYYYreMUTTH9I77jtK4io0FMZb5smC/DSiJg9i5+yPRLC6Tg+ZKN+UL
 b6TH4S0C6KRMUQsKnAzT43ChZQCnBGRkXBwBYbZM565z4TphU83eiL/+r5aWNyjiyYGcWIA2hkrAPh
 +jw2GOPDw3uKpZTuiEw46xtHUrkDPvqW+D7rB31ZURtgiO7UKUd5HPJEldFaCNJvrRsohfQJFnIngY
 yK0ath/7dj8BxzgFsSM1aJPl5EXpFdk0FjJrAeRzpcwvFkcC5bqKRf1NtUOhKgyb47AR165ZSjgx2d
 JGvbDQt4Ju6juizlh6qqHcKmRK5GxztM3qHab7
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ac3885ce5079..9bc56075f66f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5741,7 +5741,6 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 typedef struct NvmeFormatAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
-    QEMUBH *bh;
     NvmeRequest *req;
     int ret;
 
@@ -5756,14 +5755,15 @@ typedef struct NvmeFormatAIOCB {
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
 
@@ -5787,13 +5787,17 @@ static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
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
@@ -5817,8 +5821,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
     iocb->offset = 0;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_format(iocb);
 }
 
 static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
@@ -5842,9 +5845,8 @@ static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
     return NVME_SUCCESS;
 }
 
-static void nvme_format_bh(void *opaque)
+static void nvme_do_format(NvmeFormatAIOCB *iocb)
 {
-    NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
@@ -5882,11 +5884,7 @@ static void nvme_format_bh(void *opaque)
     return;
 
 done:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
     iocb->common.cb(iocb->common.opaque, iocb->ret);
-
     qemu_aio_unref(iocb);
 }
 
@@ -5905,7 +5903,6 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
 
     iocb->req = req;
-    iocb->bh = qemu_bh_new(nvme_format_bh, iocb);
     iocb->ret = 0;
     iocb->ns = NULL;
     iocb->nsid = 0;
@@ -5934,14 +5931,13 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
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


