Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3525F773F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:15:26 +0200 (CEST)
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglK9-0001br-Um
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkty-0005Q5-Ru
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktx-0003A4-AE
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOooDqfRcR5P5jQ2HfzI++ZcYUJNWybSLieOnCIkpxQ=;
 b=Rpu7DjwIFOTGLfP8tmKh37rl2ifaKaftLBYqgnHFXoVGe20lPkgqzaFWROduWo53FqBtrx
 6/e/sQqX42laitH7q1vKN2rydww9yDmwM+cXSQ667Bfm7oWgqwvUO2n3C8OZ7MkKTE4x9S
 lQ7XPHt1UdhVQIbP3ZIYVcHWIaC3k1w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-Dj8KOSJ9PEGbI2JHFYTojw-1; Fri, 07 Oct 2022 06:48:19 -0400
X-MC-Unique: Dj8KOSJ9PEGbI2JHFYTojw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F59C85A5B6;
 Fri,  7 Oct 2022 10:48:19 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CFB82024CBB;
 Fri,  7 Oct 2022 10:48:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 19/50] quorum: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:21 +0200
Message-Id: <20221007104752.141361-20-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-19-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/quorum.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index f33f30d36b..970f63d9f9 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -161,11 +161,10 @@ static bool quorum_64bits_compare(QuorumVoteValue *a, QuorumVoteValue *b)
     return a->l == b->l;
 }
 
-static QuorumAIOCB *quorum_aio_get(BlockDriverState *bs,
-                                   QEMUIOVector *qiov,
-                                   uint64_t offset,
-                                   uint64_t bytes,
-                                   int flags)
+static QuorumAIOCB *coroutine_fn quorum_aio_get(BlockDriverState *bs,
+                                                QEMUIOVector *qiov,
+                                                uint64_t offset, uint64_t bytes,
+                                                int flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = g_new(QuorumAIOCB, 1);
@@ -273,7 +272,7 @@ static void quorum_report_bad_versions(BDRVQuorumState *s,
     }
 }
 
-static void quorum_rewrite_entry(void *opaque)
+static void coroutine_fn quorum_rewrite_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -574,7 +573,7 @@ free_exit:
     quorum_free_vote_list(&acb->votes);
 }
 
-static void read_quorum_children_entry(void *opaque)
+static void coroutine_fn read_quorum_children_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -602,7 +601,7 @@ static void read_quorum_children_entry(void *opaque)
     }
 }
 
-static int read_quorum_children(QuorumAIOCB *acb)
+static int coroutine_fn read_quorum_children(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int i;
@@ -643,7 +642,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
     return acb->vote_ret;
 }
 
-static int read_fifo_child(QuorumAIOCB *acb)
+static int coroutine_fn read_fifo_child(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int n, ret;
@@ -664,8 +663,10 @@ static int read_fifo_child(QuorumAIOCB *acb)
     return ret;
 }
 
-static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                            QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_preadv(BlockDriverState *bs,
+                                         int64_t offset, int64_t bytes,
+                                         QEMUIOVector *qiov,
+                                         BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
@@ -684,7 +685,7 @@ static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return ret;
 }
 
-static void write_quorum_entry(void *opaque)
+static void coroutine_fn write_quorum_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -715,9 +716,9 @@ static void write_quorum_entry(void *opaque)
     }
 }
 
-static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
-                             int64_t bytes, QEMUIOVector *qiov,
-                             BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                          int64_t bytes, QEMUIOVector *qiov,
+                                          BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
@@ -746,8 +747,9 @@ static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
     return ret;
 }
 
-static int quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                   int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_pwrite_zeroes(BlockDriverState *bs,
+                                                int64_t offset, int64_t bytes,
+                                                BdrvRequestFlags flags)
 
 {
     return quorum_co_pwritev(bs, offset, bytes, NULL,
-- 
2.37.3


