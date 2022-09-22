Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42AE5E5E3F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:16:46 +0200 (CEST)
Received: from localhost ([::1]:36876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIK5-0000cr-Vv
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtq-0004HM-3J
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtn-00037P-6H
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEG7sP+TZ893sNXFvklbS5KEErh7APC8OAUbfr5xMK4=;
 b=ODZEF/NzqHNzj5pmsBkvVNZC/64kHlYgfRqQp02Nemv3JlqBB0pkDgBEhHlWnJfQZFbPXY
 pZIZoSr55ZF3sfbn8BaRs7f914TSqDtNZO+IKGQ5ItG5d6WAQrcUKSkRMpnABRvD+NI+lI
 Wpkbn1NBtE6K3XCLKJQIUDuDiKec0DA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-7nHrCHRQOTaXfnP5f83cgw-1; Thu, 22 Sep 2022 04:49:31 -0400
X-MC-Unique: 7nHrCHRQOTaXfnP5f83cgw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so6175970edd.10
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gEG7sP+TZ893sNXFvklbS5KEErh7APC8OAUbfr5xMK4=;
 b=iwOLEa2CH+kkITtFAP8fQ474f9k4ioFNZhaHaka7AxFj8Oodsv42pKpQ7EdGKmBNNo
 9dY7URW3StPC8QGlM35tsWq8D5Unj2XAGZo9u+KF8ofO3YxSezlk1yxFUV3xMKPv9AtU
 UQmFhLfcW37L12Nzbu9jRWRiCIbP3g4WuZy0hq30tewhR84n5xGil4ZaBxDFxWUaPnzV
 erohv65/FlzjE9VQd4QOvj91H2Mlmsf6cB0RVDOo3rbeSoA9uV4101fjbur1FvJLGOnZ
 +Ak9+5HY49kmEWLG7lRd+aXW0MrD+ppqRp+Jn/A9xgZ5J1N905m5Z/8jqlAztdxpKYet
 iRSA==
X-Gm-Message-State: ACrzQf1WXJfACdzdeH4kMAVCFbJY3xCwdtABkPtCzOmubbrjn8Cqd1wN
 Cs1KTjucABNrKqH6dBhRvm15RKfH4kr32of26AcXku1Q++Ml/U7C8aLct16MIkZzNQpNixmIxf/
 trjYxxZ9pxa/w+ktrqLM8K2oN3iiFXoKScu1+aOYJR0Lby0e1LYWuA+OzwIJ/Mp3w/Kk=
X-Received: by 2002:a05:6402:2816:b0:434:ed38:16f3 with SMTP id
 h22-20020a056402281600b00434ed3816f3mr2165376ede.116.1663836570034; 
 Thu, 22 Sep 2022 01:49:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4HFQ9PbHWqPQLo/qYdLuawfXkVHpXtPhcQK3aHQpDfrbwt1jPnoAKYlDyXZgqh11+YDojHxg==
X-Received: by 2002:a05:6402:2816:b0:434:ed38:16f3 with SMTP id
 h22-20020a056402281600b00434ed3816f3mr2165355ede.116.1663836569823; 
 Thu, 22 Sep 2022 01:49:29 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a17090652cd00b0073cd7cc2c81sm2307783ejn.181.2022.09.22.01.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 02/26] block: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:00 +0200
Message-Id: <20220922084924.201610-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c               |  6 +++---
 block/block-backend.c | 10 +++++-----
 block/io.c            | 22 +++++++++++-----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index bc85f46eed..5c34ada53f 100644
--- a/block.c
+++ b/block.c
@@ -631,9 +631,9 @@ static int64_t create_file_fallback_truncate(BlockBackend *blk,
  * Helper function for bdrv_create_file_fallback(): Zero the first
  * sector to remove any potentially pre-existing image header.
  */
-static int create_file_fallback_zero_first_sector(BlockBackend *blk,
-                                                  int64_t current_size,
-                                                  Error **errp)
+static int coroutine_fn create_file_fallback_zero_first_sector(BlockBackend *blk,
+                                                               int64_t current_size,
+                                                               Error **errp)
 {
     int64_t bytes_to_clear;
     int ret;
diff --git a/block/block-backend.c b/block/block-backend.c
index d4a5df2ac2..aa4adf06ae 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1546,7 +1546,7 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     return &acb->common;
 }
 
-static void blk_aio_read_entry(void *opaque)
+static void coroutine_fn blk_aio_read_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1558,7 +1558,7 @@ static void blk_aio_read_entry(void *opaque)
     blk_aio_complete(acb);
 }
 
-static void blk_aio_write_entry(void *opaque)
+static void coroutine_fn blk_aio_write_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1669,7 +1669,7 @@ int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
     return ret;
 }
 
-static void blk_aio_ioctl_entry(void *opaque)
+static void coroutine_fn blk_aio_ioctl_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1703,7 +1703,7 @@ blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(blk->root, offset, bytes);
 }
 
-static void blk_aio_pdiscard_entry(void *opaque)
+static void coroutine_fn blk_aio_pdiscard_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
@@ -1747,7 +1747,7 @@ static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
     return bdrv_co_flush(blk_bs(blk));
 }
 
-static void blk_aio_flush_entry(void *opaque)
+static void coroutine_fn blk_aio_flush_entry(void *opaque)
 {
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
diff --git a/block/io.c b/block/io.c
index 0a8cbefe86..e3dcb8e7e6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -751,11 +751,11 @@ static void coroutine_fn tracked_request_end(BdrvTrackedRequest *req)
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
 
@@ -794,7 +794,7 @@ static bool tracked_request_overlaps(BdrvTrackedRequest *req,
 }
 
 /* Called with self->bs->reqs_lock held */
-static BdrvTrackedRequest *
+static coroutine_fn BdrvTrackedRequest *
 bdrv_find_conflicting_request(BdrvTrackedRequest *self)
 {
     BdrvTrackedRequest *req;
@@ -1644,10 +1644,10 @@ static bool bdrv_init_padding(BlockDriverState *bs,
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
@@ -3168,7 +3168,7 @@ out:
     return ret;
 }
 
-int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
+int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
 {
     BlockDriver *drv = bs->drv;
     CoroutineIOCompletion co = {
-- 
2.37.3


