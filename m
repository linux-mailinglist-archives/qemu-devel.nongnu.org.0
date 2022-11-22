Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84076336D4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOPw-0002Re-Oa; Tue, 22 Nov 2022 03:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPt-0002Qd-Mp; Tue, 22 Nov 2022 03:14:05 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPr-00032O-2t; Tue, 22 Nov 2022 03:14:05 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 10F3D32006F5;
 Tue, 22 Nov 2022 03:14:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Nov 2022 03:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1669104840; x=
 1669191240; bh=B56DPERl8CnD26jP56nVQriCz1nPl+8gf+cVseZCaP0=; b=L
 PUwGkKcx4i/SdxMlUl8hM6778w0aeRQQWdySiFoNrYj6fvfsD1zTA+qSAwn9eEkT
 GBs0SY0n084qdD0tEfO2+BLPGOe61LBb7lS6H4UTCTg4UiWyc7eP7/EPonD6rgbI
 mssCHajNEdZJpud+joQ0Q4VYphgGoaFnG53S0MciXBzytODACphGpRn+YNK3mFdV
 qPFjMm6SRdb1jLooBs/EUy3Qrqqv7urYemwFwamopyab6iapmGhcfuDiA971z/v3
 8ebI2L2QdMs9gcSWALMOBbD539E5OaXyt86s+10f1DHbrjYzfScxTvE0rUBfF0ME
 eGd7+fqPxBFz4VN3Fa5Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669104840; x=1669191240; bh=B56DPERl8CnD2
 6jP56nVQriCz1nPl+8gf+cVseZCaP0=; b=Z4wWCWYu/Dtk3apwRezNpC3sG8bWs
 Pq3Nmy9FjQ4/A+rGa0KGOjfTun3TbS2m2E7TpEaS8fJem1frwU6zHIvQyhL1EMuS
 VHEUL5ZaVU0Bf7afXgUrkqxOIPYRc+XUkUx2TWol79b/vh9vliGEYW0y6SnENQ9Z
 HtK1y8jlhH0XTWbjb8EZzqnRBlnCMCn8nIMZ8I94z3dEU/y/vW+i6q+R2+jq8dTw
 8BCD2/ERy73R3VpHQLNL4ngLAWVyPs3IMGD6OWfEoodHgdrk0Kjvdzzu/0Wx8lBN
 GsmO0PbQueWbzvRxY1gm/86wefuT+qskonyMGTp+At+kg3mFi7mAovlcw==
X-ME-Sender: <xms:yIR8Y02aNbyjr4vKIs43nk-GXKYcoMikq3YAjrKamjFAI4SYcner8g>
 <xme:yIR8Y_H8ZZjNX_nw4AyTuvijI36qQaDvdODmgCMP6Vu2wXnkMSOnpyvOlgJ7bOfRc
 afOkC3Uz6XQzHmt8C0>
X-ME-Received: <xmr:yIR8Y86QOahvG6MvdumPa9xR0g4tmVJa0urhAvWokQD6eRH6Er0Y9ybEDUs80RuIuLhID5ILsM7JnF7FkDfqffTIcU4H7hxmvj-35Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:yIR8Y90nZ79T3fQJKfC5dJaMr8QklpfpF-Tmub8hhaUBxeJIfNQeLQ>
 <xmx:yIR8Y3FLvM62frJuTMtYcNyMFCPb58a_IW_v1j1kIS7_PG-dDb_IZA>
 <xmx:yIR8Y29BBj1013qVzqFKDH5xig4WI6FFgw0tNQilRXylZxQpIqyVrQ>
 <xmx:yIR8Y_DFJQzcvz3I8nCE9dYyeVoNvGF1vbq2tzb140eh7VcRIZ_ADA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Nov 2022 03:13:59 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 3/5] hw/nvme: fix aio cancel in zone reset
