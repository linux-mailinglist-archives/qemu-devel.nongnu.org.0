Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57C5F96E2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:36:36 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohiei-0006I5-0S
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohibl-0001HZ-D1; Sun, 09 Oct 2022 22:33:35 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohibj-0007pM-5n; Sun, 09 Oct 2022 22:33:33 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so8126959pjl.0; 
 Sun, 09 Oct 2022 19:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDdnwZ8LlAo9NIDS/xnjTRz5pB5SfY/ZhaHzYJkeBAk=;
 b=J0Tv6zCUvGPb2lYBY8nM6zO8bRWR3GmCx11nRDwq5gWmYOCt/SBxOuQBLiwCTa+9Tq
 YTr7N6DEr4UvtIWAt3Kae9heUmf04YkfoGFBx1zcDw6qm4i1Y4pIWd1ik03fFtH/lqDG
 LrcQO+96VSGGDCZMgNqMsn+MGBPn/P0akM1cMTuuBr80TGMpCdFPduBRfz7OqoNt+zIl
 LsxzEEFqLLSnV5+dk1IldzDY/4T6tMIV3tVgfMpPqqUBI8XFhIk+PEK+f9OljLsZ/CF6
 +cUPIUfHONo03SX4owvbspaaI9seJtS72hiy/iIHSmGbsREIhDh3ET/flOdO/0WUzB6k
 eiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDdnwZ8LlAo9NIDS/xnjTRz5pB5SfY/ZhaHzYJkeBAk=;
 b=NKdEnOWzm4LtWVfzhbk6AFCxB8YV+iY3Uc+UKv1gH0fdOjSarkmkzMVwJV+/+cELHl
 gLwBAZVN+wFyY/7myJsZwujJNBjGgNuMs2QQJ+UC7PS3jzMkTy1R8/AVnC2lIoT17Z1j
 0LhlXXNaYzY2rWO+JS11Z3OHBK8O5KCVBnyFEDb+035t8BRsep5Cq72pntROFv3H6J0g
 zSGL8i1aU5t9aBVuTxPw98xG8vKdDlxMYL2kb4jUy4lbq1tYE1HQ8FfWJhrvFyiJLY1n
 yEywHEstuVqmb08U92WUoqFvEMievSXmh6lOqUYacxRLNzHa33+VP9Q9PD2iEHbPg2HL
 FsWw==
X-Gm-Message-State: ACrzQf36KV9TbitbCrFC3NTRBZze9elTN0e5lQ392kdP5bbDR99O6ff/
 TjJQr/QlseQSVcrCCI8GzcwQ6J+2cfebRJptZVc=
X-Google-Smtp-Source: AMsMyM5MF02heJewJ1p9KHlkFTVZWHAtGKjVKBTnWBXrZTvMMBG3At5/WMCq0rvFMjXm5oMKUNg6QQ==
X-Received: by 2002:a17:90b:1d4d:b0:20a:794a:f6e7 with SMTP id
 ok13-20020a17090b1d4d00b0020a794af6e7mr29568285pjb.151.1665369209216; 
 Sun, 09 Oct 2022 19:33:29 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 j64-20020a625543000000b00537b1aa9191sm5743995pfb.178.2022.10.09.19.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:33:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v3 2/3] block: introduce zone append write for zoned devices
Date: Mon, 10 Oct 2022 10:33:05 +0800
Message-Id: <20221010023306.43610-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010023306.43610-1-faithilikerun@gmail.com>
References: <20221010023306.43610-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

A zone append command is a write operation that specifies the first
logical block of a zone as the write position. When writing to a zoned
block device using zone append, the byte offset of writes is pointing
to the write pointer of that zone. Upon completion the device will
respond with the position the data has been written in the zone.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/block-backend.c             | 64 +++++++++++++++++++++++++++++++
 block/file-posix.c                | 64 ++++++++++++++++++++++++++++---
 block/io.c                        | 21 ++++++++++
 block/raw-format.c                |  7 ++++
 include/block/block-io.h          |  3 ++
 include/block/block_int-common.h  |  3 ++
 include/block/raw-aio.h           |  4 +-
 include/sysemu/block-backend-io.h |  9 +++++
 8 files changed, 168 insertions(+), 7 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ddc569e3ac..bfdb719bc8 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
         struct {
             BlockZoneOp op;
         } zone_mgmt;
+        struct {
+            int64_t *append_sector;
+        } zone_append;
     };
 } BlkRwCo;
 
@@ -1869,6 +1872,46 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
     return &acb->common;
 }
 
