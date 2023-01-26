Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79867C448
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKume-00089l-6q; Thu, 26 Jan 2023 00:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKumc-000848-0u
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:46 -0500
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKumY-0000vS-7A
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:45 -0500
X-IronPort-RemoteIP: 209.85.128.197
X-IronPort-MID: 253344990
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IxaVJKs3ORwIJf4Inm/Sv65KZ+fnVOhcMUV32f8akzHdYApBsoF/q
 tZmKWiDOPmON2XxKt4gbNiz900OvZPSmtBqSVduqipnESoV9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVkO6gS1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqU7quVWBH5P1
 MVbJTcVUhy4g7qY5ouCH7wEasQLdKEHPasas3BkiCDGVLMoGMGcBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk2aM1sWawh/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKwa4GJJo3bHa25mG6bv
 3icwEH6PC0LC8OG1iap6E2qodTmyHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8Am6UYC4UUTp/ziLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO76famRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:AZOUs6+oBM9cn+cPR/Vuk+AII+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtND4N+bNykBsS4tijPIburJw7O8gdyVbf+19QYIcenzAZsQlzuQDGygYypLrFkvP+teKH
 KEjPA33gadRQ==
Received: from mail-yw1-f197.google.com ([209.85.128.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2023 00:26:41 -0500
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-434eb7c6fa5so8926197b3.14
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FG0/FU6uw0vDtarwt5+2HOJFgKERR2bBzA1uds1Yh7k=;
 b=GmkGejaNeTsdycAL/X8WF4cDWl6UjNaTGkTsucW4NaBQwCdMeQH+nl0+bKC0uHNuq3
 egx929x1Ij38QCLWMQ6sQcuHlBItNc/pmEnJ1c7ogEnQz8eRKDOnYe9jAEYdQCqmmNS0
 uzkqay0teZNBPbU8GooA5WbdJ9Da094j+Facglk6Uf0TdqZwlKAttsdJew0KB8EK2Lx2
 ggJyvXde6UBYjvc7G5xcel4pjTDCI8b6CNF/rMEPpax3sqWVQkR0XBXgvkFS+OPlzr8N
 qlb8UNKVxf23Gok6Gh66cNAZJrn85bClKvewt6Ru/E8mzPriW/3FPXTaku9tG6Ira1Br
 Jiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FG0/FU6uw0vDtarwt5+2HOJFgKERR2bBzA1uds1Yh7k=;
 b=Y17+ejcVYqfxFJHMXJdgbCEMwcRVg9ArDX/vJMkQx649jfF8VHSPejFl6v1dPnFt31
 xc3nFDh/6+fHI5lh1StCYl/JMJGJ3PKdf68YQzIFR4lZnfmQsowfwvNoYbcMoIjnubBk
 TzM4Aq8K6qFwNo9zxZ9KLQrCQ5TwTjftXBszWi/6wnABv58ifQ/5eX3rldkF3x/ZdAQ7
 Vn39kgK/3xRu/iDC4aGCMHvE7QL39dcYcODesizmAH5Hel+R8luelL70gA4v3tDUVZA2
 m05zvIt2Vi3BuY97NP0Wch84ut2/7CjTHFbRrdSO2MI4gusiT1PZjhM0/lOvzGGFmezd
 r4EQ==
X-Gm-Message-State: AO0yUKUf5ThEIxyR/tU4e8zA92G5hxHFA9O0Jh8gnXrGEtZFFNAdnrYG
 opFebZv4ufcm0Fi3z0wv9ewnAc0ip/75rUkBfGKPGQX0HLduh4Px9pCICvWuIRowLqN9nQZBPWF
 bTxmlU0ISJRTP22P6hOTJInQp2Zxchw==
X-Received: by 2002:ac8:5545:0:b0:3b6:2f0d:1925 with SMTP id
 o5-20020ac85545000000b003b62f0d1925mr49128554qtr.64.1674710788522; 
 Wed, 25 Jan 2023 21:26:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXully7MjMRtDtbZtceH3RS9913TvvPBNRP2ZPLGLwxrSXUh8elrZBVGZpyyxkhK/A9rW0V7RQ==
X-Received: by 2002:ac8:5545:0:b0:3b6:2f0d:1925 with SMTP id
 o5-20020ac85545000000b003b62f0d1925mr49128489qtr.64.1674710788085; 
 Wed, 25 Jan 2023 21:26:28 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05620a074700b006fed58fc1a3sm318746qki.119.2023.01.25.21.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 21:26:27 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Amit Shah <amit@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
 qemu-block@nongnu.org (open list:virtio-blk),
 qemu-arm@nongnu.org (open list:i.MX31 (kzm)),
 qemu-ppc@nongnu.org (open list:Old World (g3beige))
Subject: [PATCH v5 4/4] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Date: Thu, 26 Jan 2023 00:25:58 -0500
Message-Id: <20230126052558.572634-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126052558.572634-1-alxndr@bu.edu>
References: <20230126052558.572634-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This protects devices from bh->mmio reentrancy issues.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/9pfs/xen-9p-backend.c        | 4 +++-
 hw/block/dataplane/virtio-blk.c | 3 ++-
 hw/block/dataplane/xen-block.c  | 5 +++--
 hw/block/virtio-blk.c           | 5 +++--
 hw/char/virtio-serial-bus.c     | 3 ++-
 hw/display/qxl.c                | 9 ++++++---
 hw/display/virtio-gpu.c         | 6 ++++--
 hw/ide/ahci.c                   | 3 ++-
 hw/ide/core.c                   | 3 ++-
 hw/misc/imx_rngc.c              | 6 ++++--
 hw/misc/macio/mac_dbdma.c       | 2 +-
 hw/net/virtio-net.c             | 3 ++-
 hw/nvme/ctrl.c                  | 6 ++++--
 hw/scsi/mptsas.c                | 3 ++-
 hw/scsi/scsi-bus.c              | 3 ++-
 hw/scsi/vmw_pvscsi.c            | 3 ++-
 hw/usb/dev-uas.c                | 3 ++-
 hw/usb/hcd-dwc2.c               | 3 ++-
 hw/usb/hcd-ehci.c               | 3 ++-
 hw/usb/hcd-uhci.c               | 2 +-
 hw/usb/host-libusb.c            | 6 ++++--
 hw/usb/redirect.c               | 6 ++++--
 hw/usb/xen-usb.c                | 3 ++-
 hw/virtio/virtio-balloon.c      | 5 +++--
 hw/virtio/virtio-crypto.c       | 3 ++-
 25 files changed, 66 insertions(+), 35 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 65c4979c3c..f077c1b255 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -441,7 +441,9 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
         xen_9pdev->rings[i].ring.out = xen_9pdev->rings[i].data +
                                        XEN_FLEX_RING_SIZE(ring_order);
 
-        xen_9pdev->rings[i].bh = qemu_bh_new(xen_9pfs_bh, &xen_9pdev->rings[i]);
+        xen_9pdev->rings[i].bh = qemu_bh_new_guarded(xen_9pfs_bh,
+                                                     &xen_9pdev->rings[i],
+                                                     &DEVICE(xen_9pdev)->mem_reentrancy_guard);
         xen_9pdev->rings[i].out_cons = 0;
         xen_9pdev->rings[i].out_size = 0;
         xen_9pdev->rings[i].inprogress = false;
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 26f965cabc..191a8c90aa 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -127,7 +127,8 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
     } else {
         s->ctx = qemu_get_aio_context();
     }
-    s->bh = aio_bh_new(s->ctx, notify_guest_bh, s);
+    s->bh = aio_bh_new_guarded(s->ctx, notify_guest_bh, s,
+                               &DEVICE(s)->mem_reentrancy_guard);
     s->batch_notify_vqs = bitmap_new(conf->num_queues);
 
     *dataplane = s;
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 2785b9e849..e31806b317 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -632,8 +632,9 @@ XenBlockDataPlane *xen_block_dataplane_create(XenDevice *xendev,
     } else {
         dataplane->ctx = qemu_get_aio_context();
     }
-    dataplane->bh = aio_bh_new(dataplane->ctx, xen_block_dataplane_bh,
-                               dataplane);
+    dataplane->bh = aio_bh_new_guarded(dataplane->ctx, xen_block_dataplane_bh,
+                                       dataplane,
+                                       &DEVICE(xendev)->mem_reentrancy_guard);
 
     return dataplane;
 }
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f717550fdc..e9f516e633 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -866,8 +866,9 @@ static void virtio_blk_dma_restart_cb(void *opaque, bool running,
      * requests will be processed while starting the data plane.
      */
     if (!s->bh && !virtio_bus_ioeventfd_enabled(bus)) {
-        s->bh = aio_bh_new(blk_get_aio_context(s->conf.conf.blk),
-                           virtio_blk_dma_restart_bh, s);
+        s->bh = aio_bh_new_guarded(blk_get_aio_context(s->conf.conf.blk),
+                                   virtio_blk_dma_restart_bh, s,
+                                   &DEVICE(s)->mem_reentrancy_guard);
         blk_inc_in_flight(s->conf.conf.blk);
         qemu_bh_schedule(s->bh);
     }
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 7d4601cb5d..dd619f0731 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -985,7 +985,8 @@ static void virtser_port_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    port->bh = qemu_bh_new(flush_queued_data_bh, port);
+    port->bh = qemu_bh_new_guarded(flush_queued_data_bh, port,
+                                   &dev->mem_reentrancy_guard);
     port->elem = NULL;
 }
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 6772849dec..67efa3c3ef 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2223,11 +2223,14 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
 
     qemu_add_vm_change_state_handler(qxl_vm_change_state_handler, qxl);
 
