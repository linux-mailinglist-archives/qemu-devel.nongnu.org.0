Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9363F5B0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mlt-0000Ge-SA; Thu, 01 Dec 2022 11:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mlr-0000Fk-Ia; Thu, 01 Dec 2022 11:50:47 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p0mle-000115-0T; Thu, 01 Dec 2022 11:50:36 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 169E05C019E;
 Thu,  1 Dec 2022 11:50:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 01 Dec 2022 11:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669913433; x=
 1669999833; bh=TqrX8aYaYyYeBNnOyObLeoI2PBPSkqeBYdmIchkhRz8=; b=m
 fpWeiKfjkNWyFeRlEQLIGBAStoxiUUraTlxg3hnGdcoIYNO7cyDtHFu0vu0no9Vs
 4yFnyuONegm23wGLoCUlRmOMbXIQjEVWrK8cVetlsO/FAMr88VwiyUIAtS5w6PWx
 /KcvWbdx4MaclOA5ZJDyK9VUBCxIIGqje71EZWEukNAuXWfIoz68Q98GFT6RaDJp
 tJ1c3TheqYv54EnMJp4Tqymj1QpPAYpJ60fo5fzBTz6sPg8SS1wVhtMUl0R9gaR7
 VzdR7trN3HHtC/q2FdUNYU4Iu3SGDaswfEHtbpPSx0Gxj1qPZR1RYakiCEFc4tNz
 GBo9PfNeBzsq2rZ8XngUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669913433; x=1669999833; bh=TqrX8aYaYyYeB
 NnOyObLeoI2PBPSkqeBYdmIchkhRz8=; b=OkW+eb2yIJf7pQNgaf7yHaWEorp2f
 KCXaC/YIzAHgS8nDHUBIGE6wThIjAHtxjU+uOWcF8LLTjK6/pgcTErsiuIcOWVfy
 Jv7mJcMZI0KVqWy49WYn2EM64mZZUrf3KBUATR+6MKczAwPPgYe9TqwKUxKzGG4M
 /Ft8RqTt5SpB8qW+1APhTrGhdBJvvBM6Cj8+qKITYltisd0S+PcACYrIFa7GbCI2
 /69e9F9rGwn180uQBB0j2p1Vb2cmWjQNZhilCoDi25nugKVdC9T8rUb1IR5QTjKt
 6YdCdJYRJJLAs4saROWxU68LByvnNcq9E/4/J7F5070AGfz2r+rrHWPZQ==
X-ME-Sender: <xms:WNuIY_D3ZEa5H_3JJfHqqG3sgdwd7t0wMO2sWKTWCQ1yuXv0XpLLbw>
 <xme:WNuIY1hN9agGkfY4zJQdfLmiiWxvYtmld0Rp2qC3i0gXAFFidxpSNhxVZ4sszXsno
 uUkIoST56OaLIxTHig>
X-ME-Received: <xmr:WNuIY6lWb-geWuBP-1pt-3cTR17JNdBRj8LHEc933OgouiDGQYsrH97_oTnEj-UdyPEPACTyfMQMBVmVn633jFVqU30Rj5lbFlNGBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WNuIYxwo87UzG-fbliCDc_eCULxRBgHfd_lirIsPO2J0XIURMCpFgQ>
 <xmx:WNuIY0QApWyI5l_z12_Tamy0ecMJQRDP96pTK2nvRjdIcpLakUfFqg>
 <xmx:WNuIY0bRFDgk_825N3nEd-woTIfOnjeIn7p-Et6JG2Tg6oL9vEtDOA>
 <xmx:WduIY6fZb8df9rfkiwI3HGoVokTbkHrRjm3I_bM1Cdr5KfmI5geS6Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 11:50:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL for-7.2 2/5] hw/nvme: fix aio cancel in flush
Date: Thu,  1 Dec 2022 17:50:21 +0100
Message-Id: <20221201165024.51018-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201165024.51018-1-its@irrelevant.dk>
References: <20221201165024.51018-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2596; i=k.jensen@samsung.com;
 h=from:subject; bh=avzERG+brYvQDBEX92TIH/6WWgSMh4xCDUsNn3ctL5s=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOI21DNKVJak2gKX0NBx96V7ndXQRqgIBP6hYi5
 Z5uwXRLC9IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjiNtQAAoJEE3hrzFtTw3ptT
 QIAILh/B+hQHNLimn3xKSWANIh6peKgUWui8sWXB+sovWdHBBRNCaoiBapwpnVhEJSxGDHXujBYn3r
 WGCAVDA5jBAmF6+dQROwoXTurC8oQMoKieoHYN4I5xXyYmpEOoPYAUy/FcY8mrjxKK/dijEHLPVYmb
 pg6F/aIr/f/1LeuiSzMMe64uQdZAlUbFdquZguC2bxQvrbmXPOGsYikLM6ppwza5PK3w+O8NP18MlG
 pM+ilJ98HfDonKilYBDu+KPuigtQFtUa1ZqEBleYupYAqGIYbOsG6hkZuc8dOPs7XWoGpFQyGOiL+1
 AQ2qCKnqOYjXUgbLMIWPBVtwWCeAxM2lGnbqkg
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

Make sure that iocb->aiocb is NULL'ed when cancelling.

Fix a potential use-after-free by removing the bottom half and enqueuing
the completion directly.

Fixes: 38f4ac65ac88 ("hw/nvme: reimplement flush to allow cancellation")
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9bc56075f66f..fede5af6afd0 100644
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


