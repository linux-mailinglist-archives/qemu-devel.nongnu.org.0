Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1C65EF118
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:00:52 +0200 (CEST)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpPX-0006x4-Tg
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2m-0000h8-GY; Thu, 29 Sep 2022 04:37:25 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2g-0007ja-Ts; Thu, 29 Sep 2022 04:37:20 -0400
Received: by mail-pg1-x533.google.com with SMTP id 129so847134pgc.5;
 Thu, 29 Sep 2022 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=H9FlPjialttbgWBGdyUs6RB7k1ork6IUjXSWOE3vzCI=;
 b=f1v6CA9B8Nk1S7HK9ZBXBYfR85Lggy8oWf2qDDPPZJrf4pg0w3Acn33aUGRsh4H0mi
 o1K+ikQFR9ZTL717/eE2rASFqmJae6BFvNwjzaWxnko52u0IziUUgG1lvByTcwS4xwuT
 bFOIaLiGmzFZqyFWdd8eFJPXqNw3ve0XJoKyTPS/RVtz6+sNcs+peNYapsuESWhh8LH4
 QLp8H5kKP0O+dN4ZHvDnbogNpGAk10h5AdS7oEvApmWgabZfbN7JQZWNNalWULvwwyy6
 JYU/NyBTtSq57bn3LNzKWech4hWRKYMoGKHeTZq7B7OY9JfOPWraMlP51hU74UAWE9Wf
 83mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=H9FlPjialttbgWBGdyUs6RB7k1ork6IUjXSWOE3vzCI=;
 b=4sbxmT3pv21IvJHZ0B2cJTJ7X4qs3ztYrDmAl8pm1Ppgru2t2l3O8K5PKFWwV4sHgi
 y6cJldjPL4SXYOUfrpRYg6XAAh2SB6vxlCadpEnclQtI9VZ7SzKOkNlAYXga9Qj6E+N+
 z7yopvUM4F5mY1b9JE8l0nX8WL2XQh+ciR/Lcq8amd46MTA3gQnqg3xdSuPiTxl8kT7u
 kNUOsHOvg3fiRjnMtjnVNxLpX3FVrifGDb0vAFFEADOOL5jNwoC5Hjg2PcUz/jjz6d9e
 yCGGL0oJHtYC75AfFceA0Cl+qHPdONxXHpJSdm9AcgFEqg+IOdlkl/dAp/W/utvm84QM
 n/BA==
X-Gm-Message-State: ACrzQf30foypQOVNzWW5Xc+KamOzce2fAoyYgzbHqZkE7h3+R5weXBEW
 xPxvV3Mug34+GzU95/h8z1QbFnyL+V8odQ==
X-Google-Smtp-Source: AMsMyM5vddStyqVsig5G58ayamutEZTXpLHn/Ee6GfDarahWnv+9fx3Sa7RvNywuX3V5XbD7J2ZQKg==
X-Received: by 2002:a63:4918:0:b0:439:1802:dda3 with SMTP id
 w24-20020a634918000000b004391802dda3mr1880484pga.467.1664440632856; 
 Thu, 29 Sep 2022 01:37:12 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b0017829a3df46sm5324233plg.204.2022.09.29.01.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:37:12 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Date: Thu, 29 Sep 2022 16:36:27 +0800
Message-Id: <20220929083631.61899-4-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929083631.61899-1-faithilikerun@gmail.com>
References: <20220929083631.61899-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x533.google.com
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

Add a new zoned_host_device BlockDriver. The zoned_host_device option
accepts only zoned host block devices. By adding zone management
operations in this new BlockDriver, users can use the new block
layer APIs including Report Zone and four zone management operations
(open, close, finish, reset).

Qemu-io uses the new APIs to perform zoned storage commands of the device:
zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
zone_finish(zf).

