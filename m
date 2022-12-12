Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF19649F4E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:01:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iQS-0001nd-2w; Mon, 12 Dec 2022 08:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPk-0001Mf-MQ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPh-0000sB-HR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670850008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcIXilAWoE8KTc2TcLHja/aK6r+Hwo53E5xRR0bpKH0=;
 b=B7iQdJ7mJ30zl03WMLc7dznB+ix013/7k7DmZUBuVIW2sH279ZHlK+YsCQrlfHR3zsWMoK
 RQNib7cVto/6ZbAPC5VGfG0VxfywS6z91mVtDOSRQ0DOyIOE5ty0quW85mADVDqLyXfOqY
 b5TeKvQbf1KZnXHp58cg1yq5/SrpOYw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-E8lZCdFYPgmx8Q1YFJbYgw-1; Mon, 12 Dec 2022 08:00:06 -0500
X-MC-Unique: E8lZCdFYPgmx8Q1YFJbYgw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a6-20020a05600c224600b003d1f3ed49adso1970922wmm.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QcIXilAWoE8KTc2TcLHja/aK6r+Hwo53E5xRR0bpKH0=;
 b=dnrSxRDCOQfdFI3Hse3RnkuV8Kf0S7qDyI5KaAH9i37hjqfhhiboe9Bnbk3vDNkt4W
 fQbkQSKqohmSskTM5OkHC5a6U5iX/3v3c4fx0lrvIG9Kx0F3gpIvCOE7eVHr6RBiyrQn
 NbGxbPvhEwGHxx7K+ZaTt3G2M4sVmUmblR3uwNAzQggGTsFK6SSt9ghxfrJNdpF+iLdf
 dteG9A9ZaJjKmWsjEDgrGk+1N/PpUDUDHMSnXL2Ljwyw9xshiv08FYXlXINzJO28HhNw
 BwQMBjZFy76rcRGGT/xlU7Y30/1n276TU14zPl+0MMZ4qHb9tsL8U/VymhxjLUFHqgFM
 Q2+A==
X-Gm-Message-State: ANoB5pm0kxarDT4Y4dW1EC6Td4PpwBdzEkFor6A6gvGxoe1XjHiNh+BT
 abv49cwj/k15nhC+OdV6zCBw8Vey0+95pYpLAU9gm1wtEtWBjQl+DAatSUzvjZ4yBIKHZSDoIJu
 fK3VQx6EjOyFEoOMYJTRJpZv6Py0To9UQJPAsEjM1ncN1mfpSR4TzoYDYI8QhluPMEuE=
X-Received: by 2002:adf:ebc3:0:b0:237:45f1:7f12 with SMTP id
 v3-20020adfebc3000000b0023745f17f12mr13051761wrn.39.1670850004580; 
 Mon, 12 Dec 2022 05:00:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4eCNi+tmDuMw0FfO/riKnUae2Yif7HBL+CNw1JfW2q026hX1nPQF98WsAY9jFWZqs1u03p1Q==
X-Received: by 2002:adf:ebc3:0:b0:237:45f1:7f12 with SMTP id
 v3-20020adfebc3000000b0023745f17f12mr13051720wrn.39.1670850003976; 
 Mon, 12 Dec 2022 05:00:03 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b17-20020adfde11000000b00236545edc91sm8758968wrm.76.2022.12.12.05.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 05:00:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 14/15] block: second argument of bdrv_do_drained_begin and
 bdrv_drain_poll is always NULL
Date: Mon, 12 Dec 2022 13:59:19 +0100
Message-Id: <20221212125920.248567-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Remove it from the functions, from callers/callees such as
bdrv_do_drained_begin_quiesce() and bdrv_drain_poll(), and
from bdrv_co_yield_to_drain() and BdrvCoDrainData.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                  |  4 ++--
 block/io.c               | 49 ++++++++++++++++------------------------
 include/block/block-io.h |  7 +++---
 3 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/block.c b/block.c
index c542a0a33358..676bbe0529b0 100644
--- a/block.c
+++ b/block.c
@@ -1186,13 +1186,13 @@ static char *bdrv_child_get_parent_desc(BdrvChild *c)
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    bdrv_do_drained_begin_quiesce(bs, NULL);
+    bdrv_do_drained_begin_quiesce(bs);
 }
 
 static bool bdrv_child_cb_drained_poll(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    return bdrv_drain_poll(bs, NULL, false);
+    return bdrv_drain_poll(bs, false);
 }
 
 static void bdrv_child_cb_drained_end(BdrvChild *child)
diff --git a/block/io.c b/block/io.c
index c2962adf8d2d..a75f42ee13cb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -45,14 +45,11 @@ static void bdrv_parent_cb_resize(BlockDriverState *bs);
 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int64_t offset, int64_t bytes, BdrvRequestFlags flags);
 
-static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore)
+static void bdrv_parent_drained_begin(BlockDriverState *bs)
 {
     BdrvChild *c, *next;
 
     QLIST_FOREACH_SAFE(c, &bs->parents, next_parent, next) {
-        if (c == ignore) {
-            continue;
-        }
         bdrv_parent_drained_begin_single(c);
     }
 }
@@ -86,14 +83,13 @@ bool bdrv_parent_drained_poll_single(BdrvChild *c)
     return false;
 }
 
