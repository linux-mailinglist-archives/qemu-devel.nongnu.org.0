Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC7621E79
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW17-0005OH-0r; Tue, 08 Nov 2022 16:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0q-0005DW-Hs
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0l-0008Mh-T5
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdutNCwwUufz/K0xOfEnZCzq6t0R/NOelUe6SRbC/sU=;
 b=UUjuWQuOPBwQgat7rgfnOavI5tidh6NPNBalbdGJOGqIrcx1wOwYAqXSOmD+t/RUI+bwoU
 ht2itAeDGwlR04tFSfBMaf+Qwxwu76v6i1IO+0ev48dX3/yGPS8QfrKbRnrxKTAPBvcHzD
 A4LPBCWwl/dr1bU3bjp9o6Tp3kG0oT4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-RVRdQhVhM_272ckAXUEPKQ-1; Tue, 08 Nov 2022 16:19:54 -0500
X-MC-Unique: RVRdQhVhM_272ckAXUEPKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A46B3C0E204;
 Tue,  8 Nov 2022 21:19:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7C74111F3BB;
 Tue,  8 Nov 2022 21:19:53 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 4/8] virtio-blk: mark GLOBAL_STATE_CODE functions
Date: Tue,  8 Nov 2022 16:19:26 -0500
Message-Id: <20221108211930.876142-5-stefanha@redhat.com>
In-Reply-To: <20221108211930.876142-1-stefanha@redhat.com>
References: <20221108211930.876142-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Just as done in the block API, mark functions in virtio-blk
that are always called in the main loop with BQL held.

We know such functions are GS because they all are callbacks
from virtio.c API that has already classified them as GS.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609143727.1151816-6-eesposit@redhat.com>
---
 hw/block/dataplane/virtio-blk.c |  4 ++++
 hw/block/virtio-blk.c           | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 975f5ca8c4..728c9cd86c 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -89,6 +89,8 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
 
+    GLOBAL_STATE_CODE();
+
     *dataplane = NULL;
 
     if (conf->iothread) {
@@ -140,6 +142,8 @@ void virtio_blk_data_plane_destroy(VirtIOBlockDataPlane *s)
 {
     VirtIOBlock *vblk;
 
+    GLOBAL_STATE_CODE();
+
     if (!s) {
         return;
     }
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 96bc11d2fe..02b213a140 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -845,11 +845,17 @@ static void virtio_blk_dma_restart_bh(void *opaque)
     aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
+/*
+ * Only called when VM is started or stopped in cpus.c.
+ * No iothread runs in parallel
+ */
 static void virtio_blk_dma_restart_cb(void *opaque, bool running,
                                       RunState state)
 {
     VirtIOBlock *s = opaque;
 
+    GLOBAL_STATE_CODE();
+
     if (!running) {
         return;
     }
@@ -867,8 +873,14 @@ static void virtio_blk_reset(VirtIODevice *vdev)
     AioContext *ctx;
     VirtIOBlockReq *req;
 
+    GLOBAL_STATE_CODE();
+
     ctx = blk_get_aio_context(s->blk);
     aio_context_acquire(ctx);
+    /*
+     * This drain together with ->stop_ioeventfd() in virtio_pci_reset()
+     * stops all Iothreads.
+     */
     blk_drain(s->blk);
 
     /* We drop queued requests after blk_drain() because blk_drain() itself can
@@ -1037,11 +1049,17 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
     }
 }
 
+/*
+ * VM is stopped while doing migration, so iothread has
+ * no requests to process.
+ */
 static void virtio_blk_save_device(VirtIODevice *vdev, QEMUFile *f)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
     VirtIOBlockReq *req = s->rq;
 
+    GLOBAL_STATE_CODE();
+
     while (req) {
         qemu_put_sbyte(f, 1);
 
@@ -1055,11 +1073,17 @@ static void virtio_blk_save_device(VirtIODevice *vdev, QEMUFile *f)
     qemu_put_sbyte(f, 0);
 }
 
+/*
+ * VM is stopped while doing migration, so iothread has
+ * no requests to process.
+ */
 static int virtio_blk_load_device(VirtIODevice *vdev, QEMUFile *f,
                                   int version_id)
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
 
+    GLOBAL_STATE_CODE();
+
     while (qemu_get_sbyte(f)) {
         unsigned nvqs = s->conf.num_queues;
         unsigned vq_idx = 0;
@@ -1108,6 +1132,7 @@ static const BlockDevOps virtio_block_ops = {
     .resize_cb = virtio_blk_resize,
 };
 
+/* Iothread is not yet created */
 static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -1116,6 +1141,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     unsigned i;
 
+    GLOBAL_STATE_CODE();
+
     if (!conf->conf.blk) {
         error_setg(errp, "drive property not set");
         return;
-- 
2.38.1


