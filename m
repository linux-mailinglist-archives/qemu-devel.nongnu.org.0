Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E8579E3E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:59:27 +0200 (CEST)
Received: from localhost ([::1]:45224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmow-0003YZ-BH
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDmlw-0007ua-9P
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oDmln-00010F-G4
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658235366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYHsxOgQC64spexgBOTb3l7k23VLyk4h2CpVrqe/R9k=;
 b=NuInEeLh+uih7dNN2U03T5YHJdvOEKaLa0VNM/tk6B2YVJFX7F143/ZUwsWZ3L2Pm5tIZz
 hoava4gycTTse5Q6USOUJ5zjQXrLyhq1blJPnHYzwI5N6CFKIcQ8T9qXj5qdQCtQC7wZV4
 L7TB+6mGLOdrScF25hEXyxjQ13iAhoQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-s9fz5uB4Ph6kbH4FQn7BYA-1; Tue, 19 Jul 2022 08:56:05 -0400
X-MC-Unique: s9fz5uB4Ph6kbH4FQn7BYA-1
Received: by mail-ej1-f70.google.com with SMTP id
 gb37-20020a170907962500b0072b820af09dso3066804ejc.20
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yYHsxOgQC64spexgBOTb3l7k23VLyk4h2CpVrqe/R9k=;
 b=UwBc6lZWRvqldK1d+bGRWS8RX7mgUE+meijCrltK0g577w4B2zGR0WwPWRq6FECO7P
 dwGqCgqJPT7tC9MO4hzrkBZOTvoezbY91roPazasRuXXw/+4kfb51gi2LQSYV0bE9CIY
 bmxCYgAHZr2jVxBju4yPpl+kkUH2K5pYtl941j5n9OIawyvltmgkp8hPxJHbirjKV05b
 ZsSmimOhRTO94dC3Ll4pKPzF344r8B7VTRFGZUr4M/T9G+wFtpfEqh2h4t39NzAqYEMw
 3+fw7vixYZT8E4yI9JAjrEudSiCnojuxRD+f3FFgjJ7qSUCaJmVEGbtf7oPmrYi4N4AM
 7UQQ==
X-Gm-Message-State: AJIora9HCKaRDj1S5+t/7AwpFMY65AY4+JNqSuC/9L4cX30crTe2/T9c
 fUZP64i46kbNeC646ddhiZPl95FmpSGDzRDoKQiojmO2CRKaDZinrLGEV4Klhe8LMiCc8wFhi6m
 lj6zcCIvBDRU4i556ChCx5S2FQByUx2I=
X-Received: by 2002:a17:906:9b0a:b0:72b:4fc2:4b07 with SMTP id
 eo10-20020a1709069b0a00b0072b4fc24b07mr31211205ejc.700.1658235363552; 
 Tue, 19 Jul 2022 05:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSG2Gq9m2GD82FKSRo4yfvZ8Nrn48UGFaSY1d/FBgslHL5IWsbKurfAqLgiFsGSx9L3i+GURq7X/rsvmDQiQg=
X-Received: by 2002:a17:906:9b0a:b0:72b:4fc2:4b07 with SMTP id
 eo10-20020a1709069b0a00b0072b4fc24b07mr31211172ejc.700.1658235363233; Tue, 19
 Jul 2022 05:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220711155243.866530-2-lulu@redhat.com>
 <48006fbf-b848-829c-fe0b-e2bc51f9563c@redhat.com>
 <CACLfguVnvEL3tjmK4-5b+HQjuh_1pv+HQxF9GZJpcS2N1xMcrA@mail.gmail.com>
In-Reply-To: <CACLfguVnvEL3tjmK4-5b+HQjuh_1pv+HQxF9GZJpcS2N1xMcrA@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 19 Jul 2022 20:55:26 +0800
Message-ID: <CACLfguXhi7wO7_JfKq-Bb-YTP-+nosBa4CDV=W_=70vjpcApsA@mail.gmail.com>
Subject: Re: [PATCH v11 01/10] virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
To: Jason Wang <jasowang@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jul 19, 2022 at 8:53 PM Cindy Lu <lulu@redhat.com> wrote:
>
> On Tue, Jul 19, 2022 at 4:58 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/7/11 23:52, Cindy Lu =E5=86=99=E9=81=93:
> > > To support configure interrupt for vhost-vdpa
> > > Introduce VIRTIO_CONFIG_IRQ_IDX -1 as configure interrupt's queue ind=
ex,
> > > Then we can reuse the functions guest_notifier_mask and guest_notifie=
r_pending.
> > > Add the check of queue index in these drivers, if the driver does not=
 support
> > > configure interrupt, the function will just return
> > >
> > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> >
> >
> > A typo in the subject should be "VIRTIO_CONFIG_IRQ_IDX".
> >
sure, will fix this
> >
> > > ---
> > >   hw/display/vhost-user-gpu.c    |  6 ++++++
> > >   hw/net/virtio-net.c            | 10 ++++++++--
> > >   hw/virtio/vhost-user-fs.c      |  6 ++++++
> > >   hw/virtio/vhost-vsock-common.c |  6 ++++++
> > >   hw/virtio/virtio-crypto.c      |  6 ++++++
> > >   include/hw/virtio/virtio.h     |  3 +++
> > >   6 files changed, 35 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.=
c
> > > index 09818231bd..d4a440e815 100644
> > > --- a/hw/display/vhost-user-gpu.c
> > > +++ b/hw/display/vhost-user-gpu.c
> > > @@ -485,6 +485,9 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevic=
e *vdev, int idx)
> > >   {
> > >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return false;
> > > +    }
> >
> >
> > I think we should either
> >
> > 1) explain why this check is needed
> >
> > or
> >
> > 2) defer this change to the patch that can actually hit this check
> >
 I will add the explanation for this , there may be cause some
 unexpected behavior if we defer this check while the device itself
