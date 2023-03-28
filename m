Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3C6CB855
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 09:39:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph3u3-00012y-OG; Tue, 28 Mar 2023 03:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ph3u2-00012p-D3
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ph3u0-0003SY-FJ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 03:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679989074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QADTtDsNly0T6HtBRH/IXeFNrz4mkndo/ksy4aYgHy8=;
 b=Mnm8HPmKv83pCAjqeV4IQLCGZZBNscX1T8IPjUlt40d+VJmkbw/xeowSSlp91MJZ0tOKXz
 p4kjvbo7mshz+9RmWRiOW8AxYNcCbngL8WCCuW/ym94vdyGJWzGKyt36DM+E0XQcX9ln0p
 z0y5xvLmSCk27LfAhEmTkVgipk5h8wA=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-041evR-5MFKK0IHgwPyyzQ-1; Tue, 28 Mar 2023 03:37:53 -0400
X-MC-Unique: 041evR-5MFKK0IHgwPyyzQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 c187-20020a25c0c4000000b00b6fd84f760dso11245138ybf.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 00:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679989073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QADTtDsNly0T6HtBRH/IXeFNrz4mkndo/ksy4aYgHy8=;
 b=0CxvSqPBq7qAN6U0rqSmRvobNv++hnsvdVVJWIQo9kgoay/ELD7PSWVP9CnM+SdbhF
 wpCwBnhi8kwSQjwTsKL1egd8CF4b6jtZr6PwW/8uvpF3QsVphUIIKoeKneQgzphwCaIA
 uAARB+IuJ+SJyeKCiOlJ1QyPXf5FQ+cXuYsuCQmRTINlN1zrIRZ4zPXONVcR6YeD6izc
 SPwpTy812EplU3hh3JhAzT7i/zFsaXK/JCJIktCowVc78uAdHDJvbLEP4/FkxIMBs4zh
 X7eGuZyfGzxMcYWgftOIM0vc8C4ClLsVkrdYobJigaiHfrcHM/Qz8zbu2dwoIZWla2Lw
 EvWw==
X-Gm-Message-State: AAQBX9csWZDhyxqxr1218UH1zRpuinIFpJnTqTjU6mpZZQv8/TfWjWbB
 VPPRcJXf3zwXeraBm7qLGYtHZ7G6aodW4o6h9W7kRZCkIIJuOtfPzeu0+nDsktqZ1NuhXL05TOf
 GNav/SxHohjcob+NGOHBLGSuZb/FaxHU=
X-Received: by 2002:a05:6902:4b2:b0:af7:38fc:f6da with SMTP id
 r18-20020a05690204b200b00af738fcf6damr9672976ybs.2.1679989072718; 
 Tue, 28 Mar 2023 00:37:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350ay/+WTZ/YPv6OQFujSjNITUrbt51TrSrbdaWsCTUUq0MBJ4dGfcG9KgVIsefwKk0H9D53E5gCdoFsf+TD2ru0=
X-Received: by 2002:a05:6902:4b2:b0:af7:38fc:f6da with SMTP id
 r18-20020a05690204b200b00af738fcf6damr9672968ybs.2.1679989072445; Tue, 28 Mar
 2023 00:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-3-eperezma@redhat.com>
 <CACGkMEuAcfrnC1_9ttFwecVV6fcs00GUfxBBGUKpXnZVmgmHeQ@mail.gmail.com>
In-Reply-To: <CACGkMEuAcfrnC1_9ttFwecVV6fcs00GUfxBBGUKpXnZVmgmHeQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 28 Mar 2023 09:37:16 +0200
Message-ID: <CAJaqyWduKd3Vccwo-sR==DZC8ncbv39jxPwfRQ35O7JHZ5Czcg@mail.gmail.com>
Subject: Re: [PATCH for 8.1 v2 2/6] vdpa: add vhost_vdpa_reset_status_fd
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Mar 28, 2023 at 8:53=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Fri, Mar 24, 2023 at 3:54=E2=80=AFAM Eugenio P=C3=A9rez <eperezma@redh=
at.com> wrote:
> >
>
> The title needs some tweak, I think the more appropriate one is
> "introduce vhost_vdpa_call_fd()"
>

We can do it otherwise, but the function exported in the
include/hw/virtio/vhost-vdpa.h file is vhost_vdpa_reset_status_fd. I'd
consider vhost_vdpa_call_fd an implementation detail, only in
hw/virtio/vhost-vdpa.c file.

> > This allows to reset a vhost-vdpa device from external subsystems like
> > vhost-net, since it does not have any struct vhost_dev by the time we
> > need to use it.
>
> This part needs some clarification, vhost-net should be initialized
> after vhost_dev, so it can access its parent vhost_dev structure?
>

Next patches probes CVQ vring groups at initialization net-vdpa
initialization time (net_init_vhost_vdpa). It already fetches things
like device features using raw ioctl() calls because vhost_dev is
still not available.

