Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA25EF2FE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 12:05:31 +0200 (CEST)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqQ6-0002sI-LF
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 06:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odq9z-0001cp-8r; Thu, 29 Sep 2022 05:48:54 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odq9w-0004Jq-Dx; Thu, 29 Sep 2022 05:48:50 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r62so965219pgr.12;
 Thu, 29 Sep 2022 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=K1ntGVwpQwsU1bse0bYbK8dSP/GMyhTPpVHaJElj3ts=;
 b=ObDRiWbAei0Htgy14JQQ28BWfeNrE0Yb0osOkxHFZ6hOC60nhMgzRHHjGhy4htNTwE
 A+KYFyteJYFTmgCc8pBhLou2l6hd/QDgXAyz83BM6NUVhH3dgdDZZ+DEohpjvww1ZUGq
 /0To/LVPsZe9L3m/+vKJxDAR0w+jkQKpyDMh9nRsg5tvim8UcE37tgAGO2cGKF2FG207
 SqJTOkTLaCdClKkeKVq6N3PXC/TG9TpCWforolzYvmXvcmLvXuuPyEOW1rVbBBJlWZqY
 vD4s3YP5JH7n1lPV9a9CSKh9rtOd9McU5+XVYjflY46tnRrK0+TjbdkZq8k97DQnacR+
 LXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K1ntGVwpQwsU1bse0bYbK8dSP/GMyhTPpVHaJElj3ts=;
 b=hB7CxgP+uZEM/hjvGL8t4C79ilNs4zm85K4ZXnBsaw6T0hw1z9yI43FmzvrCr8RhUT
 xerwA9gf8aDvmQM5ZOahET+q8heBi8ZqVZsNmoeHAiQvrdK3a2RS/ScJqWcz4EIZnVXm
 v3rEt2oy3Wg9ibXPjPmdELPDOhF9Q6W9cI2RAWb9J4Aq7R/x4HfMxzCnlkIkp8nUSu/R
 WuWboPunfnwRiVZY8tPUvbwYb6wgsYrPhzZTUbdvHlW/ICKr3RUNvqCrwBfyIPbtt5Wu
 FaNxXnTI615bhNWaGxAI/wJjkFC/XQOG2InWUrKGk+CQXsOEzxfcmON4nuQ0UsyLXGaB
 nA6g==
X-Gm-Message-State: ACrzQf3EZGNnuHaNUyCSzwIr56I1MKa91ptHgJegnwv3wt3ZgJ+eFFT5
 FJDQiqlnzOhzq9lsPbbFfnUDvasr16oMyA==
X-Google-Smtp-Source: AMsMyM6XCdPz3KCFaa8vN2J6WWAEQk81tS+98mtYz0k04yyGzVhU0VpwMaUu1OLvQbM8nXBizRfFLw==
X-Received: by 2002:a63:5a0b:0:b0:434:4748:4e7a with SMTP id
 o11-20020a635a0b000000b0043447484e7amr2083517pgb.561.1664444926232; 
 Thu, 29 Sep 2022 02:48:46 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 f4-20020a170902ce8400b00178b06fea7asm5574515plg.148.2022.09.29.02.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 02:48:46 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v2 2/2] virtio-blk: add zoned storage emulation for zoned
 devices
Date: Thu, 29 Sep 2022 17:48:21 +0800
Message-Id: <20220929094821.78596-3-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929094821.78596-1-faithilikerun@gmail.com>
References: <20220929094821.78596-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52e.google.com
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

This patch extends virtio-blk emulation to handle zoned device commands
by calling the new block layer APIs to perform zoned device I/O on
behalf of the guest. It supports Report Zone, four zone oparations (open,
close, finish, reset), and Append Zone.

The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
support zoned block devices. Regular block devices(conventional zones)
will not be set.

The guest os having zoned device support can use blkzone(8) to test those
commands. Furthermore, using zonefs to test zone append write is also
supported.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 hw/block/virtio-blk.c | 393 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 393 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..1c2535bfeb 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -26,6 +26,9 @@
 #include "hw/virtio/virtio-blk.h"
 #include "dataplane/virtio-blk.h"
 #include "scsi/constants.h"
