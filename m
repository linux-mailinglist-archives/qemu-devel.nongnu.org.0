Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E43BED46
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:41:10 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BXp-0002RD-Sd
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1m1BU3-0007zf-AU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:37:15 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1m1BTx-00080r-V8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:37:12 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 w15-20020a056830144fb02904af2a0d96f3so3011063otp.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m6ucerOHHVBQbnWNzLCT1cjMpY/DZyCFDPd9cr/yscc=;
 b=hUwNUrtOPU56y3Hn9mis/3IUWh5FtmcL4/ONOlWyhP0Tid/T+DcQnzr4uXFmLe9+SB
 iu2neQTlQVTgUONFDLPlNJgL7G3Gj7q2OLIXHNx0X12Ok7zsdmJmvaoa/dHZ7AhxBuyt
 TiD97ZS/wigP/a22h3KCcX/9WbVjDz1RX3C3FFWIBE+PO1DyTPjohtFCZxoh5UtFK66d
 0wt9UwKFNuncS63nKO+r1zcYjbZph2w37s+kJTYcA6UAPv2/Lh1Pn4ipAMWM4Yl7fQPu
 SncItrGcM0mmG1xUIxQunZpwvVZdBbjaDI0hjwine6ITjhwfqXz7D+k4CPaytSB3vf85
 ieeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6ucerOHHVBQbnWNzLCT1cjMpY/DZyCFDPd9cr/yscc=;
 b=qEPJXxWPsVkE6OgLnXKbolxuRBnJOuL2QTmKyXIAbdfEk3oXvRul5x+34ZPtbVusJG
 UQy/3WPTl9RTfWVRtZQtHcktWDNIwlw53jw4BXd8ibGhu2z6W9ewq48GBOQEKF2jJQ4L
 +6h/KGLFa8TxwNfvTnGUvSyx4nz6u2PD7ugPAa/Uq3X60oRxDMbpaeuFt3YvdZEHL0vP
 85dOJdU70MKThZoVNj9N6HzArEwYMMsTkcii/T9hKDTWo1R0EVhx4kcydO1pkjfeDDOL
 8d/MosQC+QodM+LtjbCYmtk8dPTPvz89oKrQ4Yl80qn6zqIaI2hVj++5YLk4CSY7GGvN
 1MlQ==
X-Gm-Message-State: AOAM531bQ00u8+5gExTTyvl1bfwWya06mcWGNTpBfYdc3uPuNAIhz1sK
 8PFiZF4i/u8Iyx7UBLf6im47lK7mu9kKKyZfiaeotA==
X-Google-Smtp-Source: ABdhPJzddhaKFe4FKJ4/yXc/x4+oCOjjCwpMpSiUGt7KRcTKN/xtCEMS+wnTn0FH0beeH9WuOOXPxupo8Js+N1J+ZZI=
X-Received: by 2002:a05:6830:25cb:: with SMTP id
 d11mr14908688otu.56.1625679426987; 
 Wed, 07 Jul 2021 10:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210706222607.1058040-1-jiang.wang@bytedance.com>
 <20210707083312.algmreafmfofg7el@steredhat>
 <CAP_N_Z-NbofkoDbWby9Pe=VH1CjYQL6-gSbrwWDBZBNDwcnmuA@mail.gmail.com>
 <20210707172737.j2xpyd45wmufdqc5@steredhat.lan>
In-Reply-To: <20210707172737.j2xpyd45wmufdqc5@steredhat.lan>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Wed, 7 Jul 2021 10:36:56 -0700
Message-ID: <CAP_N_Z_F-jMsC-X2n=GhNq08G-7F9UzYcCB3uq0mAEDgvn0Kfg@mail.gmail.com>
Subject: Re: Re: [RFC v3] virtio/vsock: add two more queues for datagram types
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=jiang.wang@bytedance.com; helo=mail-ot1-x336.google.com
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