-    qxl->update_irq = qemu_bh_new(qxl_update_irq_bh, qxl);
+    qxl->update_irq = qemu_bh_new_guarded(qxl_update_irq_bh, qxl,
+                                          &DEVICE(qxl)->mem_reentrancy_guard);
     qxl_reset_state(qxl);
 
-    qxl->update_area_bh = qemu_bh_new(qxl_render_update_area_bh, qxl);
-    qxl->ssd.cursor_bh = qemu_bh_new(qemu_spice_cursor_refresh_bh, &qxl->ssd);
+    qxl->update_area_bh = qemu_bh_new_guarded(qxl_render_update_area_bh, qxl,
+                                              &DEVICE(qxl)->mem_reentrancy_guard);
+    qxl->ssd.cursor_bh = qemu_bh_new_guarded(qemu_spice_cursor_refresh_bh, &qxl->ssd,
+                                             &DEVICE(qxl)->mem_reentrancy_guard);
 }
 
 static void qxl_realize_primary(PCIDevice *dev, Error **errp)
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5e15c79b94..66ac9b6cc5 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1339,8 +1339,10 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
 
     g->ctrl_vq = virtio_get_queue(vdev, 0);
     g->cursor_vq = virtio_get_queue(vdev, 1);
-    g->ctrl_bh = qemu_bh_new(virtio_gpu_ctrl_bh, g);
-    g->cursor_bh = qemu_bh_new(virtio_gpu_cursor_bh, g);
+    g->ctrl_bh = qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
+                                     &qdev->mem_reentrancy_guard);
+    g->cursor_bh = qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
+                                       &qdev->mem_reentrancy_guard);
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 7ce001cacd..37091150cb 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1508,7 +1508,8 @@ static void ahci_cmd_done(const IDEDMA *dma)
     ahci_write_fis_d2h(ad);
 
     if (ad->port_regs.cmd_issue && !ad->check_bh) {
-        ad->check_bh = qemu_bh_new(ahci_check_cmd_bh, ad);
+        ad->check_bh = qemu_bh_new_guarded(ahci_check_cmd_bh, ad,
+                                           &DEVICE(ad)->mem_reentrancy_guard);
         qemu_bh_schedule(ad->check_bh);
     }
 }
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 5d1039378f..8c8d1a8ec2 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -519,7 +519,8 @@ BlockAIOCB *ide_issue_trim(
 
     iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
     iocb->s = s;
-    iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
+    iocb->bh = qemu_bh_new_guarded(ide_trim_bh_cb, iocb,
+                                   &DEVICE(s)->mem_reentrancy_guard);
     iocb->ret = 0;
     iocb->qiov = qiov;
     iocb->i = -1;
diff --git a/hw/misc/imx_rngc.c b/hw/misc/imx_rngc.c
index 632c03779c..082c6980ad 100644
--- a/hw/misc/imx_rngc.c
+++ b/hw/misc/imx_rngc.c
@@ -228,8 +228,10 @@ static void imx_rngc_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 
     sysbus_init_irq(sbd, &s->irq);
-    s->self_test_bh = qemu_bh_new(imx_rngc_self_test, s);
-    s->seed_bh = qemu_bh_new(imx_rngc_seed, s);
+    s->self_test_bh = qemu_bh_new_guarded(imx_rngc_self_test, s,
+                                          &dev->mem_reentrancy_guard);
+    s->seed_bh = qemu_bh_new_guarded(imx_rngc_seed, s,
+                                     &dev->mem_reentrancy_guard);
 }
 
 static void imx_rngc_reset(DeviceState *dev)
diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
index efcc02609f..cc7e02203d 100644
--- a/hw/misc/macio/mac_dbdma.c
+++ b/hw/misc/macio/mac_dbdma.c
@@ -914,7 +914,7 @@ static void mac_dbdma_realize(DeviceState *dev, Error **errp)
 {
     DBDMAState *s = MAC_DBDMA(dev);
 
-    s->bh = qemu_bh_new(DBDMA_run_bh, s);
+    s->bh = qemu_bh_new_guarded(DBDMA_run_bh, s, &dev->mem_reentrancy_guard);
 }
 
 static void mac_dbdma_class_init(ObjectClass *oc, void *data)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..a170c724de 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2885,7 +2885,8 @@ static void virtio_net_add_queue(VirtIONet *n, int index)
         n->vqs[index].tx_vq =
             virtio_add_queue(vdev, n->net_conf.tx_queue_size,
                              virtio_net_handle_tx_bh);
-        n->vqs[index].tx_bh = qemu_bh_new(virtio_net_tx_bh, &n->vqs[index]);
+        n->vqs[index].tx_bh = qemu_bh_new_guarded(virtio_net_tx_bh, &n->vqs[index],
+                                                  &DEVICE(vdev)->mem_reentrancy_guard);
     }
 
     n->vqs[index].tx_waiting = 0;
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f25cc2c235..dcb250e772 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4318,7 +4318,8 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
         QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
     }
 