+#if defined(CONFIG_BLKZONED)
+#include <linux/blkzoned.h>
+#endif
 #ifdef __linux__
 # include <scsi/sg.h>
 #endif
@@ -46,6 +49,8 @@ static const VirtIOFeature feature_sizes[] = {
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
      .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
+    {.flags = 1ULL << VIRTIO_BLK_F_ZONED,
+     .end = endof(struct virtio_blk_config, zoned)},
     {}
 };
 
@@ -614,6 +619,340 @@ err:
     return err_status;
 }
 
+typedef struct ZoneCmdData {
+    VirtIOBlockReq *req;
+    union {
+        struct {
+            unsigned int nr_zones;
+            BlockZoneDescriptor *zones;
+        } zone_report_data;
+        struct {
+            int64_t append_sector;
+        } zone_append_data;
+    };
+} ZoneCmdData;
+
+/*
+ * check zoned_request: error checking before issuing requests. If all checks
+ * passed, return true.
+ * append: true if only zone append requests issued.
+ */
+static bool check_zoned_request(VirtIOBlock *s, int64_t offset, int64_t len,
+                             bool append, uint8_t *status) {
+    BlockDriverState *bs = blk_bs(s->blk);
+    int index = offset / bs->bl.zone_size;
+
+    if (offset < 0 || offset + len > bs->bl.capacity) {
+        *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        return false;
+    }
+
+    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
+        *status = VIRTIO_BLK_S_UNSUPP;
+        return false;
+    }
+
+    if (append) {
+        if ((offset % bs->bl.write_granularity) != 0) {
+            *status = VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
+            return false;
+        }
+
+        if (!BDRV_ZT_IS_SWR(bs->bl.wps->wp[index])) {
+            *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            return false;
+        }
+
+        if (len / 512 > bs->bl.max_append_sectors) {
+            if (bs->bl.max_append_sectors == 0) {
+                *status = VIRTIO_BLK_S_UNSUPP;
+            } else {
+                *status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            }
+            return false;
+        }
+    }
+    return true;
+}
+
+static void virtio_blk_zone_report_complete(void *opaque, int ret)
+{
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
+    struct iovec *in_iov = req->elem.in_sg;
+    unsigned in_num = req->elem.in_num;
+    int64_t zrp_size, nz, n, j = 0;
+    int8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    nz = data->zone_report_data.nr_zones;
+    struct virtio_blk_zone_report zrp_hdr = (struct virtio_blk_zone_report) {
+            .nr_zones = cpu_to_le64(nz),
+    };
+
+    zrp_size = sizeof(struct virtio_blk_zone_report)
+               + sizeof(struct virtio_blk_zone_descriptor) * nz;
+    n = iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
+    if (n != sizeof(zrp_hdr)) {
+        virtio_error(vdev, "Driver provided intput buffer that is too small!");
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    for (size_t i = sizeof(zrp_hdr); i < zrp_size; i += sizeof(struct virtio_blk_zone_descriptor), ++j) {
+        struct virtio_blk_zone_descriptor desc =
+                (struct virtio_blk_zone_descriptor) {
+                        .z_start = cpu_to_le64(data->zone_report_data.zones[j].start) >> BDRV_SECTOR_BITS,
+                        .z_cap = cpu_to_le64(data->zone_report_data.zones[j].cap) >> BDRV_SECTOR_BITS,
+                        .z_wp = cpu_to_le64(data->zone_report_data.zones[j].wp) >> BDRV_SECTOR_BITS,
+                };
+
+        switch (data->zone_report_data.zones[j].type) {
+        case BLK_ZT_CONV:
+            desc.z_type = BLK_ZONE_TYPE_CONVENTIONAL;
+            break;
+        case BLK_ZT_SWR:
+            desc.z_type = BLK_ZONE_TYPE_SEQWRITE_REQ;
+            break;
+        case BLK_ZT_SWP:
+            desc.z_type = BLK_ZONE_TYPE_SEQWRITE_PREF;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        switch (data->zone_report_data.zones[j].cond) {
+        case BLK_ZS_RDONLY:
+            desc.z_state = BLK_ZONE_COND_READONLY;
+            break;
+        case BLK_ZS_OFFLINE:
+            desc.z_state = BLK_ZONE_COND_OFFLINE;
+            break;
+        case BLK_ZS_EMPTY:
+            desc.z_state = BLK_ZONE_COND_EMPTY;
+            break;
+        case BLK_ZS_CLOSED:
+            desc.z_state = BLK_ZONE_COND_CLOSED;
+            break;
+        case BLK_ZS_FULL:
+            desc.z_state = BLK_ZONE_COND_FULL;
+            break;
+        case BLK_ZS_EOPEN:
+            desc.z_state = BLK_ZONE_COND_EXP_OPEN;
+            break;
+        case BLK_ZS_IOPEN:
+            desc.z_state = BLK_ZONE_COND_IMP_OPEN;
+            break;
+        case BLK_ZS_NOT_WP:
+            desc.z_state = BLK_ZONE_COND_NOT_WP;
+            break;
+        default:
+            g_assert_not_reached();
+            break;
+        }
+
+        /* TODO: it takes O(n^2) time complexity. Optimizations required here. */
+        n = iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
+        if (n != sizeof(desc)) {
+            virtio_error(vdev, "Driver provided input buffer "
+                               "for descriptors that is too small!");
+            err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            goto out;
+        }
+    }
+    goto out;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data->zone_report_data.zones);
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_report(VirtIOBlockReq *req) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    unsigned int nr_zones;
+    ZoneCmdData *data;
+    int64_t zone_size, offset;
+    uint8_t err_status;
+
+    if (req->in_len < sizeof(struct virtio_blk_inhdr) +
+            sizeof(struct virtio_blk_zone_report) +
+            sizeof(struct virtio_blk_zone_descriptor)) {
+        virtio_error(vdev, "in buffer too small for zone report");
+        return -1;
+    }
+
+    /* start byte offset of the zone report */
+    offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
+        goto out;
+    }
+
+    nr_zones = (req->in_len - sizeof(struct virtio_blk_inhdr) -
+                sizeof(struct virtio_blk_zone_report)) /
+               sizeof(struct virtio_blk_zone_descriptor);
+
+    zone_size = sizeof(BlockZoneDescriptor) * nr_zones;
+    data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+    data->zone_report_data.nr_zones = nr_zones;
+    data->zone_report_data.zones = g_malloc(zone_size),
+
+    blk_aio_zone_report(s->blk, offset, &data->zone_report_data.nr_zones,
+                        data->zone_report_data.zones,
+                        virtio_blk_zone_report_complete, data);
+    return 0;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    return err_status;
+}
+
+static void virtio_blk_zone_mgmt_complete(void *opaque, int ret) {
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    int8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+    goto out;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    BlockDriverState *bs = blk_bs(s->blk);
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    uint64_t len;
+    uint32_t type;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
+        goto out;
+    }
+
+    ZoneCmdData *data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+
+    type = virtio_ldl_p(vdev, &req->out.type);
+    if (type == VIRTIO_BLK_T_ZONE_RESET_ALL) {
+        /* Entire drive capacity */
+        offset = 0;
+        len = bs->bl.capacity;
+    } else {
+        if (bs->bl.zone_size * bs->bl.nr_zones == bs->bl.capacity) {
+            len = bs->bl.zone_size;
+        } else {
+            /* when the SWR drive has one last small zone, calculate its len */
+            len = bs->bl.capacity - bs->bl.zone_size * (bs->bl.nr_zones - 1);
+        }
+        if (offset + len > bs->bl.capacity) {
+            err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+            goto out;
+        }
+    }
+
+    blk_aio_zone_mgmt(s->blk, op, offset, len,
+                      virtio_blk_zone_mgmt_complete, data);
+
+    return 0;
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    return err_status;
+}
+
+static void virtio_blk_zone_append_complete(void *opaque, int ret) {
+    ZoneCmdData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
+    int64_t append_sector, n;
+    struct iovec *out_iov = req->elem.out_sg;
+    unsigned out_num = req->elem.out_num;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    if (ret) {
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+
+    virtio_stl_p(vdev, &append_sector, data->zone_append_data.append_sector);
+    n = iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(append_sector));
+    if (n != sizeof(append_sector)) {
+        virtio_error(vdev, "Driver provided input buffer less than size of "
+                     "append_sector");
+        err_status = VIRTIO_BLK_S_ZONE_INVALID_CMD;
+        goto out;
+    }
+    goto out;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    g_free(data);
+}
+
+static int virtio_blk_handle_zone_append(VirtIOBlockReq *req) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    uint64_t niov = req->elem.out_num;
+    struct iovec *out_iov = req->elem.out_sg;
+    uint8_t err_status = VIRTIO_BLK_S_OK;
+
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector) * 512;
+    int64_t len = 0;
+    for (int i = 1; i < niov; ++i) {
+        len += out_iov[i].iov_len;
+    }
+
+    if (!check_zoned_request(s, offset, len, true, &err_status)) {
+        goto out;
+    }
+
+    ZoneCmdData *data = g_malloc(sizeof(ZoneCmdData));
+    data->req = req;
+    data->zone_append_data.append_sector = offset;
+    qemu_iovec_init_external(&req->qiov, &out_iov[1], niov-1);
+    blk_aio_zone_append(s->blk, &data->zone_append_data.append_sector, &req->qiov, 0,
+                        virtio_blk_zone_append_complete, data);
+    return 0;
+
+out:
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    virtio_blk_req_complete(req, err_status);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+    return err_status;
+}
+
 static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 {
     uint32_t type;
@@ -700,6 +1039,24 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     case VIRTIO_BLK_T_FLUSH:
         virtio_blk_handle_flush(req, mrb);
         break;
+    case VIRTIO_BLK_T_ZONE_REPORT:
+        virtio_blk_handle_zone_report(req);
+        break;
+    case VIRTIO_BLK_T_ZONE_OPEN:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
+        break;
+    case VIRTIO_BLK_T_ZONE_CLOSE:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
+        break;
+    case VIRTIO_BLK_T_ZONE_FINISH:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
+        break;
+    case VIRTIO_BLK_T_ZONE_RESET:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
+        break;
+    case VIRTIO_BLK_T_ZONE_RESET_ALL:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET_ALL);
+        break;
     case VIRTIO_BLK_T_SCSI_CMD:
         virtio_blk_handle_scsi(req);
         break;