For example, to test zone_report, use following command:
$ ./build/qemu-io --image-opts -n driver=zoned_host_device, filename=/dev/nullb0
-c "zrp offset nr_zones"

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/block-backend.c             | 146 +++++++++++++
 block/file-posix.c                | 340 +++++++++++++++++++++++++++++-
 block/io.c                        |  41 ++++
 include/block/block-common.h      |   4 +
 include/block/block-io.h          |   7 +
 include/block/block_int-common.h  |  24 +++
 include/block/raw-aio.h           |   6 +-
 include/sysemu/block-backend-io.h |  17 ++
 meson.build                       |   4 +
 qapi/block-core.json              |   8 +-
 qemu-io-cmds.c                    | 148 +++++++++++++
 11 files changed, 741 insertions(+), 4 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index d4a5df2ac2..f7f7acd6f4 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1431,6 +1431,15 @@ typedef struct BlkRwCo {
     void *iobuf;
     int ret;
     BdrvRequestFlags flags;
+    union {
+        struct {
+            unsigned int *nr_zones;
+            BlockZoneDescriptor *zones;
+        } zone_report;
+        struct {
+            BlockZoneOp op;
+        } zone_mgmt;
+    };
 } BlkRwCo;
 
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
@@ -1775,6 +1784,143 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     return ret;
 }
 
+static void blk_aio_zone_report_entry(void *opaque) {
+    BlkAioEmAIOCB *acb = opaque;
+    BlkRwCo *rwco = &acb->rwco;
+
+    rwco->ret = blk_co_zone_report(rwco->blk, rwco->offset,
+                                   rwco->zone_report.nr_zones,
+                                   rwco->zone_report.zones);
+    blk_aio_complete(acb);
+}
+
+BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
+                                unsigned int *nr_zones,
+                                BlockZoneDescriptor  *zones,
+                                BlockCompletionFunc *cb, void *opaque)
+{
+    BlkAioEmAIOCB *acb;
+    Coroutine *co;
+    IO_CODE();
+
+    blk_inc_in_flight(blk);
+    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
+    acb->rwco = (BlkRwCo) {
+        .blk    = blk,
+        .offset = offset,
+        .ret    = NOT_DONE,
+        .zone_report = {
+            .zones = zones,
+            .nr_zones = nr_zones,
+        },
+    };
+    acb->has_returned = false;
+
+    co = qemu_coroutine_create(blk_aio_zone_report_entry, acb);
+    bdrv_coroutine_enter(blk_bs(blk), co);
+
+    acb->has_returned = true;
+    if (acb->rwco.ret != NOT_DONE) {
+        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
+                                         blk_aio_complete_bh, acb);
+    }
+
+    return &acb->common;
+}
+
+static void blk_aio_zone_mgmt_entry(void *opaque) {
+    BlkAioEmAIOCB *acb = opaque;
+    BlkRwCo *rwco = &acb->rwco;
+
+    rwco->ret = blk_co_zone_mgmt(rwco->blk, rwco->zone_mgmt.op,
+                                 rwco->offset, acb->bytes);
+    blk_aio_complete(acb);
+}
+
+BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
+                              int64_t offset, int64_t len,
+                              BlockCompletionFunc *cb, void *opaque) {
+    BlkAioEmAIOCB *acb;
+    Coroutine *co;
+    IO_CODE();
+
+    blk_inc_in_flight(blk);
+    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
+    acb->rwco = (BlkRwCo) {
+        .blk    = blk,
+        .offset = offset,
+        .ret    = NOT_DONE,
+        .zone_mgmt = {
+            .op = op,
+        },
+    };
+    acb->bytes = len;
+    acb->has_returned = false;
+
+    co = qemu_coroutine_create(blk_aio_zone_mgmt_entry, acb);
+    bdrv_coroutine_enter(blk_bs(blk), co);
+
+    acb->has_returned = true;
+    if (acb->rwco.ret != NOT_DONE) {
+        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
+                                         blk_aio_complete_bh, acb);
+    }
+
+    return &acb->common;
+}
+
+/*
+ * Send a zone_report command.
+ * offset is a byte offset from the start of the device. No alignment
+ * required for offset.
+ * nr_zones represents IN maximum and OUT actual.
+ */
+int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
+                                    unsigned int *nr_zones,
+                                    BlockZoneDescriptor *zones)
+{
+    int ret;
+    IO_CODE();
+
+    blk_inc_in_flight(blk); /* increase before waiting */
+    blk_wait_while_drained(blk);
+    if (!blk_is_available(blk)) {
+        blk_dec_in_flight(blk);
+        return -ENOMEDIUM;
+    }
+    ret = bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
+    blk_dec_in_flight(blk);
+    return ret;
+}
+
+/*
+ * Send a zone_management command.
+ * op is the zone operation;
+ * offset is the byte offset from the start of the zoned device;
+ * len is the maximum number of bytes the command should operate on. It
+ * should be aligned with the device zone size.
+ */
+int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
+        int64_t offset, int64_t len)
+{
+    int ret;
+    IO_CODE();
+
+
+    blk_inc_in_flight(blk);
+    blk_wait_while_drained(blk);
+
+    ret = blk_check_byte_request(blk, offset, len);
+    if (ret < 0) {
+        blk_dec_in_flight(blk);
+        return ret;
+    }
+
+    ret = bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
+    blk_dec_in_flight(blk);
+    return ret;
+}
+
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/block/file-posix.c b/block/file-posix.c
index 0a8b4b426e..0a6c781201 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -67,6 +67,9 @@
 #include <sys/param.h>
 #include <sys/syscall.h>
 #include <sys/vfs.h>