> >
> > It is used in subsequent patches to negotiate features
> > and probe for CVQ ASID isolation.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  1 +
> >  hw/virtio/vhost-vdpa.c         | 58 +++++++++++++++++++++++-----------
> >  2 files changed, 41 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index c278a2a8de..28de7da91e 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -54,6 +54,7 @@ typedef struct vhost_vdpa {
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >  } VhostVDPA;
> >
> > +void vhost_vdpa_reset_status_fd(int fd);
> >  int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *io=
va_range);
> >
> >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iov=
a,
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index bbabea18f3..7a2053b8d9 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -335,38 +335,45 @@ static const MemoryListener vhost_vdpa_memory_lis=
tener =3D {
> >      .region_del =3D vhost_vdpa_listener_region_del,
> >  };
> >
> > -static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int re=
quest,
> > -                             void *arg)
> > +static int vhost_vdpa_dev_fd(const struct vhost_dev *dev)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > -    int fd =3D v->device_fd;
> > -    int ret;
> >
> >      assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA=
);
> > +    return v->device_fd;
> > +}
> > +
> > +static int vhost_vdpa_call_fd(int fd, unsigned long int request, void =
*arg)
> > +{
> > +    int ret =3D ioctl(fd, request, arg);
> >
> > -    ret =3D ioctl(fd, request, arg);
> >      return ret < 0 ? -errno : ret;
> >  }
> >
> > -static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status=
)
> > +static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int re=
quest,
> > +                           void *arg)
> > +{
> > +    return vhost_vdpa_call_fd(vhost_vdpa_dev_fd(dev), request, arg);
> > +}
> > +
> > +static int vhost_vdpa_add_status_fd(int fd, uint8_t status)
> >  {
> >      uint8_t s;
> >      int ret;
> >
> > -    trace_vhost_vdpa_add_status(dev, status);
> > -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
>
> We can stick a vhost_vdpa_call() function that calls
> vhost_vdpa_call_fd() then we can avoid a lot of changes?
>

I don't follow this. vhost_vdpa_call already calls vhost_vdpa_call_fd.

Thanks!

> Thanks
>
> > +    ret =3D vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
> >      if (ret < 0) {
> >          return ret;
> >      }
> >
> >      s |=3D status;
> >
> > -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> > +    ret =3D vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &s);
> >      if (ret < 0) {
> >          return ret;
> >      }
> >
> > -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
> > +    ret =3D vhost_vdpa_call_fd(fd, VHOST_VDPA_GET_STATUS, &s);
> >      if (ret < 0) {
> >          return ret;
> >      }
> > @@ -378,6 +385,12 @@ static int vhost_vdpa_add_status(struct vhost_dev =
*dev, uint8_t status)
> >      return 0;
> >  }
> >
> > +static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status=
)
> > +{
> > +    trace_vhost_vdpa_add_status(dev, status);
> > +    return vhost_vdpa_add_status_fd(vhost_vdpa_dev_fd(dev), status);
> > +}
> > +
> >  int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *io=
va_range)
> >  {
> >      int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > @@ -709,16 +722,20 @@ static int vhost_vdpa_get_device_id(struct vhost_=
dev *dev,
> >      return ret;
> >  }
> >
> > +static int vhost_vdpa_reset_device_fd(int fd)
> > +{
> > +    uint8_t status =3D 0;
> > +
> > +    return vhost_vdpa_call_fd(fd, VHOST_VDPA_SET_STATUS, &status);
> > +}
> > +
> >  static int vhost_vdpa_reset_device(struct vhost_dev *dev)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > -    int ret;
> > -    uint8_t status =3D 0;
> >
> > -    ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> > -    trace_vhost_vdpa_reset_device(dev);
> >      v->suspended =3D false;
> > -    return ret;
> > +    trace_vhost_vdpa_reset_device(dev);
> > +    return vhost_vdpa_reset_device_fd(vhost_vdpa_dev_fd(dev));
> >  }
> >
> >  static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
> > @@ -1170,6 +1187,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev=
 *dev, bool started)
> >      return 0;
> >  }
> >
> > +void vhost_vdpa_reset_status_fd(int fd)
> > +{
> > +    vhost_vdpa_reset_device_fd(fd);
> > +    vhost_vdpa_add_status_fd(fd, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > +                                 VIRTIO_CONFIG_S_DRIVER);
> > +}
> > +
> >  static void vhost_vdpa_reset_status(struct vhost_dev *dev)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > @@ -1178,9 +1202,7 @@ static void vhost_vdpa_reset_status(struct vhost_=
dev *dev)
> >          return;
> >      }
> >
> > -    vhost_vdpa_reset_device(dev);
> > -    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > -                               VIRTIO_CONFIG_S_DRIVER);
> > +    vhost_vdpa_reset_status_fd(vhost_vdpa_dev_fd(dev));
> >      memory_listener_unregister(&v->listener);
> >  }
> >
> > --
> > 2.31.1
> >
>