@@ -718,6 +1075,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         virtio_blk_free_request(req);
         break;
     }
+   case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
+       virtio_blk_handle_zone_append(req);
+       break;
     /*
      * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined with
      * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch statement,
@@ -917,6 +1277,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
     BlockConf *conf = &s->conf.conf;
+    BlockDriverState *bs = blk_bs(s->blk);
     struct virtio_blk_config blkcfg;
     uint64_t capacity;
     int64_t length;
@@ -976,6 +1337,30 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
         blkcfg.write_zeroes_may_unmap = 1;
         virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
     }
+    if (bs->bl.zoned != BLK_Z_NONE) {
+        switch (bs->bl.zoned) {
+        case BLK_Z_HM:
+            blkcfg.zoned.model = VIRTIO_BLK_Z_HM;
+            break;
+        case BLK_Z_HA:
+            blkcfg.zoned.model = VIRTIO_BLK_Z_HA;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
+                     bs->bl.zone_size / 512);
+        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
+                     bs->bl.max_active_zones);
+        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
+                     bs->bl.max_open_zones);
+        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
+        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
+                     bs->bl.max_append_sectors);
+    } else {
+        blkcfg.zoned.model = VIRTIO_BLK_Z_NONE;
+    }
     memcpy(config, &blkcfg, s->config_size);
 }
 
@@ -1140,6 +1525,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOBlock *s = VIRTIO_BLK(dev);
     VirtIOBlkConf *conf = &s->conf;
+    BlockDriverState *bs = blk_bs(conf->conf.blk);
     Error *err = NULL;
     unsigned i;
 
@@ -1185,6 +1571,13 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (bs->bl.zoned != BLK_Z_NONE) {
+        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
+        if (bs->bl.zoned == BLK_Z_HM) {
+            virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_DISCARD);
+        }
+    }
+
     if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD) &&
         (!conf->max_discard_sectors ||
          conf->max_discard_sectors > BDRV_REQUEST_MAX_SECTORS)) {
-- 
2.37.3


