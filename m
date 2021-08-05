Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F63E1C25
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:08:31 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBijF-0007L9-BM
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mBii7-0005uC-3C
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:07:19 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:33406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mBii2-0007oG-RZ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:07:17 -0400
Received: by mail-oi1-x22b.google.com with SMTP id 26so8803284oiy.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQpAZXu3WAMV/VuevmyS0/VQCP/fQpgUHsL4QaaIBQs=;
 b=b9tISQRwyacQgAcNIP82Jgf+fyqRUUWxXfjvFPcEuR7n2o4axlYQy2f944mDBxRm1B
 cDB3JbNx0YdzPxYg7ou321nVLgaPGo3nE4RtLb5yndH056Hv38nelwYK/3k0QPgASryo
 FFWzyy4la4OUvCBdconNpn9Jp/tGipbKk/Vz5ltkRxKalbvzDEBo5Yu5zKh3NjegS6VR
 /9cOGS3ePpvuDhGHjIIQcg2xBpDUF3aICWdenHwBUwt7FhmQpqM3oY1bghR/WFop5FjB
 T6mFiKH+EfdL5WZyEluTfX43KYVzO3j41tSc8WUddsvtNNzpstOLEdftRV87iSKJTg7D
 6euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQpAZXu3WAMV/VuevmyS0/VQCP/fQpgUHsL4QaaIBQs=;
 b=lG3jOUB78AJda+868OEcfYL320ZZctoQpc/u+6Mt4k699ftFcp5njtW8eMh1aX9rqC
 uLjM/h/kAdPumQnO0/FAeCwcPmZg5HaTyAFR0MLUOmoR6J/sxvK/qaqbAAzJJH96YTDW
 A9QlBgUWfQC7f50hs84HS7BVygymzHhytYkaQFFgdFJXO6H9pV60+V+TF7ZJrxj5pb9M
 vSDW9rlZF6XcleRTUyDsjSBvsuOMyCikhjM8LPYSkFTvKBnP3t3a2jlEgWP0sB9IA3Fq
 cTuv1k6PFignnsWWogFs2n+aBHm2jEemw/adHEnfeQF4BCIWU4YDi/RimpwhGAW8HNWu
 eawg==
X-Gm-Message-State: AOAM5304Ut61afRiTbJPudCcwt78i0QeMvzgQugPML/Pk9aYuVsAKPaI
 49u3TMjI9l6QXlIkNEf+VVHt8djmWcKslFjABmDN8Q==
X-Google-Smtp-Source: ABdhPJwz+ErXKzdqbBo7fbbEy6dsEMc05uj62eBlTGox8v+vGLuzP8qIXEvDyo0b40vKPaUe32HEZT353ULhF/Gswrw=
X-Received: by 2002:a05:6808:d53:: with SMTP id
 w19mr4748613oik.48.1628190433579; 
 Thu, 05 Aug 2021 12:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210803234132.1557394-1-jiang.wang@bytedance.com>
 <20210804081349.44gifmmks2uut6r5@steredhat>
In-Reply-To: <20210804081349.44gifmmks2uut6r5@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Thu, 5 Aug 2021 12:07:02 -0700
Message-ID: <CAP_N_Z_yhrNJtL0_xZ+Ar8OKqxx=JC-eBejjcPZPbNREWeq_Yg@mail.gmail.com>
Subject: Re: Re: [PATCH v4] virtio/vsock: add two more queues for datagram
 types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=jiang.wang@bytedance.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 4, 2021 at 1:13 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Tue, Aug 03, 2021 at 11:41:32PM +0000, Jiang Wang wrote:
