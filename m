Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F73E0EE0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:06:30 +0200 (CEST)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXSX-0008Vx-Er
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mBXRm-0007kn-AG
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mBXRj-0007xW-2n
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628147137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88gqQsYQ918Bl0Nnl2oGN4gvJvV1zJk1fxWvTA+I0A4=;
 b=fIFC9Tj7wsqjg3vRuT9K9TQy+owvJ/9ZTOsPJwrT0kBkQHs3kHQDNGFtwqEHFxmGwvCqDj
 imRv0m6euVsZoiwkz4fJKQGoOHYzJSuMV8iHEY6tGqKfj+M6PgRGqgcUw3MyW5h6fkpmFw
 quyjhIOKcJYR+z/yu9ampbsH1z5BX4I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-7U5LlDcAPce9oA9mtjaDqg-1; Thu, 05 Aug 2021 03:05:36 -0400
X-MC-Unique: 7U5LlDcAPce9oA9mtjaDqg-1
Received: by mail-qk1-f200.google.com with SMTP id
 q9-20020a05620a0c89b02903ba3e0f08d7so3632985qki.3
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 00:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=88gqQsYQ918Bl0Nnl2oGN4gvJvV1zJk1fxWvTA+I0A4=;
 b=M6red1zkJs1sMN6MfG0IRENryDRtftevU3+TlH4ZgCUDcxKDMAhHsiV2D1IVJU9Zx6
 sD85+nai/kPK3e1ZtOjYPqRKR8D16HLKamBAXBfwkvo5U3j/4VNXjB8BetWgK/HXQbXv
 tuMl7tVV8xbcglAx5/QkVNVW18Kcl7aC4TQgC2TkgybVWM20O7zqEiylPn7kFdQQAJrC
 24YTm2lHTzyQrZDu8jUyDrkma5n/wQQG7X7Lu0ypSPAU9GflF8XZAyNIhK1Hbi4R1BDU
 PymjX3fHI9Wrv6BOoNljfZnEPurrr1f36nVE6aGoHuHJ4rJ9fhXLZkSYMO3GaeYW8jxP
 2//g==
X-Gm-Message-State: AOAM5330mCqPnhe8gxYOq3g7/MapKP1dgkSMI52ZYdK+KNajJ9Q/HEc7
 mvaUbzfrsSP2LShJDFD8Jv24tW9KKBAMvPfwPafRYxkxadkOY+dPc9gYb/mrRGQj79yo/ASvuMt
 hYgsoG/PxVGeipskYwJxT5alPVAtDhnw=
X-Received: by 2002:a37:6ca:: with SMTP id 193mr3353163qkg.484.1628147135793; 
 Thu, 05 Aug 2021 00:05:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXKw1K8kvtyziOqkgo+cSKD7lH/YlJf6UQboPa1QpNOS8vsZ4fPp9M8j1Nv2KU8Kyv9Mgl3w8cDAV08HTaIHY=
X-Received: by 2002:a37:6ca:: with SMTP id 193mr3353147qkg.484.1628147135598; 
 Thu, 05 Aug 2021 00:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210804144402.711594-1-eperezma@redhat.com>
 <CACGkMEuW166WvHeB63aoTvYinqK4u_8hDBFHtUXoexWkQy8PpA@mail.gmail.com>
In-Reply-To: <CACGkMEuW166WvHeB63aoTvYinqK4u_8hDBFHtUXoexWkQy8PpA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 5 Aug 2021 09:04:59 +0200
Message-ID: <CAJaqyWeQFjG5k1Savtui3cEbha37SUu5WrvObWP+o9Rp=UOA3Q@mail.gmail.com>
Subject: Re: [RFC PATCH] vhost-vdpa: Do not send empty IOTLB update batches
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 5, 2021 at 8:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Aug 4, 2021 at 10:44 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > With the introduction of the batch hinting, meaningless batches can be
> > created with no IOTLB updates if the memory region was skipped by
> > vhost_vdpa_listener_skipped_section. This is the case of host notifiers
> > memory regions, but others could fall on this category. This caused the
> > vdpa device to receive dma mapping settings with no changes, a possibly
> > expensive operation for nothing.
> >
> > To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
> > meaningful (not skipped section) mapping or unmapping operation, and
> > VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
> > _INVALIDATE has been issued.
>
> Hi Eugeni:
>
> This should work but it looks to me it's better to optimize the kernel.
>
> E.g to make sure we don't send set_map() if there is no real updating
> between batch start and end.
>