Date: Tue, 22 Nov 2022 09:13:46 +0100
Message-Id: <20221122081348.49963-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122081348.49963-1-its@irrelevant.dk>
References: <20221122081348.49963-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230; i=k.jensen@samsung.com;
 h=from:subject; bh=C91tk6BQIFBtxXFmTqXf7JFgoOaGm2gm4YWNTxSAIlg=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN8hLxJvwuQuwCezN4dRvN/HPn0mxpw7kGiYzEr
 WbaEYt3/1YkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjfIS8AAoJEE3hrzFtTw3pyN
 YH/2jQv6lv0BwB/a+cpigABiUFyomUkypGLXopPIaXiZLF9HRbmj+m6lcGECZAVmy8RQp6WR/+/deU
 WkGXtiI3R8+hOcaRQEzu/6RwqIDzWSX7HpDHWq/Ylcq8JaX8IxNtQnvGNahFpTb3DuVh8icSYIXM5v
 kmHRfOUJhFr4EKW02UdMWy0XSdeX17T6kS+yB0OcF+Eqjju6VmDJ9WplXvg0znctzTfpHocnilnxyA
 QgXGuga8kOK3Jbr5zk6d3TpmzFoFJgGWKXy0HJYt1l5zdBPnpA9fgxTLcQzbaGrndyS4EoVJO1mP0K
 dU7022gteuypV6Rok1y+V2z37lBSnvm9yA86uN
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

If the zone reset operation is cancelled but the block unmap operation
completes normally, the callback will continue resetting the next zone
since it neglects to check iocb->ret which will have been set to
-ECANCELED. Make sure that this is checked and bail out if an error is
present.

Secondly, fix a potential use-after-free by removing the bottom half and
enqueuing the completion directly.

Fixes: 63d96e4ffd71 ("hw/nvme: reimplement zone reset to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fc129b8d1a93..558ccea154c2 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3712,7 +3712,6 @@ typedef struct NvmeZoneResetAIOCB {
     BlockAIOCB common;
     BlockAIOCB *aiocb;
     NvmeRequest *req;
-    QEMUBH *bh;
     int ret;
 
     bool all;
@@ -3741,17 +3740,6 @@ static const AIOCBInfo nvme_zone_reset_aiocb_info = {
     .cancel_async = nvme_zone_reset_cancel,
 };
 
-static void nvme_zone_reset_bh(void *opaque)
-{
-    NvmeZoneResetAIOCB *iocb = opaque;
-
-    iocb->common.cb(iocb->common.opaque, iocb->ret);
-
-    qemu_bh_delete(iocb->bh);
-    iocb->bh = NULL;
-    qemu_aio_unref(iocb);
-}
-
 static void nvme_zone_reset_cb(void *opaque, int ret);
 
 static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
@@ -3762,14 +3750,8 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
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
@@ -3779,6 +3761,9 @@ static void nvme_zone_reset_epilogue_cb(void *opaque, int ret)
                                         BDRV_REQ_MAY_UNMAP,
                                         nvme_zone_reset_cb, iocb);
     return;
+
+out:
+    nvme_zone_reset_cb(iocb, ret);
 }
 
 static void nvme_zone_reset_cb(void *opaque, int ret)
@@ -3787,7 +3772,9 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
 
-    if (ret < 0) {
+    if (iocb->ret < 0) {
+        goto done;
+    } else if (ret < 0) {
         iocb->ret = ret;
         goto done;
     }
@@ -3835,9 +3822,9 @@ static void nvme_zone_reset_cb(void *opaque, int ret)
 
 done:
     iocb->aiocb = NULL;
-    if (iocb->bh) {
-        qemu_bh_schedule(iocb->bh);
-    }
+
+    iocb->common.cb(iocb->common.opaque, iocb->ret);
+    qemu_aio_unref(iocb);
 }
 
 static uint16_t nvme_zone_mgmt_send_zrwa_flush(NvmeCtrl *n, NvmeZone *zone,
@@ -3942,7 +3929,6 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
                            nvme_misc_cb, req);
 
         iocb->req = req;
-        iocb->bh = qemu_bh_new(nvme_zone_reset_bh, iocb);
         iocb->ret = 0;
         iocb->all = all;
         iocb->idx = zone_idx;
-- 
2.38.1


