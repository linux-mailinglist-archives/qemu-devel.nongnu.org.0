Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B16563FC6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:38:43 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7bST-0007mB-R7
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNm-000338-Mf
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o7bNk-0007jR-Hu
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656761627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxfLSdJeaqScMeruvLuh/qoohWtLPXnBogvQe9zNGcM=;
 b=Z2NZel2KfcMlE5nBudPMToTU8tClVwmRNrjx+ymE7MAOrPG72i6rnn8AmaZeOtRPkWRHyU
 vnCGbWpBYnPohnXPrEKrqqXgtmMViOnymKJeCxZi0sD8Ob28fm1GxNZAOMKt6dz2nFxTOr
 1Bz3pdKng2yfMpiHfZTDOSjFovBDaos=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-VilpdHhqNECdBKGEMPyw3Q-1; Sat, 02 Jul 2022 07:33:44 -0400
X-MC-Unique: VilpdHhqNECdBKGEMPyw3Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B0ED1C068E2;
 Sat,  2 Jul 2022 11:33:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C2D9492C3B;
 Sat,  2 Jul 2022 11:33:40 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>, Alberto Faria <afaria@redhat.com>
Subject: [RFC 2/8] Drop some unused static function return values
Date: Sat,  2 Jul 2022 12:33:25 +0100
Message-Id: <20220702113331.2003820-3-afaria@redhat.com>
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
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

Make some non-void static functions whose return values are ignored by
all callers return void instead.

These functions were found by the shiny new static-analyzer.py. Only a
few of the reported cases were fixed.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/file-posix.c   |  6 +-----
 block/io.c           | 24 +++++++++++-------------
 block/qcow2-bitmap.c |  6 ++----
 block/quorum.c       |  5 +----
 block/vpc.c          |  9 +++------
 block/vvfat.c        | 11 +++++------
 6 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..a4641da7f9 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1895,7 +1895,7 @@ static int handle_aiocb_discard(void *opaque)
  * Returns: 0 on success, -errno on failure. Since this is an optimization,
  * caller may ignore failures.
  */
-static int allocate_first_block(int fd, size_t max_size)
+static void allocate_first_block(int fd, size_t max_size)
 {
     size_t write_size = (max_size < MAX_BLOCKSIZE)
         ? BDRV_SECTOR_SIZE
@@ -1903,7 +1903,6 @@ static int allocate_first_block(int fd, size_t max_size)
     size_t max_align = MAX(MAX_BLOCKSIZE, qemu_real_host_page_size());
     void *buf;
     ssize_t n;
-    int ret;
 
     buf = qemu_memalign(max_align, write_size);
     memset(buf, 0, write_size);
@@ -1912,10 +1911,7 @@ static int allocate_first_block(int fd, size_t max_size)
         n = pwrite(fd, buf, write_size, 0);
     } while (n == -1 && errno == EINTR);
 
-    ret = (n == -1) ? -errno : 0;
-
     qemu_vfree(buf);
-    return ret;
 }
 
 static int handle_aiocb_truncate(void *opaque)
diff --git a/block/io.c b/block/io.c
index 1e9bf09a49..bbfe94503b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -934,20 +934,18 @@ void bdrv_dec_in_flight(BlockDriverState *bs)
     bdrv_wakeup(bs);
 }
 
-static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self)
+static void coroutine_fn
+bdrv_wait_serialising_requests(BdrvTrackedRequest *self)
 {
     BlockDriverState *bs = self->bs;
-    bool waited = false;
 
     if (!qatomic_read(&bs->serialising_in_flight)) {
-        return false;
+        return;
     }
 
     qemu_co_mutex_lock(&bs->reqs_lock);
-    waited = bdrv_wait_serialising_requests_locked(self);
+    bdrv_wait_serialising_requests_locked(self);
     qemu_co_mutex_unlock(&bs->reqs_lock);
-
-    return waited;
 }
 
 bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
@@ -1689,10 +1687,10 @@ static bool bdrv_init_padding(BlockDriverState *bs,
     return true;
 }
 
