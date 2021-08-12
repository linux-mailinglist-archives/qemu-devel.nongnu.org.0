Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BFB3E9EC4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:47:28 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE4Ux-0002D7-Fx
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mE4T5-00010f-R9
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mE4T4-0004sV-6r
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628750729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/viA8EoAF4Jj8G00AYuI5PK0gN0W0bx9v3l9Z62fF8M=;
 b=K3ZkXK6Yay8P0aSiehQ+Ht40DdI5EiuziSBf/t4wh2ji31ZJo0H+o4SdZ772LCPlfq7pU9
 OQc1TFAgI0YCK6ugA9PnNAUkmo9NnRdX9MVcyh2NUJZRwJBCuPBFjSq0OxBGX8qNbKYc6z
 W7plj8O9V+ylNlWZLRCvBNMo3RKGDmE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-FKrEN83DO1ey0UgFqX4f_g-1; Thu, 12 Aug 2021 02:45:27 -0400
X-MC-Unique: FKrEN83DO1ey0UgFqX4f_g-1
Received: by mail-lj1-f198.google.com with SMTP id
 u3-20020a2e9b030000b02901b787d7d260so1642460lji.3
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 23:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/viA8EoAF4Jj8G00AYuI5PK0gN0W0bx9v3l9Z62fF8M=;
 b=LhVOri7WWZlsRVCRqNuVEstTTqKWAUQ34CbuyfXRap3SzGMlx10ImTHGipBjcp5E5a
 sMmirS8jCK59eo1Bz8nuYBcmy/xhPxLrs1QcjwhRK0rirRtnszl54M0SJGPQb/j35rYW
 /ieAeWLtHSFD3tNFOvPdxHAaeU9nME63OrXKdlLUZM0/ij6LTH5UCPLDjCHBdydY7gCK
 2VRZTaSajFgpIGmGX0p628yDNSR392oN/G5cUtq9Tia7UOt6JVs5IwjCDIhEQktqIaVW
 aFaozhiRPXKhjb0Vs6z0I054ItRFTt16TFPWlk6wZP1tw31BuyhtcV7iJKqj3bQc6wHn
 HRWw==
X-Gm-Message-State: AOAM533iODNVGbYM4gwCOGgkDPoRZW5ViO6Wgpr0EI9MjbvqRZwtOp5G
 tBFz7XbMVBA0fbdg/hXvUX2uPs1Om6ElZE/n8BiF3RSZ31znL0jkc8HqTiHvqa3xRGFhEqEsj1u
 EkIrH83ObpMVTjALT7xvHMmp6S0fR4N0=
X-Received: by 2002:a19:f719:: with SMTP id z25mr1446639lfe.339.1628750726171; 
 Wed, 11 Aug 2021 23:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz228XOXW20dkfgkgKkbJNhQ2X6+dDWJ75S2bkvylE9YR/0AyLC+3OIRPNFU9Jkl4aKoaP8AKSneiJnAWVPalw=
X-Received: by 2002:a19:f719:: with SMTP id z25mr1446622lfe.339.1628750725845; 
 Wed, 11 Aug 2021 23:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163211.185870-1-eperezma@redhat.com>
 <CACGkMEsP1QFh16qLDyXmPp4-NgLA-7HNZ7Far2sQqjr9rXoorw@mail.gmail.com>
 <CAJaqyWcZiosVZnpepsOWBPFTypmofQpaGHpaCPFmD5B5bvw2iA@mail.gmail.com>
In-Reply-To: <CAJaqyWcZiosVZnpepsOWBPFTypmofQpaGHpaCPFmD5B5bvw2iA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 Aug 2021 14:45:14 +0800
Message-ID: <CACGkMEsjTXRVWyU0DSfNXxArRkR-6uZQK4An_pjauSYfWFwEOw@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa: Do not send empty IOTLB update batches
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 2:43 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Aug 12, 2021 at 8:16 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Aug 12, 2021 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > >
> > > With the introduction of the batch hinting, meaningless batches can b=
e
> > > created with no IOTLB updates if the memory region was skipped by
> > > vhost_vdpa_listener_skipped_section. This is the case of host notifie=
rs
> > > memory regions, device un/realize, and others. This causes the vdpa
> > > device to receive dma mapping settings with no changes, a possibly
> > > expensive operation for nothing.
> > >
> > > To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have =
a
> > > meaningful (not skipped section) mapping or unmapping operation, and
> > > VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
> > > _INVALIDATE has been issued.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  include/hw/virtio/vhost-vdpa.h |  1 +
> > >  hw/virtio/vhost-vdpa.c         | 50 ++++++++++++++++++++++++++------=
--
> > >  2 files changed, 39 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> > > index e98e327f12..6538572a6f 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
> > >      int device_fd;
> > >      int index;
> > >      uint32_t msg_type;
> > > +    size_t n_mr_updated;
> > >      MemoryListener listener;
> > >      struct vhost_dev *dev;
> > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 6ce94a1f4d..512fa18d68 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa=
 *v, hwaddr iova,
