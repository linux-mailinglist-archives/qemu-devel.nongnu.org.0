Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A776AFBE0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLW-00024O-HX; Tue, 07 Mar 2023 20:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLT-0001ow-88
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLR-0001b7-KD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LR/2NC5b3GMc7dlS3VMn63WeWMHdgJP7N4ThX8xxwRk=;
 b=iwsRuJTT0R4XSgE3lzPWurmQEXtT2KgjUX0+MHQCrwzW1hw6iflp55ysPAZ6gAQO5LGCgU
 ulSsNUZcFgBwRmRyN/LwLLHOnEiG1onJTvj0i5r8ABYkAZ+Nbeg3urw7MJrcW0iFyBUM3H
 K+1UiXK7W1GstLsODaacHqJKQRx3YuY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-IXKHSVFvOvufomeJqEg_fw-1; Tue, 07 Mar 2023 20:11:51 -0500
X-MC-Unique: IXKHSVFvOvufomeJqEg_fw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso12385783edb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237910;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LR/2NC5b3GMc7dlS3VMn63WeWMHdgJP7N4ThX8xxwRk=;
 b=6V3wJrshdZGjjqTsTPIEtT5yaheeTiaThks/0ld4mWr67KvpWG4TKBmMwiM3M8xsyL
 xBU8FcUDAb1GVdxfNuRsd36Ujc1ZfsBTsPOo7nAHtIrZ4EymrGTjs1wq2XSJKLoE9ADy
 UeBglEIX5oXWBGUXUN9PCakEkznykuChSk7/SzXMxNWIJsnG2SVpfI9QIvgu8FVy839E
 CKITM6n2L7Vt4FJJYkqV8KlQSljo32nxw6kCZaBR3hrI4HkIxHexK1SQ4uwqlrtsgmGe
 8f/cdNqMGEdeEZWgVRdneNvoBXS7UFgHNnVpFEDBT7M6/wUP/p0gKp/ZkGcfHRi+ZFNH
 wMIQ==
X-Gm-Message-State: AO0yUKUoUV+w+CdwdoxtFH4/o9nbDe+yVaAMsYeow01Dqvg57Fu7og3n
 lClwaP3PHZ8O3gVXHQshZWgB2X6/jneIKhSNgY/CftrnHdEvSPXFbhnCwPVft7WjghT9bGiNdYg
 EH2K6ShIDwOANVmBRzbENMymHUAiIBmG/z6LixnbwDPY8hs5xjOxDLp4++X7EbMj+RbDP
X-Received: by 2002:a17:906:9b88:b0:8b1:fc:b06d with SMTP id
 dd8-20020a1709069b8800b008b100fcb06dmr20900164ejc.77.1678237910271; 
 Tue, 07 Mar 2023 17:11:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/K/17pZ+A2iTPLX4H+A10afWqFexZPDu8dIWNCW1taqyIo3ApBSeKlHdkDJKA1qi6Fsguscg==
X-Received: by 2002:a17:906:9b88:b0:8b1:fc:b06d with SMTP id
 dd8-20020a1709069b8800b008b100fcb06dmr20900143ejc.77.1678237909967; 
 Tue, 07 Mar 2023 17:11:49 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 qt2-20020a170906ece200b008e938e98046sm6735972ejb.223.2023.03.07.17.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:49 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>
Subject: [PULL 19/73] vdpa: move vhost reset after get vring base
Message-ID: <c3716f260bff1bd3586a0dc3477e1febdd3a3f35.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

The function vhost.c:vhost_dev_stop calls vhost operation
vhost_dev_start(false). In the case of vdpa it totally reset and wipes
the device, making the fetching of the vring base (virtqueue state) totally
useless.

The kernel backend does not use vhost_dev_start vhost op callback, but
vhost-user do. A patch to make vhost_user_dev_start more similar to vdpa
is desirable, but it can be added on top.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-8-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h |  4 ++++
 hw/virtio/vhost-vdpa.c            | 24 +++++++++++++++++-------
 hw/virtio/vhost.c                 |  3 +++
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index c5ab49051e..ec3fbae58d 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
 typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
                                        int fd);
+
+typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
+
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -177,6 +180,7 @@ typedef struct VhostOps {
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
     vhost_set_config_call_op vhost_set_config_call;
+    vhost_reset_status_op vhost_reset_status;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index aecc01c6a7..c9a82ce5e0 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1146,14 +1146,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     if (started) {
         memory_listener_register(&v->listener, &address_space_memory);
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
-    } else {
-        vhost_vdpa_reset_device(dev);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-                                   VIRTIO_CONFIG_S_DRIVER);
-        memory_listener_unregister(&v->listener);
-
-        return 0;
     }
+
+    return 0;
+}
+
+static void vhost_vdpa_reset_status(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
+        return;
+    }
+
+    vhost_vdpa_reset_device(dev);
+    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
+                               VIRTIO_CONFIG_S_DRIVER);
+    memory_listener_unregister(&v->listener);
 }
 
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
@@ -1337,4 +1346,5 @@ const VhostOps vdpa_ops = {
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
         .vhost_set_config_call = vhost_vdpa_set_config_call,
+        .vhost_reset_status = vhost_vdpa_reset_status,
 };
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index eb8c4c378c..a266396576 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
                              hdev->vqs + i,
                              hdev->vq_index + i);
     }
+    if (hdev->vhost_ops->vhost_reset_status) {
+        hdev->vhost_ops->vhost_reset_status(hdev);
+    }
 
     if (vhost_dev_has_iommu(hdev)) {
         if (hdev->vhost_ops->vhost_set_iotlb_callback) {
-- 
MST


