Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61F649F60
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:06:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iP7-0000Vg-Ip; Mon, 12 Dec 2022 07:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iP5-0000TK-Tk
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iP4-0000Xh-BZ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93Vb2O90S1QkJg8CKuiinms78f3vrRZAmob0IGqZ83Y=;
 b=d9H7wgFdWUKwyGj7Dw3ybdP22j0mbi/JW+B53XoL1MHiA9WgWH3QTxtREUU3395AG8TlpC
 z6qcvyUbqs0h3xxOKAKOgSnHjgAACfQ2T3xrc4L+YTQR12SqoUSRCjURbAu7le0T0heps8
 ZqBqL2nSI+R560KfVLB9rAY5Lo/ysok=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-AMRUJpDbP_CKuUn09SKAOw-1; Mon, 12 Dec 2022 07:59:28 -0500
X-MC-Unique: AMRUJpDbP_CKuUn09SKAOw-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so4134869wmb.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93Vb2O90S1QkJg8CKuiinms78f3vrRZAmob0IGqZ83Y=;
 b=3LthB/9VhSJVhpNyFL3a+EUEMr3XMaS+x62FDcZPR20QtMc5zswRRgbJ5YwIAX576w
 s81sG9oe/GjicN7yznV2rkGDL9EGziLcdBOFLiOw2XrBRGhozKZUJnLwmyaZyr34Sqfp
 jrH9zTuKKRgaYtquqWt8A0ymRP9WMze4qHpTd3RXx7ua+2Xi+HFzI5bI2Wb0b0lvOrC6
 OHXkmJhjG/uEsFUscRFWjzYyHYaoxpILRdCbwq1QRK6xwsrq6gfuV40RhHGOLdnVsqw7
 pCnYMBAuOTtpriPv0NLu5K2NbduWkJvBxDLZvnj5neNTDhzuNy5HQW477ffB1uRGSjnA
 QS3Q==
X-Gm-Message-State: ANoB5plmUIbMRNCxe70uvLWgbrGabBKxoIE15obRcZxAHpXUKmuXTSa9
 HFoodUdfJ7Sm7xb32aHxJYzqyChh5QMYLhl0gIeMGFRyfNOyLvIL4kvTxXLKePGogohYu/ks9wJ
 6B7Flx8AD8qrrgFjIl6jU7NB2gtutEaMs2ODneIUsGDM+J7EM8C2yQnoEWvTkTHzW+OI=
X-Received: by 2002:a05:600c:1e88:b0:3d1:efa1:3689 with SMTP id
 be8-20020a05600c1e8800b003d1efa13689mr11967736wmb.24.1670849966522; 
 Mon, 12 Dec 2022 04:59:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4DUVH2KtukyGjZbouJxlRkpu5qOKN97ixm6Xjw5WQ/tpXeJ6xjs0TaAbO96Iz+8KEZzEaMIA==
X-Received: by 2002:a05:600c:1e88:b0:3d1:efa1:3689 with SMTP id
 be8-20020a05600c1e8800b003d1efa13689mr11967720wmb.24.1670849966213; 
 Mon, 12 Dec 2022 04:59:26 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c66-20020a1c3545000000b003d09150b339sm9392544wma.20.2022.12.12.04.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 01/15] Revert "block: Remove poll parameter from
 bdrv_parent_drained_begin_single()"
Date: Mon, 12 Dec 2022 13:59:06 +0100
Message-Id: <20221212125920.248567-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This reverts commit dcc5d4bc2abed4268bf31908193c4369e4c9d005.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                  | 4 ++--
 block/io.c               | 8 ++++++--
 include/block/block-io.h | 5 +++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 6191ac1f440c..87022f4cd971 100644
--- a/block.c
+++ b/block.c
@@ -2377,7 +2377,7 @@ static void bdrv_replace_child_abort(void *opaque)
          * new_bs drained when calling bdrv_replace_child_tran() is not a
          * requirement any more.
          */
-        bdrv_parent_drained_begin_single(s->child);
+        bdrv_parent_drained_begin_single(s->child, false);
         assert(!bdrv_parent_drained_poll_single(s->child));
     }
     assert(s->child->quiesced_parent);
@@ -3050,7 +3050,7 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
      * a problem, we already did this), but it will still poll until the parent
      * is fully quiesced, so it will not be negatively affected either.
      */
-    bdrv_parent_drained_begin_single(new_child);
+    bdrv_parent_drained_begin_single(new_child, false);
     bdrv_replace_child_noperm(new_child, child_bs);
 
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
diff --git a/block/io.c b/block/io.c
index f4444b7777d9..aee6e70c1496 100644
--- a/block/io.c
+++ b/block/io.c
@@ -53,7 +53,7 @@ static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore)
         if (c == ignore) {
             continue;
         }
-        bdrv_parent_drained_begin_single(c);
+        bdrv_parent_drained_begin_single(c, false);
     }
 }
 
@@ -105,8 +105,9 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
     return busy;
 }
 
-void bdrv_parent_drained_begin_single(BdrvChild *c)
+void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
 {
+    AioContext *ctx = bdrv_child_get_parent_aio_context(c);
     IO_OR_GS_CODE();
 
     assert(!c->quiesced_parent);
@@ -115,6 +116,9 @@ void bdrv_parent_drained_begin_single(BdrvChild *c)
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
     }
+    if (poll) {
+        AIO_WAIT_WHILE(ctx, bdrv_parent_drained_poll_single(c));
+    }
 }
 
 static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 52869ea08eb5..75d043204355 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -308,9 +308,10 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 /**
  * bdrv_parent_drained_begin_single:
  *
- * Begin a quiesced section for the parent of @c.
+ * Begin a quiesced section for the parent of @c. If @poll is true, wait for
+ * any pending activity to cease.
  */
-void bdrv_parent_drained_begin_single(BdrvChild *c);
+void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll);
 
 /**
  * bdrv_parent_drained_poll_single:
-- 
2.38.1


