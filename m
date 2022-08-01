Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2658625C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:44:53 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKUG-00044k-DV
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJh-0003sZ-PO; Sun, 31 Jul 2022 21:33:57 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJf-0000fG-GD; Sun, 31 Jul 2022 21:33:57 -0400
Received: by mail-pj1-x1036.google.com with SMTP id f7so9604807pjp.0;
 Sun, 31 Jul 2022 18:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=FSjm4fpw1GFTKKny8ZQPXkRUdPSravta+3M2bQR2cdM=;
 b=IjRWKHc5XIC1K4U9vbfO5o6gWC+kjveRfCSq4HLbNe6fuSAa31I01elbYjo6U5sqhl
 +z6VEeZR+ciUzfcDotlYmrrifc8sVYpDxvmBBa6F8C9wBzfodGCc/EuZxn+/EDfdPKgC
 JfvdcIM9ZHg4IY973euagurjjbsA+tUqei4nXoAZXGYItpMIw6gFLfU8rSsHg3exR9Id
 xqnmc6DpL7WHscQS0tPU8fcL/uND6SGij0UsApMcjlpttvot0MCnP/hjjv4yfFXvzc7d
 s6TGnubLCYrVg7usLNHyEAe4J2lnDwSRC37z5VjOA6ALFRQrXJENZ5wnCij2tS3alB0Z
 KSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FSjm4fpw1GFTKKny8ZQPXkRUdPSravta+3M2bQR2cdM=;
 b=DR1nZQkxWlGu4mrt/2StY16r/k+rRzV5/bIy0yCRcOds4EfVGVvb2/8vCv54MaytCB
 Xpg8Ih7ltSKz+Lk/S4tDGA/CuUP/JdvoUaFYSzkF5Sfv/CSyyc6XjyRIwt/mVJmqbAzI
 cECzB6DjJjvUZC+HErqdejHZ/phTC1UUZN9cvqPLwouxASTYGlw+uaFRl4W9PDtiq119
 pk6mYNmIPnO5xkg5fTskdBkZFT/ccQUkya+wbEtE+aE34Ddg6mY+8cDQ+FTrOSM/mfmB
 XsfjFM0TNdv52cZBsYEzBM/1EkN1P79/0Z3YJDJ38anDcKQYFerObQq3sy5Vlzemzja7
 jhfg==
X-Gm-Message-State: ACgBeo0NEtIOGAeXNzCmKQ5EzzxUEIQZRpJAIMwlDoiYG58dm8K3AOV3
 kqWTKV8Qrml1aBM+AU7iR0+AmJtrqwSl39mn
X-Google-Smtp-Source: AA6agR7WPCUB6a34JLl4Wrub22/C+kZAix4uKj5pkSgiijWt86mBSlCaq2iq+4yBqbdUk7KJDfnAXA==
X-Received: by 2002:a17:90b:ec7:b0:1f2:fa08:44cd with SMTP id
 gz7-20020a17090b0ec700b001f2fa0844cdmr16305687pjb.183.1659317633705; 
 Sun, 31 Jul 2022 18:33:53 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 cp17-20020a17090afb9100b001ef9659d711sm7297302pjb.48.2022.07.31.18.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:33:53 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 08/11] virtio-blk: add zoned storage APIs for zoned devices
Date: Mon,  1 Aug 2022 09:33:45 +0800
Message-Id: <20220801013345.10681-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
behalf of the guest. It supports Report Zone, and four zone oparations (open,
close, finish, reset). The virtio-blk zoned device command specifications
is currently in the reviewing process.