Hi Jason,

I think we should do both in parallel anyway. We also obtain an
(unmeasured at this moment) decrease in startup time for qemu with
vdpa this way, for example. I consider that this particular RFC has
room to improve or change totally of course.

I've made these changes in the kernel too, just counting the number of
memory updates and not calling set_map if no actual changes have been
made.

> This makes sure that it can work for all kinds of userspace (not only for=
 Qemu).
>
> Another optimization is to batch the memory region transaction by adding:
>
> memory_region_transaction_begin() and memory_region_transaction_end() in
>
> both vhost_vdpa_host_notifiers_init() and vhost_vdpa_host_notifiers_unini=
t().
>
> This can make sure only at least one memory transactions when
> adding/removing host notifier regions.
>

That solves the updates about memory regions, but it does not solve
the case where updating memory regions are not interesting to the
device. In other words, where all the changes meet
vhost_vdpa_listener_skipped_section() =3D=3D true. I did not spend a lot
of time trying to raise these though, maybe it happens when
hot-plugging a device, for example?

We could abstract these changes in memory_region_transaction_begin() /
memory_region_transaction_end() wrappers though.

Thanks!

> Thanks
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  1 +
> >  hw/virtio/vhost-vdpa.c         | 38 +++++++++++++++++++++++-----------
> >  2 files changed, 27 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index e98e327f12..0a7edbe4eb 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
> >      int device_fd;
> >      int index;
> >      uint32_t msg_type;
> > +    size_t n_iotlb_sent_batch;
> >      MemoryListener listener;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 6ce94a1f4d..2517fc6103 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *=
v, hwaddr iova,
> >      return ret;
> >  }
> >
> > -static void vhost_vdpa_listener_begin(MemoryListener *listener)
> > +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
> >  {
> > -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa,=
 listener);
> > -    struct vhost_dev *dev =3D v->dev;
> > -    struct vhost_msg_v2 msg =3D {};
> >      int fd =3D v->device_fd;
> > -
> > -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)))=
 {
> > -        return;
> > -    }
> > -
> > -    msg.type =3D v->msg_type;
> > -    msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> > +    struct vhost_msg_v2 msg =3D {
> > +        .type =3D v->msg_type,
> > +        .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> > +    };
> >
> >      if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >          error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> > @@ -120,6 +114,11 @@ static void vhost_vdpa_listener_commit(MemoryListe=
ner *listener)
> >          return;
> >      }
> >
> > +    if (v->n_iotlb_sent_batch =3D=3D 0) {
> > +        return;
> > +    }
> > +
> > +    v->n_iotlb_sent_batch =3D 0;
> >      msg.type =3D v->msg_type;
> >      msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> >
> > @@ -170,6 +169,14 @@ static void vhost_vdpa_listener_region_add(MemoryL=
istener *listener,
> >
> >      llsize =3D int128_sub(llend, int128_make64(iova));
> >
> > +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))=
 {
> > +        if (v->n_iotlb_sent_batch =3D=3D 0) {
> > +            vhost_vdpa_listener_begin_batch(v);
> > +        }
> > +
> > +        v->n_iotlb_sent_batch++;
> > +    }
> > +
> >      ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> >                               vaddr, section->readonly);
> >      if (ret) {
> > @@ -221,6 +228,14 @@ static void vhost_vdpa_listener_region_del(MemoryL=
istener *listener,
> >
> >      llsize =3D int128_sub(llend, int128_make64(iova));
> >
> > +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))=
 {
> > +        if (v->n_iotlb_sent_batch =3D=3D 0) {
> > +            vhost_vdpa_listener_begin_batch(v);
> > +        }
> > +
> > +        v->n_iotlb_sent_batch++;
> > +    }
> > +
> >      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >      if (ret) {
> >          error_report("vhost_vdpa dma unmap error!");
> > @@ -234,7 +249,6 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >   * depends on the addnop().
> >   */
> >  static const MemoryListener vhost_vdpa_memory_listener =3D {
> > -    .begin =3D vhost_vdpa_listener_begin,
> >      .commit =3D vhost_vdpa_listener_commit,
> >      .region_add =3D vhost_vdpa_listener_region_add,
> >      .region_del =3D vhost_vdpa_listener_region_del,
> > --
> > 2.27.0
> >
>