+#if defined(CONFIG_BLKZONED)
+#include <linux/blkzoned.h>
+#endif
 #include <linux/cdrom.h>
 #include <linux/fd.h>
 #include <linux/fs.h>
@@ -216,6 +219,15 @@ typedef struct RawPosixAIOData {
             PreallocMode prealloc;
             Error **errp;
         } truncate;
+        struct {
+            unsigned int *nr_zones;
+            BlockZoneDescriptor *zones;
+        } zone_report;
+        struct {
+            unsigned long zone_op;
+            const char *zone_op_name;
+            bool all;
+        } zone_mgmt;
     };
 } RawPosixAIOData;
 
@@ -1339,7 +1351,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 #endif
 
     if (bs->sg || S_ISBLK(st.st_mode)) {
-        int ret = hdev_get_max_hw_transfer(s->fd, &st);
+        ret = hdev_get_max_hw_transfer(s->fd, &st);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
             bs->bl.max_hw_transfer = ret;
@@ -1356,6 +1368,41 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
         zoned = BLK_Z_NONE;
     }
     bs->bl.zoned = zoned;
+    if (zoned != BLK_Z_NONE) {
+        ret = get_sysfs_long_val(&st, "chunk_sectors");
+        if (ret <= 0) {
+            error_report("Invalid zone size %" PRId32 " sectors ", ret);
+            bs->bl.zoned = BLK_Z_NONE;
+            return;
+        }
+        bs->bl.zone_size = ret * 512;
+
+        ret = get_sysfs_long_val(&st, "zone_append_max_bytes");
+        if (ret > 0) {
+            bs->bl.max_append_sectors = ret / 512;
+        }
+
+        ret = get_sysfs_long_val(&st, "max_open_zones");
+        if (ret >= 0) {
+            bs->bl.max_open_zones = ret;
+        }
+
+        ret = get_sysfs_long_val(&st, "max_active_zones");
+        if (ret >= 0) {
+            bs->bl.max_active_zones = ret;
+        }
+        
+        ret = get_sysfs_long_val(&st, "nr_zones");
+        if (ret >= 0) {
+            bs->bl.nr_zones = ret;
+        }
+
+        ret = ioctl(s->fd, BLKGETSIZE64, &bs->bl.capacity);
+        if (ret != 0) {
+            error_report("Invalid device capacity %" PRId64 " bytes ", bs->bl.capacity);
+            return;
+        }
+    }
 }
 
 static int check_for_dasd(int fd)
@@ -1850,6 +1897,147 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
 }
 #endif
 