On Wed, Jul 7, 2021 at 10:27 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Wed, Jul 07, 2021 at 09:52:46AM -0700, Jiang Wang . wrote:
> >On Wed, Jul 7, 2021 at 1:33 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >>
> >> On Tue, Jul 06, 2021 at 10:26:07PM +0000, Jiang Wang wrote:
> >> >Datagram sockets are connectionless and unreliable.
> >> >The sender does not know the capacity of the receiver
> >> >and may send more packets than the receiver can handle.
> >> >
> >> >Add two more dedicate virtqueues for datagram sockets,
> >> >so that it will not unfairly steal resources from
> >> >stream and future connection-oriented sockets.
> >> >---
> >> >v1 -> v2: use qemu cmd option to control number of queues,
> >> >        removed configuration settings for dgram.
> >> >v2 -> v3: use ioctl to get features and decie numbr of
> >> >       virt queues, instead of qemu cmd option.
> >> >
> >> >btw: this patch is based on Arseny's SEQPACKET patch.
> >> >
> >> > hw/virtio/vhost-vsock-common.c                | 53 ++++++++++++++++++++++++++-
> >> > hw/virtio/vhost-vsock.c                       |  3 ++
> >> > include/hw/virtio/vhost-vsock-common.h        |  3 +-
> >> > include/hw/virtio/vhost-vsock.h               |  4 ++
> >> > include/standard-headers/linux/virtio_vsock.h |  3 ++
> >> > 5 files changed, 63 insertions(+), 3 deletions(-)
> >> >
> >> >diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> >> >index 4ad6e234ad..8164e09445 100644
> >> >--- a/hw/virtio/vhost-vsock-common.c
> >> >+++ b/hw/virtio/vhost-vsock-common.c
> >> >@@ -17,6 +17,8 @@
> >> > #include "hw/virtio/vhost-vsock.h"
> >> > #include "qemu/iov.h"
> >> > #include "monitor/monitor.h"
> >> >+#include <sys/ioctl.h>
> >> >+#include <linux/vhost.h>
> >> >
> >> > int vhost_vsock_common_start(VirtIODevice *vdev)
> >> > {
> >> >@@ -196,9 +198,36 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
> >> >     return 0;
> >> > }
> >> >
> >> >+static int vhost_vsock_get_max_qps(void)
> >> >+{
> >> >+    uint64_t features;
> >> >+    int ret;
> >> >+    int fd = -1;
> >> >+
> >> >+    fd = qemu_open_old("/dev/vhost-vsock", O_RDONLY);
> >> >+    if (fd == -1) {
> >> >+        error_report("vhost-vsock: failed to open device. %s", strerror(errno));
> >> >+        return -1;
> >> >+    }
> >>
> >> You should use the `vhostfd` already opened in
> >> vhost_vsock_device_realize(), since QEMU may not have permission to
> >> access to the device, and the file descriptor can be passed from the
> >> management layer.
> >>
> >Sure. Will do.
> >
> >> >+
> >> >+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
> >> >+    if (ret) {
> >> >+        error_report("vhost-vsock: failed to read  device. %s", strerror(errno));
> >> >+        qemu_close(fd);
> >> >+        return ret;
> >> >+    }
> >> >+
> >> >+    qemu_close(fd);
> >> >+    if (features & (1 << VIRTIO_VSOCK_F_DGRAM))
> >> >+        return MAX_VQS_WITH_DGRAM;
> >> >+
> >> >+    return MAX_VQS_WITHOUT_DGRAM;
> >> >+}
> >> >+
> >> > void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> >> > {
> >> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >> >+    int nvqs = MAX_VQS_WITHOUT_DGRAM;
> >> >
> >> >     virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> >> >                 sizeof(struct virtio_vsock_config));
> >> >@@ -209,12 +238,24 @@ void vhost_vsock_common_realize(VirtIODevice
> >> >*vdev, const char *name)
> >> >     vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >                                        vhost_vsock_common_handle_output);
> >> >
> >> >+    nvqs = vhost_vsock_get_max_qps();
> >>
> >> You can't do this here, since the vhost-vsock-common.c functions are
> >> used also by vhost-user-vsock, that doesn't use the /dev/vhost-vsock
> >> device since the device is emulated in a separate user process.
> >>
> >> I think you can use something similar to what you did in v2, where you
> >> passed a parameter to vhost_vsock_common_realize() to enable or not the
> >> datagram queues.
> >>
> >Just to make sure, the qemu parameter will only be used for vhost-user-vsock,
> >right? I think for the vhost-vsock kernel module, we will use ioctl and ignore
> >the qemu parameter?
>
> No, I mean a function parameter in vhost_vsock_common_realize() that we
> set to true when datagram is supported by the backend.
>
> You can move the vhost_vsock_get_max_qps() call in
> vhost_vsock_device_realize(), just before call
> vhost_vsock_common_realize() where we can pass a parameter to specify if
> datagram is supported or not.
>
> For now in vhost-user-vsock you can always pass `false`. When we will
> support it, we can add something similar to discover the features.
>
> Just to be clear, we don't need any QEMU command line parameter.
>
Got it. That sounds good.

> >
> >> >+
> >> >+    if (nvqs < 0)
> >> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
> >> >+
> >> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
> >> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >+                                              vhost_vsock_common_handle_output);
> >> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >+                                               vhost_vsock_common_handle_output);
> >> >+    }
> >> >+
> >> >     /* The event queue belongs to QEMU */
> >> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >> >                                        vhost_vsock_common_handle_output);
> >>
> >> Did you do a test with a guest that doesn't support datagram with QEMU
> >> and hosts that do?
> >>
> >Yes, and it works.
> >
> >> I repost my thoughts that I had on v2:
> >>
> >>      What happen if the guest doesn't support dgram?
> >>
> >>      I think we should dynamically use the 3rd queue or the 5th queue for
> >>      the events at runtime after the guest acked the features.
> >>
> >>      Maybe better to switch to an array of VirtQueue.
> >>
> >I think in current V3, it  already dynamically use 3rd or 5th queue
> >depending
> >on the feature bit.
>
> I'm not sure. IIUC when vhost_vsock_common_realize() is called, we don't
> know the features acked by the guest, so how can it be dynamic?
>
> Here we should know only if the host kernel supports it.
>
> Maybe it works, because in QEMU we use the event queue only after a
> migration to send a reset event, so you can try to migrate a guest to
> check this path.
>
I see. I did not test migration, so likely I did not check that code path.
Will give it a try.

