Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F46336DB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOQ4-0002V5-K0; Tue, 22 Nov 2022 03:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPy-0002Ts-27; Tue, 22 Nov 2022 03:14:13 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPw-00033Q-7k; Tue, 22 Nov 2022 03:14:09 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4546532002F9;
 Tue, 22 Nov 2022 03:14:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 22 Nov 2022 03:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669104845; x=
 1669191245; bh=j7y/MWN6fNT+OKWecTnjw0YE7RbwUbItNh/m0jJTFLU=; b=d
 LYkpc5puOQtBT8RbCs6y7RQmxXguaHoDAVzAa8FgMoz0AYFIB5GrQCIrd1WnzIB4
 Kpnvuw44QiKvBuIZ+4QVBut4AkulYJbgDwOm3CtQbp3qduCEkC/V+kZ3CV8etLZm
 Vp8O2F7y6vE/uBu+m73Fowrq7M2uo8jX0Vs3BNA2dq2t2kaC5oZ001nocuRKm/4q
 v56IeUvRoF9rzbzJeBkVonDKHZFCqgJ1+nY6EhrzZDghJj5tpkAX6Tzjb6jJBP1M
 fwsRucUok1T9qtz1V9+sw6bPoVOIj0T87weubEng6JyLnUygZejhKBXwuuWFbOwr
 WcP0lkXi4xzxOaP7inezw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669104845; x=1669191245; bh=j7y/MWN6fNT+O
 KWecTnjw0YE7RbwUbItNh/m0jJTFLU=; b=HmCLVDRhn9y0iFkL7RBCUOboGs9+Y
 E04icGeuCziYyukmPFrhWo/W52XQaVAqzBCKte1BZQ1zV1mvD+ZNpMFw21LTpkcM
 O0lQ+h84uFOJs5ArYFY0BJgco4xLovJMTY9RgW5upgOlSoeIltId5Kpv+be71dc5
 AjE5PvAvU69qqJ7XDiVClocBt3mjq0/69I98q0S3Wp3L940qZe28VnI51hs5+I7J
 yAteGcCfhnoqFKMPqKrozRA5NWXUesLKrKZmihSu+olpxocEMCa8gWWTDLjGXKzh
 a03+86rMP8qYyiTNEYui87WMj60hcg2B0YEjbl6Tec8JEKikwQ1gozqXg==
X-ME-Sender: <xms:zYR8Y0679Vm9GN9Db5XmENGYChUtifH3pUN8PM6C277fIj3ZJzlwcQ>
 <xme:zYR8Y17wxqsXtSFofRawj5f2Xk6q37dK6eAi-tq7pug3ceIdQyzfsbTUNIrl-j9Yz
 cJfoROn1YEs1JtBIuk>
X-ME-Received: <xmr:zYR8YzcksfHVAU-zht6GtyfW32w4S6VO4JezJjRxpTNtTxBiv3DGpGfQkaOprGAUlJ41aiL2S2pLScLvZfUcF9bMI-kUORDH-IqNow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zYR8Y5JBjWigq6L5R-7CNsYL_j3jFPNbQ4O6SnCjGO0JYeN1OwPzfQ>
 <xmx:zYR8Y4Lb6bdMgGkCHVjD2O2XU3Sv02pe5Ib3h_EwG133HXyVmHmwqA>
 <xmx:zYR8Y6zehwJeNpL6-YWObaHNrnraSbaPTYPaaVyOt3QxXGgKfbjBqQ>
 <xmx:zYR8Y83tVJ_-pbeNt_3k8oQvaW-5LwaVoN-LeDLTs70qJG0fMtEPBQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Nov 2022 03:14:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 5/5] hw/nvme: remove copy bh scheduling
Date: Tue, 22 Nov 2022 09:13:48 +0100
Message-Id: <20221122081348.49963-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122081348.49963-1-its@irrelevant.dk>
References: <20221122081348.49963-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5187; i=k.jensen@samsung.com;
 h=from:subject; bh=r8xt28hL2XjHXyCxH8P3dGAxaIUzlrpd/Tbu7TX7HXs=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN8hLwM/deV7QbdUrZi96C52YR0lc86vwT0dQ+w
 xtsh3hL904kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjfIS8AAoJEE3hrzFtTw3pRV
 wIAL+nRYyp2s+8BTVEZcJSb9w0H5EdmnvIzra258SnLbjf7FBVd1DINbX3CRaI7PheDjU3HWSwTUiD
 T8JYDfhQ9vsF0HUzcr35zuAit9ebJ11QkhMv0Ibrh8h7r/nrJof5qgGUJ8l4FZrHDRL6WUlgsz2kc5
 280gOpG4h1CZfcTOg67TIXlWUPLaV4cj1+km0F1Ib5Ro7J0EH6/evYURRPeLHwgiprpBQhI9aoGn1t
 uMaRaRtTdL9UOuaSnp1zoR21dxiR01nyPpoWmOgeHM7sDQxwGwkEwciLOdJM0xhmQGFp4rcwoqnd5+
 BY1WRodvMvkQ3GGADGanRTpBZnEM7B0McWsazD
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

Fix a potential use-after-free by removing the bottom half and enqueuing
the completion directly.

Fixes: 796d20681d9b ("hw/nvme: reimplement the copy command to allow aio cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 63 +++++++++++---------------------------------------
 1 file changed, 14 insertions(+), 49 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 458c85d47cce..bbbab522aa7a 100644
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