> > >      return ret;
> > >  }
> > >
> > > -static void vhost_vdpa_listener_begin(MemoryListener *listener)
> > > +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
> > >  {
> > > -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdp=
a, listener);
> > > -    struct vhost_dev *dev =3D v->dev;
> > > -    struct vhost_msg_v2 msg =3D {};
> > >      int fd =3D v->device_fd;
> > > -
> > > -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)=
)) {
> > > -        return;
> > > -    }
> > > -
> > > -    msg.type =3D v->msg_type;
> > > -    msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> > > +    struct vhost_msg_v2 msg =3D {
> > > +        .type =3D v->msg_type,
> > > +        .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> > > +    };
> > >
> > >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> > >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > > @@ -109,6 +103,25 @@ static void vhost_vdpa_listener_begin(MemoryList=
ener *listener)
> > >      }
> > >  }
> > >
> > > +static bool vhost_vdpa_iotlb_batch_is_started(const struct vhost_vdp=
a *v)
> > > +{
> > > +    return v->n_mr_updated !=3D 0;
> > > +}
> > > +
> > > +static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
> > > +{
> > > +    if (!vhost_vdpa_iotlb_batch_is_started(v)) {
> > > +        vhost_vdpa_listener_begin_batch(v);
> > > +    }
> > > +
> > > +    v->n_mr_updated++;
> > > +}
> > > +
> > > +static void vhost_vdpa_iotlb_batch_reset(struct vhost_vdpa *v)
> > > +{
> > > +    v->n_mr_updated =3D 0;
> > > +}
> > > +
> > >  static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > >  {
> > >      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdp=
a, listener);
> > > @@ -120,6 +133,10 @@ static void vhost_vdpa_listener_commit(MemoryLis=
tener *listener)
> > >          return;
> > >      }
> > >
> > > +    if (vhost_vdpa_iotlb_batch_is_started(v)) {
> > > +        return;
> > > +    }
> > > +
> > >      msg.type =3D v->msg_type;
> > >      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> > >
> > > @@ -127,6 +144,8 @@ static void vhost_vdpa_listener_commit(MemoryList=
ener *listener)
> > >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > >                       fd, errno, strerror(errno));
> > >      }
> > > +
> > > +    vhost_vdpa_iotlb_batch_reset(v);
> > >  }
> > >
> > >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > > @@ -170,6 +189,10 @@ static void vhost_vdpa_listener_region_add(Memor=
yListener *listener,
> > >
> > >      llsize =3D int128_sub(llend, int128_make64(iova));
> > >
> > > +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH=
)) {
> >
> > Let's move this in to vhost_vdpa_iotlb_batch_begin_once()?
> >
>
> Sure
>
> > > +        vhost_vdpa_iotlb_batch_begin_once(v);
> > > +    }
> > > +
> > >      ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> > >                               vaddr, section->readonly);
> > >      if (ret) {
> > > @@ -221,6 +244,10 @@ static void vhost_vdpa_listener_region_del(Memor=
yListener *listener,
> > >
> > >      llsize =3D int128_sub(llend, int128_make64(iova));
> > >
> > > +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH=
)) {
> > > +        vhost_vdpa_iotlb_batch_begin_once(v);
> > > +    }
> > > +
> >
> > Do we need to check vhost_vdpa_iotlb_batch_is_started() in the .commit?
> >
>
> I don't follow you here. It's that comment in this position of the
> patch for a reason?
>
> That checking is the one that allows qemu to skip the IOTLB_END write.

So it looks to me the BATCH_END will be sent unconditionally in this patch?

If yes, will this become a problem?

Thanks

>
> > Others look good.
> >
> > Thanks
> >
> > >      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> > >      if (ret) {
> > >          error_report("vhost_vdpa dma unmap error!");
> > > @@ -234,7 +261,6 @@ static void vhost_vdpa_listener_region_del(Memory=
Listener *listener,
> > >   * depends on the addnop().
> > >   */
> > >  static const MemoryListener vhost_vdpa_memory_listener =3D {
> > > -    .begin =3D vhost_vdpa_listener_begin,
> > >      .commit =3D vhost_vdpa_listener_commit,
> > >      .region_add =3D vhost_vdpa_listener_region_add,
> > >      .region_del =3D vhost_vdpa_listener_region_del,
> > > --
> > > 2.27.0
> > >
> >
>


