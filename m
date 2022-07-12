Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181F572328
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:44:36 +0200 (CEST)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKs7-00075E-IS
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI3-0003nW-Cm
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI0-0006jD-43
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQOxVQD6H2mj6U/W3MYyV4hegv0SEoxr9zirR4spQaM=;
 b=d7Cfe2Bd9R/AU50xe8gMfLzIqo+dn4dmzaE/GG0itc3DBiNz0y/dXqmX1sSTlSdcDc1Wm0
 0CbyfaawG9/btRR1mleXsGKPOfvM3a9WBpAngvC6U4bFNTKsGN1Hb1YUFgzWDe+j+mECAi
 qtNRIpmUUwKl0vngoVI32mc8b47MntQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-1ogMG_XDMVWH47oJo2k-vg-1; Tue, 12 Jul 2022 14:07:11 -0400
X-MC-Unique: 1ogMG_XDMVWH47oJo2k-vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F053D3801149;
 Tue, 12 Jul 2022 18:07:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB2A1414A7E7;
 Tue, 12 Jul 2022 18:07:10 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 30/35] block: Remove remaining unused symbols in coroutines.h
Date: Tue, 12 Jul 2022 20:06:12 +0200
Message-Id: <20220712180617.1362407-31-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Some can be made static, others are unused generated_co_wrappers.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220705161527.1054072-19-afaria@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/coroutines.h    | 19 -------------------
 block/block-backend.c |  6 +++---
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index d66551a277..3a2bad564f 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -63,17 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
 
-int coroutine_fn
-blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                       QEMUIOVector *qiov, size_t qiov_offset,
-                       BdrvRequestFlags flags);
-
-int coroutine_fn
-blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-
-int coroutine_fn blk_co_do_flush(BlockBackend *blk);
-
-
 /*
  * "I/O or GS" API functions. These functions can run without
  * the BQL, but only in one specific iothread/main loop.
@@ -82,14 +71,6 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
  * the "I/O or GS" API.
  */
 
-int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
-            QEMUIOVector *qiov, BdrvRequestFlags flags);
-
-int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
-             QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
diff --git a/block/block-backend.c b/block/block-backend.c
index f3d6525923..d4a5df2ac2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1354,7 +1354,7 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags)
@@ -1687,7 +1687,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
@@ -1735,7 +1735,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn blk_co_do_flush(BlockBackend *blk)
+static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
     IO_CODE();
-- 
2.35.3