> >Datagram sockets are connectionless and unreliable.
> >The sender does not know the capacity of the receiver
> >and may send more packets than the receiver can handle.
> >
> >Add two more dedicate virtqueues for datagram sockets,
> >so that it will not unfairly steal resources from
> >stream and future connection-oriented sockets.
> >
> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> >---
> >v1 -> v2: use qemu cmd option to control number of queues,
> >       removed configuration settings for dgram.
> >v2 -> v3: use ioctl to get features and decide number of
> >        virt queues, instead of qemu cmd option.
> >v3 -> v4: change DGRAM feature bit value to 2. Add an argument
> >       in vhost_vsock_common_realize to indicate dgram is supported or not.
> >
> > hw/virtio/vhost-user-vsock.c                  |  2 +-
> > hw/virtio/vhost-vsock-common.c                | 58 ++++++++++++++++++-
> > hw/virtio/vhost-vsock.c                       |  5 +-
> > include/hw/virtio/vhost-vsock-common.h        |  6 +-
> > include/hw/virtio/vhost-vsock.h               |  4 ++
> > include/standard-headers/linux/virtio_vsock.h |  1 +
> > 6 files changed, 69 insertions(+), 7 deletions(-)
> >
> >diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> >index 6095ed7349..e9ec0e1c00 100644
> >--- a/hw/virtio/vhost-user-vsock.c
> >+++ b/hw/virtio/vhost-user-vsock.c
> >@@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
> >         return;
> >     }
> >
> >-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> >+    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
> >
> >     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> >
> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> >index 4ad6e234ad..c78536911a 100644
> >--- a/hw/virtio/vhost-vsock-common.c
> >+++ b/hw/virtio/vhost-vsock-common.c
> >@@ -17,6 +17,8 @@
> > #include "hw/virtio/vhost-vsock.h"
> > #include "qemu/iov.h"
> > #include "monitor/monitor.h"
> >+#include <sys/ioctl.h>
> >+#include <linux/vhost.h>
> >
> > int vhost_vsock_common_start(VirtIODevice *vdev)
> > {
> >@@ -196,9 +198,39 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
> >     return 0;
> > }
> >
> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> >+static int vhost_vsock_get_max_qps(bool enable_dgram)
> >+{
> >+    uint64_t features;
> >+    int ret;
> >+    int fd = -1;
> >+
> >+    if (!enable_dgram)
> >+        return MAX_VQS_WITHOUT_DGRAM;
> >+
> >+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);
>
>
> As I said in the previous version, we cannot directly open
> /dev/vhost-vsock, for two reasons:
>
>    1. this code is common with vhost-user-vsock which does not use
>    /dev/vhost-vsock.
>
>    2. the fd may have been passed from the management layer and qemu may
>    not be able to directly open /dev/vhost-vsock.
>
> I think is better to move this function in hw/virtio/vhost-vsock.c,
> using the `vhostfd`, returning true or false if dgram is supported, then
> you can use it for `enable_dgram` param ...
>

Yes, you are right. Now I remember you said that before but I forgot about that
when I changed the code. I will fix it. Sorry about that.

