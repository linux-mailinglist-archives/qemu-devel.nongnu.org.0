Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2A3C23BC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:53:22 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q0P-0005Rp-SR
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyB-0002Wf-8k
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1py9-0003L4-4K
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIxJiS9163S0JFV7Ar8Fq1KQkvv2JSQ4F28oqpQiVXY=;
 b=TyATRH6oaEPiCfFolUhSMkeOl+4BPcM4rgP2cQuA+XGpZBXsFncbwbC0rbs3dvbj0iS1gC
 wxd3FO7jHO9JQEfYP8z7+Xgc59rm/M3OVlFqMWxLbK3nz2vcxUim20KqHPEPiK3MWUlVqV
 y64wRd+cFAXSuBRL6v2eksFySrzQtDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-QsjFlCbSM_SGyc8QLuCaeA-1; Fri, 09 Jul 2021 08:50:58 -0400
X-MC-Unique: QsjFlCbSM_SGyc8QLuCaeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E768A40D2;
 Fri,  9 Jul 2021 12:50:57 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1FC960843;
 Fri,  9 Jul 2021 12:50:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/28] block/rbd: bump librbd requirement to luminous release
Date: Fri,  9 Jul 2021 14:50:10 +0200
Message-Id: <20210709125035.191321-4-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

Ceph Luminous (version 12.2.z) is almost 4 years old at this point.
Bump the requirement to get rid of the ifdef'ry in the code.
Qemu 6.1 dropped the support for RHEL-7 which was the last supported
OS that required an older librbd.

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Message-Id: <20210702172356.11574-2-idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 120 ++++------------------------------------------------
 meson.build |   7 ++-
 2 files changed, 13 insertions(+), 114 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index f51adb3646..b4b928bbb9 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -55,24 +55,10 @@
  * leading "\".
  */
 
-/* rbd_aio_discard added in 0.1.2 */
-#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 2)
-#define LIBRBD_SUPPORTS_DISCARD
-#else
-#undef LIBRBD_SUPPORTS_DISCARD
-#endif
-
 #define OBJ_MAX_SIZE (1UL << OBJ_DEFAULT_OBJ_ORDER)
 
 #define RBD_MAX_SNAPS 100
 
-/* The LIBRBD_SUPPORTS_IOVEC is defined in librbd.h */
-#ifdef LIBRBD_SUPPORTS_IOVEC
-#define LIBRBD_USE_IOVEC 1
-#else
-#define LIBRBD_USE_IOVEC 0
-#endif
-
 #define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
 
 static const char rbd_luks_header_verification[
@@ -96,7 +82,6 @@ typedef struct RBDAIOCB {
     BlockAIOCB common;
     int64_t ret;
     QEMUIOVector *qiov;
-    char *bounce;
     RBDAIOCmd cmd;
     int error;
     struct BDRVRBDState *s;
@@ -106,7 +91,6 @@ typedef struct RADOSCB {
     RBDAIOCB *acb;
     struct BDRVRBDState *s;
     int64_t size;
-    char *buf;
     int64_t ret;
 } RADOSCB;
 
@@ -354,13 +338,9 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
 
 static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
 {
-    if (LIBRBD_USE_IOVEC) {
-        RBDAIOCB *acb = rcb->acb;
-        iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
-                   acb->qiov->size - offs);
-    } else {
-        memset(rcb->buf + offs, 0, rcb->size - offs);
-    }
+    RBDAIOCB *acb = rcb->acb;
+    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
+               acb->qiov->size - offs);
 }
 
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
@@ -787,13 +767,6 @@ static void qemu_rbd_complete_aio(RADOSCB *rcb)
 
     g_free(rcb);
 
-    if (!LIBRBD_USE_IOVEC) {
-        if (acb->cmd == RBD_AIO_READ) {
-            qemu_iovec_from_buf(acb->qiov, 0, acb->bounce, acb->qiov->size);
-        }
-        qemu_vfree(acb->bounce);
-    }
-
     acb->common.cb(acb->common.opaque, (acb->ret > 0 ? 0 : acb->ret));
 
     qemu_aio_unref(acb);
@@ -1174,28 +1147,6 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
                                      rbd_finish_bh, rcb);
 }
 
-static int rbd_aio_discard_wrapper(rbd_image_t image,
-                                   uint64_t off,
-                                   uint64_t len,
-                                   rbd_completion_t comp)
-{
-#ifdef LIBRBD_SUPPORTS_DISCARD
-    return rbd_aio_discard(image, off, len, comp);
-#else
-    return -ENOTSUP;
-#endif
-}
-
-static int rbd_aio_flush_wrapper(rbd_image_t image,
-                                 rbd_completion_t comp)
-{
-#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
-    return rbd_aio_flush(image, comp);
-#else
-    return -ENOTSUP;
-#endif
-}
-
 static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
                                  int64_t off,
                                  QEMUIOVector *qiov,
@@ -1218,21 +1169,6 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
 
     rcb = g_new(RADOSCB, 1);
 
