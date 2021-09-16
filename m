Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176740D234
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:01:58 +0200 (CEST)
Received: from localhost ([::1]:37948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQiax-0005SH-NV
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mQiYj-0004gV-LC
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 23:59:39 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mQiYd-0008Ck-1N
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 23:59:35 -0400
Received: by mail-lf1-x12a.google.com with SMTP id t10so7306388lfd.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 20:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/8b25RRrUnWPkOq0Q54WjMwm0zMfoYTzK98CbslToQ=;
 b=i42yBblte4upMSUfrV/OtwntDppjmmKqrRG2RAz5tURnwLEUlvtkJ+Gpc4QrCv5b1M
 5D8ebx85+/QD/+lMgqBMXMacKtUrPh+weB3ZMDS1j+AM8fgU2wMrTYtk6QiTia33SDyO
 Ybam2dEpdenbGlueiaXbBHdsY6nz/C6UvwEmL6xXHON5KMDtLkOJ6OFjNWkZrcjSkfpi
 jVEF0TKDE+wiEtC7QQFT39nUPsc/W2skMeSXNdKjpIf5im3BkHxjr32VENtkRLoCLqZk
 Mgmw2hv2BA1ZwB/nXT7iw81M+E/SRnvWZpBu+d1hTygXUJ9lIbKkuBN697t2wIjMB2Ix
 EQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/8b25RRrUnWPkOq0Q54WjMwm0zMfoYTzK98CbslToQ=;
 b=y6872UkJXfQCDhp+nfN9wd0Uv9iK5sorOl2bmeB3TbvNTFVH4NVvOacSojhWmlfBn1
 PFMcd2qrenbc1S0y2XxTsPgGH+HM9NqMdgxUvns+t18pZEhso+MEWxvMQr/2/2pJOYGM
 GSijVpTqMB8RJSg1mOpQIylV8RvW87E9AkRYiD0W6Yub68Ssx09f/Z8DrXlc5xX+qHTu
 JnO0HoTd7gO6nc5h5DvcxUtYP2QThYXoasOYMZrCU5vqaaWp6NTHR+DVDR2nqzhWnJ3s
 dBu/gpeQ1QmRvOChowyumTF08hHXsuC6S2u3akWsh+2Gt9LP41t33wiFdTqp+zDKVmWA
 D6tQ==
X-Gm-Message-State: AOAM530iRC+WqWV7TRfc9QO/FcY8rx3pn9Xdlt9+bwRbx/i8/k50giXF
 emfskRJPN/YbuHed6Oc3aIwNQuol3bD9sAiL2xoAyg==
X-Google-Smtp-Source: ABdhPJzaT1M56wU4IXYgzW6ztYqbwaK2avz1JS4gkpaydH4rjMJwHX53hriX1IzxUOJNqVqQA2fHhvwCQgWwlBUoVyQ=
X-Received: by 2002:a2e:98d1:: with SMTP id s17mr2972971ljj.138.1631764767887; 
 Wed, 15 Sep 2021 20:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210913221843.2304308-1-jiang.wang@bytedance.com>
 <YUCZntCNrLQTu9Xu@stefanha-x1.localdomain>
In-Reply-To: <YUCZntCNrLQTu9Xu@stefanha-x1.localdomain>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Wed, 15 Sep 2021 20:59:17 -0700
Message-ID: <CAP_N_Z8vJF7F=mhpRpcFwQarFH_uLWBmahi0jb1q6yj=j7YSXg@mail.gmail.com>
Subject: Re: Re: [RFC v6] virtio/vsock: add two more queues for datagram types
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=jiang.wang@bytedance.com; helo=mail-lf1-x12a.google.com
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
 Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 5:46 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Sep 13, 2021 at 10:18:43PM +0000, Jiang Wang wrote:
> > Datagram sockets are connectionless and unreliable.
> > The sender does not know the capacity of the receiver
> > and may send more packets than the receiver can handle.
> >
> > Add two more dedicate virtqueues for datagram sockets,
> > so that it will not unfairly steal resources from
> > stream and future connection-oriented sockets.
> >
> > Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> > ---
> > v1 -> v2: use qemu cmd option to control number of queues,
> >         removed configuration settings for dgram.
> > v2 -> v3: use ioctl to get features and decide number of
> >         virt queues, instead of qemu cmd option.
> > v3 -> v4: change DGRAM feature bit value to 2. Add an argument
> >         in vhost_vsock_common_realize to indicate dgram is supported or not.
> > v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
> >         enable_dgram
> > v5 -> v6: fix style errors. Imporve error handling of
> >         vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and another one.
> >
> >  hw/virtio/vhost-user-vsock.c                  |  2 +-
> >  hw/virtio/vhost-vsock-common.c                | 25 ++++++++++++--
> >  hw/virtio/vhost-vsock.c                       | 34 ++++++++++++++++++-
> >  include/hw/virtio/vhost-vsock-common.h        |  6 ++--
> >  include/hw/virtio/vhost-vsock.h               |  3 ++
> >  include/standard-headers/linux/virtio_vsock.h |  1 +
> >  6 files changed, 64 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> > index 6095ed7349..e9ec0e1c00 100644
> > --- a/hw/virtio/vhost-user-vsock.c
> > +++ b/hw/virtio/vhost-user-vsock.c
> > @@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
> >          return;
> >      }
> >
> > -    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> > +    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
>
> VIRTIO_VSOCK_F_DGRAM support should work equally well for
> vhost-user-vsock. I don't think there is a need to disable it here.
>
Stefano mentioned in previous email ( V3 ) that I can disable dgram
for vhost-user-vsock for now. I think we need some extra changes to
fully support vhost-vsock-user, like feature discovery?

