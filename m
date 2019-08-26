Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A089D402
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 18:30:09 +0200 (CEST)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Hsd-000402-Ri
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 12:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i2HcT-0000S4-7V
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i2HcR-0000rN-HF
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:13:25 -0400
Received: from relay.sw.ru ([185.231.240.75]:44764)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i2HcN-0000lx-K0; Mon, 26 Aug 2019 12:13:19 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i2HcI-0006QJ-32; Mon, 26 Aug 2019 19:13:14 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Mon, 26 Aug 2019 19:13:03 +0300
Message-Id: <20190826161312.489398-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190826161312.489398-1-vsementsov@virtuozzo.com>
References: <20190826161312.489398-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v9 04/13] block/backup: adjust block-copy
 functions style
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix comment style and reflow arguments in same manner like
block_copy_state_new.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index f52ac622e0..d9192ac778 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -192,14 +192,13 @@ fail:
     return NULL;
 }
 
-/* Copy range to target with a bounce buffer and return the bytes copied. If
- * error occurred, return a negative error number */
-static int coroutine_fn block_copy_with_bounce_buffer(BlockCopyState *s,
-                                                      int64_t start,
-                                                      int64_t end,
-                                                      bool is_write_notifier,
-                                                      bool *error_is_read,
-                                                      void **bounce_buffer)
+/*
+ * Copy range to target with a bounce buffer and return the bytes copied. If
+ * error occurred, return a negative error number
+ */
+static int coroutine_fn block_copy_with_bounce_buffer(
+        BlockCopyState *s, int64_t start, int64_t end, bool is_write_notifier,
+        bool *error_is_read, void **bounce_buffer)
 {
     int ret;
     int nbytes;
@@ -238,12 +237,12 @@ fail:
 
 }
 
-/* Copy range to target and return the bytes copied. If error occurred, return a
- * negative error number. */
-static int coroutine_fn block_copy_with_offload(BlockCopyState *s,
-                                                int64_t start,
-                                                int64_t end,
-                                                bool is_write_notifier)
+/*
+ * Copy range to target and return the bytes copied. If error occurred, return a
+ * negative error number.
+ */
+static int coroutine_fn block_copy_with_offload(
+        BlockCopyState *s, int64_t start, int64_t end, bool is_write_notifier)
 {
     int ret;
     int nr_clusters;
@@ -310,14 +309,14 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
     }
 }
 
-/**
+/*
  * Reset bits in copy_bitmap starting at offset if they represent unallocated
  * data in the image. May reset subsequent contiguous bits.
  * @return 0 when the cluster at @offset was unallocated,
  *         1 otherwise, and -ret on error.
  */
-static int64_t block_copy_reset_unallocated(BlockCopyState *s,
-                                            int64_t offset, int64_t *count)
+static int64_t block_copy_reset_unallocated(
+        BlockCopyState *s, int64_t offset, int64_t *count)
 {
     int ret;
     int64_t clusters, bytes;
@@ -338,10 +337,9 @@ static int64_t block_copy_reset_unallocated(BlockCopyState *s,
     return ret;
 }
 
-static int coroutine_fn block_copy(BlockCopyState *s,
-                                   int64_t offset, uint64_t bytes,
-                                   bool *error_is_read,
-                                   bool is_write_notifier)
+static int coroutine_fn block_copy(
+        BlockCopyState *s, int64_t offset, uint64_t bytes, bool *error_is_read,
+        bool is_write_notifier)
 {
     int ret = 0;
     int64_t start = offset, end = bytes + offset; /* bytes */
-- 
2.18.0