+/*
+ * parse_zone - Fill a zone descriptor
+ */
+#if defined(CONFIG_BLKZONED)
+static inline void parse_zone(struct BlockZoneDescriptor *zone,
+                              const struct blk_zone *blkz,
+                              const struct blk_zone_report *rep) {
+    zone->start = blkz->start << BDRV_SECTOR_BITS;
+    zone->length = blkz->len << BDRV_SECTOR_BITS;
+    zone->wp = blkz->wp << BDRV_SECTOR_BITS;
+    
+    if (rep->flags & BLK_ZONE_REP_CAPACITY) {
+        zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
+    } else {
+        zone->cap = blkz->len << BDRV_SECTOR_BITS;
+    }
+
+    switch (blkz->type) {
+    case BLK_ZONE_TYPE_SEQWRITE_REQ:
+        zone->type = BLK_ZT_SWR;
+        break;
+    case BLK_ZONE_TYPE_SEQWRITE_PREF:
+        zone->type = BLK_ZT_SWP;
+        break;
+    case BLK_ZONE_TYPE_CONVENTIONAL:
+        zone->type = BLK_ZT_CONV;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    switch (blkz->cond) {
+    case BLK_ZONE_COND_NOT_WP:
+        zone->cond = BLK_ZS_NOT_WP;
+        break;
+    case BLK_ZONE_COND_EMPTY:
+        zone->cond = BLK_ZS_EMPTY;
+        break;
+    case BLK_ZONE_COND_IMP_OPEN:
+        zone->cond = BLK_ZS_IOPEN;
+        break;
+    case BLK_ZONE_COND_EXP_OPEN:
+        zone->cond = BLK_ZS_EOPEN;
+        break;
+    case BLK_ZONE_COND_CLOSED:
+        zone->cond = BLK_ZS_CLOSED;
+        break;
+    case BLK_ZONE_COND_READONLY:
+        zone->cond = BLK_ZS_RDONLY;
+        break;
+    case BLK_ZONE_COND_FULL:
+        zone->cond = BLK_ZS_FULL;
+        break;
+    case BLK_ZONE_COND_OFFLINE:
+        zone->cond = BLK_ZS_OFFLINE;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+#endif
+
+static int handle_aiocb_zone_report(void *opaque) {
+#if defined(CONFIG_BLKZONED)
+    RawPosixAIOData *aiocb = opaque;
+    int fd = aiocb->aio_fildes;
+    unsigned int *nr_zones = aiocb->zone_report.nr_zones;
+    BlockZoneDescriptor *zones = aiocb->zone_report.zones;
+    /* zoned block devices use 512-byte sectors */
+    int64_t sector = aiocb->aio_offset / 512;
+
+    struct blk_zone *blkz;
+    int64_t rep_size;
+    unsigned int nrz;
+    int ret, n = 0, i = 0;
+
+    nrz = *nr_zones;
+    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
+    g_autofree struct blk_zone_report *rep = NULL;
+    rep = g_malloc(rep_size);
+
+    blkz = (struct blk_zone *)(rep + 1);
+    while (n < nrz) {
+        memset(rep, 0, rep_size);
+        rep->sector = sector;
+        rep->nr_zones = nrz - n;
+
+        do {
+            ret = ioctl(fd, BLKREPORTZONE, rep);
+        } while (ret != 0 && errno == EINTR);
+        if (ret != 0) {
+            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed %d",
+                         fd, sector, errno);
+            return -errno;
+        }
+
+        if (!rep->nr_zones) {
+            break;
+        }
+
+        for (i = 0; i < rep->nr_zones; i++, n++) {
+            parse_zone(&zones[n], &blkz[i], rep);
+            /* The next report should start after the last zone reported */
+            sector = blkz[i].start + blkz[i].len;
+        }
+    }
+
+    *nr_zones = n;
+    return 0;
+#else
+    return -ENOTSUP;
+#endif
+}
+
+static int handle_aiocb_zone_mgmt(void *opaque) {
+#if defined(CONFIG_BLKZONED)
+    RawPosixAIOData *aiocb = opaque;
+    int fd = aiocb->aio_fildes;
+    int64_t sector = aiocb->aio_offset / 512;
+    int64_t nr_sectors = aiocb->aio_nbytes / 512;
+    struct blk_zone_range range;
+    int ret;
+
+    /* Execute the operation */
+    range.sector = sector;
+    range.nr_sectors = nr_sectors;
+    do {
+        ret = ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
+    } while (ret != 0 && errno == EINTR);
+
+    if (ret != 0) {
+        error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_name,
+                     errno);
+        return -errno;
+    }
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static int handle_aiocb_copy_range(void *opaque)
 {
     RawPosixAIOData *aiocb = opaque;
@@ -3022,6 +3210,105 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
     }
 }
 
+/*
+ * zone report - Get a zone block device's information in the form
+ * of an array of zone descriptors.
+ * zones is an array of zone descriptors to hold zone information on reply;
+ * offset can be any byte within the entire size of the device;
+ * nr_zones is the maxium number of sectors the command should operate on.
+ */
+static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                           unsigned int *nr_zones,
+                                           BlockZoneDescriptor *zones) {
+#if defined(CONFIG_BLKZONED)
+    BDRVRawState *s = bs->opaque;
+    RawPosixAIOData acb;
+
+    acb = (RawPosixAIOData) {
+        .bs         = bs,
+        .aio_fildes = s->fd,
+        .aio_type   = QEMU_AIO_ZONE_REPORT,
+        .aio_offset = offset,
+        .zone_report    = {
+            .nr_zones       = nr_zones,
+            .zones          = zones,
+        },
+    };
+
+    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
+#else
+    return -ENOTSUP;
+#endif
+}
+
+/*
+ * zone management operations - Execute an operation on a zone
+ */
+static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+        int64_t offset, int64_t len) {
+#if defined(CONFIG_BLKZONED)
+    BDRVRawState *s = bs->opaque;
+    RawPosixAIOData acb;
+    int64_t zone_size, zone_size_mask;
+    const char *zone_op_name;
+    unsigned long zone_op;
+    bool is_all = false;
+
+    zone_size = bs->bl.zone_size;
+    zone_size_mask = zone_size - 1;
+    if (offset & zone_size_mask) {
+        error_report("sector offset %" PRId64 " is not aligned to zone size "
+                     "%" PRId64 "", offset / 512, zone_size / 512);
+        return -EINVAL;
+    }
+
+    if (((offset + len) < bs->bl.capacity && len & zone_size_mask) ||
+        offset + len > bs->bl.capacity) {
+        error_report("number of sectors %" PRId64 " is not aligned to zone size"
+                      " %" PRId64 "", len / 512, zone_size / 512);
+        return -EINVAL;
+    }
+
+    switch (op) {
+    case BLK_ZO_OPEN:
+        zone_op_name = "BLKOPENZONE";
+        zone_op = BLKOPENZONE;
+        break;
+    case BLK_ZO_CLOSE:
+        zone_op_name = "BLKCLOSEZONE";
+        zone_op = BLKCLOSEZONE;
+        break;
+    case BLK_ZO_FINISH:
+        zone_op_name = "BLKFINISHZONE";
+        zone_op = BLKFINISHZONE;
+        break;
+    case BLK_ZO_RESET:
+        zone_op_name = "BLKRESETZONE";
+        zone_op = BLKRESETZONE;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    acb = (RawPosixAIOData) {
+        .bs             = bs,
+        .aio_fildes     = s->fd,
+        .aio_type       = QEMU_AIO_ZONE_MGMT,
+        .aio_offset     = offset,
+        .aio_nbytes     = len,
+        .zone_mgmt  = {
+            .zone_op = zone_op,
+            .zone_op_name = zone_op_name,
+            .all = is_all,
+        },
+    };
+
+    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 bool blkdev)
@@ -3752,6 +4039,54 @@ static BlockDriver bdrv_host_device = {
 #endif
 };
 
+#if defined(CONFIG_BLKZONED)
+static BlockDriver bdrv_zoned_host_device = {
+    .format_name = "zoned_host_device",
+    .protocol_name = "zoned_host_device",
+    .instance_size = sizeof(BDRVRawState),
+    .bdrv_needs_filename = true,
+    .bdrv_probe_device  = hdev_probe_device,
+    .bdrv_file_open     = hdev_open,
+    .bdrv_close         = raw_close,
+    .bdrv_reopen_prepare = raw_reopen_prepare,
+    .bdrv_reopen_commit  = raw_reopen_commit,
+    .bdrv_reopen_abort   = raw_reopen_abort,
+    .bdrv_co_create_opts = bdrv_co_create_opts_simple,
+    .create_opts         = &bdrv_create_opts_simple,
+    .mutable_opts        = mutable_opts,
+    .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
+    .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
+
+    .bdrv_co_preadv         = raw_co_preadv,
+    .bdrv_co_pwritev        = raw_co_pwritev,
+    .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
+    .bdrv_co_pdiscard       = hdev_co_pdiscard,
+    .bdrv_co_copy_range_from = raw_co_copy_range_from,
+    .bdrv_co_copy_range_to  = raw_co_copy_range_to,
+    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_io_plug = raw_aio_plug,
+    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_attach_aio_context = raw_aio_attach_aio_context,
+
+    .bdrv_co_truncate       = raw_co_truncate,
+    .bdrv_getlength = raw_getlength,
+    .bdrv_get_info = raw_get_info,
+    .bdrv_get_allocated_file_size
+                        = raw_get_allocated_file_size,
+    .bdrv_get_specific_stats = hdev_get_specific_stats,
+    .bdrv_check_perm = raw_check_perm,
+    .bdrv_set_perm   = raw_set_perm,
+    .bdrv_abort_perm_update = raw_abort_perm_update,
+    .bdrv_probe_blocksizes = hdev_probe_blocksizes,
+    .bdrv_probe_geometry = hdev_probe_geometry,
+    .bdrv_co_ioctl = hdev_co_ioctl,
+
+    /* zone management operations */
+    .bdrv_co_zone_report = raw_co_zone_report,
+    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
+};
+#endif
+
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 static void cdrom_parse_filename(const char *filename, QDict *options,
                                  Error **errp)
@@ -4012,6 +4347,9 @@ static void bdrv_file_init(void)
     bdrv_register(&bdrv_file);
 #if defined(HAVE_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
+#if defined(CONFIG_BLKZONED)
+    bdrv_register(&bdrv_zoned_host_device);
+#endif
 #ifdef __linux__
     bdrv_register(&bdrv_host_cdrom);
 #endif
diff --git a/block/io.c b/block/io.c
index 0a8cbefe86..5ab2d169c8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3198,6 +3198,47 @@ out:
     return co.ret;
 }
 
