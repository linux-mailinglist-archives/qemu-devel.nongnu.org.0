Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7001550DD7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 02:29:19 +0200 (CEST)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o35I6-0007n0-Bc
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 20:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o35Gs-0006JL-Io; Sun, 19 Jun 2022 20:28:02 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o35Gm-00012T-Sc; Sun, 19 Jun 2022 20:28:02 -0400
Received: by mail-pg1-x530.google.com with SMTP id 23so2680072pgc.8;
 Sun, 19 Jun 2022 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydz90Ij22LthNfr8bVktsBAeVfhykg3ixqGBagk4Bi8=;
 b=NO1wrVoNi9NEtImYWOXXe/frpxy0WXzCSDqPjYGSo/KSTtbpF+Zlet1Mq1zi3c5akE
 cqMS4sHjEN0wrpkYge9ziM6Ry7ILzHWXud1W1YsnIDfwgZ7v41og7vVO9H4ACs2Afp/V
 +gCPtdW27uZQ/UHmx/UI1XmkkMaLQEaH3kABzkkr3DHjGgofNCIQllW4vlLlz1FvARnh
 Ag1XJhF8Xmox39WdMUpczMXS6aa21imwFKLN0m5C8o/e+/wQLN5t+FnZ5Psja4zFAvWD
 YQbK3j1yWCu9nQRbZVBH/stUOGvsoC+xjSX37psjJ9NsG2+iot/J0B5mrjW6EnsAPBPg
 Hppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydz90Ij22LthNfr8bVktsBAeVfhykg3ixqGBagk4Bi8=;
 b=zpHYJ1jp+tuLd/dSS+gbKyT90rGkCdQDoJMUhDwAhK5Gy3kXngf0f4ZOs2duZsCRA1
 AvmWfw9IgLWgQ2YqeuIznTh4rVwj5pNv+hMhjJrTT8GZncdO4nvPV82405oAJ1RKP9nu
 tfGJorImaoSLkfZe8U7a8X5DgCRN35tciCF5cKbKmMfznHd68gMeWbRpE9eiH5Cgpx1m
 gkXLmmElJCiaZSzp8K3nmLOfuVGu38711RH3TePcq2WzMCg6atUrg0WDmq63/1LbFUEt
 F65BBUOcGMetsQqdim6kJUbHzxZ6s4HthP6zvAbvZ64x7oJia9qKCqWjPOA9Co7lD2A1
 OHaw==
X-Gm-Message-State: AJIora+nzXo//VKSzbcJc6Y5bfqbg83Ld5MFgbG/H9hTU20DTmdlJ2IS
 z7ymsHB7/aW8xyHZ2iUgqJTSeIapW0c2gBj/g0c=
X-Google-Smtp-Source: AGRyM1uyeckavyhTGKotzfgGDARBUtSmVZaFKzkmze/7rknqxCtpe3odxYwfbHWKH+SP9D94lf98vA==
X-Received: by 2002:a63:cd52:0:b0:3fe:30ec:825d with SMTP id
 a18-20020a63cd52000000b003fe30ec825dmr19468152pgj.82.1655684874272; 
 Sun, 19 Jun 2022 17:27:54 -0700 (PDT)
Received: from resources.jetbrains.com ([106.84.130.14])
 by smtp.gmail.com with ESMTPSA id
 bc10-20020a170902930a00b0016413dbbf92sm7281875plb.234.2022.06.19.17.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 17:27:53 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v1] Add support for zoned device
Date: Mon, 20 Jun 2022 08:27:21 +0800
Message-Id: <20220620002721.26081-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This patch series adds support for zoned device to virtio-blk emulation.
Zoned storage can support sequential writes, which reduces write 
amplification in SSD, leading to higher write throughput and increased
capacity.

v1:
- add block layer APIs resembling Linux ZoneBlockDevice ioctls.

By adding zone management operations in BlockDriver, storage
controller emulation can use the new block layer APIs including
zone_report, zone_reset, zone_open, zone_close, and zone_finish.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/block-backend.c             |  22 ++++
 block/coroutines.h                |   5 +
 block/file-posix.c                | 182 ++++++++++++++++++++++++++++++
 block/io.c                        |  23 ++++
 include/block/block-common.h      |  43 ++++++-
 include/block/block-io.h          |  13 +++
 include/block/block_int-common.h  |  20 ++++
 qemu-io-cmds.c                    | 118 +++++++++++++++++++
 tests/qemu-iotests/tests/zoned.sh |  52 +++++++++
 9 files changed, 477 insertions(+), 1 deletion(-)
 create mode 100644 tests/qemu-iotests/tests/zoned.sh

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..20248e4a35 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
     int ret;
 } BlockBackendAIOCB;
 