+static void coroutine_fn blk_aio_zone_append_entry(void *opaque) {
+    BlkAioEmAIOCB *acb = opaque;
+    BlkRwCo *rwco = &acb->rwco;
+
+    rwco->ret = blk_co_zone_append(rwco->blk, rwco->zone_append.append_sector,
+                                   rwco->iobuf, rwco->flags);
+    blk_aio_complete(acb);
+}
+
+BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
+                                QEMUIOVector *qiov, BdrvRequestFlags flags,
+                                BlockCompletionFunc *cb, void *opaque) {
+    BlkAioEmAIOCB *acb;
+    Coroutine *co;
+    IO_CODE();
+
+    blk_inc_in_flight(blk);
+    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
+    acb->rwco = (BlkRwCo) {
+            .blk    = blk,
+            .ret    = NOT_DONE,
+            .flags  = flags,
+            .iobuf  = qiov,
+            .zone_append = {
+                    .append_sector = offset,
+            },
+    };
+    acb->has_returned = false;
+
+    co = qemu_coroutine_create(blk_aio_zone_append_entry, acb);
+    bdrv_coroutine_enter(blk_bs(blk), co);
+    acb->has_returned = true;
+    if (acb->rwco.ret != NOT_DONE) {
+        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
+                                         blk_aio_complete_bh, acb);
+    }
+
+    return &acb->common;
+}
+
 /*
  * Send a zone_report command.
  * offset is a byte offset from the start of the device. No alignment
@@ -1921,6 +1964,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
     return ret;
 }
 
+/*
+ * Send a zone_append command.
+ */
+int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset,
+        QEMUIOVector *qiov, BdrvRequestFlags flags)
+{
+    int ret;
+    IO_CODE();
+
+    blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
+    if (!blk_is_available(blk)) {
+        blk_dec_in_flight(blk);
+        return -ENOMEDIUM;
+    }
+
+    ret = bdrv_co_zone_append(blk_bs(blk), offset, qiov, flags);
+    blk_dec_in_flight(blk);
+    return ret;
+}
+
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/block/file-posix.c b/block/file-posix.c
index 17c0b58158..08ab164df4 100755
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1657,7 +1657,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
     ssize_t len;
 
     do {
-        if (aiocb->aio_type & QEMU_AIO_WRITE)
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
             len = qemu_pwritev(aiocb->aio_fildes,
                                aiocb->io.iov,
                                aiocb->io.niov,
@@ -1687,7 +1687,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
     ssize_t len;
 
     while (offset < aiocb->aio_nbytes) {
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             len = pwrite(aiocb->aio_fildes,
                          (const char *)buf + offset,
                          aiocb->aio_nbytes - offset,
@@ -1731,7 +1731,7 @@ static int handle_aiocb_rw(void *opaque)
      * The offset of regular writes, append writes is the wp location
      * of that zone.
      */
-    if (aiocb->aio_type & QEMU_AIO_WRITE) {
+    if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
         if (aiocb->bs->bl.zone_size > 0) {
             BlockZoneWps *wps = aiocb->bs->bl.wps;
             qemu_mutex_lock(&wps->lock);
@@ -1794,7 +1794,7 @@ static int handle_aiocb_rw(void *opaque)
     }
 
     nbytes = handle_aiocb_rw_linear(aiocb, buf);
-    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
+    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
         char *p = buf;
         size_t count = aiocb->aio_nbytes, copy;
         int i;
@@ -1816,7 +1816,7 @@ static int handle_aiocb_rw(void *opaque)
 out:
     if (nbytes == aiocb->aio_nbytes) {
 #if defined(CONFIG_BLKZONED)
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             BlockZoneWps *wps = aiocb->bs->bl.wps;
             int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
             if (wps) {
@@ -1828,6 +1828,11 @@ out:
                     if (wend_offset > wps->wp[index]){
                         wps->wp[index] = wend_offset;
                     }
+
+                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
+                        *aiocb->io.append_sector =
+                                wps->wp[index] >> BDRV_SECTOR_BITS;
+                    }
                 }
                 qemu_mutex_unlock(&wps->lock);
             }
@@ -1845,7 +1850,7 @@ out:
     } else {
         assert(nbytes < 0);
 #if defined(CONFIG_BLKZONED)
-        if (aiocb->aio_type & QEMU_AIO_WRITE) {
+        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
             update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
                             aiocb->bs->bl.nr_zones);
         }
@@ -3493,6 +3498,52 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
 }
 #endif
 
+#if defined(CONFIG_BLKZONED)
+static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
+                                           int64_t *offset,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags) {
+    BDRVRawState *s = bs->opaque;
+    int64_t zone_size_mask = bs->bl.zone_size - 1;
+    int64_t iov_len = 0;
+    int64_t len = 0;
+    RawPosixAIOData acb;
+
+    if (*offset & zone_size_mask) {
+        error_report("sector offset %" PRId64 " is not aligned to zone size "
+                     "%" PRId32 "", *offset / 512, bs->bl.zone_size / 512);
+        return -EINVAL;
+    }
+
+    int64_t wg = bs->bl.write_granularity;
+    int64_t wg_mask = wg - 1;
+    for (int i = 0; i < qiov->niov; i++) {
+       iov_len = qiov->iov[i].iov_len;
+       if (iov_len & wg_mask) {
+           error_report("len of IOVector[%d] %" PRId64 " is not aligned to block "
+                        "size %" PRId64 "", i, iov_len, wg);
+           return -EINVAL;
+       }
+       len += iov_len;
+    }
+
+    acb = (RawPosixAIOData) {
+        .bs = bs,
+        .aio_fildes = s->fd,
+        .aio_type = QEMU_AIO_ZONE_APPEND,
+        .aio_offset = *offset,
+        .aio_nbytes = len,
+        .io = {
+                .iov = qiov->iov,
+                .niov = qiov->niov,
+                .append_sector = offset,
+        },
+    };
+
+    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+}
+#endif
+
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 bool blkdev)
@@ -4268,6 +4319,7 @@ static BlockDriver bdrv_zoned_host_device = {
     /* zone management operations */
     .bdrv_co_zone_report = raw_co_zone_report,
     .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+    .bdrv_co_zone_append = raw_co_zone_append,
 };
 #endif
 
