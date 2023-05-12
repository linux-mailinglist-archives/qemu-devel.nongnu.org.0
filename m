Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF7700A0F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:15:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTXH-0003M8-FS; Fri, 12 May 2023 10:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTWw-0003Ko-58
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:13:58 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTWs-0006EK-Fg
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:13:56 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ac785015d7so109976821fa.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683900832; x=1686492832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=88gcIUulyM6CpOugeQ+05VRvGLwWeckcFbT9A/IY1l0=;
 b=zqGJggcYsUK1tLaJ9jV1UCOtpkEonwD36D64dK2S/yWAC8F6U+qUlS2FfIG+vzjUnU
 SDyCrE/i1VscA4auAG5Hum471gjtwtd5XXcI5wp35hxHcCeEb3fbxHdtW2XIRwwpx1si
 ZpcpA0e9HN7bhL4KN+aEkf8tQZFSxSWXLY1LEdDou/6bIjnwF1J0d+bYCPHUA2Y9uliW
 8R7aAdwVSU+SgHjCQBNzXEzebUTY5Co0wxhmaCskffzm54mH/MrfvlvrD4/yrNLgyuOL
 DplgNrCBPfIo9Ny9eGzOl+Ul0ydoYnhLEEO87ubSbEjK4pkRP6y/Dom4tkz2T1sOPjqd
 9+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683900832; x=1686492832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=88gcIUulyM6CpOugeQ+05VRvGLwWeckcFbT9A/IY1l0=;
 b=KkosaQQh/C73FU6xecBKCn1Wpzp9oiHAM2KlmXM3FYb2XAFyyWkkWIk3KjCf6rJzMi
 F6NL/PwV/Q+l8lhvyM3ruwAzlz5KJFiQBEXtz0qar+bu05Cccf9emHj5hk6JrGQLW5Fl
 jC8fSBgI77cT5zBfb9Yxvzqol7sQuOBZGgY+UljF+qEaunzWYik2ZC4ka2I3rkHYR/Ck
 EYtZgfXYYzr5pVfmYdGUn98EmV22u+yL/BACtBiCW+oszsHq7qW7OLmgI630mKkzo6+F
 AyQ3z0ltpO300joQCdAAuN2KT4UCgXJ7pFlaERZRXY+CkB9nqtNWaMWobX9EpKnj4WmN
 hf+w==
X-Gm-Message-State: AC+VfDw3KKDrS3x7VEPujPnlKpfEs+qOPxJdAjQRgQI4aGKNFduOlwv5
 Dp6y+/NTKUrjagD7Ev7MOI94puaBNTCMK1FxFJgtgw==
X-Google-Smtp-Source: ACHHUZ4lA/CAPcg9ARSbB+rTEAHwxlSRqBXR5tgQLGrLWryKbYhYzcvBjh64Lun2eWc6rRTT9Ee+th/8kId1lnNMW6g=
X-Received: by 2002:a2e:6e17:0:b0:2ac:826e:c5a with SMTP id
 j23-20020a2e6e17000000b002ac826e0c5amr4576835ljc.1.1683900831643; Fri, 12 May
 2023 07:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230501020221.188376-1-viktor@daynix.com>
 <20230501020221.188376-4-viktor@daynix.com>
 <CACGkMEvDZQX2=AzL5Y8q6EzqriKXwQhM=2wb=ysot4xEydw59w@mail.gmail.com>
 <CACGkMEv2oxqG55ZBWaLB38bSuV9To0zNfTUjhjqeoMeLYPN_jg@mail.gmail.com>
In-Reply-To: <CACGkMEv2oxqG55ZBWaLB38bSuV9To0zNfTUjhjqeoMeLYPN_jg@mail.gmail.com>
From: Viktor Prutyanov <viktor@daynix.com>
Date: Fri, 12 May 2023 17:13:41 +0300
Message-ID: <CAPv0NP6-VE93QdJJL7T1v9oCAKcGCNFL-63W-3Sb7vWW2H393g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] vhost: register and change IOMMU flag
 depending on Device-TLB state
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yan@daynix.com, 
 yuri.benditovich@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::22e;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 8, 2023 at 8:28=E2=80=AFAM Jason Wang <jasowang@redhat.com> wro=
