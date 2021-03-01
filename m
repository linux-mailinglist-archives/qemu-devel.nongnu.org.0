Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998832809B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:22:46 +0100 (CET)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjRc-0000KJ-Jn
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6b-00029h-LQ; Mon, 01 Mar 2021 09:01:02 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:49875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6U-0003xt-Ot; Mon, 01 Mar 2021 09:01:01 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA941580430;
 Mon,  1 Mar 2021 09:00:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 01 Mar 2021 09:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BKqC5nB4lrKxF
 WeGqV6vxzP+/JjW3X3UsPxYJmBXNBc=; b=BbvET98HZm7BfKmvZ7XYJudAG5At4
 wfp1F2iqEXaRjikJNnwoEEFyVlokftKV5hYv3njbExIYJ60dBXxoOWtJ1NuTuJud
 g1OMerxj3NKnB9CPJXDtgQhKeSA4+jDHWcDRqV8716EuxdFXieVnwR8VEZxkVRPR
 yixz4FDaaovLJT7XkqDnEa3I5YKagNA336CjqcIKX+Q7iAdYEr6SZxPWWUKXhUXA
 N7qPaXzWys+/6L/mBYo45ecdkqCgMcA1abP0ayGMa2W6Yju/mQIjLGtw3GzXzV2P
 yE9U73owlphP1wjLIcy0u3aR8VZ7uJtI1zTYC41K3Z8it52/WWXEEyZCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BKqC5nB4lrKxFWeGqV6vxzP+/JjW3X3UsPxYJmBXNBc=; b=dLMvB8yK
 18i+JUktVZ/4VxqUvRGPsrm0s5O87yxlRAg35iyBKux/0Eh8fcm4+ncL+Nqiv7CR
 So4gZv+LhsedCUlgO+q1FDGqM7kjEuaRyv/6uiuj1mH6MCCuMpzy0F08C6qQUQ0u
 3flpULx4jJuRhiZyyKYVBgykUZSUSBs8Kzw/svPg4d+hHPLL3DbvA7nZx3H7Vshe
 3o+hUkQXe70VL9uZuBm4MNRqlU49U31fpASJU2BH67EBduNv7IPkmGCdqXIDBPfv
 7KuxBvwv6poO23NjApWiPxu6qx084Yuow1D8N0OrtFaWE1E/vAKaya3VF95Cp6vB
 4xOCUPdKbI9UqA==
X-ME-Sender: <xms:lPM8YB8AbCD9KOz3WpVqy25EDMIXEkRXMizIpfyxD1DtECfRQ94IGw>
 <xme:lPM8YNVChkhfzDEgrTyvK2nSWeopXpZ__jlb4Z6_f2Ye6jfUEfizCILwhNwZuhLjO
 DJbJRQ88lZ5YP1U5fA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lPM8YMrN-mFX-zwacEVNdqfqMSWmPTKqqElMRxeQX9hVaKLYDO4EXQ>
 <xmx:lPM8YPnYcYKLJLzIZE13caUifWkpJBUOnyCRucI3uu5I8J6Lhv4knQ>
 <xmx:lPM8YM013juJDaQfxvppf1wBBehgUyBVKTHZ5zL5fLrCsbK-tBfSgw>
 <xmx:lPM8YOtJEXKKdxjvSsMtX2ccAtSzJOFxkFsuaaPbnNtUsMKNZwrjtg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D0A9108006B;
 Mon,  1 Mar 2021 09:00:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/12] hw/block/nvme: remove redundant len member in
 compare context
Date: Mon,  1 Mar 2021 15:00:36 +0100
Message-Id: <20210301140047.106261-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301140047.106261-1-its@irrelevant.dk>
References: <20210301140047.106261-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The 'len' member of the nvme_compare_ctx struct is redundant since the
same information is available in the 'iov' member.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index edd0b85c10ce..baa69a4a6859 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1697,7 +1697,6 @@ static void nvme_aio_copy_in_cb(void *opaque, int ret)
 struct nvme_compare_ctx {
     QEMUIOVector iov;
     uint8_t *bounce;
-    size_t len;
 };
 
 static void nvme_compare_cb(void *opaque, int ret)
@@ -1718,16 +1717,16 @@ static void nvme_compare_cb(void *opaque, int ret)
         goto out;
     }
 
-    buf = g_malloc(ctx->len);
+    buf = g_malloc(ctx->iov.size);
 
-    status = nvme_dma(nvme_ctrl(req), buf, ctx->len, DMA_DIRECTION_TO_DEVICE,
-                      req);
+    status = nvme_dma(nvme_ctrl(req), buf, ctx->iov.size,
+                      DMA_DIRECTION_TO_DEVICE, req);
     if (status) {
         req->status = status;
         goto out;
     }
 
-    if (memcmp(buf, ctx->bounce, ctx->len)) {
+    if (memcmp(buf, ctx->bounce, ctx->iov.size)) {
         req->status = NVME_CMP_FAILURE;
     }
 
@@ -1964,7 +1963,6 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     ctx = g_new(struct nvme_compare_ctx, 1);
     ctx->bounce = bounce;
-    ctx->len = len;
 
     req->opaque = ctx;
 
-- 
2.30.1


