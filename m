Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3713BA3A2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:28:41 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzMy0-00070W-Lq
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuI-0000Tt-1k; Fri, 02 Jul 2021 13:24:50 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuA-0005mv-Rc; Fri, 02 Jul 2021 13:24:49 -0400
Received: by mail-ej1-x629.google.com with SMTP id c17so17230178ejk.13;
 Fri, 02 Jul 2021 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5MeShz+o63946KpuF48TG7tsdR5i2Qdc++ZjC3XzmRM=;
 b=FfHlquTZeg9Q93kQ2kdDDehVuAjM0/Y1JRmkRHU6yCXDSiPpQtY/44h6ebuNNg91im
 2XdFEokCHl3a3o6xxQVXkcnvVzaQexRLZogtRb2oKD1IHr5YYmFWrrIeTHJ/WRxmwmxb
 PCQVyWMcvI/5jhqQnxaaYjCg0sRNL6kJfha89P5EYajLSVLKRDm3EYivVc/cqtil2+gB
 VkMoJhH7QutT97LviY26NXiFdXPXpOYGiR5wQ/zXTXuS4RIsZzMmiRnETcL+/fJ/lEMi
 e0z07caS0j/xeJTJ/CnIUMWyzLyGLGq4pWnhTFVU+d+P+p8G0mXX4f8WnXMW0zRmQzJa
 fIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5MeShz+o63946KpuF48TG7tsdR5i2Qdc++ZjC3XzmRM=;
 b=di87k8kai0liU6X94ea/6HPB5qUcpJbbuHyIJ7Xyqm7sceUnLQECq5FzZvHe0IBTv5
 5S8O6DhegwZNn5ntvCpnbw/251duo+ecXn4H315o0E4JtWT5uRYmG0s9L3ju+f7GNFFO
 V5cp5rXAiTRFJ7wE4bZgdpohwTuxeUtTY9pgfqo8z8NKGzf/gAtLBR/gt45X4r1MwDTj
 Qgm6p5d0baLQdiU9q5Ks4VVITFKdn05giz/EcBxydj64LzI2qfKBUKKKZkTxOh95pazq
 UauVmbqSCUZ7i2Bx0BwMQdkJmHbLLfXDtcvRCJnyFrKJI/5zjqNW7Aflde73oN9X5D8T
 oyrg==
X-Gm-Message-State: AOAM530R9vVe0NPm5aqPy9iyzUqTGm2443VsWX7vVX847wH0dIEFUS5J
 7UtoK3KmiBjD3qLG7gMt7zwxdx5889xgvA==
X-Google-Smtp-Source: ABdhPJy/DZ6GxcXEwtyneUwmTSCxAT64LgMSq847p1i/HyEFAWObVbwEupq/tA9OR0IWzrlJ9HoXAw==
X-Received: by 2002:a17:906:7393:: with SMTP id
 f19mr784332ejl.533.1625246680859; 
 Fri, 02 Jul 2021 10:24:40 -0700 (PDT)
Received: from kwango.redhat.com (ip-94-112-132-16.net.upcbroadband.cz.
 [94.112.132.16])
 by smtp.gmail.com with ESMTPSA id ar27sm1242229ejc.100.2021.07.02.10.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 10:24:40 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 1/6] block/rbd: bump librbd requirement to luminous release
Date: Fri,  2 Jul 2021 19:23:51 +0200
Message-Id: <20210702172356.11574-2-idryomov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20210702172356.11574-1-idryomov@gmail.com>
References: <20210702172356.11574-1-idryomov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 ct@flyingcircus.io, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

Ceph Luminous (version 12.2.z) is almost 4 years old at this point.
Bump the requirement to get rid of the ifdef'ry in the code.
Qemu 6.1 dropped the support for RHEL-7 which was the last supported
OS that required an older librbd.

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
---
 block/rbd.c | 120 ++++------------------------------------------------
 meson.build |   7 ++-
 2 files changed, 13 insertions(+), 114 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index f51adb364670..b4b928bbb99f 100644
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
index db6789af9c90..5974a9d4b235 100644
--- a/meson.build
+++ b/meson.build
@@ -706,13 +706,16 @@ if not get_option('rbd').auto() or have_block
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
2.19.2