te:
>
> On Mon, May 8, 2023 at 1:25=E2=80=AFPM Jason Wang <jasowang@redhat.com> w=
rote:
> >
> > On Mon, May 1, 2023 at 10:02=E2=80=AFAM Viktor Prutyanov <viktor@daynix=
.com> wrote:
> > >
> > > The guest can disable or never enable Device-TLB. In these cases,
> > > it can't be used even if enabled in QEMU. So, check Device-TLB state
> > > before registering IOMMU notifier and select unmap flag depending on
> > > that. Also, implement a way to change IOMMU notifier flag if Device-T=
LB
> > > state is changed.
> > >
> > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001312
> > > Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> > > ---
> > >  hw/virtio/vhost-backend.c         |  6 ++++++
> > >  hw/virtio/vhost.c                 | 26 ++++++++++++++++++++++++--
> > >  include/hw/virtio/vhost-backend.h |  4 ++++
> > >  include/hw/virtio/vhost.h         |  1 +
> > >  4 files changed, 35 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > > index 8e581575c9..30eb71fb83 100644
> > > --- a/hw/virtio/vhost-backend.c
> > > +++ b/hw/virtio/vhost-backend.c
> > > @@ -297,6 +297,11 @@ static void vhost_kernel_set_iotlb_callback(stru=
ct vhost_dev *dev,
> > >          qemu_set_fd_handler((uintptr_t)dev->opaque, NULL, NULL, NULL=
);
> > >  }
> > >
> > > +static void vhost_kernel_toggle_device_iotlb(struct vhost_dev *dev, =
int enable)
> > > +{
> > > +    vhost_toggle_device_iotlb(dev, enable);
> > > +}
> > > +
> > >  const VhostOps kernel_ops =3D {
> > >          .backend_type =3D VHOST_BACKEND_TYPE_KERNEL,
> > >          .vhost_backend_init =3D vhost_kernel_init,
> > > @@ -328,6 +333,7 @@ const VhostOps kernel_ops =3D {
> > >          .vhost_vsock_set_running =3D vhost_kernel_vsock_set_running,
> > >          .vhost_set_iotlb_callback =3D vhost_kernel_set_iotlb_callbac=
k,
> > >          .vhost_send_device_iotlb_msg =3D vhost_kernel_send_device_io=
tlb_msg,
> > > +        .vhost_toggle_device_iotlb =3D vhost_kernel_toggle_device_io=
tlb,
> > >  };
> > >  #endif
> > >
> > > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > > index a266396576..1bfcc6d263 100644
> > > --- a/hw/virtio/vhost.c
> > > +++ b/hw/virtio/vhost.c
> > > @@ -796,7 +796,9 @@ static void vhost_iommu_region_add(MemoryListener=
 *listener,
> > >      iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
> > >                                                     MEMTXATTRS_UNSPEC=
IFIED);
> > >      iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
> > > -                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
> > > +                        dev->vdev->device_iotlb_enabled ?
> > > +                            IOMMU_NOTIFIER_DEVIOTLB_UNMAP :
> > > +                            IOMMU_NOTIFIER_UNMAP,
> > >                          section->offset_within_region,
> > >                          int128_get64(end),
> > >                          iommu_idx);
> > > @@ -804,7 +806,8 @@ static void vhost_iommu_region_add(MemoryListener=
 *listener,
> > >      iommu->iommu_offset =3D section->offset_within_address_space -
> > >                            section->offset_within_region;
> > >      iommu->hdev =3D dev;
> > > -    ret =3D memory_region_register_iommu_notifier(section->mr, &iomm=
u->n, NULL);
> > > +    ret =3D memory_region_register_iommu_notifier(section->mr, &iomm=
u->n,
> > > +            dev->vdev->device_iotlb_enabled ? NULL : &error_fatal);
> > >      if (ret) {
> > >          /*
> > >           * Some vIOMMUs do not support dev-iotlb yet.  If so, try to=
 use the
> > > @@ -841,6 +844,25 @@ static void vhost_iommu_region_del(MemoryListene=
r *listener,
> > >      }
> > >  }
> > >
> > > +void vhost_toggle_device_iotlb(struct vhost_dev *dev, bool enable)
> > > +{
> > > +    struct vhost_iommu *iommu;
> > > +    int ret;
> > > +
> > > +    QLIST_FOREACH(iommu, &dev->iommu_list, iommu_next) {
> > > +        memory_region_unregister_iommu_notifier(iommu->mr, &iommu->n=
);
> > > +        iommu->n.notifier_flags =3D enable ?
> > > +                IOMMU_NOTIFIER_DEVIOTLB_UNMAP : IOMMU_NOTIFIER_UNMAP=
;
> > > +        ret =3D memory_region_register_iommu_notifier(iommu->mr, &io=
mmu->n,
> > > +                enable ? NULL : &error_fatal);
> > > +        if (ret) {
> > > +            iommu->n.notifier_flags =3D IOMMU_NOTIFIER_UNMAP;
> > > +            memory_region_register_iommu_notifier(iommu->mr, &iommu-=
>n,
> > > +                                                  &error_fatal);
> >
> > I think it's better to tweak the code to avoid doing IOMMU_NOTIFIER_UNM=
AP twice.
> >
> > The rest looks good.
>
> Btw, it might worth to add comment to explain why we need this fallback.
>
> Actually, I'm not sure I understand the logic.
>
> E.g if guest tries to enable ATS it means it knows there's a vIOMMU
> that support device IOTLB. If we use UNMAP notifier, we will lose the
> device device IOTLB event here?

Yes. So, the fallback is not really needed anymore. It can't help if
the guest is going to use Device-TLB (by enabling ATS) but it isn't
available in emulated IOMMU.

Thanks,
Viktor Prutyanov

>
> Thanks
>
> >
> > Thanks
> >
> > > +        }
> > > +    }
> > > +}
> > > +
> > >  static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
> > >                                      struct vhost_virtqueue *vq,
> > >                                      unsigned idx, bool enable_log)
> > > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vh=
ost-backend.h
> > > index ec3fbae58d..f8e9660a96 100644
> > > --- a/include/hw/virtio/vhost-backend.h
> > > +++ b/include/hw/virtio/vhost-backend.h
> > > @@ -133,6 +133,9 @@ typedef int (*vhost_set_config_call_op)(struct vh=
ost_dev *dev,
> > >
> > >  typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
> > >
> > > +typedef void (*vhost_toggle_device_iotlb_op)(struct vhost_dev *dev,
> > > +                                             int enabled);
> > > +
> > >  typedef struct VhostOps {
> > >      VhostBackendType backend_type;
> > >      vhost_backend_init vhost_backend_init;
> > > @@ -181,6 +184,7 @@ typedef struct VhostOps {
> > >      vhost_force_iommu_op vhost_force_iommu;
> > >      vhost_set_config_call_op vhost_set_config_call;
> > >      vhost_reset_status_op vhost_reset_status;
> > > +    vhost_toggle_device_iotlb_op vhost_toggle_device_iotlb;
> > >  } VhostOps;
> > >
> > >  int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
> > > diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> > > index a52f273347..b3f585c6cd 100644
> > > --- a/include/hw/virtio/vhost.h
> > > +++ b/include/hw/virtio/vhost.h
> > > @@ -320,6 +320,7 @@ bool vhost_has_free_slot(void);
> > >  int vhost_net_set_backend(struct vhost_dev *hdev,
> > >                            struct vhost_vring_file *file);
> > >
> > > +void vhost_toggle_device_iotlb(struct vhost_dev *dev, bool enable);
> > >  int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, in=
t write);
> > >
> > >  int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice=
 *vdev,
> > > --
> > > 2.35.1
> > >
>