VIRTIO_BLK_F_ZONED will only be set if the host does support zoned block
devices. The regular block device will not be set. The guest os having
zoned device support can use blkzone(8) to test those commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/block-backend.c             |  92 ++++++++++++++++
 hw/block/virtio-blk.c             | 172 +++++++++++++++++++++++++++++-
 include/sysemu/block-backend-io.h |   6 ++
 3 files changed, 268 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ef6a1f33d5..8f2cfcbd9d 100644
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
@@ -1775,6 +1784,89 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
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
+
+    blk_inc_in_flight(blk);
+    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
+    acb->rwco = (BlkRwCo) {
+            .blk    = blk,
+            .offset = offset,
+            .ret    = NOT_DONE,
+            .zone_report = {
+                    .zones = zones,
+                    .nr_zones = nr_zones,
+            },
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
+
+    blk_inc_in_flight(blk);
+    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
+    acb->rwco = (BlkRwCo) {
+            .blk    = blk,
+            .offset = offset,
+            .ret    = NOT_DONE,
+            .zone_mgmt = {
+                    .op = op,
+            },
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
 /*
  * Send a zone_report command.
  * offset is a byte offset from the start of the device. No alignment
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..9722f447a2 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -37,6 +37,7 @@
 /* Config size before the discard support (hide associated config fields) */
 #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
                                      max_discard_sectors)
+
 /*
  * Starting from the discard feature, we can use this array to properly
  * set the config size depending on the features enabled.
@@ -46,6 +47,8 @@ static const VirtIOFeature feature_sizes[] = {
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
      .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
+    {.flags = 1ULL << VIRTIO_BLK_F_ZONED,
+     .end = endof(struct virtio_blk_config, zoned)},
     {}
 };
 
@@ -514,6 +517,131 @@ static void virtio_blk_handle_flush(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     blk_aio_flush(s->blk, virtio_blk_flush_complete, req);
 }
 
+typedef struct ZoneReportData {
+    VirtIOBlockReq *req;
+    unsigned int nr_zones;
+    BlockZoneDescriptor zones[];
+} ZoneReportData;
+
+static void virtio_blk_zone_report_complete(void *opaque, int ret)
+{
+    ZoneReportData *data = opaque;
+    VirtIOBlockReq *req = data->req;
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(req->dev);
+    struct iovec *in_iov = req->elem.in_sg;
+    unsigned in_num = req->elem.in_num;
+    int64_t zrp_size, nz, offset, n, j; /* offset is of in_iov */
+
+    nz = data->nr_zones;
+    j = 0;
+
+    struct virtio_blk_zone_report zrp_hdr = (struct virtio_blk_zone_report) {
+            .nr_zones = cpu_to_le64(nz),
+    };
+
+    zrp_size = sizeof(struct virtio_blk_zone_report)
+              + sizeof(struct virtio_blk_zone_descriptor) * nz;
+    offset = sizeof(zrp_hdr);
+
+    memset(zrp_hdr.reserved, 0, 56);
+    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    n = iov_from_buf(in_iov, in_num, 0, &zrp_hdr, offset);
+    if (n != sizeof(zrp_hdr)) {
+        virtio_error(vdev, "Driver provided intput buffer that is too small!");
+        return;
+    }
+
+    for (size_t i = offset; i < zrp_size; i += sizeof(struct virtio_blk_zone_descriptor), ++j) {
+        struct virtio_blk_zone_descriptor desc =
+                (struct virtio_blk_zone_descriptor) {
+                        .z_start = cpu_to_le64(data->zones[j].start),
+                        .z_cap = cpu_to_le64(data->zones[j].cap),
+                        .z_wp = cpu_to_le64(data->zones[j].wp),
+                        .z_type = data->zones[j].type,
+                        .z_state = data->zones[j].cond,
+                };
+        memset(desc.reserved, 0, 38);
+        n = iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
+        if (n != sizeof(desc)) {
+            virtio_error(vdev, "Driver provided input buffer "
+                               "for descriptors that is too small!");
+            return;
+        }
+    }
+    g_free(data);
+
+    virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
+    virtio_blk_free_request(req);
+    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
+}
+
+static int virtio_blk_handle_zone_report(VirtIOBlockReq *req) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    unsigned int nr_zones;
+    size_t data_size;
+    ZoneReportData *data;
+    int64_t offset;
+
+    if (req->in_len <= sizeof(struct virtio_blk_inhdr)) {
+        virtio_error(vdev, "in buffer too small for zone report");
+        return -1;
+    }
+
+    /* start offset of the zone report */
+    offset = virtio_ldq_p(vdev, &req->out.sector);
+    nr_zones = (req->in_len - sizeof(struct virtio_blk_inhdr) -
+                sizeof(struct virtio_blk_zone_report)) /
+                sizeof(struct virtio_blk_zone_descriptor);
+    data_size = sizeof(ZoneReportData) +
+                sizeof(BlockZoneDescriptor) * nr_zones;
+    data = g_malloc(data_size);
+    memset(data, 0, data_size);
+    data->nr_zones = nr_zones;
+    data->req = req;
+
+    blk_aio_zone_report(s->blk, offset, &data->nr_zones, data->zones,
+                        virtio_blk_zone_report_complete, data);
+    return 0;
+}
+
+static void virtio_blk_zone_mgmt_complete(void *opaque, int ret) {
+    VirtIOBlockReq *req = opaque;
+
+    virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
+    virtio_blk_free_request(req);
+}
+
+static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op) {
+    VirtIOBlock *s = req->dev;
+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
+    int64_t offset = virtio_ldq_p(vdev, &req->out.sector);
+    struct iovec *out_iov =req->elem.out_sg;
+    unsigned out_num = req->elem.out_num;
+    BlockDriverState *state = blk_bs(s->blk);
+    struct virtio_blk_zone_mgmt_outhdr zm_hdr;
+    uint64_t len;
+
+    if (unlikely(iov_to_buf(out_iov, out_num, 0, &zm_hdr,
+                            sizeof(zm_hdr)) != sizeof(zm_hdr))){
+        virtio_error(vdev, "virtio-blk request zone_mgmt_outhdr too short");
+        return -1;
+    }
+
+    if (zm_hdr.flags & VIRTIO_BLK_ZONED_FLAG_ALL) {
+        /* Entire drive capacity */
+        offset = 0;
+        blk_get_geometry(s->blk, &len);
+    } else {
+        len = state->bl.zone_sectors;
+    }
+
+    blk_aio_zone_mgmt(s->blk, op, offset, len,
+                      virtio_blk_zone_mgmt_complete, req);
+    return 0;
+}
+
 static bool virtio_blk_sect_range_ok(VirtIOBlock *dev,
                                      uint64_t sector, size_t size)
 {
@@ -700,6 +828,21 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
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
+    case VIRTIO_BLK_T_ZONE_RESET:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
+        break;
+    case VIRTIO_BLK_T_ZONE_FINISH:
+        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
+        break;
     case VIRTIO_BLK_T_SCSI_CMD:
         virtio_blk_handle_scsi(req);
         break;
@@ -913,10 +1056,10 @@ static void virtio_blk_reset(VirtIODevice *vdev)
 
 /* coalesce internal state, copy to pci i/o region 0
  */
-static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
-{
+static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config) {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
     BlockConf *conf = &s->conf.conf;
+    BlockDriverState *state = blk_bs(s->blk);
     struct virtio_blk_config blkcfg;
     uint64_t capacity;
     int64_t length;
@@ -976,6 +1119,25 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
         blkcfg.write_zeroes_may_unmap = 1;
         virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
     }
+#ifdef CONFIG_BLKZONED
+    blkcfg.zoned.model = state->bl.zoned;
+    if (state->bl.zoned != BLK_Z_NONE) {
+        switch (state->bl.zoned) {
+        case BLK_Z_HM:
+        case BLK_Z_HA:
+            virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors, state->bl.zone_sectors);
+            virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones, state->bl.max_active_zones);
+            virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones, state->bl.max_open_zones);
+            virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors, state->bl.zone_append_max_bytes);
+            virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
+            break;
+        default:
+            virtio_error(vdev, "Invalid zoned model %x \n", (int)state->bl.zoned);
+            blkcfg.zoned.model = BLK_Z_NONE;
+            break;
+        }
+    }
+#endif
     memcpy(config, &blkcfg, s->config_size);
 }
 
@@ -995,6 +1157,7 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
                                         Error **errp)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
+    BlockDriverState *state = blk_bs(s->blk);
 
     /* Firstly sync all virtio-blk possible supported features */
     features |= s->host_features;
@@ -1003,6 +1166,8 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
     virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
     virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
     virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
+    if (state->bl.zoned != BLK_Z_NONE)
+        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
     if (virtio_has_feature(features, VIRTIO_F_VERSION_1)) {
         if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_SCSI)) {
             error_setg(errp, "Please set scsi=off for virtio-blk devices in order to use virtio 1.0");
@@ -1286,6 +1451,9 @@ static Property virtio_blk_properties[] = {
 #ifdef __linux__
     DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
                       VIRTIO_BLK_F_SCSI, false),
+#endif
+#ifdef CONFIG_BLKZONED
+    DEFINE_PROP_BIT64("zoned", VirtIOBlock, host_features, VIRTIO_BLK_F_ZONED, true),
 #endif
     DEFINE_PROP_BIT("request-merging", VirtIOBlock, conf.request_merging, 0,
                     true),
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 50f5aa2e07..6fe98bd1ed 100644
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
-- 
2.37.1