+
+
 static const AIOCBInfo block_backend_aiocb_info = {
     .get_aio_context = blk_aiocb_get_aio_context,
     .aiocb_size = sizeof(BlockBackendAIOCB),
@@ -1810,6 +1812,25 @@ int blk_flush(BlockBackend *blk)
     return ret;
 }
 
+int blk_co_zone_report(BlockBackend *blk, int64_t offset, int64_t len,
+                       int64_t *nr_zones,
+                       struct BlockZoneDescriptor *zones)
+{
+    int ret;
+    ret = bdrv_co_zone_report(blk->root->bs, offset, len, nr_zones, zones);
+    return ret;
+}
+
+int blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
+        int64_t offset, int64_t len)
+{
+    int ret;
+    ret = bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
+
+    return ret;
+}
+
+
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
@@ -2634,3 +2655,4 @@ int blk_make_empty(BlockBackend *blk, Error **errp)
 
     return bdrv_make_empty(blk->root, errp);
 }
+
diff --git a/block/coroutines.h b/block/coroutines.h
index 830ecaa733..247326255f 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -80,6 +80,11 @@ int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 
 int coroutine_fn blk_co_do_flush(BlockBackend *blk);
+int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
+                                    int64_t len, int64_t *nr_zones,
+                                    struct BlockZoneDescriptor *zones);
+int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
+        int64_t offset, int64_t len);
 
 
 /*
diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..71fd21f8ba 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -178,6 +178,137 @@ typedef struct BDRVRawReopenState {
     bool check_cache_dropped;
 } BDRVRawReopenState;
 
+/*
+ * parse_zone - Fill a zone descriptor
+ */
+static inline void parse_zone(struct BlockZoneDescriptor *zone,
+        struct blk_zone *blkz) {
+    zone->start = blkz->start << BDRV_SECTOR_BITS;
+    zone->length = blkz->len << BDRV_SECTOR_BITS;
+    zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
+    zone->wp = blkz->wp << BDRV_SECTOR_BITS;
+    zone->type = blkz->type;
+    zone->cond = blkz->type;
+}
+
+/**
+ * zone report - Get a zone block device's information in the
+ * form of an array of zone descriptors.
+ *
+ * @param bs: passing zone block device file descriptor
+ * @param zones: Space to hold zone information on reply
+ * @param offset: the location in the zone block device
+ * @return 0 on success, -1 on failure
+ */
+static int raw_co_zone_report(BlockDriverState *bs, int64_t offset, int64_t len,
+                              int64_t *nr_zones,
+                              struct BlockZoneDescriptor *zones) {
+    BDRVRawState *s = bs->opaque;
+    struct blk_zone_report *rep;
+    struct BlockZoneDescriptor bzd;
+    struct blk_zone *blkz;
+    int64_t zone_size_mask, end, rep_size, nrz;
+    int ret, n = 0, i = 0;
+
+    printf("%s\n", "start to report zone");
+    nrz = *nr_zones;
+    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
+    rep = (struct blk_zone_report *)malloc(rep_size);
+    if (!rep) {
+        return -1;
+    }
+
+    zone_size_mask = zone_start_sector - 1;
+    /* align up */
+    end = ((offset + len + zone_size_mask) & (~zone_size_mask))
+            >> BDRV_SECTOR_BITS;
+
+    blkz = (struct blk_zone *)(rep + 1);
+    while (offset < end) {
+        memset(rep, 0, rep_size);
+        rep->sector = offset;
+        rep->nr_zones = nrz;
+
+        ret = ioctl(s->fd, BLKREPORTZONE, rep);
+        if (ret != 0) {
+            ret = -errno;
+            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
+                         s->fd, offset, errno);
+            free(rep);
+            return ret;
+        }
+
+        if (!rep->nr_zones) {
+            break;
+        }
+
+        for (i = 0; i < rep->nr_zones; i++) {
+            parse_zone(&bzd, &blkz[i]);
+            if (zones) {
+                memcpy(&zones[n], &bzd, sizeof(bzd));
+            }
+        }
+
+        offset = blkz[i].start + blkz[i].len;
+    }
+
+    return ret;
+}
+
+/**
+ * zone management operations - Execute an operation on a zone
+ */
+static int raw_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len) {
+    BDRVRawState *s = bs->opaque;
+    struct blk_zone_range range;
+    const char *ioctl_name;
+    uint64_t ioctl_op;
+    int64_t zone_size_mask, end;
+    int ret;
+
+    zone_size_mask = zone_start_sector - 1;
+    /* align up */
+    end = ((offset + len + zone_size_mask) & (~zone_size_mask))
+            >> BDRV_SECTOR_BITS;
+    offset = (offset & (~zone_size_mask)) >> BDRV_SECTOR_BITS; /* align down */
+
+    switch (op) {
+    case zone_open:
+        ioctl_name = "BLKOPENZONE";
+        ioctl_op = BLKOPENZONE;
+        break;
+    case zone_close:
+        ioctl_name = "BLKCLOSEZONE";
+        ioctl_op = BLKCLOSEZONE;
+        break;
+    case zone_finish:
+        ioctl_name = "BLKFINISHZONE";
+        ioctl_op = BLKFINISHZONE;
+        break;
+    case zone_reset:
+        ioctl_name = "BLKRESETZONE";
+        ioctl_op = BLKRESETZONE;
+        break;
+    default:
+        error_report("Invalid zone operation 0x%x", op);
+        errno = -EINVAL;
+        return -1;
+    }
+
+    /* Execute the operation */
+    range.sector = offset;
+    range.nr_sectors = end - offset;
+    ret = ioctl(s->fd, ioctl_op, &range);
+    if (ret != 0) {
+        error_report("ioctl %s failed %d",
+                         ioctl_name, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
 static int fd_open(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
@@ -3324,6 +3455,9 @@ BlockDriver bdrv_file = {
     .bdrv_abort_perm_update = raw_abort_perm_update,
     .create_opts = &raw_create_opts,
     .mutable_opts = mutable_opts,
+
+    .bdrv_co_zone_report = raw_co_zone_report,
+    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
 };
 
 /***********************************************/
@@ -3703,6 +3837,53 @@ static BlockDriver bdrv_host_device = {
 #endif
 };
 
+static BlockDriver bdrv_zoned_host_device = {
+        .format_name = "zoned_host_device",
+        .protocol_name = "zoned_host_device",
+        .instance_size = sizeof(BDRVRawState),
+        .bdrv_needs_filename = true,
+        .bdrv_probe_device  = hdev_probe_device,
+        .bdrv_parse_filename = hdev_parse_filename,
+        .bdrv_file_open     = hdev_open,
+        .bdrv_close         = raw_close,
+        .bdrv_reopen_prepare = raw_reopen_prepare,
+        .bdrv_reopen_commit  = raw_reopen_commit,
+        .bdrv_reopen_abort   = raw_reopen_abort,
+        .bdrv_co_create_opts = bdrv_co_create_opts_simple,
+        .create_opts         = &bdrv_create_opts_simple,
+        .mutable_opts        = mutable_opts,
+        .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
+        .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
+
+        .bdrv_co_preadv         = raw_co_preadv,
+        .bdrv_co_pwritev        = raw_co_pwritev,
+        .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
+        .bdrv_co_pdiscard       = hdev_co_pdiscard,
+        .bdrv_co_copy_range_from = raw_co_copy_range_from,
+        .bdrv_co_copy_range_to  = raw_co_copy_range_to,
+        .bdrv_refresh_limits = raw_refresh_limits,
+        .bdrv_io_plug = raw_aio_plug,
+        .bdrv_io_unplug = raw_aio_unplug,
+        .bdrv_attach_aio_context = raw_aio_attach_aio_context,
+
+        .bdrv_co_truncate       = raw_co_truncate,
+        .bdrv_getlength = raw_getlength,
+        .bdrv_get_info = raw_get_info,
+        .bdrv_get_allocated_file_size
+                            = raw_get_allocated_file_size,
+        .bdrv_get_specific_stats = hdev_get_specific_stats,
+        .bdrv_check_perm = raw_check_perm,
+        .bdrv_set_perm   = raw_set_perm,
+        .bdrv_abort_perm_update = raw_abort_perm_update,
+        .bdrv_probe_blocksizes = hdev_probe_blocksizes,
+        .bdrv_probe_geometry = hdev_probe_geometry,
+        .bdrv_co_ioctl = hdev_co_ioctl,
+
+        /* zone management operations */
+        .bdrv_co_zone_report = raw_co_zone_report,
+        .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+};
+
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 static void cdrom_parse_filename(const char *filename, QDict *options,
                                  Error **errp)
@@ -3964,6 +4145,7 @@ static void bdrv_file_init(void)
 #if defined(HAVE_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
 #ifdef __linux__
+    bdrv_register(&bdrv_zoned_host_device);
     bdrv_register(&bdrv_host_cdrom);
 #endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
diff --git a/block/io.c b/block/io.c
index 789e6373d5..3e8bb83cc3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3258,6 +3258,29 @@ out:
     return co.ret;
 }
 
+int bdrv_co_zone_report(BlockDriverState *bs,
+                        int64_t offset, int64_t len, int64_t *nr_zones,
+                        struct BlockZoneDescriptor *zones)
+{
+    int ret = 0;
+    if (!bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones)) {
+        return -ENOTSUP;
+    }
+
+    return ret;
+}
+
+int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len)
+{
+    int ret = 0;
+    if (!bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len)) {
+        return -ENOTSUP;
+    }
+
+    return ret;
+}
+
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
     IO_CODE();
diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..24c468d8ad 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -23,7 +23,7 @@
  */
 #ifndef BLOCK_COMMON_H
 #define BLOCK_COMMON_H
-
+#include <linux/blkzoned.h>
 #include "block/aio.h"
 #include "block/aio-wait.h"
 #include "qemu/iov.h"
@@ -48,6 +48,47 @@
 typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
 typedef struct BdrvChildClass BdrvChildClass;
+enum zone_type {
+    BLK_ZT_CONV = BLK_ZONE_TYPE_CONVENTIONAL,
+    BLK_ZT_SWR = BLK_ZONE_TYPE_SEQWRITE_REQ,
+    BLK_ZT_SWP = BLK_ZONE_TYPE_SEQWRITE_PREF,
+};
+
+enum zone_cond {
+    BLK_ZS_NOT_WP = BLK_ZONE_COND_NOT_WP,
+    BLK_ZS_EMPTY = BLK_ZONE_COND_EMPTY,
+    BLK_ZS_IOPEN = BLK_ZONE_COND_IMP_OPEN,
+    BLK_ZS_EOPEN = BLK_ZONE_COND_EXP_OPEN,
+    BLK_ZS_CLOSED = BLK_ZONE_COND_CLOSED,
+    BLK_ZS_RDONLY = BLK_ZONE_COND_READONLY,
+    BLK_ZS_FULL = BLK_ZONE_COND_FULL,
+    BLK_ZS_OFFLINE = BLK_ZONE_COND_OFFLINE,
+};
+
+enum zone_op {
+    zone_open,
+    zone_close,
+    zone_finish,
+    zone_reset,
+};
+
+/*
+ * Zone descriptor data structure.
+ * Provide information on a zone with all position and size values in bytes.
+ */
+typedef struct BlockZoneDescriptor {
+    uint64_t start;
+    uint64_t length;
+    uint64_t cap;
+    uint64_t wp;
+    enum zone_type type;
+    enum zone_cond cond;
+} BlockZoneDescriptor;
+
+enum zone_model {
+    BLK_Z_HM,
+    BLK_Z_HA,
+};
 
 typedef struct BlockDriverInfo {
     /* in bytes, 0 if irrelevant */
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 62c84f0519..deb8902684 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
 
+/* Report zone information of zone block device. */
+int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                     int64_t len, int64_t *nr_zones,
+                                     struct BlockZoneDescriptor *zones);
+int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
+        int64_t offset, int64_t len);
+
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
@@ -290,6 +297,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 int generated_co_wrapper
 bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