+int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
+                        unsigned int *nr_zones,
+                        BlockZoneDescriptor *zones)
+{
+    BlockDriver *drv = bs->drv;
+    CoroutineIOCompletion co = {
+            .coroutine = qemu_coroutine_self(),
+    };
+    IO_CODE();
+
+    bdrv_inc_in_flight(bs);
+    if (!drv || !drv->bdrv_co_zone_report) {
+        co.ret = -ENOTSUP;
+        goto out;
+    }
+    co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
+out:
+    bdrv_dec_in_flight(bs);
+    return co.ret;
+}
+
+int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+        int64_t offset, int64_t len)
+{
+    BlockDriver *drv = bs->drv;
+    CoroutineIOCompletion co = {
+            .coroutine = qemu_coroutine_self(),
+    };
+    IO_CODE();
+
+    bdrv_inc_in_flight(bs);
+    if (!drv || !drv->bdrv_co_zone_mgmt) {
+        co.ret = -ENOTSUP;
+        goto out;
+    }
+    co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
+out:
+    bdrv_dec_in_flight(bs);
+    return co.ret;
+}
+
 void *qemu_blockalign(BlockDriverState *bs, size_t size)
 {
     IO_CODE();
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 36bd0e480e..8efb6b0c43 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -49,6 +49,10 @@ typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
 typedef struct BdrvChildClass BdrvChildClass;
 
+#ifndef HAVE_BLK_ZONE_REP_CAPACITY
+#define BLK_ZONE_REP_CAPACITY (1 << 0)
+#endif
+
 typedef enum BlockZoneOp {
     BLK_ZO_OPEN,
     BLK_ZO_CLOSE,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index fd25ffa9be..65463b88d9 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -88,6 +88,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
 
+/* Report zone information of zone block device. */
+int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                     unsigned int *nr_zones,
+                                     BlockZoneDescriptor *zones);
+int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+                                   int64_t offset, int64_t len);
+
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 7f7863cc9e..cdc06e77a6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -691,6 +691,12 @@ struct BlockDriver {
                                           QEMUIOVector *qiov,
                                           int64_t pos);
 
