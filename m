Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E222558AB5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:28:07 +0200 (CEST)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UMw-0002y3-8b
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UE4-0006f2-D7; Thu, 23 Jun 2022 17:18:56 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UE2-00047E-JY; Thu, 23 Jun 2022 17:18:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BA92E3200953;
 Thu, 23 Jun 2022 17:18:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Jun 2022 17:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019132; x=
 1656105532; bh=URNdkGQ8Jhh3C9CNzgiSYcZOTDyRV0EKShg68E0eQCw=; b=b
 FQXeFiuTZbLjgvDR7+pxwBpg2apm4giODTBakR19fBZzH/8ADSAt7/0mYpm19y0T
 DeGmJtwmIuAeaQyE/0hAvXM/Sz3jf/GqSSsNVQufRP/zhEjlDyBaOMsGA0nVHrGT
 9zf5ub8d628pXbE0Zmww8tdYA8Oxn9byvn/BBoplFcHdX83BduLpZctwJMVEkyUc
 UHcSGPys4WlVCbzUhmJuXiEX7l/CYDsb8FctWIcGQY6bfscmieEbL3xnfY22N7J3
 PwlgVGzhlsUlS/NERdb0waz0mx5BpB9cWpGxKfNjYuQLt+RkqNMoXrBEDYwyTOJ1
 H8gFC5bCHWRHZ5bmWXcjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019132; x=1656105532; bh=URNdkGQ8Jhh3C
 9CNzgiSYcZOTDyRV0EKShg68E0eQCw=; b=FEUcdBWNcKNEFcn7kxPt8Xgcgg8u9
 b9j/vy7IXC+Wyo5ebySG2nwcDlPpmsJV1eHo8ucdmhHrcblx2sNBKXPRTbRU0/mK
 VEx7HiUAJTYjLE8yQ0fXVmPbLCnTT9zYL1JQt907rHm4KKE/N0Gw5OB4AzrTRFXE
 UtsqiMWFs2EcEnACLjvGGGX94Ui6q0AVLuNv2fgNBmX0+BtfmYtI3bLmCYdyAkAG
 EuBQvlWm6wUNvBkcuvhlWKPPi5iG1p9WtGX1Xk9yJBHXw4vIrenxWREW3mVybaMh
 hgmsILeLlNttlODm32Aj4TrvDkNC1NOr85eTaPgoXmA+IMpJnFkaG+5Kw==
X-ME-Sender: <xms:vNi0Yr_uVCKT4Hb5CWB2guzjlXvcEc51PtvYPv3gYdaTXoFG40WnqQ>
 <xme:vNi0Yntds-41xizizPU_3I0mqZn8gTz2LCcqbOQr0n0X6L-cIoXal3Ki_Slbm1axD
 sKegrnpewRWqlJaWnk>
X-ME-Received: <xmr:vNi0YpCnH5cYcKpGmA6oX2E1_ZqdCETg4r3Vtqd2vgUR7pASKLfxFLFg_AucEbKFAE1W9LlJDrluYsfeeSVH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vNi0YnckqWZMrTWFC1Hv0knkCV2pA_I9hL2jgdZrvIgIOVYSzltTBA>
 <xmx:vNi0YgM1v7jTLHJgZqyC-n-TIue98EnjZMF6DYMcDCliL25fXq0Csw>
 <xmx:vNi0YpngtGyFj34d1WEW2jPZ4vwKdxyC2_ZLinWGtzTyg0HDHMVa5Q>
 <xmx:vNi0Ylpglb3Vme3DeJldVNZslM3qjUd5bsfZRssdgGO9g6aSHbBDvg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 11/12] hw/nvme: simplify copy command error handling
Date: Thu, 23 Jun 2022 23:18:20 +0200
Message-Id: <20220623211821.50534-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
References: <20220623211821.50534-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Move error handling down in the call stack to simplify the control flow.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 50 ++++++++++++--------------------------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5eee730ed0cf..4d6b4c9f00ba 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2614,7 +2614,7 @@ static void nvme_copy_bh(void *opaque)
     qemu_aio_unref(iocb);
 }
 
-static void nvme_copy_cb(void *opaque, int ret);
+static void nvme_do_copy(NvmeCopyAIOCB *iocb);
 
 static void nvme_copy_source_range_parse_format0(void *ranges, int idx,
                                                  uint64_t *slba, uint32_t *nlb,
@@ -2726,7 +2726,7 @@ static void nvme_copy_out_completed_cb(void *opaque, int ret)
     iocb->idx++;
     iocb->slba += nlb;
 out:
-    nvme_copy_cb(iocb, iocb->ret);
+    nvme_do_copy(iocb);
 }
 
 static void nvme_copy_out_cb(void *opaque, int ret)
@@ -2738,16 +2738,8 @@ static void nvme_copy_out_cb(void *opaque, int ret)
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
@@ -2766,7 +2758,7 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     return;
 
 out:
-    nvme_copy_cb(iocb, ret);
+    nvme_copy_out_completed_cb(iocb, ret);
 }
 
 static void nvme_copy_in_completed_cb(void *opaque, int ret)
@@ -2860,15 +2852,9 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
 
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
@@ -2879,16 +2865,8 @@ static void nvme_copy_in_cb(void *opaque, int ret)
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
@@ -2904,12 +2882,11 @@ static void nvme_copy_in_cb(void *opaque, int ret)
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
@@ -2917,10 +2894,7 @@ static void nvme_copy_cb(void *opaque, int ret)
     size_t len;
     uint16_t status;
 
-    if (ret < 0) {
-        iocb->ret = ret;
-        goto done;
-    } else if (iocb->ret < 0) {
+    if (iocb->ret < 0) {
         goto done;
     }
 
@@ -2967,6 +2941,7 @@ static void nvme_copy_cb(void *opaque, int ret)
 
 invalid:
     req->status = status;
+    iocb->ret = -1;
 done:
     iocb->aiocb = NULL;
     if (iocb->bh) {
@@ -2974,7 +2949,6 @@ done:
     }
 }
 
-
 static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -3060,7 +3034,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
                      BLOCK_ACCT_WRITE);
 
     req->aiocb = &iocb->common;
-    nvme_copy_cb(iocb, 0);
+    nvme_do_copy(iocb);
 
     return NVME_NO_COMPLETE;
 
-- 
2.36.1


