Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AAB558ACB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:34:52 +0200 (CEST)
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UTT-0003Wm-Ii
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDx-0006Gr-4A; Thu, 23 Jun 2022 17:18:49 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDv-00046I-Fq; Thu, 23 Jun 2022 17:18:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7E697320091E;
 Thu, 23 Jun 2022 17:18:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Jun 2022 17:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019125; x=
 1656105525; bh=urkDKj28QOaJNNz3LSM48EgyVlP0l7gXJ1kwu/bRW4s=; b=P
 PV5nQysTSSh9AEW7bw0BGLMuknaO4mhjJRW4aH+D6DZ+uydLBBLOKzQTqOC6K95U
 Zkzqpj3hUQEpzFGGGYSLigOP0HvRSB8RYPFqNF23/wSsnS6zijxw2+x4fWIWTirI
 2p9od6jY8RGkYA+5Yai5ORFfqUJrwPD15XEIc320ZUb5xWEwUxlgnwFhqVeGpsBm
 tDRhu5toYO7uKxoaA7G2EUNQ6DoPXwVd1BAkoAkaa3GoP9VdmvNrerZ2Ir/PQfRm
 KM1fSQq5RvB+ffugxBptyIP6Gv3ipp9A4vYDcXye26GCF2SEt5O3RUHaKJuMV/rC
 gkgIIwxvuTtir7577eT1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019125; x=1656105525; bh=urkDKj28QOaJN
 Nz3LSM48EgyVlP0l7gXJ1kwu/bRW4s=; b=qKb1pqSPOMsD4GopT1rZBgAe71cDW
 CXr/xf6wLgk2z3RwVMw3+alccLCjUG5kkCwDNB6bw1eNYDChYV0eKS80aEMf+Ru9
 WjSEe9Fn6Zu3TCnwFvRBcdVCMwNUu+28y910qFfLqByGXTlHZ/0chV01HBm+Teh1
 NvvN79paScPfDbWwE2SbiRw7Z8GQvPm/XulzC9e5+LGOBG7vACSnD/7D1adYG90o
 Gp7JZAN1+fEKZB9l0hSYD1kQDUBnBwzNeFT2OeBDWq1TJYWsUurQHL4+Lg456sv8
 Hgy1p/hiph599xguPd0+UsmrZ5mfvX6RRMXCsSYVkuPazFO82EEPhguFg==
X-ME-Sender: <xms:tNi0YqrEIn4ckNeyq62cTON0oqXjmcISUh_1WVWlQcUAFc8H6aKmGQ>
 <xme:tNi0YoqULPIgSb2oUCbD3yqzSlA-tdHKN4nEJbo9U8qQKQegxK219SG0dgfZiLKg6
 FuPmofNJMD02-OCce8>
X-ME-Received: <xmr:tNi0YvOSB70hhBkhvMrLV_jVj4fd90NEJ0UQwqyHX-EXZ-9ANIUnDJ98XmV9ONvWCvzntBEoDhz_1JB8Yg2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tNi0Yp5PJ8HiIzctFJNCr9G_ZA0uGrr3RNVWbW1By_xyC-9MKvgz6A>
 <xmx:tNi0Yp6eMDX3tpb8tdV3SIZFoYfoWljoJz_aoBHK94DKZW8YYPcmvQ>
 <xmx:tNi0YpgZxBLbDLd9fsE3KfwxSHiRub5TCtm-T5omR8J6v5n4QYHleQ>
 <xmx:tdi0YjkazTeA8WV7dpk-DCXZJqhaIzqa0F9IF1RgGNyHWcrX_xW1sg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 08/12] hw/nvme: rework flush bh scheduling
Date: Thu, 23 Jun 2022 23:18:17 +0200
Message-Id: <20220623211821.50534-9-its@irrelevant.dk>
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

Remove an initial bh scheduling and move the completion invocation into
a separate bh. Also, make sure that iocb->aiocb is NULL'ed when
cancelling.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index cea90cf65ce8..1acf88d9e8c7 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3168,6 +3168,19 @@ static const AIOCBInfo nvme_flush_aiocb_info = {
     .get_aio_context = nvme_get_aio_context,
 };
 
+static void nvme_flush_bh(void *opaque)
+{
+    NvmeFlushAIOCB *iocb = opaque;
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+
+    qemu_bh_delete(iocb->bh);
+    iocb->bh = NULL;
+    qemu_aio_unref(iocb);
+}
+
+static void nvme_do_flush(NvmeFlushAIOCB *iocb);
+
 static void nvme_flush_ns_cb(void *opaque, int ret)
 {
     NvmeFlushAIOCB *iocb = opaque;
@@ -3189,13 +3202,11 @@ static void nvme_flush_ns_cb(void *opaque, int ret)
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
@@ -3222,14 +3233,9 @@ static void nvme_flush_bh(void *opaque)
     return;
 
 done:
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-
-    iocb->common.cb(iocb->common.opaque, iocb->ret);
-
-    qemu_aio_unref(iocb);
-
-    return;
+    if (iocb->bh) {
+        qemu_bh_schedule(iocb->bh);
+    }
 }
 
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
@@ -3263,7 +3269,7 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     }
 
     req->aiocb = &iocb->common;
-    qemu_bh_schedule(iocb->bh);
+    nvme_do_flush(iocb);
 
     return NVME_NO_COMPLETE;
 
-- 
2.36.1


