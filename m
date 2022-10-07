Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE25F7768
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:27:02 +0200 (CEST)
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglVN-0000fn-0S
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktq-0005PC-Rv
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkto-00035j-W8
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8xvN39iU961FppPbmR0E62c3pd08SKYbcd6d0IDE0I=;
 b=U/Pi26WE9gC55vhWlSkBkZU03r1nBDOv7/Uw3+oqwnQzcYinOE3AEeWK3DTpoFWfp8BLE+
 RqJLCKXkm1Cijfr3WCmUA9HtOdgpruh768X/benSUz3/PMDrD966sa34KX9Oqt3/8RF/9D
 GGbaNmauEUtEqTVCCjHA8/DACXA0Pvk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-BB-zxB2YNLqsjzaisxcTtw-1; Fri, 07 Oct 2022 06:48:05 -0400
X-MC-Unique: BB-zxB2YNLqsjzaisxcTtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C3F03826244;
 Fri,  7 Oct 2022 10:48:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D854D2028DC1;
 Fri,  7 Oct 2022 10:48:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 04/50] block: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:06 +0200
Message-Id: <20221007104752.141361-5-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-3-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c               |  7 ++++---
 block/block-backend.c | 10 +++++-----
 block/io.c            | 22 +++++++++++-----------
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index bc85f46eed..9b0fae5c1e 100644
--- a/block.c
+++ b/block.c
@@ -631,9 +631,10 @@ static int64_t create_file_fallback_truncate(BlockBackend *blk,
  * Helper function for bdrv_create_file_fallback(): Zero the first
  * sector to remove any potentially pre-existing image header.
  */
-static int create_file_fallback_zero_first_sector(BlockBackend *blk,
-                                                  int64_t current_size,
-                                                  Error **errp)
+static int coroutine_fn
+create_file_fallback_zero_first_sector(BlockBackend *blk,
+                                       int64_t current_size,
+                                       Error **errp)
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
index c3200bcdff..d30073036e 100644
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
@@ -1635,10 +1635,10 @@ static bool bdrv_init_padding(BlockDriverState *bs,
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
@@ -3159,7 +3159,7 @@ out:
     return ret;
 }
 
-int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
+int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf)
 {
     BlockDriver *drv = bs->drv;
     CoroutineIOCompletion co = {
-- 
2.37.3


