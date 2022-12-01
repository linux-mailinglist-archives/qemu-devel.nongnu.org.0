Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C3163F5B7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:52:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mlz-0000Ly-M9; Thu, 01 Dec 2022 11:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlx-0000Iv-5g; Thu, 01 Dec 2022 11:50:53 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlr-00011j-J1; Thu, 01 Dec 2022 11:50:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 768A35C019D;
 Thu,  1 Dec 2022 11:50:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 11:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669913437; x=
 1669999837; bh=FX7J8/sRMp1mCRrCC1Kf8RXdoMZyyoqm/n8QvBjbHpY=; b=a
 8Qv9NegRBd8a2KQUSrJw3QbwgoC3jvjV7wjNCrWqgqT9hrjCNHsi/AIGivCe3Wjo
 MreKKEzpENcl/ECnqrjD5lU9cn91xzDDbEajYtbwzaaNu4S7hfPn9/S+bTHvjClU
 QInaZrOAwPUrUJ8StDi0tM0qC0Uh4hENDEERT9DRbEyvtX7WucFm8CA68YesDYaU
 WrwtS2+VqWJgg9a4b/+F17rdNQDlQpHsg31gMQJkGOxZ5GmMu81l156qfnZsb+jR
 zILH9h0R9crMpe0GsNpPLjCGaP3rQG5BWAV/JjBDVLtM5T7OROVSQ1NjZhTA0mRC
 LebRAbndOCEv+P9qKnfyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669913437; x=1669999837; bh=FX7J8/sRMp1mC
 RrCC1Kf8RXdoMZyyoqm/n8QvBjbHpY=; b=NDMcCwULaPC6QuKaO1sIuz2m91jw7
 1DVzibKkL5BCxdGhYhGEGBQKVAtSkF6omKuYFlnH7INZ7a6Hpqv/AZexdb2PkQov
 x2+TNrdKSCcRMCfR+G9hQu3KpWtdk65UWHVk3URdy5hQHYOVYmTihGqiQWysZOJ2
 O5TH11q3ykf/52PpsqZs1TPIyUAdFz4A0nKicdHgE5Rnip94MHPBTbcMowMkNVVv
 r2XA+WJdnfdhT2We0SI5NlhE1JNC69+wcaOtovxkPVMvV69J1m5zPyrcTVLIl2Gi
 /W+bpety522lyYxdC1UsK1lIhvwMAluC62ybn6xHQ48tgz5an2kPth7qg==
X-ME-Sender: <xms:XduIYx4XNy_kaXO3fhSE24J3PVR4QV8HemO01rVtoJ3zhIxTlet-Rw>
 <xme:XduIY-7n1zRbm10qpNJqIZzhAN50PVv5y8obwiVTVtjF48U_cWViFugv0QD5aLxaC
 yQUzobQxeXFHVga-CE>
X-ME-Received: <xmr:XduIY4fsFaU6wldyho6wSw6T7ty-MC3VAp2CeLj6Z53RlFv3OZS2MMLJndZdl1f5LFys5P851wUJBKbxMsJGjIOZSk2q4TJjtCE5fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XduIY6JrLmDkQBzDxx9EqaYUGaWh2ZErNqbezcW7Hisdzr9espxe9A>
 <xmx:XduIY1IkE5qHzMu4jRwlsvJ9fXIo7mJtmb4WxwTuAnkoZ0kJlaidRw>
 <xmx:XduIYzy_RuW5-rACBDNpn7BtT7lsu_qfkU8SwBE3nK0EUnWxA3mtbA>
 <xmx:XduIY11QOUyBciJSwXm1Ql7CHCsjqvOJv9i7h8Op_tCgdtfn8s-HKQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 11:50:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL for-7.2 5/5] hw/nvme: remove copy bh scheduling
Date: Thu,  1 Dec 2022 17:50:24 +0100
Message-Id: <20221201165024.51018-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201165024.51018-1-its@irrelevant.dk>
References: <20221201165024.51018-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5233; i=k.jensen@samsung.com;
 h=from:subject; bh=YYP8uBStgeLY45WB9aMw/UdyJ2BfC/rjU1mMLPXzeGg=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOI21C48iOb5uEiqkb1LzWHeeKapErgHQOUS+0J
 /scSjXxaNokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjiNtQAAoJEE3hrzFtTw3pCU
 UIAKhy/IgKeV44j/KE9INeB8rhU0mSZabgE1ZSjn2NdKf5kHnE/MVprPaUqv21yJLg5bfaNqGuPih2
 LddHCocFtZhATumZX+aVkxSyqYnQnkTHzV6nr9fRGfhxqPlFlCxqfu0N+7goN9Xy3wTaRWV4lysvM7
 axT21a2rXaYLP78LK6/BElnNXY1bHckJl5CRG2TRSBnA/CWiVACor7THcfGczXpTQBjyofp8aMy6zY
 s1WkoOrlXtYU5M/Yud0N0jWodFfiZga9zoGjoi8ZnfsNovNHmkbPWtZCMegPuKaieKsptOm2Qptzso
 bzq7kc3R6m/C/mQa0kvNHS6RUKGTtfuIC3pLSg
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