diff --git a/block/io.c b/block/io.c
index e5aaa64e17..935abf2ed4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3230,6 +3230,27 @@ out:
     return co.ret;
 }
 
+int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
+                        QEMUIOVector *qiov,
+                        BdrvRequestFlags flags)
+{
+    BlockDriver *drv = bs->drv;
+    CoroutineIOCompletion co = {
+            .coroutine = qemu_coroutine_self(),
+    };
+    IO_CODE();
+
+    bdrv_inc_in_flight(bs);
+    if (!drv || !drv->bdrv_co_zone_append) {
+        co.ret = -ENOTSUP;
+        goto out;
+    }
+    co.ret = drv->bdrv_co_zone_append(bs, offset, qiov, flags);
+out:
+    bdrv_dec_in_flight(bs);
+    return co.ret;
+}
+
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
     IO_CODE();
diff --git a/block/raw-format.c b/block/raw-format.c
index b885688434..f132880c85 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -325,6 +325,12 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
     return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
 }
 
+static int coroutine_fn raw_co_zone_append(BlockDriverState *bs, int64_t *offset,
+                                           QEMUIOVector *qiov,
+                                           BdrvRequestFlags flags) {
+    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
+}
+
 static int64_t raw_getlength(BlockDriverState *bs)
 {
     int64_t len;
@@ -628,6 +634,7 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
     .bdrv_co_zone_report  = &raw_co_zone_report,
     .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
+    .bdrv_co_zone_append = &raw_co_zone_append,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index f0cdf67d33..6a54453578 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -94,6 +94,9 @@ int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
                                      BlockZoneDescriptor *zones);
 int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
                                    int64_t offset, int64_t len);
+int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
+                                     QEMUIOVector *qiov,
+                                     BdrvRequestFlags flags);
 
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 59c2d1316d..a7e7db5646 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -701,6 +701,9 @@ struct BlockDriver {
             BlockZoneDescriptor *zones);
     int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
             int64_t offset, int64_t len);
+    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
+            int64_t *offset, QEMUIOVector *qiov,
+            BdrvRequestFlags flags);
 
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 3d26929cdd..f13cc1887b 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -31,6 +31,7 @@
 #define QEMU_AIO_TRUNCATE     0x0080
 #define QEMU_AIO_ZONE_REPORT  0x0100
 #define QEMU_AIO_ZONE_MGMT    0x0200
+#define QEMU_AIO_ZONE_APPEND  0x0400
 #define QEMU_AIO_TYPE_MASK \
         (QEMU_AIO_READ | \
          QEMU_AIO_WRITE | \
@@ -41,7 +42,8 @@
          QEMU_AIO_COPY_RANGE | \
          QEMU_AIO_TRUNCATE  | \
          QEMU_AIO_ZONE_REPORT | \
-         QEMU_AIO_ZONE_MGMT)
+         QEMU_AIO_ZONE_MGMT | \
+         QEMU_AIO_ZONE_APPEND)
 
 /* AIO flags */
 #define QEMU_AIO_MISALIGNED   0x1000
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6835525582..33e35ae5d7 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -51,6 +51,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
 BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                               int64_t offset, int64_t len,
                               BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
+                                QEMUIOVector *qiov, BdrvRequestFlags flags,
+                                BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel_async(BlockAIOCB *acb);
@@ -172,6 +175,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                                   int64_t offset, int64_t len);
 int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
                                        int64_t offset, int64_t len);
+int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset,
+                                    QEMUIOVector *qiov,
+                                    BdrvRequestFlags flags);
+int generated_co_wrapper blk_zone_append(BlockBackend *blk, int64_t *offset,
+                                         QEMUIOVector *qiov,
+                                         BdrvRequestFlags flags);
 
 int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
                                       int64_t bytes);
-- 
2.37.3


