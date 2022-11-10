Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2C623C55
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1d8-0003qB-Ar; Thu, 10 Nov 2022 02:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1d2-0003mN-31; Thu, 10 Nov 2022 02:05:38 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1d0-0007bp-7i; Thu, 10 Nov 2022 02:05:35 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 62C4C5C01BF;
 Thu, 10 Nov 2022 02:05:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 10 Nov 2022 02:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668063933; x=
 1668150333; bh=+q37KJqetTbMGxdU+/QWTLOK1xl3R4MQU0inD7AbpQM=; b=d
 V8zyYfpY8l7/pcf3kH0OnM/T1baHxFLZk+bu9AsJN1bRxcSMv+WZ0pq/H2Yhr7uN
 lRTyUljfqQIkQixim3HGRwlOuXMy1d7JXhhaxMkXUEVEjZWxV6KYWuzwNvsnsDhg
 bgqeBA8G13IAAA1fSgNCQHhF8xb+hZFEUsSI/7J8ZhyZLnMQqlOk+jgjiuiD80jD
 pYdfmQ8SsNh1hEGGkiW2PTYGv4+MXXffan60LbvGSkdRJthqsiVmbOdIA/UuSAJX
 QdPydYYY/YnL5993NyJpR7amgC9nl2TuCJt3GpCq9+BdoXjrFqw9d+Tt2Q6W5I8R
 MIOv90OFq9KjlGPm8RXeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668063933; x=1668150333; bh=+q37KJqetTbMG
 xdU+/QWTLOK1xl3R4MQU0inD7AbpQM=; b=wX9k3FtDgUwThvasZkxtd9b4Rv7Ep
 fG82oSztKTJRFUkm9vWRLUmnh09k0DDF1EVQ5986SyauOfa/XfWFZIoy0cwA9Vv3
 eSQ1nYMe8ADvhdgJNAx836vJZpOWQb3IYKBhUXlCl72nRAiDIifv1i1m27X6o5BX
 ar0jBT/T6pZgmfJ/UjirUGg6Bx3bKAr0m2lVHczE/+5+Q2K8Z1a7zOQpyrXRAP4U
 3WkE1LlZA2e+wr2JhY7/WKV7e1gzcNZxpeOXgrD6MPUdJmO+dl0j9IERjVo6u18V
 CzSQdgvceSjp5cchI6g+wn/Xic3emUlblK16mBnbZGABHDv2TY8RcseMA==
X-ME-Sender: <xms:vaJsY5cSbVZYJ96iY0Xl3cRVhztzk2M_QvHfaIDQo1v8CnNbY6UNLQ>
 <xme:vaJsY3OwTijHYB1-kcUaBNSvVY4kT5m-BHFUIPnMeZAfWDhhy-Iabh1wFgmhFqlgL
 -JRxCOPrySDoFgXamA>
X-ME-Received: <xmr:vaJsYyjLbDfLcGi7hSt5iqQWSHwVbjyMICExgaje1kCXxbwmhJ37L1jythYQz74haHylRGbN9pB8EZcxnj7QT8EVJaHInkBa6qtU0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vaJsYy_cm5WTcwMOKOJ0dnKeisk4eiYshpjsGyhSwz91hr_XoE80ng>
 <xmx:vaJsY1u-xrQeW-FuvW8XQbWkkFTTA7UOd3mNHdKb0ErOVuZa9N7sYA>
 <xmx:vaJsYxFrb25zlTaw1aAMjeVxl3xOht1BNsfyep1xOlIKJG_ci8s_qQ>
 <xmx:vaJsY9LB-V3L8JFp3GMlzHGkIRCIqIdfvCnoNZyJsucuZu6wiONEqg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 02:05:32 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 v2 4/6] hw/nvme: fix cancellation handling in zone
 reset
Date: Thu, 10 Nov 2022 08:05:21 +0100
Message-Id: <20221110070523.36290-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110070523.36290-1-its@irrelevant.dk>
References: <20221110070523.36290-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; i=k.jensen@samsung.com;
 h=from:subject; bh=n7Dcj1qGEyBaxhTLSaJ/sp063OE/KCgn13JRZLe8DfU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsorNwHW4m9wF91XzbKmOJp55FWQZjJos6T4e/
 3nW/12JioYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbKKzAAoJEE3hrzFtTw3pqg
 8H/0itizwi01O5jr9DL2bQmSyH1J8clyBx4pY2aaSEwvFC1gzgQgFg+Q/NncpsJuK3xc0d+c1Asgya
 BCqNsOxigFanibmvEChS+z0okqPCghyYcGkGjZGyHLQW3dGflIIs5ND8bvkD33t7YndfEh20XN60d8
 LXknswxAjHB/VM0WaOxKZ68b9MLh9PoJSVGd0bL2UiZ2Q6v1QiCHL2WRb5k3O5osxWSfjaPpQmzGR6
 HhT5DOt46L5J65jkuHyfiygen27mcuxSw3D+4dP+SSBH5BUhx6xupYtqw96z6HJH+0fK9cOipFwt24
 VcgU7IvjFXjVVTpF4MuUzTYAbSXqAvXMwXqK2V
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

If the zone reset operation is cancelled but the block unmap operation
completes normally, the callback will continue resetting the next zone
since it neglects to check iocb->ret which will have been set to
-ECANCELED. Make sure that this is checked and bail out if an error is
present.

Fixes: 63d96e4ffd71 ("hw/nvme: reimplement zone reset to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fe748fc18a2e..fa8e4b8dd53a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3772,14 +3772,8 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
     int64_t moff;
     int count;
 
-    if (ret < 0) {
-        nvme_zone_reset_cb(iocb, ret);
-        return;
-    }
-
-    if (!ns->lbaf.ms) {
-        nvme_zone_reset_cb(iocb, 0);
-        return;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
+        goto out;
     }
 
     moff = nvme_moff(ns, iocb->zone->d.zslba);
@@ -3789,6 +3783,9 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
                                         BDRV_REQ_MAY_UNMAP,
                                         nvme_zone_reset_cb, iocb);
     return;
+
+out:
+    nvme_zone_reset_cb(iocb, ret);
 }
 
 static void nvme_zone_reset_cb(void *opaque, int ret)
@@ -3797,7 +3794,9 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
-- 
2.38.1