+int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offset,
+                                         int64_t len, int64_t *nr_zones,
+                                         struct BlockZoneDescriptor *zones);
+int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op op,
+        int64_t offset, int64_t len);
+
 /**
  * bdrv_parent_drained_begin_single:
  *
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..4d0180a7da 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -63,6 +63,7 @@
 #define BLOCK_OPT_EXTL2             "extended_l2"
 
 #define BLOCK_PROBE_BUF_SIZE        512
+#define zone_start_sector           512
 
 enum BdrvTrackedRequestType {
     BDRV_TRACKED_READ,
@@ -94,6 +95,19 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;
 
+/**
+ * Zone device information data structure.
+ * Provide information on a device.
+ */
+typedef struct zbd_dev {
+    enum zone_model model;
+    uint32_t block_size;
+    uint32_t write_granularity;
+    uint32_t nr_zones;
+    struct BlockZoneDescriptor *zones; /* array of zones */
+    uint32_t max_nr_open_zones; /* maximum number of explicitly open zones */
+    uint32_t max_nr_active_zones;
+} zbd_dev;
 
 struct BlockDriver {
     /*
@@ -691,6 +705,12 @@ struct BlockDriver {
                                           QEMUIOVector *qiov,
                                           int64_t pos);
 
+    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
+            int64_t offset, int64_t len, int64_t *nr_zones,
+            struct BlockZoneDescriptor *zones);
+    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, enum zone_op op,
+            int64_t offset, int64_t len);
+
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 2f0d8ac25a..51da6b7a89 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1706,6 +1706,119 @@ static const cmdinfo_t flush_cmd = {
     .oneline    = "flush all in-core file state to disk",
 };
 
+static int zone_report_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    printf("block report\n");
+    BlockZoneDescriptor *zones;
+    int64_t offset, len, nr_zones;
+    int i = 0;
+
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ++optind;
+    nr_zones = cvtnum(argv[optind]);
+    zones = malloc(sizeof(struct BlockZoneDescriptor) * nr_zones);
+    ret = blk_zone_report(blk, offset, len, &nr_zones, zones);
+    while (i < nr_zones) {
+        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%lx, "
+                        "zcond:%u, [type: %u]\n",
+                zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
+                zones[i].cond, zones[i].type);
+        ++i;
+    }
+    free(zones);
+    return ret;
+}
+
+static const cmdinfo_t zone_report_cmd = {
+        .name = "zone_report",
+        .altname = "f",
+        .cfunc = zone_report_f,
+        .argmin = 3,
+        .argmax = 3,
+        .args = "offset [offset..] len [len..] number [num..]",
+        .oneline = "report a number of bytes of zone information",
+};
+
+static int zone_open_f(BlockBackend *blk, int argc, char **argv)
+{
+    return blk_zone_mgmt(blk, zone_open, 0, 0);
+}
+
+static const cmdinfo_t zone_open_cmd = {
+        .name = "zone_open",
+        .altname = "f",
+        .cfunc = zone_open_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "explicit open a range of zones in zone block device",
+};
+
+static int zone_close_f(BlockBackend *blk, int argc, char **argv)
+{
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    return blk_zone_mgmt(blk, zone_close, offset, len);
+}
+
+static const cmdinfo_t zone_close_cmd = {
+        .name = "zone_close",
+        .altname = "f",
+        .cfunc = zone_close_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "close a range of zones in zone block device",
+};
+
+static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
+{
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    return blk_zone_mgmt(blk, zone_finish, offset, len);
+}
+
+static const cmdinfo_t zone_finish_cmd = {
+        .name = "zone_finish",
+        .altname = "f",
+        .cfunc = zone_finish_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "finish a range of zones in zone block device",
+};
+
+static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
+{
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    return blk_zone_mgmt(blk, zone_reset, offset, len);
+}
+
+static const cmdinfo_t zone_reset_cmd = {
+        .name = "zone_reset",
+        .altname = "f",
+        .cfunc = zone_reset_f,
+        .argmin = 2,
+        .argmax = 2,
+        .args = "offset [offset..] len [len..]",
+        .oneline = "reset a zone write pointer in zone block device",
+};
+
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2498,6 +2611,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&aio_write_cmd);
     qemuio_add_command(&aio_flush_cmd);
     qemuio_add_command(&flush_cmd);
+    qemuio_add_command(&zone_report_cmd);
+    qemuio_add_command(&zone_open_cmd);
+    qemuio_add_command(&zone_close_cmd);
+    qemuio_add_command(&zone_finish_cmd);
+    qemuio_add_command(&zone_reset_cmd);
     qemuio_add_command(&truncate_cmd);
     qemuio_add_command(&length_cmd);
     qemuio_add_command(&info_cmd);
diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
new file mode 100644
index 0000000000..042e47af27
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -0,0 +1,52 @@
+#!/usr/bin/env bash
+#
+# Test zone management operations.
+#
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1 # failure is the default!
+
+_cleanup()
+{
+  _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.pattern
+
+# much of this could be generic for any format supporting compression.
+_supported_fmt qcow qcow2
+_supported_proto file
+_supported_os Linux
+
+TEST_OFFSETS="0"
+TEST_LENS="1000"
+IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0 -c"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+echo "Testing a null_blk device"
+echo
+echo "Simple cases: testing operations once at a time"
+echo
+echo "At beginning: report all of the zones"
+echo
+$QEMU_IO "$IMG zone_report"
+$QEMU_IO "$IMG zone_open"
+echo "After opening a zone:"
+$QEMU_IO "$IMG zone_report"
+$QEMU_IO "$IMG zone_close"
+echo "After closing a zone:"
+$QEMU_IO "$IMG zone_report"
+$QEMU_IO "$IMG zone_reset"
+echo "After resetting a zone:"
+$QEMU_IO "$IMG zone_report"
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
-- 
2.35.3


