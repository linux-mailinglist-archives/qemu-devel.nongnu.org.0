Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C30545166
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:57:46 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKXZ-0007ym-1v
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI2-0002Jn-H6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJHz-00070h-LY
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBYz+24fQRhzaFS9ZOhkXmN+1cmAhTazfgjITWX5BNA=;
 b=evryU3WKPTTvtV7seF6fvjScEbiWwRSa9boqjQm/a7eLY/c/DW3jZu6Hs/V2nXvRSnRrra
 fDEknw8wFYeSKSlZEgsz+pFZeFgDGRKWhQyocLn/aGyRKbFXOABnt7wfKUtpnqa2VKEjVU
 oJGFOsZ+nv1Ky5aBCVmod/lkOHiMrB4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-9s_JSOATPAq7rQddTttQ1w-1; Thu, 09 Jun 2022 10:37:34 -0400
X-MC-Unique: 9s_JSOATPAq7rQddTttQ1w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A65D238005C9;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66A3D492C3B;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 5/8] virtio-blk: mark GLOBAL_STATE_CODE functions
Date: Thu,  9 Jun 2022 10:37:24 -0400
Message-Id: <20220609143727.1151816-6-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Just as done in the block API, mark functions in virtio-blk
that are always called in the main loop with BQL held.

We know such functions are GS because they all are callbacks
from virtio.c API that has already classified them as GS.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/dataplane/virtio-blk.c |  4 ++++
 hw/block/virtio-blk.c           | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 03e10a36a4..bda6b3e8de 100644
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
index 4e6421c35e..2eb0408f92 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -51,6 +51,8 @@ static const VirtIOFeature feature_sizes[] = {
 
 static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
 {
+    GLOBAL_STATE_CODE();
+
     s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
         virtio_feature_get_config_size(feature_sizes, host_features));
 
@@ -865,6 +867,10 @@ void virtio_blk_restart_bh(void *opaque)
     virtio_blk_process_queued_requests(s, true);
 }
 
+/*
+ * Only called when VM is started or stopped in cpus.c.
+ * No iothread runs in parallel
+ */
 static void virtio_blk_dma_restart_cb(void *opaque, bool running,
                                       RunState state)
 {
@@ -872,6 +878,8 @@ static void virtio_blk_dma_restart_cb(void *opaque, bool running,
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(s)));
     VirtioBusState *bus = VIRTIO_BUS(qbus);
 
+    GLOBAL_STATE_CODE();
+
     if (!running) {
         return;
     }
@@ -894,8 +902,14 @@ static void virtio_blk_reset(VirtIODevice *vdev)
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
@@ -1064,11 +1078,17 @@ static void virtio_blk_set_status(VirtIODevice *vdev, uint8_t status)
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
 
@@ -1082,11 +1102,17 @@ static void virtio_blk_save_device(VirtIODevice *vdev, QEMUFile *f)
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
@@ -1135,6 +1161,7 @@ static const BlockDevOps virtio_block_ops = {
     .resize_cb = virtio_blk_resize,
 };
 
+/* Iothread is not yet created */
 static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -1143,6 +1170,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     unsigned i;
 
+    GLOBAL_STATE_CODE();
+
     if (!conf->conf.blk) {
         error_setg(errp, "drive property not set");
         return;
-- 
2.31.1


