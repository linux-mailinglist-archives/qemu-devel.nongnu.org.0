Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AAF623C5B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:07:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1d8-0003q8-BV; Thu, 10 Nov 2022 02:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1d3-0003mT-D2; Thu, 10 Nov 2022 02:05:38 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1d1-0007fY-Ir; Thu, 10 Nov 2022 02:05:37 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C25235C0153;
 Thu, 10 Nov 2022 02:05:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 02:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668063934; x=
 1668150334; bh=dpK/AXVrw0wKyFZ+msLjs6r4jWGMrg7IpCn1dnDY/nc=; b=I
 7Mg1EYV9RpkOF7Rmk5PlyBdl94AphRwIMfGyKG+Ao/Di3Z10X1DvpZLvj6z4yYL6
 x3pjeH6LwguaXsTIz3MRR9GgWlGyFsl7902z/G/XGjZq/Opezf+vf5EvhK+QdPu6
 hdfHxIxfWLxWlRmqs9oQ+9Hjw3JlzNMjWTT3tw30RgOBP/R9pI+Fjryg5SjNwnns
 iPllLovsK2TGBfn50iWKF57sDU0YZL8upjFQVYJBL9LtWhAD3VlIIZmqhjePfpnL
 SApuM9deUy/tZLU2Ow7S0XSYrsmkB6WUtGlC693OtKhhvQRs2rkxVxpVRiV3Pmaz
 q5qjSye4hBsTb1DFEqzdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668063934; x=1668150334; bh=dpK/AXVrw0wKy
 FZ+msLjs6r4jWGMrg7IpCn1dnDY/nc=; b=SEnV4RUo6DmQUGx2OnEv6DMxK5K9y
 gVit1mRMKCa3A7L+XGJCQN8gYirEnGbqiSDCX0ZgY1DA8VMB4O02uVeHqXV/LTdd
 NWEOifb5cHJizIp7RWRVxcbEt9w0gGft/kOrEtpTtucmYoAYTQSwYiUS5hOLjTQQ
 Ku7+KdPOk103i9pgDUGZbGUZSuTz6NZQblu1PrrLJRYO1ERWb3RugZ6Lf+MTTlh2
 ODyXbxEQ/iin5H7v9BixiD4ClvY2a7bYGmTtaayo5u0MZ5esBQ3fPfCMcHBYY2oD
 z0BMDaU5ZLcX5NriQKBVW4+6um8XR1fzM9rJ7mZt83/fJDOVoZ3HxHrfg==
X-ME-Sender: <xms:vqJsY8PLtJyrqjww60SkDsRmoHeS3pkDcLRcX-gCRDdv4Wlb4XQS3g>
 <xme:vqJsYy8QxmEowK_xdTtUvNozrZfT-HCmKAy9u3lh2VrlHxUDoURz9mbB68ID9Wt83
 Vg_daSKiwNA0nat_uI>
X-ME-Received: <xmr:vqJsYzR2kzgRQs6weVfET8kWJqq6tFOEEhHNCqKLJPPOrrlQp1hxSmQjRAbde9wweyn6GTV6FEA7xFmKJ5cYRlwjAuNNmY5o6lSdaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vqJsY0t4z-e0_qn5X3D72ahThwhZy_LfZTUIOwjq3G39rtLxwFB-yg>
 <xmx:vqJsY0de0UTXQS5H1mjZ-lziGh9STsCwByJ3FYQ9_ts0GIJdFEvLzA>
 <xmx:vqJsY42KM2SixdQZ5h-MAmcCmLpqlfr_E5fofCAjh1_OmSB1B7nwGw>
 <xmx:vqJsY87Uu2y24ocSh5ZoOt_QFus-ONpg3YyMFk1qIw6jfbp3JYV91A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 02:05:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 v2 5/6] hw/nvme: fix cancellation handling in dsm
Date: Thu, 10 Nov 2022 08:05:22 +0100
Message-Id: <20221110070523.36290-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110070523.36290-1-its@irrelevant.dk>
References: <20221110070523.36290-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=k.jensen@samsung.com;
 h=from:subject; bh=tbY5b8GPyHs2k8mhY6tLvoyX/S+S++hnbWuhpyft6XU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsorM59JsO8gn3Q3VnLIr/+XUF/JybRzgeLMvQ
 9muVug12W4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbKKzAAoJEE3hrzFtTw3pAB
 gH/2z9NdSrQoqJQ3qcOkC4aSkgToXh1/1ypo+2xMKuqKuhxksBwEIpmj7FKdDne9ccx+Tfhe2r9ZM0
 +9UXkO5badIJV0NfiwFtkPA3Wu8pMG8NzGIpdl5gRIH+cJYR4ANv3pqfFjkZdPVpNvPukklcuqxQ4F
 LIOFV425oPHRxqbZhgdCXVjrrIBGxZUarHOkjWHWxxavG7O/rjwTyha3MCsLupr/ZFJSq3+SSkjxGS
 AZzCOMR+gTplgglv/18UUveXBGT0AuO89I1vrLyS2L6B13SuQcacAhSHlDfotZJkT9EicsjNgcl/Qc
 M+ZjFSBsP+ImcGWoRdDVHelSWto24jkt6KA6s9
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fa8e4b8dd53a..6f217c3951bd 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2384,16 +2384,10 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
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
@@ -2406,7 +2400,6 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     ret = nvme_block_status_all(ns, slba, nlb, BDRV_BLOCK_ZERO);
     if (ret) {
         if (ret < 0) {
-            iocb->ret = ret;
             goto done;
         }
 
@@ -2420,8 +2413,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     return;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_dsm_cb(iocb, ret);
 }
 
 static void nvme_dsm_cb(void *opaque, int ret)
@@ -2434,7 +2426,9 @@ static void nvme_dsm_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
-- 
2.38.1