> I'll be off until July 16th, after that I'll check better, but I think
> there is something wrong here and we should use the 3rd or 5th queue for
> events only after the guest acked the features.
>
Got it.

> >
> >> >
> >> >-    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
> >> >-    vvc->vhost_dev.vqs = vvc->vhost_vqs;
> >> >+    vvc->vhost_dev.nvqs = nvqs;
> >> >+    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
> >> >
> >> >     vvc->post_load_timer = NULL;
> >> > }
> >> >@@ -227,6 +268,14 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
> >> >
> >> >     virtio_delete_queue(vvc->recv_vq);
> >> >     virtio_delete_queue(vvc->trans_vq);
> >> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM) {
> >> >+        virtio_delete_queue(vvc->dgram_recv_vq);
> >> >+        virtio_delete_queue(vvc->dgram_trans_vq);
> >> >+    }
> >> >+
> >> >+    if (vvc->vhost_dev.vqs)
> >>
> >> g_free() already handles NULL pointers, so you can remove this check.
> >>
> >Got it.
> >
> >> >+        g_free(vvc->vhost_dev.vqs);
> >> >+
> >> >     virtio_delete_queue(vvc->event_vq);
> >> >     virtio_cleanup(vdev);
> >> > }
> >> >diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> >> >index 1b1a5c70ed..33bbe16983 100644
> >> >--- a/hw/virtio/vhost-vsock.c
> >> >+++ b/hw/virtio/vhost-vsock.c
> >> >@@ -23,6 +23,7 @@
> >> >
> >> > const int feature_bits[] = {
> >> >     VIRTIO_VSOCK_F_SEQPACKET,
> >> >+    VIRTIO_VSOCK_F_DGRAM,
> >> >     VHOST_INVALID_FEATURE_BIT
> >> > };
> >> >
> >> >@@ -116,6 +117,8 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
> >> >     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >> >
> >> >     virtio_add_feature(&requested_features,
> >> >     VIRTIO_VSOCK_F_SEQPACKET);
> >> >+    if (vvc->vhost_dev.nvqs == MAX_VQS_WITH_DGRAM)
> >> >+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
> >> >     return vhost_get_features(&vvc->vhost_dev, feature_bits,
> >> >                                 requested_features);
> >> > }
> >> >diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
> >> >index e412b5ee98..798715241f 100644
> >> >--- a/include/hw/virtio/vhost-vsock-common.h
> >> >+++ b/include/hw/virtio/vhost-vsock-common.h
> >> >@@ -27,12 +27,13 @@ enum {
> >> > struct VHostVSockCommon {
> >> >     VirtIODevice parent;
> >> >
> >> >-    struct vhost_virtqueue vhost_vqs[2];
> >> >     struct vhost_dev vhost_dev;
> >> >
> >> >     VirtQueue *event_vq;
> >> >     VirtQueue *recv_vq;
> >> >     VirtQueue *trans_vq;
> >> >+    VirtQueue *dgram_recv_vq;
> >> >+    VirtQueue *dgram_trans_vq;
> >> >
> >> >     QEMUTimer *post_load_timer;
> >> > };
> >> >diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
> >> >index 84f4e727c7..e10319785d 100644
> >> >--- a/include/hw/virtio/vhost-vsock.h
> >> >+++ b/include/hw/virtio/vhost-vsock.h
> >> >@@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostVSock, VHOST_VSOCK)
> >> > typedef struct {
> >> >     uint64_t guest_cid;
> >> >     char *vhostfd;
> >> >+    bool enable_dgram;
> >>
> >> Leftover?
> >>
> >Right, but to support vhost-vsock-user, I think I will add this
> >parameter back?
>
> I'm not sure it is needed.
>
> >
> >> > } VHostVSockConf;
> >> >
> >> > struct VHostVSock {
> >> >@@ -33,4 +34,7 @@ struct VHostVSock {
> >> >     /*< public >*/
> >> > };
> >> >
> >> >+#define MAX_VQS_WITHOUT_DGRAM 2
> >> >+#define MAX_VQS_WITH_DGRAM 4
> >> >+
> >> > #endif /* QEMU_VHOST_VSOCK_H */
> >> >diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
> >> >index 5eac522ee2..6ff8c5084c 100644
> >> >--- a/include/standard-headers/linux/virtio_vsock.h
> >> >+++ b/include/standard-headers/linux/virtio_vsock.h
> >> >@@ -41,6 +41,9 @@
> >> > /* The feature bitmap for virtio vsock */
> >> > #define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET
> >> > supported */
> >> >
> >> >+/* Feature bits */
> >> >+#define VIRTIO_VSOCK_F_DGRAM 0 /*Does vsock support dgram */
> >>
> >> Bit 0 is reserved for STREAM, IIRC also in the virtio-spec proposal you
> >> used bit 2 for DGRAM.
> >>
> >My bad, I did not update the code here yet.
> >
>
> No problems :-)
>
> Thanks,
> Stefano
>

