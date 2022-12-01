Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435463F5B3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mlz-0000M1-O8; Thu, 01 Dec 2022 11:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlv-0000Hm-Eq; Thu, 01 Dec 2022 11:50:51 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlr-00011X-IF; Thu, 01 Dec 2022 11:50:51 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 02E605C0199;
 Thu,  1 Dec 2022 11:50:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 01 Dec 2022 11:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669913435; x=
 1669999835; bh=xhzJtcCUyy85UyC2FNJXI7BUgPe5ixAUSRRVPcBbq3Y=; b=q
 u1v2GUbPtSoEO0pnbLtSyiij1tE06PC570MFoDp1o/fNRhqFExEQXrMQERYA3jNT
 4o5TF+JYutNiIQLh/E03pKTHi+/4pa6fD2cOpmwMoqDW5eMkJiyblG+hewdkWWCx
 A7i7YCBxXPHlLEyKIe9l+sBbLk5XI+ivz1RocIsNRRLU88zQjh6zN5I2i92drn5H
 nTf97cpLYllT690qbL27ejcaGkhxz0NyDFEVcQspOpLGWiZFbA04/6763Y6bZI5t
 r2D6l9QcAcddikBrzX6zQUzFgQmcGXfVNznD7PPx6aRnJqG/KplfnDrOxsmNPYD2
 WmGE3XYYPsSr5IYiKnPTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669913435; x=1669999835; bh=xhzJtcCUyy85U
 yC2FNJXI7BUgPe5ixAUSRRVPcBbq3Y=; b=usUb5ns2q1s4g5nzdvxeLke+9/66r
 pa/bIdcpINeAsKWsAG5vlZXL2zOa9hSEzCeBM4TSch+dM/u6ZMPW+gh+Va3Kevkh
 P+S0byt0qhMQ4bP6B9Rdjl55U/tSqgNzConqNNj9qVw0ec1GK1ffublGEOv4Vvjb
 e6ghk2htjpC/ua2iAPGzNfhrUaTYeu7i07ZkjyWuX1/EwxstuwnGYJwfrvWSYzZo
 JLwgmlvFZAhkUlQcnyly1leieI5eP2fXJJGKR3bcXhYg9ajoif9iG+7Ojw9Tp23G
 GYSj+hDQZhecJAyFRFDq2MQ8XaMiKJ75naVJRPiBedWrc9E6erbm8vnrQ==
X-ME-Sender: <xms:W9uIYxX6kXz32Ad06febBuJtaTFvNGIzKxns-J-5m9eEKi5oWK89ww>
 <xme:W9uIYxl1KDr7NwJBuVF8bEJPmCjCHKEvtTmgeSncK_bSEfQHMfIXXqozvnaNjtHjq
 WL1W9EFyZO_sy-t5iQ>
X-ME-Received: <xmr:W9uIY9ap2rSivYgsmnyxRU14lTHnB9odYHBev6g1J-nuPFbR0ksSLu5zKVpUKYU9iG8fOsPcNjTHY2ol5Vv1mKqxEMwkzUpKn6H2CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:W9uIY0UA3N8jutzRPbhH0Ph7X0ov_tCeyqfdxDTMKwVdpUoWcOi0kw>
 <xmx:W9uIY7nfyUoyVB1MBNUIomHQJjX5s2nWT7Db1YBK1cPvOciMWGAwoQ>
 <xmx:W9uIYxcUZ2T6An_ZmLc4rcfdkDWJLvfwKl-IKDn3BMi6hIuwZcotMw>
 <xmx:W9uIY5hFvwwN2N09awtLINtYFnkADFYFCWFdOFH_GHldpoRcL0FIkw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 11:50:34 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL for-7.2 4/5] hw/nvme: fix aio cancel in dsm
Date: Thu,  1 Dec 2022 17:50:23 +0100
Message-Id: <20221201165024.51018-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201165024.51018-1-its@irrelevant.dk>
References: <20221201165024.51018-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3673; i=k.jensen@samsung.com;
 h=from:subject; bh=NgJITmtDtdnGN4ssoFa45yM5GbM7YaoerPemTnHoVrc=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOI21C+o5rlXlM2jTM8CkCj/XNQUWEgdBug9sqk
 RE5HOym0w4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjiNtQAAoJEE3hrzFtTw3p6r
 EIAK20PFdRANAYjGgpgrOXukdeLjsRxyDQnw1VpCYtnHQz/1T0dxsAw7DSPt93U6dqtp8rBI3SZ5QZ
 9Ydkl9PahEKtMfZpgjEQgVP0Lkcqigzeb6DXz2L0BnvS9Z+CKqKqjqqIrGe/MRsTvPAmPBhNSTf3Wp
 U3DeMOkZH9F0LBfUki56Y/BXShlHrUrhg1Tj4/dHhP6wSCGslXeI69lxZOcYINkDau5XaBKxPLoLlb
 ie7LQwl7N9Pk8kkSBhcONoyutbYZuBhPgP8cMIseO8vQOhle9pdHj7C5LHPiV8H+gQLp3mioedPXgw
 +f36DFCW5DD8UCpQl870FO4qaEQgpOddznHKFi
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

When the DSM operation is cancelled asynchronously, we set iocb->ret to
-ECANCELED. However, the callback function only checks the return value
of the completed aio, which may have completed succesfully prior to the
cancellation and thus the callback ends up continuing the dsm operation
instead of bailing out. Fix this.

Secondly, fix a potential use-after-free by removing the bottom half and
enqueuing the completion directly.

Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index bf4abf73f765..e847b89461f8 100644
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