-static int bdrv_padding_rmw_read(BdrvChild *child,
-                                 BdrvTrackedRequest *req,
-                                 BdrvRequestPadding *pad,
-                                 bool zero_middle)
+static void bdrv_padding_rmw_read(BdrvChild *child,
+                                  BdrvTrackedRequest *req,
+                                  BdrvRequestPadding *pad,
+                                  bool zero_middle)
 {
     QEMUIOVector local_qiov;
     BlockDriverState *bs = child->bs;
@@ -1715,7 +1713,7 @@ static int bdrv_padding_rmw_read(BdrvChild *child,
         ret = bdrv_aligned_preadv(child, req, req->overlap_offset, bytes,
                                   align, &local_qiov, 0, 0);
         if (ret < 0) {
-            return ret;
+            return;
         }
         if (pad->head) {
             bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_HEAD);
@@ -1738,7 +1736,7 @@ static int bdrv_padding_rmw_read(BdrvChild *child,
                 req->overlap_offset + req->overlap_bytes - align,
                 align, align, &local_qiov, 0, 0);
         if (ret < 0) {
-            return ret;
+            return;
         }
         bdrv_debug_event(bs, BLKDBG_PWRITEV_RMW_AFTER_TAIL);
     }
@@ -1748,7 +1746,7 @@ zero_mem:
         memset(pad->buf + pad->head, 0, pad->buf_len - pad->head - pad->tail);
     }
 
-    return 0;
+    return;
 }
 
 static void bdrv_padding_destroy(BdrvRequestPadding *pad)
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8fb4731551..a4e9fe73d4 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -257,14 +257,14 @@ fail:
     return ret;
 }
 
-static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
+static void free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
 {
     int ret;
     uint64_t *bitmap_table;
 
     ret = bitmap_table_load(bs, tb, &bitmap_table);
     if (ret < 0) {
-        return ret;
+        return;
     }
 
     clear_bitmap_table(bs, bitmap_table, tb->size);
@@ -274,8 +274,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
 
     tb->offset = 0;
     tb->size = 0;
-
-    return 0;
 }
 
 /* load_bitmap_data
diff --git a/block/quorum.c b/block/quorum.c
index f33f30d36b..9c0fbd79be 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -293,7 +293,7 @@ static void quorum_rewrite_entry(void *opaque)
     }
 }
 
-static bool quorum_rewrite_bad_versions(QuorumAIOCB *acb,
+static void quorum_rewrite_bad_versions(QuorumAIOCB *acb,
                                         QuorumVoteValue *value)
 {
     QuorumVoteVersion *version;
@@ -331,9 +331,6 @@ static bool quorum_rewrite_bad_versions(QuorumAIOCB *acb,
             qemu_coroutine_enter(co);
         }
     }
-
-    /* return true if any rewrite is done else false */
-    return count;
 }
 
 static void quorum_count_vote(QuorumVotes *votes,
diff --git a/block/vpc.c b/block/vpc.c
index 4d8f16e199..bd705cffb0 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -777,11 +777,10 @@ static int coroutine_fn vpc_co_block_status(BlockDriverState *bs,
  * Note that the geometry doesn't always exactly match total_sectors but
  * may round it down.
  *
- * Returns 0 on success, -EFBIG if the size is larger than 2040 GiB. Override
- * the hardware EIDE and ATA-2 limit of 16 heads (max disk size of 127 GB)
- * and instead allow up to 255 heads.
+ * Override the hardware EIDE and ATA-2 limit of 16 heads (max disk size of 127
+ * GB) and instead allow up to 255 heads.
  */
-static int calculate_geometry(int64_t total_sectors, uint16_t *cyls,
+static void calculate_geometry(int64_t total_sectors, uint16_t *cyls,
     uint8_t *heads, uint8_t *secs_per_cyl)
 {
     uint32_t cyls_times_heads;
@@ -815,8 +814,6 @@ static int calculate_geometry(int64_t total_sectors, uint16_t *cyls,
     }
 
     *cyls = cyls_times_heads / *heads;
-
-    return 0;
 }
 
 static int create_dynamic_disk(BlockBackend *blk, VHDFooter *footer,
diff --git a/block/vvfat.c b/block/vvfat.c
index b2b58d93b8..fba7581427 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -154,9 +154,9 @@ static inline int array_remove_slice(array_t* array,int index, int count)
     return 0;
 }
 
-static int array_remove(array_t* array,int index)
+static void array_remove(array_t* array,int index)
 {
-    return array_remove_slice(array, index, 1);
+    array_remove_slice(array, index, 1);
 }
 
 /* return the index for a given member */
@@ -2967,13 +2967,12 @@ DLOG(checkpoint());
     return 0;
 }
 
-static int try_commit(BDRVVVFATState* s)
+static void try_commit(BDRVVVFATState* s)
 {
     vvfat_close_current_file(s);
 DLOG(checkpoint());
-    if(!is_consistent(s))
-        return -1;
-    return do_commit(s);
+    if (is_consistent(s))
+        do_commit(s);
 }
 
 static int vvfat_write(BlockDriverState *bs, int64_t sector_num,
-- 
2.36.1