+    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
+            int64_t offset, unsigned int *nr_zones,
+            BlockZoneDescriptor *zones);
+    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
+            int64_t offset, int64_t len);
+
     /* removable device specific */
     bool (*bdrv_is_inserted)(BlockDriverState *bs);
     void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
@@ -828,6 +834,24 @@ typedef struct BlockLimits {
 
     /* device zone model */
     BlockZoneModel zoned;
+
+    /* zone size expressed in bytes */
+    uint32_t zone_size;
+
+    /* total number of zones */
+    unsigned int nr_zones;
+
+    /* maximum sectors of a zone append write operation */
+    int64_t max_append_sectors;
+
+    /* maximum number of open zones */
+    int64_t max_open_zones;
+
+    /* maximum number of active zones */
+    int64_t max_active_zones;
+
+    /* device capacity expressed in bytes */
+    int64_t capacity;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 21fc10c4c9..3d26929cdd 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -29,6 +29,8 @@
 #define QEMU_AIO_WRITE_ZEROES 0x0020
 #define QEMU_AIO_COPY_RANGE   0x0040
 #define QEMU_AIO_TRUNCATE     0x0080
+#define QEMU_AIO_ZONE_REPORT  0x0100
+#define QEMU_AIO_ZONE_MGMT    0x0200
 #define QEMU_AIO_TYPE_MASK \
         (QEMU_AIO_READ | \
          QEMU_AIO_WRITE | \
@@ -37,7 +39,9 @@
          QEMU_AIO_DISCARD | \
          QEMU_AIO_WRITE_ZEROES | \
          QEMU_AIO_COPY_RANGE | \
-         QEMU_AIO_TRUNCATE)
+         QEMU_AIO_TRUNCATE  | \
+         QEMU_AIO_ZONE_REPORT | \
+         QEMU_AIO_ZONE_MGMT)
 
 /* AIO flags */
 #define QEMU_AIO_MISALIGNED   0x1000
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 50f5aa2e07..6835525582 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -45,6 +45,12 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
                             BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_flush(BlockBackend *blk,
                           BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
+                                unsigned int *nr_zones, BlockZoneDescriptor *zones,
+                                BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
+                              int64_t offset, int64_t len,
+                              BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel_async(BlockAIOCB *acb);
@@ -156,6 +162,17 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 
+int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
+                                    unsigned int *nr_zones,
+                                    BlockZoneDescriptor *zones);
+int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offset,
+                                         unsigned int *nr_zones,
+                                         BlockZoneDescriptor *zones);
+int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
+                                  int64_t offset, int64_t len);
+int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
+                                       int64_t offset, int64_t len);
+
 int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
                                       int64_t bytes);
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
diff --git a/meson.build b/meson.build
index 63cfb844cf..9a797388ad 100644
--- a/meson.build
+++ b/meson.build
@@ -1882,6 +1882,7 @@ config_host_data.set('CONFIG_REPLICATION', get_option('replication').allowed())
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
 config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
