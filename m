Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B93B9F25
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:34:51 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGVW-0004OH-0E
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lzGUP-0003gV-Hc
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lzGUK-0000lT-BI
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625222014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFjtfGkkq1BnI/FvZ53s0PUACL3DWeFvj/PcHbUe7LY=;
 b=eH+Zhl0ZiOSyotir6mGHSyQGJ2QaW25c6BZCHByTFMMB8I4blzO9ENemrGTu8vHwLqv4XS
 nq04XhDG4TzfHadLOXbzd+I/hRj3AOJAEmjCQqfO7s1TFsKFF7RZEk2ox607EDq7yAigTn
 vFZynWPCgmLl8y0uIGBJ0jsK3xCHGys=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-YDEoDgUnNFaXKxW-tYMmYg-1; Fri, 02 Jul 2021 06:33:33 -0400
X-MC-Unique: YDEoDgUnNFaXKxW-tYMmYg-1
Received: by mail-ed1-f72.google.com with SMTP id
 y17-20020a0564023591b02903951740fab5so4900955edc.23
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AFjtfGkkq1BnI/FvZ53s0PUACL3DWeFvj/PcHbUe7LY=;
 b=oqcO8vvgJzdtzu0WJ4j4d+4vC1rA5snfAclwAoRpY0Dc7aimq04NF2eAkD8+PYPLeJ
 COgoc8VvBeEtEsMHZZfom08y9gLJRmJstrCCyOL2aEZfBPGx9jrLYLYRkIQiI5DOAxK9
 Z1gsLYVguZespSxQ2illQ9Oz92d9gCs8Ae9UrkyVJAVIIZ4zvQXX4ORvqE/la9cKQVqI
 vr9Aoo4i1iBRewlmO3+MHsy1rkrNfsQA2oN4jp8tcReO0qot69HFm9xd3QxhKqL8vQlA
 V5zjJlOmwgwPBRD9hnxSeHJO/d9q4KJ1yJmdcuDJQxJRMIGVRO60Iju4MqRsdSDCOvj5
 n7pg==
X-Gm-Message-State: AOAM530d8UXBJmWzBcjUZaj4QNMYwXoq3lbA+dV2E2SvA0eH9harFPff
 lfawgeiNtDlliJJwGnX5Sv5KclaWbRrWSlMdNaPFyl9q55Zm9Ykg/KWZzVJ9lDhtQ9GMtNp9L6M
 QsIt/UM0Qdr6Bcfs=
X-Received: by 2002:a17:907:6092:: with SMTP id
 ht18mr4215778ejc.331.1625222011912; 
 Fri, 02 Jul 2021 03:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmIPSGdQYgZB40hGhUeg4tLul0BYhewxLIg47CCKS/xzMtU2/QhCdZfzokY0D1G5t4vjQQzg==
X-Received: by 2002:a17:907:6092:: with SMTP id
 ht18mr4215757ejc.331.1625222011587; 
 Fri, 02 Jul 2021 03:33:31 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id y6sm1108251edr.65.2021.07.02.03.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:33:31 -0700 (PDT)
Date: Fri, 2 Jul 2021 12:33:29 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v2] virtio/vsock: add two more queues for datagram types
Message-ID: <20210702103329.2wdppl3ybafwqb4p@steredhat>
References: <20210701214910.33913-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210701214910.33913-1-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 01, 2021 at 09:49:10PM +0000, Jiang Wang wrote:
>Datagram sockets are connectionless and unreliable.
>The sender does not know the capacity of the receiver
>and may send more packets than the receiver can handle.
>
>Add two more dedicate virtqueues for datagram sockets,
>so that it will not unfairly steal resources from
>stream and future connection-oriented sockets.
>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>---
>v1 -> v2: use qemu cmd option to control number of queues,
>	removed configuration settings for dgram.
>
>
> hw/virtio/vhost-user-vsock.c                  |  6 +++---
> hw/virtio/vhost-vsock-common.c                | 23 ++++++++++++++++++-----
> hw/virtio/vhost-vsock.c                       | 11 ++++++++---
> include/hw/virtio/vhost-vsock-common.h        |  8 +++++---
> include/hw/virtio/vhost-vsock.h               |  1 +
> include/standard-headers/linux/virtio_vsock.h |  3 +++
> 6 files changed, 38 insertions(+), 14 deletions(-)
>
>diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>index a6f08c26b9..409286aa8d 100644
>--- a/hw/virtio/vhost-user-vsock.c
>+++ b/hw/virtio/vhost-user-vsock.c
>@@ -103,7 +103,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>         return;
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
>
>     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>
>@@ -126,7 +126,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
> err_vhost_dev:
>     vhost_dev_cleanup(&vvc->vhost_dev);
> err_virtio:
>-    vhost_vsock_common_unrealize(vdev);
>+    vhost_vsock_common_unrealize(vdev, false);
>     vhost_user_cleanup(&vsock->vhost_user);
>     return;
> }
>@@ -142,7 +142,7 @@ static void vuv_device_unrealize(DeviceState *dev)
>
>     vhost_dev_cleanup(&vvc->vhost_dev);
>
>-    vhost_vsock_common_unrealize(vdev);
>+    vhost_vsock_common_unrealize(vdev, false);
>
>     vhost_user_cleanup(&vsock->vhost_user);
>
>diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
>index 4ad6e234ad..a36cb36496 100644
>--- a/hw/virtio/vhost-vsock-common.c
>+++ b/hw/virtio/vhost-vsock-common.c
>@@ -196,9 +196,10 @@ int vhost_vsock_common_post_load(void *opaque, int 
>version_id)
>     return 0;
> }
>
>-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>+    int nvq = 2;
>
>     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>                 sizeof(struct virtio_vsock_config));
>@@ -209,17 +210,24 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);
>
>-    /* The event queue belongs to QEMU */
>+    if (enable_dgram) {
>+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+					      vhost_vsock_common_handle_output);
>+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+					       vhost_vsock_common_handle_output);
>+	nvq = 4;
>+    }
>+	    /* The event queue belongs to QEMU */
>     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                        vhost_vsock_common_handle_output);