-    if (!LIBRBD_USE_IOVEC) {
-        if (cmd == RBD_AIO_DISCARD || cmd == RBD_AIO_FLUSH) {
-            acb->bounce = NULL;
-        } else {
-            acb->bounce = qemu_try_blockalign(bs, qiov->size);
-            if (acb->bounce == NULL) {
-                goto failed;
-            }
-        }
-        if (cmd == RBD_AIO_WRITE) {
-            qemu_iovec_to_buf(acb->qiov, 0, acb->bounce, qiov->size);
-        }
-        rcb->buf = acb->bounce;
-    }
-
     acb->ret = 0;
     acb->error = 0;
     acb->s = s;
@@ -1246,7 +1182,7 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
     }
 
     switch (cmd) {
-    case RBD_AIO_WRITE: {
+    case RBD_AIO_WRITE:
         /*
          * RBD APIs don't allow us to write more than actual size, so in order
          * to support growing images, we resize the image before write
@@ -1258,25 +1194,16 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
                 goto failed_completion;
             }
         }
-#ifdef LIBRBD_SUPPORTS_IOVEC
-            r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
-#else
-            r = rbd_aio_write(s->image, off, size, rcb->buf, c);
-#endif
+        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
         break;
-    }
     case RBD_AIO_READ:
-#ifdef LIBRBD_SUPPORTS_IOVEC
-            r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
-#else
-            r = rbd_aio_read(s->image, off, size, rcb->buf, c);
-#endif
+        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
         break;
     case RBD_AIO_DISCARD:
-        r = rbd_aio_discard_wrapper(s->image, off, size, c);
+        r = rbd_aio_discard(s->image, off, size, c);
         break;
     case RBD_AIO_FLUSH:
-        r = rbd_aio_flush_wrapper(s->image, c);
+        r = rbd_aio_flush(s->image, c);
         break;
     default:
         r = -EINVAL;
@@ -1291,9 +1218,6 @@ failed_completion:
     rbd_aio_release(c);
 failed:
     g_free(rcb);
-    if (!LIBRBD_USE_IOVEC) {
-        qemu_vfree(acb->bounce);
-    }
 
     qemu_aio_unref(acb);
     return NULL;
@@ -1319,7 +1243,6 @@ static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
                          RBD_AIO_WRITE);
 }
 
-#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
 static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
                                       BlockCompletionFunc *cb,
                                       void *opaque)
@@ -1327,20 +1250,6 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
     return rbd_start_aio(bs, 0, NULL, 0, cb, opaque, RBD_AIO_FLUSH);
 }
 
-#else
-
-static int qemu_rbd_co_flush(BlockDriverState *bs)
-{
-#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 1)
-    /* rbd_flush added in 0.1.1 */
-    BDRVRBDState *s = bs->opaque;
-    return rbd_flush(s->image);
-#else
-    return 0;
-#endif
-}
-#endif
-
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1546,7 +1455,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
     return snap_count;
 }
 
-#ifdef LIBRBD_SUPPORTS_DISCARD
 static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
                                          int bytes,
@@ -1556,9 +1464,7 @@ static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
     return rbd_start_aio(bs, offset, NULL, bytes, cb, opaque,
                          RBD_AIO_DISCARD);
 }
-#endif
 
-#ifdef LIBRBD_SUPPORTS_INVALIDATE
 static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
                                                       Error **errp)
 {
@@ -1568,7 +1474,6 @@ static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
         error_setg_errno(errp, -r, "Failed to invalidate the cache");
     }
 }
-#endif
 
 static QemuOptsList qemu_rbd_create_opts = {
     .name = "rbd-create-opts",
@@ -1643,23 +1548,14 @@ static BlockDriver bdrv_rbd = {
     .bdrv_aio_preadv        = qemu_rbd_aio_preadv,
     .bdrv_aio_pwritev       = qemu_rbd_aio_pwritev,
 
-#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
     .bdrv_aio_flush         = qemu_rbd_aio_flush,
-#else
-    .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
-#endif
-
-#ifdef LIBRBD_SUPPORTS_DISCARD
     .bdrv_aio_pdiscard      = qemu_rbd_aio_pdiscard,
-#endif
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
     .bdrv_snapshot_list     = qemu_rbd_snap_list,
     .bdrv_snapshot_goto     = qemu_rbd_snap_rollback,
-#ifdef LIBRBD_SUPPORTS_INVALIDATE
     .bdrv_co_invalidate_cache = qemu_rbd_co_invalidate_cache,
-#endif
 
     .strong_runtime_opts    = qemu_rbd_strong_runtime_opts,
 };
diff --git a/meson.build b/meson.build
index 7e12de01be..eb362ee5eb 100644
--- a/meson.build
+++ b/meson.build
@@ -710,13 +710,16 @@ if not get_option('rbd').auto() or have_block
       int main(void) {
         rados_t cluster;
         rados_create(&cluster, NULL);
+        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
+        #error
+        #endif
         return 0;
       }''', dependencies: [librbd, librados])
       rbd = declare_dependency(dependencies: [librbd, librados])
     elif get_option('rbd').enabled()
-      error('could not link librados')
+      error('librbd >= 1.12.0 required')
     else
-      warning('could not link librados, disabling')
+      warning('librbd >= 1.12.0 not found, disabling')
     endif
   endif
 endif
-- 
2.31.1