Fix a potential use-after-free by removing the bottom half and enqueuing
the completion directly.

Fixes: 796d20681d9b ("hw/nvme: reimplement the copy command to allow aio cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 63 +++++++++++---------------------------------------
 1 file changed, 14 insertions(+), 49 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e847b89461f8..e54276dc1dc7 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2552,7 +2552,6 @@ typedef struct NvmeCopyAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     void *ranges;
@@ -2590,9 +2589,8 @@ static const AIOCBInfo nvme_copy_aiocb_info = {
     .cancel_async = nvme_copy_cancel,
 };
 
-static void nvme_copy_bh(void *opaque)
+static void nvme_copy_done(NvmeCopyAIOCB *iocb)
 {
-    NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
     BlockAcctStats *stats = blk_get_stats(ns->blkconf.blk);
@@ -2604,9 +2602,6 @@ static void nvme_copy_bh(void *opaque)
     qemu_iovec_destroy(&iocb->iov);
     g_free(iocb->bounce);
 
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
     if (iocb->ret < 0) {
         block_acct_failed(stats, &iocb->acct.read);
         block_acct_failed(stats, &iocb->acct.write);
@@ -2619,7 +2614,7 @@ static void nvme_copy_bh(void *opaque)
     qemu_aio_unref(iocb);
 }
 
-static void nvme_copy_cb(void *opaque, int ret);
+static void nvme_do_copy(NvmeCopyAIOCB *iocb);
 
 static void nvme_copy_source_range_parse_format0(void *ranges, int idx,
                                                  uint64_t *slba, uint32_t *nlb,
@@ -2731,7 +2726,7 @@ static void nvme_copy_out_completed_cb(void *opaque, int ret)
     iocb->idx++;
     iocb->slba += nlb;
 out:
-    nvme_copy_cb(iocb, iocb->ret);
+    nvme_do_copy(iocb);
 }
 
 static void nvme_copy_out_cb(void *opaque, int ret)
@@ -2743,16 +2738,8 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     size_t mlen;
     uint8_t *mbounce;
 
-    if (ret < 0) {
-        iocb->ret = ret;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
         goto out;
-    } else if (iocb->ret < 0) {
-        goto out;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_copy_out_completed_cb(iocb, 0);
-        return;
     }
 
     nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, NULL,
@@ -2771,7 +2758,7 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     return;
 
 out:
-    nvme_copy_cb(iocb, ret);
+    nvme_copy_out_completed_cb(iocb, ret);
 }
 
 static void nvme_copy_in_completed_cb(void *opaque, int ret)
@@ -2865,15 +2852,9 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
 
 invalid:
     req->status = status;
-    iocb->aiocb = NULL;
-    if (iocb->bh) {
-        qemu_bh_schedule(iocb->bh);
-    }
-
-    return;
-
+    iocb->ret = -1;
 out:
-    nvme_copy_cb(iocb, ret);
+    nvme_do_copy(iocb);
 }
 
 static void nvme_copy_in_cb(void *opaque, int ret)
@@ -2884,16 +2865,8 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
-        iocb->ret = ret;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
         goto out;
-    } else if (iocb->ret < 0) {
-        goto out;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_copy_in_completed_cb(iocb, 0);
-        return;
     }
 
     nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, &slba,
@@ -2909,12 +2882,11 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     return;
 
 out:
-    nvme_copy_cb(iocb, iocb->ret);
+    nvme_copy_in_completed_cb(iocb, ret);
 }
 
-static void nvme_copy_cb(void *opaque, int ret)
+static void nvme_do_copy(NvmeCopyAIOCB *iocb)
 {
-    NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
     uint64_t slba;
@@ -2922,10 +2894,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     size_t len;
     uint16_t status;
 
-    if (ret < 0) {
-        iocb->ret = ret;
-        goto done;
-    } else if (iocb->ret < 0) {
+    if (iocb->ret < 0) {
         goto done;
     }
 
@@ -2972,14 +2941,11 @@ static void nvme_copy_cb(void *opaque, int ret)
 
 invalid:
     req->status = status;
+    iocb->ret = -1;
 done:
-    iocb->aiocb = NULL;
-    if (iocb->bh) {
-        qemu_bh_schedule(iocb->bh);
-    }
+    nvme_copy_done(iocb);
 }
 
-
 static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -3049,7 +3015,6 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     iocb->req = req;
-    iocb->bh = qemu_bh_new(nvme_copy_bh, iocb);
     iocb->ret = 0;
     iocb->nr = nr;
     iocb->idx = 0;
@@ -3066,7 +3031,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
                      BLOCK_ACCT_WRITE);
 
     req->aiocb = &iocb->common;
-    nvme_copy_cb(iocb, 0);
+    nvme_do_copy(iocb);
 
     return NVME_NO_COMPLETE;
 
-- 
2.38.1