-static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
-                                     bool ignore_bds_parents)
+static bool bdrv_parent_drained_poll(BlockDriverState *bs, bool ignore_bds_parents)
 {
     BdrvChild *c, *next;
     bool busy = false;
 
     QLIST_FOREACH_SAFE(c, &bs->parents, next_parent, next) {
-        if (c == ignore || (ignore_bds_parents && c->klass->parent_is_bds)) {
+        if (ignore_bds_parents && c->klass->parent_is_bds) {
             continue;
         }
         busy |= bdrv_parent_drained_poll_single(c);
@@ -231,16 +227,14 @@ typedef struct {
     BlockDriverState *bs;
     bool done;
     bool poll;
-    BdrvChild *parent;
 } BdrvCoDrainData;
 
 /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll() */
-bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent,
-                     bool ignore_bds_parents)
+bool bdrv_drain_poll(BlockDriverState *bs, bool ignore_bds_parents)
 {
     IO_OR_GS_CODE();
 
-    if (bdrv_parent_drained_poll(bs, ignore_parent, ignore_bds_parents)) {
+    if (bdrv_parent_drained_poll(bs, ignore_bds_parents)) {
         return true;
     }
 
@@ -251,14 +245,12 @@ bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent,
     return false;
 }
 
-static bool bdrv_drain_poll_top_level(BlockDriverState *bs,
-                                      BdrvChild *ignore_parent)
+static bool bdrv_drain_poll_top_level(BlockDriverState *bs)
 {
-    return bdrv_drain_poll(bs, ignore_parent, false);
+    return bdrv_drain_poll(bs, false);
 }
 
-static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
-                                  bool poll);
+static void bdrv_do_drained_begin(BlockDriverState *bs, bool poll);
 
 static void bdrv_co_drain_bh_cb(void *opaque)
 {
@@ -270,7 +262,7 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         AioContext *ctx = bdrv_get_aio_context(bs);
         aio_context_acquire(ctx);
         bdrv_dec_in_flight(bs);
-        bdrv_do_drained_begin(bs, data->parent, data->poll);
+        bdrv_do_drained_begin(bs, data->poll);
         aio_context_release(ctx);
     } else {
         bdrv_drain_all_begin();
@@ -281,7 +273,6 @@ static void bdrv_co_drain_bh_cb(void *opaque)
 }
 
 static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
-                                                BdrvChild *parent,
                                                 bool poll)
 {
     BdrvCoDrainData data;
@@ -297,7 +288,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .co = self,
         .bs = bs,
         .done = false,
-        .parent = parent,
         .poll = poll,
     };
 
@@ -329,20 +319,19 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     }
 }
 
-static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
-                                  bool poll)
+static void bdrv_do_drained_begin(BlockDriverState *bs, bool poll)
 {
     IO_OR_GS_CODE();
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, parent, poll);
+        bdrv_co_yield_to_drain(bs, poll);
         return;
     }
 
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
         aio_disable_external(bdrv_get_aio_context(bs));
-        bdrv_parent_drained_begin(bs, parent);
+        bdrv_parent_drained_begin(bs);
         if (bs->drv && bs->drv->bdrv_drain_begin) {
             bs->drv->bdrv_drain_begin(bs);
         }
@@ -358,19 +347,19 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
      * nodes.
      */
     if (poll) {
-        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, parent));
+        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs));
     }
 }
 
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent)
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs)
 {
-    bdrv_do_drained_begin(bs, parent, false);
+    bdrv_do_drained_begin(bs, false);
 }
 
 void bdrv_drained_begin(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
-    bdrv_do_drained_begin(bs, NULL, true);
+    bdrv_do_drained_begin(bs, true);
 }
 
 /**
@@ -425,7 +414,7 @@ static bool bdrv_drain_all_poll(void)
     while ((bs = bdrv_next_all_states(bs))) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
         aio_context_acquire(aio_context);
-        result |= bdrv_drain_poll(bs, NULL, true);
+        result |= bdrv_drain_poll(bs, true);
         aio_context_release(aio_context);
     }
 
@@ -450,7 +439,7 @@ void bdrv_drain_all_begin(void)
     GLOBAL_STATE_CODE();
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, NULL, true);
+        bdrv_co_yield_to_drain(NULL, true);
         return;
     }
 
@@ -475,7 +464,7 @@ void bdrv_drain_all_begin(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_begin(bs, NULL, false);
+        bdrv_do_drained_begin(bs, false);
         aio_context_release(aio_context);
     }
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 10659a3f246c..2f596a56fe0f 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -308,7 +308,7 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 /**
  * bdrv_drain_poll:
  *
- * Poll for pending requests in @bs and its parents (except for @ignore_parent).
+ * Poll for pending requests in @bs and its parents.
  *
  * If @ignore_bds_parents is true, parents that are BlockDriverStates must
  * ignore the drain request because they will be drained separately (used for
@@ -316,8 +316,7 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
  *
  * This is part of bdrv_drained_begin.
  */
-bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent,
-                     bool ignore_bds_parents);
+bool bdrv_drain_poll(BlockDriverState *bs, bool ignore_bds_parents);
 
 /**
  * bdrv_drained_begin:
@@ -335,7 +334,7 @@ void bdrv_drained_begin(BlockDriverState *bs);
  * Quiesces a BDS like bdrv_drained_begin(), but does not wait for already
  * running requests to complete.
  */
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent);
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs);
 
 /**
  * bdrv_drained_end:
-- 
2.38.1