-    sq->bh = qemu_bh_new(nvme_process_sq, sq);
+    sq->bh = qemu_bh_new_guarded(nvme_process_sq, sq,
+                                 &DEVICE(sq->ctrl)->mem_reentrancy_guard);
 
     if (n->dbbuf_enabled) {
         sq->db_addr = n->dbbuf_dbs + (sqid << 3);
@@ -4708,7 +4709,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
         }
     }
     n->cq[cqid] = cq;
-    cq->bh = qemu_bh_new(nvme_post_cqes, cq);
+    cq->bh = qemu_bh_new_guarded(nvme_post_cqes, cq,
+                                 &DEVICE(cq->ctrl)->mem_reentrancy_guard);
 }
 
 static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index c485da792c..3de288b454 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1322,7 +1322,8 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
     }
     s->max_devices = MPTSAS_NUM_PORTS;
 
-    s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
+    s->request_bh = qemu_bh_new_guarded(mptsas_fetch_requests, s,
+                                        &DEVICE(dev)->mem_reentrancy_guard);
 
     scsi_bus_init(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info);
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..e5c9f7a53d 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -193,7 +193,8 @@ static void scsi_dma_restart_cb(void *opaque, bool running, RunState state)
         AioContext *ctx = blk_get_aio_context(s->conf.blk);
         /* The reference is dropped in scsi_dma_restart_bh.*/
         object_ref(OBJECT(s));
-        s->bh = aio_bh_new(ctx, scsi_dma_restart_bh, s);
+        s->bh = aio_bh_new_guarded(ctx, scsi_dma_restart_bh, s,
+                                   &DEVICE(s)->mem_reentrancy_guard);
         qemu_bh_schedule(s->bh);
     }
 }
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index fa76696855..4de34536e9 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -1184,7 +1184,8 @@ pvscsi_realizefn(PCIDevice *pci_dev, Error **errp)
         pcie_endpoint_cap_init(pci_dev, PVSCSI_EXP_EP_OFFSET);
     }
 
-    s->completion_worker = qemu_bh_new(pvscsi_process_completion_queue, s);
+    s->completion_worker = qemu_bh_new_guarded(pvscsi_process_completion_queue, s,
+                                               &DEVICE(pci_dev)->mem_reentrancy_guard);
 
     scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(pci_dev), &pvscsi_scsi_info);
     /* override default SCSI bus hotplug-handler, with pvscsi's one */
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 88f99c05d5..f013ded91e 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -937,7 +937,8 @@ static void usb_uas_realize(USBDevice *dev, Error **errp)
 
     QTAILQ_INIT(&uas->results);
     QTAILQ_INIT(&uas->requests);
-    uas->status_bh = qemu_bh_new(usb_uas_send_status_bh, uas);
+    uas->status_bh = qemu_bh_new_guarded(usb_uas_send_status_bh, uas,
+                                         &d->mem_reentrancy_guard);
 
     dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
     scsi_bus_init(&uas->bus, sizeof(uas->bus), DEVICE(dev), &usb_uas_scsi_info);
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 8755e9cbb0..a0c4e782b2 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -1364,7 +1364,8 @@ static void dwc2_realize(DeviceState *dev, Error **errp)
     s->fi = USB_FRMINTVL - 1;
     s->eof_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_frame_boundary, s);
     s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_work_timer, s);
-    s->async_bh = qemu_bh_new(dwc2_work_bh, s);
+    s->async_bh = qemu_bh_new_guarded(dwc2_work_bh, s,
+                                      &dev->mem_reentrancy_guard);
 
     sysbus_init_irq(sbd, &s->irq);
 }
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index d4da8dcb8d..c930c60921 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2533,7 +2533,8 @@ void usb_ehci_realize(EHCIState *s, DeviceState *dev, Error **errp)
     }
 
     s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ehci_work_timer, s);