does not support config interrupt
 Thanks
 Cindy
> > Thanks
> >
> >
> > >       return vhost_virtqueue_pending(&g->vhost->dev, idx);
> > >   }
> > >
> > > @@ -493,6 +496,9 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *=
vdev, int idx, bool mask)
> > >   {
> > >       VhostUserGPU *g =3D VHOST_USER_GPU(vdev);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return;
> > > +    }
> > >       vhost_virtqueue_mask(&g->vhost->dev, vdev, idx, mask);
> > >   }
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 1067e72b39..72ea4819f7 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -3172,6 +3172,9 @@ static bool virtio_net_guest_notifier_pending(V=
irtIODevice *vdev, int idx)
> > >       VirtIONet *n =3D VIRTIO_NET(vdev);
> > >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> > >       assert(n->vhost_started);
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return false;
> > > +    }
> > >       return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx=
);
> > >   }
> > >
> > > @@ -3181,8 +3184,11 @@ static void virtio_net_guest_notifier_mask(Vir=
tIODevice *vdev, int idx,
> > >       VirtIONet *n =3D VIRTIO_NET(vdev);
> > >       NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> > >       assert(n->vhost_started);
> > > -    vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> > > -                             vdev, idx, mask);
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return;
> > > +    }
> > > +
> > > +    vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mas=
k);
> > >   }
> > >
> > >   static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_=
features)
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index c595957983..9b0349922e 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -161,6 +161,9 @@ static void vuf_guest_notifier_mask(VirtIODevice =
*vdev, int idx,
> > >   {
> > >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return;
> > > +    }
> > >       vhost_virtqueue_mask(&fs->vhost_dev, vdev, idx, mask);
> > >   }
> > >
> > > @@ -168,6 +171,9 @@ static bool vuf_guest_notifier_pending(VirtIODevi=
ce *vdev, int idx)
> > >   {
> > >       VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return false;
> > > +    }
> > >       return vhost_virtqueue_pending(&fs->vhost_dev, idx);
> > >   }
> > >
> > > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-c=
ommon.c
> > > index ed706681ac..b1f0d46209 100644
> > > --- a/hw/virtio/vhost-vsock-common.c
> > > +++ b/hw/virtio/vhost-vsock-common.c
> > > @@ -125,6 +125,9 @@ static void vhost_vsock_common_guest_notifier_mas=
k(VirtIODevice *vdev, int idx,
> > >   {
> > >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return;
> > > +    }
> > >       vhost_virtqueue_mask(&vvc->vhost_dev, vdev, idx, mask);
> > >   }
> > >
> > > @@ -133,6 +136,9 @@ static bool vhost_vsock_common_guest_notifier_pen=
ding(VirtIODevice *vdev,
> > >   {
> > >       VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return false;
> > > +    }
> > >       return vhost_virtqueue_pending(&vvc->vhost_dev, idx);
> > >   }
> > >
> > > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > > index dcd80b904d..7085643d5f 100644
> > > --- a/hw/virtio/virtio-crypto.c
> > > +++ b/hw/virtio/virtio-crypto.c
> > > @@ -948,6 +948,9 @@ static void virtio_crypto_guest_notifier_mask(Vir=
tIODevice *vdev, int idx,
> > >
> > >       assert(vcrypto->vhost_started);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return;
> > > +    }
> > >       cryptodev_vhost_virtqueue_mask(vdev, queue, idx, mask);
> > >   }
> > >
> > > @@ -958,6 +961,9 @@ static bool virtio_crypto_guest_notifier_pending(=
VirtIODevice *vdev, int idx)
> > >
> > >       assert(vcrypto->vhost_started);
> > >
> > > +    if (idx =3D=3D VIRTIO_CONFIG_IRQ_IDX) {
> > > +        return false;
> > > +    }
> > >       return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
> > >   }
> > >
> > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > index b31c4507f5..4512205503 100644
> > > --- a/include/hw/virtio/virtio.h
> > > +++ b/include/hw/virtio/virtio.h
> > > @@ -67,6 +67,9 @@ typedef struct VirtQueueElement
> > >
> > >   #define VIRTIO_NO_VECTOR 0xffff
> > >
> > > +/* special index value used internally for config irqs */
> > > +#define VIRTIO_CONFIG_IRQ_IDX -1
> > > +
> > >   #define TYPE_VIRTIO_DEVICE "virtio-device"
> > >   OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
> > >
> >