> >
> >      vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> >
> > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> > index 4ad6e234ad..d94636e04e 100644
> > --- a/hw/virtio/vhost-vsock-common.c
> > +++ b/hw/virtio/vhost-vsock-common.c
> > @@ -17,6 +17,8 @@
> >  #include "hw/virtio/vhost-vsock.h"
> >  #include "qemu/iov.h"
> >  #include "monitor/monitor.h"
> > +#include <sys/ioctl.h>
> > +#include <linux/vhost.h>
> >
> >  int vhost_vsock_common_start(VirtIODevice *vdev)
> >  {
> > @@ -196,9 +198,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
> >      return 0;
> >  }
> >
> > -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> > +void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
> > +                               bool enable_dgram)
> >  {
> >      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> > +    int nvqs = VHOST_VSOCK_NVQS;
> >
> >      virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> >                  sizeof(struct virtio_vsock_config));
> > @@ -209,12 +213,20 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> >      vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >                                         vhost_vsock_common_handle_output);
> >
> > +    if (enable_dgram) {
> > +        nvqs = VHOST_VSOCK_NVQS_DGRAM;
> > +        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > +                                              vhost_vsock_common_handle_output);
> > +        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > +                                              vhost_vsock_common_handle_output);
> > +    }
>
> I think the virtqueues can be added unconditionally.
>
OK.
> > +
> >      /* The event queue belongs to QEMU */
> >      vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> >                                         vhost_vsock_common_handle_output);
> >
> > -    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
> > -    vvc->vhost_dev.vqs = vvc->vhost_vqs;
> > +    vvc->vhost_dev.nvqs = nvqs;
> > +    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
>
> IIUC the number of virtqueues needs to be the maximum supported number.
> It's okay to have more virtqueues than needed. The feature bit is used
> by the driver to detect the device's support for dgrams, not the number
> of virtqueues.
>
OK. I can just make these changes. But I am not able to test vhost-user-vsock
as of now. I tried to follow the steps on here:
https://patchew.org/QEMU/20200515152110.202917-1-sgarzare@redhat.com/
But the git repo for the vhost-user-vsock is kind of broken. I tried to
fix it but I am new to rust so it will take some time. Is there any updated
or an easier way to test vhost-user-vsock?