-    s->async_bh = qemu_bh_new(ehci_work_bh, s);
+    s->async_bh = qemu_bh_new_guarded(ehci_work_bh, s,
+                                      &dev->mem_reentrancy_guard);
     s->device = dev;
 
     s->vmstate = qemu_add_vm_change_state_handler(usb_ehci_vm_state_change, s);
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 30ae0104bb..bdc891f57a 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1193,7 +1193,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
                               USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL);
         }
     }
-    s->bh = qemu_bh_new(uhci_bh, s);
+    s->bh = qemu_bh_new_guarded(uhci_bh, s, &DEVICE(dev)->mem_reentrancy_guard);
     s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, uhci_frame_timer, s);
     s->num_ports_vmstate = NB_PORTS;
     QTAILQ_INIT(&s->queues);
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 176868d345..f500db85ab 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1141,7 +1141,8 @@ static void usb_host_nodev_bh(void *opaque)
 static void usb_host_nodev(USBHostDevice *s)
 {
     if (!s->bh_nodev) {
-        s->bh_nodev = qemu_bh_new(usb_host_nodev_bh, s);
+        s->bh_nodev = qemu_bh_new_guarded(usb_host_nodev_bh, s,
+                                          &DEVICE(s)->mem_reentrancy_guard);
     }
     qemu_bh_schedule(s->bh_nodev);
 }
@@ -1739,7 +1740,8 @@ static int usb_host_post_load(void *opaque, int version_id)
     USBHostDevice *dev = opaque;
 
     if (!dev->bh_postld) {
-        dev->bh_postld = qemu_bh_new(usb_host_post_load_bh, dev);
+        dev->bh_postld = qemu_bh_new_guarded(usb_host_post_load_bh, dev,
+                                             &DEVICE(dev)->mem_reentrancy_guard);
     }
     qemu_bh_schedule(dev->bh_postld);
     dev->bh_postld_pending = true;
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index fd7df599bc..39fbaaab16 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1441,8 +1441,10 @@ static void usbredir_realize(USBDevice *udev, Error **errp)
         }
     }
 
-    dev->chardev_close_bh = qemu_bh_new(usbredir_chardev_close_bh, dev);
-    dev->device_reject_bh = qemu_bh_new(usbredir_device_reject_bh, dev);
+    dev->chardev_close_bh = qemu_bh_new_guarded(usbredir_chardev_close_bh, dev,
+                                                &DEVICE(dev)->mem_reentrancy_guard);
+    dev->device_reject_bh = qemu_bh_new_guarded(usbredir_device_reject_bh, dev,
+                                                &DEVICE(dev)->mem_reentrancy_guard);
     dev->attach_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, usbredir_do_attach, dev);
 
     packet_id_queue_init(&dev->cancelled, dev, "cancelled");
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 0f7369e7ed..dec91294ad 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -1021,7 +1021,8 @@ static void usbback_alloc(struct XenLegacyDevice *xendev)
 
     QTAILQ_INIT(&usbif->req_free_q);
     QSIMPLEQ_INIT(&usbif->hotplug_q);
-    usbif->bh = qemu_bh_new(usbback_bh, usbif);
+    usbif->bh = qemu_bh_new_guarded(usbback_bh, usbif,
+                                    &DEVICE(xendev)->mem_reentrancy_guard);
 }
 
 static int usbback_free(struct XenLegacyDevice *xendev)
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 746f07c4d2..309cebacc6 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -908,8 +908,9 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
         precopy_add_notifier(&s->free_page_hint_notify);
 
         object_ref(OBJECT(s->iothread));
-        s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
-                                     virtio_ballloon_get_free_page_hints, s);
+        s->free_page_bh = aio_bh_new_guarded(iothread_get_aio_context(s->iothread),
+                                             virtio_ballloon_get_free_page_hints, s,
+                                             &DEVICE(s)->mem_reentrancy_guard);
     }
 
     if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_REPORTING)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 516425e26a..4c95f1096e 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -1050,7 +1050,8 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         vcrypto->vqs[i].dataq =
                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_dataq_bh);
         vcrypto->vqs[i].dataq_bh =
-                 qemu_bh_new(virtio_crypto_dataq_bh, &vcrypto->vqs[i]);
+                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->vqs[i],
+                                     &dev->mem_reentrancy_guard);
         vcrypto->vqs[i].vcrypto = vcrypto;
     }
 
-- 
2.39.0