+config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.h'))
 config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgrind.h'))
 config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
@@ -1975,6 +1976,9 @@ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
 config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim',
                                    prefix: '#include <sys/stat.h>'))
+config_host_data.set('HAVE_BLK_ZONE_REP_CAPACITY',
+                     cc.has_member('struct blk_zone', 'capacity',
+                                   prefix: '#include <linux/blkzoned.h>'))
 
 # has_type
 config_host_data.set('CONFIG_IOVEC',
diff --git a/qapi/block-core.json b/qapi/block-core.json
index f21fa235f2..ee87c1df8a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2942,6 +2942,7 @@
 # @compress: Since 5.0
 # @copy-before-write: Since 6.2
 # @snapshot-access: Since 7.0
+# @zoned_host_device: Since 7.2
 #
 # Since: 2.9
 ##
@@ -2955,7 +2956,8 @@
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
-            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
+            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
+            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }
 
 ##
 # @BlockdevOptionsFile:
@@ -4329,7 +4331,9 @@
       'vhdx':       'BlockdevOptionsGenericFormat',
       'vmdk':       'BlockdevOptionsGenericCOWFormat',
       'vpc':        'BlockdevOptionsGenericFormat',
-      'vvfat':      'BlockdevOptionsVVFAT'
+      'vvfat':      'BlockdevOptionsVVFAT',
+      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
+                             'if': 'CONFIG_BLKZONED' }
   } }
 
 ##
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 952dc940f1..e56c8d1c30 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1712,6 +1712,149 @@ static const cmdinfo_t flush_cmd = {
     .oneline    = "flush all in-core file state to disk",
 };
 