What happen if the guest doesn't support dgram?

I think we should dynamically use the 3rd queue or the 5th queue for the 
events at runtime after the guest acked the features.

Maybe better to switch to an array of VirtQueue.

>
>-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
>-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
>+    vvc->vhost_dev.nvqs = nvq;
>+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);

Where do we free this?

>
>     vvc->post_load_timer = NULL;
> }
>
>-void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>+void vhost_vsock_common_unrealize(VirtIODevice *vdev, bool enable_dgram)
> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>
>@@ -227,6 +235,11 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>
>     virtio_delete_queue(vvc->recv_vq);
>     virtio_delete_queue(vvc->trans_vq);
>+    if (enable_dgram) {
>+        virtio_delete_queue(vvc->dgram_recv_vq);
>+        virtio_delete_queue(vvc->dgram_trans_vq);
>+    }
>+
>     virtio_delete_queue(vvc->event_vq);
>     virtio_cleanup(vdev);
> }
>diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>index 5eaa207504..d15c672c38 100644
>--- a/hw/virtio/vhost-vsock.c
>+++ b/hw/virtio/vhost-vsock.c
>@@ -23,6 +23,7 @@
>
> const int feature_bits[] = {
>     VIRTIO_VSOCK_F_SEQPACKET,
>+    VIRTIO_VSOCK_F_DGRAM,
>     VHOST_INVALID_FEATURE_BIT
> };
>
>@@ -116,6 +117,8 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>
>     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>+    if (vvc->vhost_dev.nvqs == 4) /* 4 means has dgram support */
>+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
>     return vhost_get_features(&vvc->vhost_dev, feature_bits,
>                                 requested_features);
> }
>@@ -175,7 +178,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>         qemu_set_nonblock(vhostfd);
>     }
>
>-    vhost_vsock_common_realize(vdev, "vhost-vsock");
>+    vhost_vsock_common_realize(vdev, "vhost-vsock", vsock->conf.enable_dgram);
>
>     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                          VHOST_BACKEND_TYPE_KERNEL, 0);
>@@ -197,7 +200,7 @@ err_vhost_dev:
>     /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() */
>     vhostfd = -1;
> err_virtio:
>-    vhost_vsock_common_unrealize(vdev);
>+    vhost_vsock_common_unrealize(vdev, vsock->conf.enable_dgram);
>     if (vhostfd >= 0) {
>         close(vhostfd);
>     }
>@@ -208,17 +211,19 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
> {
>     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(dev);
>     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>+    VHostVSock *vsock = VHOST_VSOCK(dev);
>
>     /* This will stop vhost backend if appropriate. */
>     vhost_vsock_set_status(vdev, 0);
>
>     vhost_dev_cleanup(&vvc->vhost_dev);
>-    vhost_vsock_common_unrealize(vdev);
>+    vhost_vsock_common_unrealize(vdev, vsock->conf.enable_dgram);
> }
>
> static Property vhost_vsock_properties[] = {
>     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
>     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
>+    DEFINE_PROP_BOOL("enable_dgram", VHostVSock, conf.enable_dgram, 
>false),

I think we can avoid this and query the vhost device features before 
vhost_vsock_common_realize().

Take a look at vhost_vdpa_get_max_qps() implemented by Jason here:
https://lore.kernel.org/qemu-devel/20210621041650.5826-19-jasowang@redhat.com/

We can do something similar to discover if the vhost-vsock device 
supports 2 or 4 queues checking if VIRTIO_VSOCK_F_DGRAM is set or not.

Thanks,
Stefano


