Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF896EDD02
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:46:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDN9-0000TY-Cc; Tue, 25 Apr 2023 03:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDN5-0000QD-NK
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDN3-0006oD-Ta
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=blfDpFbwTXrEQIE32dbNR8aJtUL+pHsX1hk7uO4u/aw=;
 b=D7QmHiA4wy24irRri2+0IYoNVgIJy+Jo1mPFRCqvQrmhDk9ntiKfAoL51LaqXLkaXnQQJJ
 Vm6RZpUZgihQqi4mZavwR0H1Ve1NWnFc+Q4CdoMxZUVFWCt2ieoCzDmq7CnWUArVRiL2e6
 GFchTBmsiyscJeTvKTK+c2AHFw8Xewc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-2-JVNWv4MRWDhBsvxb7Q0Q-1; Tue, 25 Apr 2023 03:45:52 -0400
X-MC-Unique: 2-JVNWv4MRWDhBsvxb7Q0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f25376e3b1so5294225e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408750; x=1685000750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blfDpFbwTXrEQIE32dbNR8aJtUL+pHsX1hk7uO4u/aw=;
 b=EV5i5hxVmEYx+SlmOuQMoj6pZB3PPUll5nVTCO9Q8fydhIauKvuLFUzfthGvo2LTrm
 2QC7KWdW4+HC9phYY7W+Z/240pn/lkLEKtGizGcfrZV1LnOPFy48e0mwcujt75rqX4Fm
 eqMncYgJukvboG0I0cw1F8w3UY7zzuUuaj37FTgNg8FyBXyh72ctDYHBcLGmGKO0Fr3v
 hkDU1dCCXmXWNCcguelqcK0pXi2WKxqw5QltWQO2D7N05orYpuLXdnJyNVxyhQhCPxxt
 b7F1igmpVYFIFHhlK9AANvFxaX8ypT9a4+Aj2HEkrs1222tucEbhd7fLUCUgBDk3BLUq
 clrg==
X-Gm-Message-State: AAQBX9eTfEjuXCX1+Y3/idxZfdvYHWbO8z01iByryCNuES1cVUId6Uf+
 W9OsZaHK8X8JsEmCCsTdEgwGzZ5NTUM1Z/fhgD7TWvNkLHx/cCPt/dX3Er6TM7pazCFigxGY5qy
 qI2K/tJ1psTDw7GMXnHHDCzuWSVVU79P3rwyCjUMs4lNHZ74Otmlvwu87I5BPg9oy/14w
X-Received: by 2002:adf:f1d1:0:b0:2ef:5d73:f6b7 with SMTP id
 z17-20020adff1d1000000b002ef5d73f6b7mr10956485wro.13.1682408750248; 
 Tue, 25 Apr 2023 00:45:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350bA9yONv16tMDWeHyElrRQgn47L4yQfbQMmE3Z1mG3NTcFvGyzO3U5zwxXenkbT6qRzvrDe3w==
X-Received: by 2002:adf:f1d1:0:b0:2ef:5d73:f6b7 with SMTP id
 z17-20020adff1d1000000b002ef5d73f6b7mr10956469wro.13.1682408749981; 
 Tue, 25 Apr 2023 00:45:49 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b002c561805a4csm12455059wru.45.2023.04.25.00.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:49 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Coiby Xu <Coiby.Xu@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 17/31] vhost-user-blk-server: notify client about disk resize
Message-ID: <ca858a5fe94c0325bfe5f764f1bb090b160264a3.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Currently block_resize qmp command is simply ignored by vhost-user-blk
export. So, the block-node is successfully resized, but virtio config
is unchanged and guest doesn't see that disk is resized.

Let's handle the resize by modifying the config and notifying the guest
appropriately.

After this comment, lsblk in linux guest with attached
vhost-user-blk-pci device shows new size immediately after block_resize
QMP command on vhost-user exported block node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20230321201323.3695923-1-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.h |  2 ++
 block/export/vhost-user-blk-server.c      | 24 +++++++++++++++++++++++
 subprojects/libvhost-user/libvhost-user.c | 10 ++++++++++
 3 files changed, 36 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 8c5a2719e3..49208cceaa 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -585,6 +585,8 @@ bool vu_queue_empty(VuDev *dev, VuVirtq *vq);
  */
 void vu_queue_notify(VuDev *dev, VuVirtq *vq);
 
+void vu_config_change_msg(VuDev *dev);
+
 /**
  * vu_queue_notify_sync:
  * @dev: a VuDev context
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 3409d9e02e..e56b92f2e2 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -10,6 +10,7 @@
  * later.  See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "block/block.h"
 #include "subprojects/libvhost-user/libvhost-user.h" /* only for the type definitions */
 #include "standard-headers/linux/virtio_blk.h"
@@ -251,6 +252,27 @@ static void vu_blk_exp_request_shutdown(BlockExport *exp)
     vhost_user_server_stop(&vexp->vu_server);
 }
 
+static void vu_blk_exp_resize(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+    BlockDriverState *bs = blk_bs(vexp->handler.blk);
+    int64_t new_size = bdrv_getlength(bs);
+
+    if (new_size < 0) {
+        error_printf("Failed to get length of block node '%s'",
+                     bdrv_get_node_name(bs));
+        return;
+    }
+
+    vexp->blkcfg.capacity = cpu_to_le64(new_size >> VIRTIO_BLK_SECTOR_BITS);
+
+    vu_config_change_msg(&vexp->vu_server.vu_dev);
+}
+
+static const BlockDevOps vu_blk_dev_ops = {
+    .resize_cb = vu_blk_exp_resize,
+};
+
 static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                              Error **errp)
 {
@@ -292,6 +314,8 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vexp);
 
+    blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
+
     if (!vhost_user_server_start(&vexp->vu_server, vu_opts->addr, exp->ctx,
                                  num_queues, &vu_blk_iface, errp)) {
         blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 0200b78e8e..0abd898a52 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2455,6 +2455,16 @@ void vu_queue_notify_sync(VuDev *dev, VuVirtq *vq)
     _vu_queue_notify(dev, vq, true);
 }
 
+void vu_config_change_msg(VuDev *dev)
+{
+    VhostUserMsg vmsg = {
+        .request = VHOST_USER_BACKEND_CONFIG_CHANGE_MSG,
+        .flags = VHOST_USER_VERSION,
+    };
+
+    vu_message_write(dev, dev->slave_fd, &vmsg);
+}
+
 static inline void
 vring_used_flags_set_bit(VuVirtq *vq, int mask)
 {
-- 
MST