> >+    if (fd == -1) {
> >+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
> >+        return -1;
> >+    }
> >+
> >+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
> >+    if (ret) {
> >+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));
> >+        qemu_close(fd);
> >+        return ret;
> >+    }
> >+
> >+    qemu_close(fd);
> >+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
> >+        return MAX_VQS_WITH_DGRAM;
> >+
> >+    return MAX_VQS_WITHOUT_DGRAM;
> >+}
> >+
> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name, bool enable_dgram)
> > {
> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
> >
> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> >                 sizeof(struct virtio_vsock_config));
> >@@ -209,12 +241,24 @@ void vhost_vsock_common_realize(VirtIODevice
> >*vdev, const char *name)
> >     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >                                        vhost_vsock_common_handle_output);
> >
> >+    nvqs = vhost_vsock_get_max_qps(enable_dgram);
> >+
> >+    if (nvqs < 0)
> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
>
> ... and here, if `enable_dgram` is true, you can set `nvqs =
> MAX_VQS_WITH_DGRAM``
>
sure.

> >+
> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >+                                              vhost_vsock_common_handle_output);
> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >+
> >vhost_vsock_common_handle_output);
> >+    }
> >+
>
> I'm still concerned about compatibility with guests that don't support
> dgram, as I mentioned in the previous email.
>
> I need to do some testing, but my guess is it won't work if the host
> (QEMU and vhost-vsock) supports it and the guest doesn't.
>
> I still think that we should allocate an array of queues and then decide
> at runtime which one to use for events (third or fifth) after the guest
> has acked the features.
>
Agree. I will check where the guest ack the feature. If you have any pointers,
just let me know. Also, could we just remove the vq allocation in common_realize
and do it at a later time? Or need to delete and add again as I mentioned in the
previous email?

> >     /* The event queue belongs to QEMU */
> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >                                        vhost_vsock_common_handle_output);
> >
> >-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
> >-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
> >+    vvc->vhost_dev.nvqs = nvqs;
> >+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
> >
> >     vvc->post_load_timer = NULL;
> > }
> >@@ -227,6 +271,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
> >
> >     virtio_delete_queue(vvc->recv_vq);
> >     virtio_delete_queue(vvc->trans_vq);
> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
> >+        virtio_delete_queue(vvc->dgram_recv_vq);
> >+        virtio_delete_queue(vvc->dgram_trans_vq);
> >+    }
> >+
> >+    if (vvc->vhost_dev.vqs)
> >+        g_free(vvc->vhost_dev.vqs);
> >+
> >     virtio_delete_queue(vvc->event_vq);
> >     virtio_cleanup(vdev);
> > }
> >diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> >index 1b1a5c70ed..f73523afaf 100644
> >--- a/hw/virtio/vhost-vsock.c
> >+++ b/hw/virtio/vhost-vsock.c
> >@@ -23,6 +23,7 @@
> >
> > const int feature_bits[] = {
> >     VIRTIO_VSOCK_F_SEQPACKET,
> >+    VIRTIO_VSOCK_F_DGRAM,
> >     VHOST_INVALID_FEATURE_BIT
> > };
> >
> >@@ -116,6 +117,8 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >
> >     virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM)
> >+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
> >     return vhost_get_features(&vvc->vhost_dev, feature_bits,
> >                                 requested_features);
> > }
> >@@ -175,7 +178,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
> >         qemu_set_nonblock(vhostfd);
> >     }
> >
> >-    vhost_vsock_common_realize(vdev, "vhost-vsock");
> >+    vhost_vsock_common_realize(vdev, "vhost-vsock", true);
> >
> >     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
> >                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
> >diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
> >index e412b5ee98..6669d24714 100644
> >--- a/include/hw/virtio/vhost-vsock-common.h
> >+++ b/include/hw/virtio/vhost-vsock-common.h
> >@@ -27,12 +27,13 @@ enum {
> > struct VHostVSockCommon {
> >     VirtIODevice parent;
> >
> >-    struct vhost_virtqueue vhost_vqs[2];
> >     struct vhost_dev vhost_dev;
> >
> >     VirtQueue *event_vq;
> >     VirtQueue *recv_vq;
> >     VirtQueue *trans_vq;
> >+    VirtQueue *dgram_recv_vq;
> >+    VirtQueue *dgram_trans_vq;
> >
> >     QEMUTimer *post_load_timer;
> > };
> >@@ -41,7 +42,8 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
> > void vhost_vsock_common_stop(VirtIODevice *vdev);
> > int vhost_vsock_common_pre_save(void *opaque);
> > int vhost_vsock_common_post_load(void *opaque, int version_id);
> >-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
> >+void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
> >+                             bool enable_dgram);
> > void vhost_vsock_common_unrealize(VirtIODevice *vdev);
> >
> > #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
> >diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
> >index 84f4e727c7..e10319785d 100644
> >--- a/include/hw/virtio/vhost-vsock.h
> >+++ b/include/hw/virtio/vhost-vsock.h
> >@@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
> > typedef struct {
> >     uint64_t guest_cid;
> >     char *vhostfd;
> >+    bool enable_dgram;
>
> This seems unused.
>
Sure, I will remove it.

> Thanks,
> Stefano
>