+static inline int64_t tosector(int64_t bytes) {
+    return bytes >> BDRV_SECTOR_BITS;
+}
+
+static int zone_report_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset;
+    unsigned int nr_zones;
+
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    nr_zones = cvtnum(argv[optind]);
+
+    g_autofree BlockZoneDescriptor *zones = NULL;
+    zones = g_new(BlockZoneDescriptor, nr_zones);
+    ret = blk_zone_report(blk, offset, &nr_zones, zones);
+    if (ret < 0) {
+        printf("zone report failed: %s\n", strerror(-ret));
+    } else {
+        for (int i = 0; i < nr_zones; ++i) {
+            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
+                   "cap"" 0x%" PRIx64 ", wptr 0x%" PRIx64 ", "
+                   "zcond:%u, [type: %u]\n",
+                    tosector(zones[i].start), tosector(zones[i].length),
+                    tosector(zones[i].cap), tosector(zones[i].wp),
+                    zones[i].cond, zones[i].type);
+        }
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_report_cmd = {
+    .name = "zone_report",
+    .altname = "zrp",
+    .cfunc = zone_report_f,
+    .argmin = 2,
+    .argmax = 2,
+    .args = "offset number",
+    .oneline = "report zone information",
+};
+
+static int zone_open_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
+    if (ret < 0) {
+        printf("zone open failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_open_cmd = {
+    .name = "zone_open",
+    .altname = "zo",
+    .cfunc = zone_open_f,
+    .argmin = 2,
+    .argmax = 2,
+    .args = "offset len",
+    .oneline = "explicit open a range of zones in zone block device",
+};
+
+static int zone_close_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
+    if (ret < 0) {
+        printf("zone close failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_close_cmd = {
+    .name = "zone_close",
+    .altname = "zc",
+    .cfunc = zone_close_f,
+    .argmin = 2,
+    .argmax = 2,
+    .args = "offset len",
+    .oneline = "close a range of zones in zone block device",
+};
+
+static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
+    if (ret < 0) {
+        printf("zone finish failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_finish_cmd = {
+    .name = "zone_finish",
+    .altname = "zf",
+    .cfunc = zone_finish_f,
+    .argmin = 2,
+    .argmax = 2,
+    .args = "offset len",
+    .oneline = "finish a range of zones in zone block device",
+};
+
+static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int64_t offset, len;
+    ++optind;
+    offset = cvtnum(argv[optind]);
+    ++optind;
+    len = cvtnum(argv[optind]);
+    ret = blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
+    if (ret < 0) {
+        printf("zone reset failed: %s\n", strerror(-ret));
+    }
+    return ret;
+}
+
+static const cmdinfo_t zone_reset_cmd = {
+    .name = "zone_reset",
+    .altname = "zrs",
+    .cfunc = zone_reset_f,
+    .argmin = 2,
+    .argmax = 2,
+    .args = "offset len",
+    .oneline = "reset a zone write pointer in zone block device",
+};
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv);
 static const cmdinfo_t truncate_cmd = {
     .name       = "truncate",
@@ -2504,6 +2647,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
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
-- 
2.37.3


