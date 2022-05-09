Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0F51FA22
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:41:08 +0200 (CEST)
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0p9-0005Gr-7t
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f3-0004UW-Kq
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0f1-0002mh-OP
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/b+5wydA9RdU0ZF0qsuG26Wp2w9p/13mEw4B/cEDK5A=;
 b=cZTKwhf7JVqwRBYMu7AqPYFIvPQYjIKLvLmhHcpqmULw3QHkTRhmmt/LfMfb50dSTAAM9o
 zuD2uNnFQuPivpO4Ln+CMwPOQO9ZczkpKAk4YrUBW5yJLZEBqMfwvsDVKKcxjvkYkEWtfg
 lpcS69HoNKSJd2BvDXWjMwfkORgyuy0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-kOqagIxBNGaOdRIal_5X4Q-1; Mon, 09 May 2022 06:30:37 -0400
X-MC-Unique: kOqagIxBNGaOdRIal_5X4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo2229967wml.1
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/b+5wydA9RdU0ZF0qsuG26Wp2w9p/13mEw4B/cEDK5A=;
 b=jCrRPG3wXNFhVeJbUXR31uM/l/P0Wt9EykJ+8BWzLVv6fvjr9RIF24tGOUBTAcHBxi
 ojIT7ldl6y436ntg3nkdzSEe19p02UcF8rqD3/ZCdO4ZUo3itU12FDkjqS8K6X+h79/y
 GmD4Dyhu5Akd+gPenwSzfD2PJ0LjjwJ388MnLV0eh0GDUFnprLvQKKntPPdxOnRuIeMf
 4GuIchCbxwRd7Sc77yRCEo6cI6JG5tNxhktDg8YGVIBeBIW8721k9Gya8TiMOBPWFMb/
 SbIApGAQc266g6yVb8KdLuPkclT5ZWWG2L5eYt6oXP3VkKBgp+yTSTL8JNldzXg5xorP
 6dtg==
X-Gm-Message-State: AOAM533B/LZtM32Gu5YGlOcHpZpxsDOVqQvy8JRM9yH3VKPm4b7EiinH
 nPdpvvM/wSNFr8x1rcluDyhvxzBbYzgsqPVkLQlIFDBi+XdRVsnua5uxCkyjpUETWZaDtcPE/y+
 dWtvehKwaxpA2v30puPuR39KOhFc2+bPLo8PxzmY5PFJBY6zDL/W8i4fF3Cu1oxEDdx8=
X-Received: by 2002:adf:f649:0:b0:20a:df27:d7e8 with SMTP id
 x9-20020adff649000000b0020adf27d7e8mr12736907wrp.288.1652092236167; 
 Mon, 09 May 2022 03:30:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSxtl75TBy1eW3/jBxifyc7BuchNa0a/ddPTMn5ypcBHF/iuKCalnBgfO9tyWnLjH+gdbbCg==
X-Received: by 2002:adf:f649:0:b0:20a:df27:d7e8 with SMTP id
 x9-20020adff649000000b0020adf27d7e8mr12736874wrp.288.1652092235661; 
 Mon, 09 May 2022 03:30:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003942a244ee2sm13083420wmm.39.2022.05.09.03.30.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/26] block: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:00 +0200
Message-Id: <20220509103019.215041-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 18 +++++++++---------
 block/io.c            | 24 ++++++++++++------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index fedf2eca83..52009b8949 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1413,8 +1413,8 @@ typedef struct BlkRwCo {
     BdrvRequestFlags flags;
 } BlkRwCo;
 
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags)
+int coroutine_fn blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                   int64_t bytes, BdrvRequestFlags flags)
 {
     IO_OR_GS_CODE();
     return blk_pwritev_part(blk, offset, bytes, NULL, 0,
@@ -1534,7 +1534,7 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     return &acb->common;
 }
 
-static void blk_aio_read_entry(void *opaque)
+static void coroutine_fn blk_aio_read_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1546,7 +1546,7 @@ static void blk_aio_read_entry(void *opaque)
     blk_aio_complete(acb);
 }
 
-static void blk_aio_write_entry(void *opaque)
+static void coroutine_fn blk_aio_write_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1580,8 +1580,8 @@ int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
     return ret < 0 ? ret : bytes;
 }
 
-int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
-               BdrvRequestFlags flags)
+int coroutine_fn blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
+                            BdrvRequestFlags flags)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
@@ -1681,7 +1681,7 @@ int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     return ret;
 }
 
-static void blk_aio_ioctl_entry(void *opaque)
+static void coroutine_fn blk_aio_ioctl_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1715,7 +1715,7 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(blk->root, offset, bytes);
 }
 
-static void blk_aio_pdiscard_entry(void *opaque)
+static void coroutine_fn blk_aio_pdiscard_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1771,7 +1771,7 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk)
     return bdrv_co_flush(blk_bs(blk));
 }
 
-static void blk_aio_flush_entry(void *opaque)
+static void coroutine_fn blk_aio_flush_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
diff --git a/block/io.c b/block/io.c
index 9769ec53b0..7db9be3c03 100644
--- a/block/io.c
+++ b/block/io.c
@@ -751,7 +751,7 @@ void bdrv_drain_all(void)
  *
  * This function should be called when a tracked request is completing.
  */
-static void tracked_request_end(BdrvTrackedRequest *req)
+static void coroutine_fn tracked_request_end(BdrvTrackedRequest *req)
 {
     if (req->serialising) {
         qatomic_dec(&req->bs->serialising_in_flight);
@@ -766,11 +766,11 @@ static void tracked_request_end(BdrvTrackedRequest *req)
 /**
  * Add an active request to the tracked requests list
  */
-static void tracked_request_begin(BdrvTrackedRequest *req,
-                                  BlockDriverState *bs,
-                                  int64_t offset,
-                                  int64_t bytes,
-                                  enum BdrvTrackedRequestType type)
+static void coroutine_fn tracked_request_begin(BdrvTrackedRequest *req,
+                                               BlockDriverState *bs,
+                                               int64_t offset,
+                                               int64_t bytes,
+                                               enum BdrvTrackedRequestType type)
 {
     bdrv_check_request(offset, bytes, &error_abort);
 
@@ -809,7 +809,7 @@ static bool tracked_request_overlaps(BdrvTrackedRequest *req,
 }
 
 /* Called with self->bs->reqs_lock held */
-static BdrvTrackedRequest *
+static coroutine_fn BdrvTrackedRequest *
 bdrv_find_conflicting_request(BdrvTrackedRequest *self)
 {
     BdrvTrackedRequest *req;
@@ -1704,10 +1704,10 @@ static bool bdrv_init_padding(BlockDriverState *bs,
     return true;
 }
 
-static int bdrv_padding_rmw_read(BdrvChild *child,
-                                 BdrvTrackedRequest *req,
-                                 BdrvRequestPadding *pad,
-                                 bool zero_middle)
+static coroutine_fn int bdrv_padding_rmw_read(BdrvChild *child,
+                                              BdrvTrackedRequest *req,
+                                              BdrvRequestPadding *pad,
+                                              bool zero_middle)
 {
     QEMUIOVector local_qiov;
     BlockDriverState *bs = child->bs;
@@ -3228,7 +3228,7 @@ out:
     return ret;
 }
 
-int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
+int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
 {
     BlockDriver *drv = bs->drv;
     CoroutineIOCompletion co = {
-- 
2.35.1


