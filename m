Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38AE558AE2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:40:56 +0200 (CEST)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UZL-0007uz-9h
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UEQ-0007Qi-OD; Thu, 23 Jun 2022 17:19:18 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UEP-00047a-0o; Thu, 23 Jun 2022 17:19:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2819D320025E;
 Thu, 23 Jun 2022 17:18:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019134; x=
 1656105534; bh=RdetYxis/WUrSIhNp79V8/GQNGJ3LxpRdXFX7z5KRpE=; b=N
 aAUeoQPAEFv1pOtCfvWDtkvwoUNeuUzdhmSQmcgYn2JChNCKwVKUJmRmgoj6Hq1R
 P7sIqNscQhDc0YD45uy5JfYbHIk9yntycMS45tL5g9Yrf0ZYtAoxdVSedkqAn4MX
 V0TTtdJ6VlpqLi6HLtwQh++4sopuec/vD7DnT4z8c4pZlorJuc8pkvUrJpz5vs0e
 AwrkdVJKVZWkcwFE3Z0wpX43Dll34+4bhiylahiCuk6icQ2+PdJhzWjcFZ1PYvpd
 8hf41EXRdvSIjDRav1au6Xv5XBFbwXM+nvvRJF3+p2pw6O3jYN9boLgwzM1QnJiO
 Yd4ApOs2+j6fSmg+k7+YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019134; x=1656105534; bh=RdetYxis/WUrS
 IhNp79V8/GQNGJ3LxpRdXFX7z5KRpE=; b=CLnCGbEtC/SkR9qM6JkZ39EqqaKuT
 w6/ML/hUOCvcNISjGtnpRnD/4vmNohHzCeY/6HARsp55v6eLBtftJmxFTatZrv3I
 xETpjuc4V2WvM8VlQLpxLh/roUvolcChrSYqpcWiLuK+hMLFEdjgn4Ulqyh1R3pj
 b7aqtJ3VXE8KBxMrDEoHPLOuFRJGFv5lg8SaZ6tMEAIRQKHg13CSNratBiy9Mgqp
 d8Btij1ktOqiVIJQCXtd4iHlKI1/pYlwdLxnpwtHxeWmHZ1Lhr59mSIJ2vfcIijR
 d6G/xLxwhvUEAxF5OLc3vu1wWoOAxATjlyN5k+AZWc6DPLc5+kLBLajGQ==
X-ME-Sender: <xms:vti0YoQllHbfVPEqR2c07Z1iUkjnD1ugBcxo0zMDhgb5jnBpVV7lHA>
 <xme:vti0YlytbuwN4UP1KlKEeXNhziZ6_vEYjUP2QrSTinfzIQWIgTb1Gt-aBne3E1Cga
 vNX9URJp6GLAG0UTJQ>
X-ME-Received: <xmr:vti0Yl3QEKtdz1SNSGVnjlwOZ9oV0br-YqL8_mi1YTYgwweG4Cn8zDMT0kQCTz37aBPJAJUpEjBfvJgY3nUi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vti0YsCx-_FZ7C3lmFj1yrL0aYzhiXtpVLgm8kSTV_gXUqhhiKubjQ>
 <xmx:vti0YhjzIMPSpvJYzto4D6Pq6a6r3FfFVBHdYCLy-mwIkJrBgKEw-g>
 <xmx:vti0YoqtdRpxWmd5fbHiYhbyrL_r2iOCztrUVD69gYhbO8yRxZbL7Q>
 <xmx:vti0Ymt6jjDz93ZDWdnH1KEujrXZIg77529k58FoM68m69YDeZu-LQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 12/12] hw/nvme: align logic of format with flush
Date: Thu, 23 Jun 2022 23:18:21 +0200
Message-Id: <20220623211821.50534-13-its@irrelevant.dk>
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

Use the same logic in format as in flush, saving a bh scheduling at the
start of the operation and moving completion handling to a separately
invoked bottom halve.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4d6b4c9f00ba..0e6f4d71134b 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5608,8 +5608,6 @@ typedef struct NvmeFormatAIOCB {
     uint8_t pil;
 } NvmeFormatAIOCB;
 
-static void nvme_format_bh(void *opaque);
-
 static void nvme_format_cancel(BlockAIOCB *aiocb)
 {
     NvmeFormatAIOCB *iocb = container_of(aiocb, NvmeFormatAIOCB, common);
@@ -5628,6 +5626,17 @@ static const AIOCBInfo nvme_format_aiocb_info = {
     .get_aio_context = nvme_get_aio_context,
 };
 
+static void nvme_format_bh(void *opaque)
+{
+    NvmeFormatAIOCB *iocb = opaque;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
+}
+
 static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
                             uint8_t pi, uint8_t pil)
 {
@@ -5642,6 +5651,8 @@ static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
     nvme_ns_init_format(ns);
 }
 
+static void nvme_do_format(NvmeFormatAIOCB *iocb);
+
 static void nvme_format_ns_cb(void *opaque, int ret)
 {
     NvmeFormatAIOCB *iocb = opaque;
@@ -5651,6 +5662,8 @@ static void nvme_format_ns_cb(void *opaque, int ret)
     if (ret < 0) {
         iocb->ret = ret;
         goto done;
+    } else if (iocb->ret < 0) {
+        goto done;
     }
 
     assert(ns);
@@ -5672,8 +5685,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
     iocb->offset = 0;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_format(iocb);
 }
 
 static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
@@ -5697,16 +5709,15 @@ static uint16_t nvme_format_check(NvmeNamespace *ns, uint8_t lbaf, uint8_t pi)
     return NVME_SUCCESS;
 }
 
-static void nvme_format_bh(void *opaque)
+static void nvme_do_format(NvmeFormatAIOCB *iocb)
 {
-    NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
     uint16_t status;
     int i;
 
     if (iocb->ret < 0) {
-        goto done;
+        goto out;
     }
 
     if (iocb->broadcast) {
@@ -5720,26 +5731,23 @@ static void nvme_format_bh(void *opaque)
     }
 
     if (!iocb->ns) {
-        goto done;
+        goto out;
     }
 
     status = nvme_format_check(iocb->ns, iocb->lbaf, iocb->pi);
     if (status) {
         req->status = status;
-        goto done;
+        goto out;
     }
 
     iocb->ns->status = NVME_FORMAT_IN_PROGRESS;
     nvme_format_ns_cb(iocb, 0);
     return;
 
-done:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
-    iocb->common.cb(iocb->common.opaque, iocb->ret);
-
-    qemu_aio_unref(iocb);
+out:
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
 }
 
 static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
@@ -5786,7 +5794,7 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     }
 
     req->aiocb = &iocb->common;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_format(iocb);
 
     return NVME_NO_COMPLETE;
 
@@ -5794,6 +5802,7 @@ out:
     qemu_bh_delete(iocb->bh);
     iocb->bh = NULL;
     qemu_aio_unref(iocb);
+
     return status;
 }
 
-- 
2.36.1


