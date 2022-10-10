Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9F5FA347
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:18:12 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxLv-0006EX-33
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbs-0002fl-JT
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbn-000708-Ue
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNBkQ9PABxkzQIUsJljFJqAYW+PD7FReb9/B5Y8OCQ4=;
 b=UCGRHdaFOkH2xMAd2Yn7wek0MAmhdPFPhx35IunyjS4uBZL5iu7eXdGgmTZfwVlrQUkolW
 9WEtRQKvAc2DCz0wojHX3/LPuuQzqXK8/I55l6RqdSuWXc7+6BaGaN9irYuu6joIhyc2Uk
 dBWsP6+dn1zhvhNsaUv7VgnDj0obY2A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-KB5WN4b0N3WRYMi15ULjsA-1; Mon, 10 Oct 2022 13:30:30 -0400
X-MC-Unique: KB5WN4b0N3WRYMi15ULjsA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so3262179wmh.6
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yNBkQ9PABxkzQIUsJljFJqAYW+PD7FReb9/B5Y8OCQ4=;
 b=dtc/X9LlZehmjnHTUEsoQLmCDdVGmMKtzHLbLu7ydj7gAP3sdhDj1/RBkw5uDl80vf
 udTy2WonP7mfh+Fzc3/N+wQd96OiBHFRF92JQ+jz4yKA/FYL3IVpqtK1bADBzpBie89c
 ldMtFMwO4IQ5kn4FeXQ7qPFamqKJS0FhhQi0rqi6CB4rxeKbA/EVBBrzH/klWNclJfms
 K9Oi73xGhyyLDwnEkKub3xFnf173HddHGqFfld/vXRQTcd4oIl/ndCTw9wRneawVpxXH
 PhvG+ch2K1vr67NtBnYHcJFPZIYulpzgFaGk6VkWMdZWTBOTRRQOabt70BeqBRGe/9qs
 OQxg==
X-Gm-Message-State: ACrzQf3A0d0LAJbpGTpVnUjnkv4vqdUAjJvLtyLEgPQA6qI3JqbxEQKc
 Mlq95pjXLvx6F6wnGnXjItyX9++tG/AP3qReapD25ziKYd4w5UZuJHQaEonnjZZjVNvGFL5ey4O
 iiHVl79oypcFBx37ql583R249yeKopkI1eOLeuEoWVfE7o+ozJWFrkgo4kDgw
X-Received: by 2002:a05:600c:1547:b0:3b4:c56b:a3a6 with SMTP id
 f7-20020a05600c154700b003b4c56ba3a6mr13757947wmg.29.1665423028649; 
 Mon, 10 Oct 2022 10:30:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57k/63nQ6T2zPdeMu50dDFq4aFyyt0e1vHhk3xX7Zh8T5m/T3s+PblJOKC5rl7nAWcl3gcMg==
X-Received: by 2002:a05:600c:1547:b0:3b4:c56b:a3a6 with SMTP id
 f7-20020a05600c154700b003b4c56ba3a6mr13757921wmg.29.1665423028361; 
 Mon, 10 Oct 2022 10:30:28 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 bv10-20020a0560001f0a00b00228fa832b7asm9288948wrb.52.2022.10.10.10.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:27 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PULL 24/55] vhost-user-blk: dynamically resize config space based
 on features
Message-ID: <20221010172813.204597-25-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

Make vhost-user-blk backwards compatible when migrating from older VMs
running with modern features turned off, the same way it was done for
virtio-blk in 20764be0421c ("virtio-blk: set config size depending on the features enabled")

It's currently impossible to migrate from an older VM with
vhost-user-blk (with disable-legacy=off) because of errors like this:

qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10 read: 41 device: 1 cmask: ff wmask: 80 w1cmask:0
qemu-system-x86_64: Failed to load PCIDevice:config
qemu-system-x86_64: Failed to load virtio-blk:virtio
qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:05.0:00.0:02.0/virtio-blk'
qemu-system-x86_64: load of migration failed: Invalid argument

This is caused by the newer (destination) VM requiring a bigger BAR0
alignment because it has to cover a bigger configuration space, which
isn't actually needed since those additional config fields are not
active (write-zeroes/discard).

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220906073111.353245-6-d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 17 ++++++++++-------
 MAINTAINERS               |  2 ++
 hw/block/meson.build      |  2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index aa4831f27a..84902dde17 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -23,6 +23,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
+#include "hw/virtio/virtio-blk-common.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/vhost-user-blk.h"
 #include "hw/virtio/virtio.h"
@@ -63,7 +64,7 @@ static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     /* Our num_queues overrides the device backend */
     virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
 
-    memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
+    memcpy(config, &s->blkcfg, vdev->config_len);
 }
 
 static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t *config)
@@ -92,12 +93,12 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
 {
     int ret;
     struct virtio_blk_config blkcfg;
+    VirtIODevice *vdev = dev->vdev;
     VHostUserBlk *s = VHOST_USER_BLK(dev->vdev);
     Error *local_err = NULL;
 
     ret = vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
-                               sizeof(struct virtio_blk_config),
-                               &local_err);
+                               vdev->config_len, &local_err);
     if (ret < 0) {
         error_report_err(local_err);
         return ret;
@@ -106,7 +107,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
     /* valid for resize only */
     if (blkcfg.capacity != s->blkcfg.capacity) {
         s->blkcfg.capacity = blkcfg.capacity;
-        memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_config));
+        memcpy(dev->vdev->config, &s->blkcfg, vdev->config_len);
         virtio_notify_config(dev->vdev);
     }
 
@@ -448,7 +449,7 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
     assert(s->connected);
 
     ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
-                               sizeof(struct virtio_blk_config), errp);
+                               s->parent_obj.config_len, errp);
     if (ret < 0) {
         qemu_chr_fe_disconnect(&s->chardev);
         vhost_dev_cleanup(&s->dev);
@@ -463,6 +464,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     ERRP_GUARD();
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    size_t config_size;
     int retries;
     int i, ret;
 
@@ -493,8 +495,9 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, VIRTIO_ID_BLOCK,
-                sizeof(struct virtio_blk_config));
+    config_size = virtio_get_config_size(&virtio_blk_cfg_size_params,
+                                         vdev->host_features);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, config_size);
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
     for (i = 0; i < s->num_queues; i++) {
diff --git a/MAINTAINERS b/MAINTAINERS
index 05b75805eb..8ae2e43c83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2281,11 +2281,13 @@ S: Maintained
 F: contrib/vhost-user-blk/
 F: contrib/vhost-user-scsi/
 F: hw/block/vhost-user-blk.c
+F: hw/block/virtio-blk-common.c
 F: hw/scsi/vhost-user-scsi.c
 F: hw/virtio/vhost-user-blk-pci.c
 F: hw/virtio/vhost-user-scsi-pci.c
 F: include/hw/virtio/vhost-user-blk.h
 F: include/hw/virtio/vhost-user-scsi.h
+F: include/hw/virtio/virtio-blk-common.h
 
 vhost-user-gpu
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 8ee1f1f850..1908abd45c 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -17,6 +17,6 @@ softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
-specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
+specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
 
 subdir('dataplane')
-- 
MST