> >
> >      vvc->post_load_timer = NULL;
> >  }
> > @@ -227,6 +239,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
> >
> >      virtio_delete_queue(vvc->recv_vq);
> >      virtio_delete_queue(vvc->trans_vq);
> > +    if (vvc->vhost_dev.nvqs == VHOST_VSOCK_NVQS_DGRAM) {
> > +        virtio_delete_queue(vvc->dgram_recv_vq);
> > +        virtio_delete_queue(vvc->dgram_trans_vq);
> > +    }
> > +
> > +    g_free(vvc->vhost_dev.vqs);
> > +
> >      virtio_delete_queue(vvc->event_vq);
> >      virtio_cleanup(vdev);
> >  }
> > diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> > index 1b1a5c70ed..891d38e226 100644
> > --- a/hw/virtio/vhost-vsock.c
> > +++ b/hw/virtio/vhost-vsock.c
> > @@ -20,9 +20,12 @@
> >  #include "hw/qdev-properties.h"
> >  #include "hw/virtio/vhost-vsock.h"
> >  #include "monitor/monitor.h"
> > +#include <sys/ioctl.h>
> > +#include <linux/vhost.h>
> >
> >  const int feature_bits[] = {
> >      VIRTIO_VSOCK_F_SEQPACKET,
> > +    VIRTIO_VSOCK_F_DGRAM,
>
> Stefano is currently working on a way to control live migration
> compatibility when features like seqpacket or dgram aren't available. He
> can suggest how to do this for dgram.
>
Yes. I watched that email thread. I can make similar changes to
DGRAM. I will do it for the next version.

> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >
> > @@ -116,6 +119,9 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
> >      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
> >
> >      virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
> > +    if (vvc->vhost_dev.nvqs == VHOST_VSOCK_NVQS_DGRAM) {
> > +        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
> > +    }
> >      return vhost_get_features(&vvc->vhost_dev, feature_bits,
> >                                  requested_features);
> >  }
> > @@ -132,13 +138,34 @@ static const VMStateDescription vmstate_virtio_vhost_vsock = {
> >      .post_load = vhost_vsock_common_post_load,
> >  };
> >
> > +static bool vhost_vsock_dgram_supported(int vhostfd, Error **errp)
> > +{
> > +    uint64_t features;
> > +    int ret;
> > +
> > +    ret = ioctl(vhostfd, VHOST_GET_FEATURES, &features);
> > +    if (ret) {
> > +        error_setg(errp, "vhost-vsock: failed to read device freatures. %s",
> > +                     strerror(errno));
> > +        return false;
> > +    }
>
> ioctl(2) shouldn't be necessary. Let vhost detect features from the
> device backend (vhost kernel or vhost-user) and don't worry about
I did not get this part. What are the difference between vhost and
device backend? I thought vhost is the device backend? vhost kernel
is one kind of backend and vhost-user is another kind.  Could you explain
more? Thanks.

> conditionally adding the exact number of virtqueues.
>
> > +
> > +    if (features & (1 << VIRTIO_VSOCK_F_DGRAM)) {
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> >  static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
> >  {
> > +    ERRP_GUARD();
> >      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(dev);
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VHostVSock *vsock = VHOST_VSOCK(dev);
> >      int vhostfd;
> >      int ret;
> > +    bool enable_dgram;
> >
> >      /* Refuse to use reserved CID numbers */
> >      if (vsock->conf.guest_cid <= 2) {
> > @@ -175,7 +202,11 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
> >          qemu_set_nonblock(vhostfd);
> >      }
> >
> > -    vhost_vsock_common_realize(vdev, "vhost-vsock");
> > +    enable_dgram = vhost_vsock_dgram_supported(vhostfd, errp);
> > +    if (*errp) {
> > +        goto err_dgram;
> > +    }
> > +    vhost_vsock_common_realize(vdev, "vhost-vsock", enable_dgram);
> >
> >      ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
> >                           VHOST_BACKEND_TYPE_KERNEL, 0, errp);
> > @@ -197,6 +228,7 @@ err_vhost_dev:
> >      vhostfd = -1;
> >  err_virtio:
> >      vhost_vsock_common_unrealize(vdev);
> > +err_dgram:
> >      if (vhostfd >= 0) {
> >          close(vhostfd);
> >      }
> > diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
> > index e412b5ee98..80151aee35 100644
> > --- a/include/hw/virtio/vhost-vsock-common.h
> > +++ b/include/hw/virtio/vhost-vsock-common.h
> > @@ -27,12 +27,13 @@ enum {
> >  struct VHostVSockCommon {
> >      VirtIODevice parent;
> >
> > -    struct vhost_virtqueue vhost_vqs[2];
> >      struct vhost_dev vhost_dev;
> >
> >      VirtQueue *event_vq;
> >      VirtQueue *recv_vq;
> >      VirtQueue *trans_vq;
> > +    VirtQueue *dgram_recv_vq;
> > +    VirtQueue *dgram_trans_vq;
> >
> >      QEMUTimer *post_load_timer;
> >  };
> > @@ -41,7 +42,8 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
> >  void vhost_vsock_common_stop(VirtIODevice *vdev);
> >  int vhost_vsock_common_pre_save(void *opaque);
> >  int vhost_vsock_common_post_load(void *opaque, int version_id);
> > -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
> > +void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
> > +                                bool enable_dgram);
> >  void vhost_vsock_common_unrealize(VirtIODevice *vdev);
> >
> >  #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
> > diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
> > index 84f4e727c7..87b2019b5a 100644
> > --- a/include/hw/virtio/vhost-vsock.h
> > +++ b/include/hw/virtio/vhost-vsock.h
> > @@ -33,4 +33,7 @@ struct VHostVSock {
> >      /*< public >*/
> >  };
> >
> > +#define VHOST_VSOCK_NVQS 2
> > +#define VHOST_VSOCK_NVQS_DGRAM 4
> > +
> >  #endif /* QEMU_VHOST_VSOCK_H */
> > diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
> > index 3a23488e42..7e35acf3d4 100644
> > --- a/include/standard-headers/linux/virtio_vsock.h
> > +++ b/include/standard-headers/linux/virtio_vsock.h
> > @@ -40,6 +40,7 @@
> >
> >  /* The feature bitmap for virtio vsock */
> >  #define VIRTIO_VSOCK_F_SEQPACKET     1       /* SOCK_SEQPACKET supported */
> > +#define VIRTIO_VSOCK_F_DGRAM         2       /* SOCK_DGRAM supported */
> >
> >  struct virtio_vsock_config {
> >       uint64_t guest_cid;
> > --
> > 2.20.1
> >

