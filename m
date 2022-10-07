Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF45F785D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:54:19 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmrq-0006gW-8x
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktw-0005Pw-4s
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktt-00038E-Gv
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYq6AUjF6RyWbI1+7EjMXYegwudi1dUzZnyyCVAEGuk=;
 b=Rh9CoGIa52A1p4Trr5BQQNDLLN6Yp7lYVBvxihxwuS///St4RNBA4pRikbVzkNXbZIQArv
 klGLOX7B3ggmLXo8YWviieBRlo26GfMdYesdsCVyIb0CCds/H3yIAZjYG3Rz3ipWUqz3J8
 QCOihTa3lvtdl3tfRvG9v3fSCTJa+vs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-QAkkqdGvPZ-CGOIVQ87UXg-1; Fri, 07 Oct 2022 06:48:15 -0400
X-MC-Unique: QAkkqdGvPZ-CGOIVQ87UXg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A7C695E3A5;
 Fri,  7 Oct 2022 10:48:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8FA32028DC1;
 Fri,  7 Oct 2022 10:48:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 15/50] qcow2: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:17 +0200
Message-Id: <20221007104752.141361-16-kwolf@redhat.com>
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
Message-Id: <20220922084924.201610-15-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h          | 15 ++++++++-------
 block/qcow2-cluster.c  | 21 ++++++++++++---------
 block/qcow2-refcount.c |  2 +-
 block/qcow2.c          |  5 +++--
 4 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index c8d9e8ea79..3e7c5e80b6 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -895,7 +895,7 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 void *cb_opaque, Error **errp);
 int qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
-int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
+int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
@@ -908,9 +908,9 @@ int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
                           QCow2SubclusterType *subcluster_type);
-int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
-                            unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m);
+int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
+                                         unsigned int *bytes,
+                                         uint64_t *host_offset, QCowL2Meta **m);
 int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
@@ -918,13 +918,14 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
                                      uint64_t *coffset, int *csize);
 
-int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
+int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs,
+                                             QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
                           uint64_t bytes, enum qcow2_discard_type type,
                           bool full_discard);
-int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, int flags);
+int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                                          uint64_t bytes, int flags);
 
 int qcow2_expand_zero_clusters(BlockDriverState *bs,
                                BlockDriverAmendStatusCB *status_cb,
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index fd32316d6f..0f293950a1 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -884,7 +884,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     return 0;
 }
 
-static int perform_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn perform_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2COWRegion *start = &m->cow_start;
@@ -1024,7 +1024,8 @@ fail:
     return ret;
 }
 
-int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
+int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs,
+                                             QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     int i, j = 0, l2_index, ret;
@@ -1397,8 +1398,9 @@ static int count_single_write_clusters(BlockDriverState *bs, int nb_clusters,
  *           information on cluster allocation may be invalid now. The caller
  *           must start over anyway, so consider *cur_bytes undefined.
  */
-static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
-    uint64_t *cur_bytes, QCowL2Meta **m)
+static int coroutine_fn handle_dependencies(BlockDriverState *bs,
+                                            uint64_t guest_offset,
+                                            uint64_t *cur_bytes, QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowL2Meta *old_alloc;
@@ -1772,9 +1774,10 @@ out:
  *
  * Return 0 on success and -errno in error cases
  */
-int qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
-                            unsigned int *bytes, uint64_t *host_offset,
-                            QCowL2Meta **m)
+int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
+                                         unsigned int *bytes,
+                                         uint64_t *host_offset,
+                                         QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t start, remaining;
@@ -2105,8 +2108,8 @@ out:
     return ret;
 }
 
-int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                             uint64_t bytes, int flags)
+int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                                          uint64_t bytes, int flags)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t end_offset = offset + bytes;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 1a6277c783..1fbb07ca77 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3706,7 +3706,7 @@ int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size)
     return -EIO;
 }
 
-int qcow2_detect_metadata_preallocation(BlockDriverState *bs)
+int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t i, end_cluster, cluster_count = 0, threshold;
diff --git a/block/qcow2.c b/block/qcow2.c
index 6c8c8b2b5a..b57f7cc8ee 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2448,7 +2448,7 @@ static bool merge_cow(uint64_t offset, unsigned bytes,
  * Return 1 if the COW regions read as zeroes, 0 if not, < 0 on error.
  * Note that returning 0 does not guarantee non-zero data.
  */
-static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
+static int coroutine_fn is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     /*
      * This check is designed for optimization shortcut so it must be
@@ -2466,7 +2466,8 @@ static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
                                 m->cow_end.nb_bytes);
 }
 
-static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
+static int coroutine_fn handle_alloc_space(BlockDriverState *bs,
+                                           QCowL2Meta *l2meta)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowL2Meta *m;
-- 
2.37.3


