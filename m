Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F183E963E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 18:42:45 +0200 (CEST)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDrJS-0007QW-1h
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 12:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mDrIL-00062v-33
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 12:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mDrIH-00083G-VC
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 12:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628700089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIFKhbsp3Ywm8i8EzSXhIzS4xrzlWb9kFpbIt4Yx8wg=;
 b=ESpoiBTHHi4RG1KirpQjsGYERPu0fPya4c/7JVSbZsaG5njAT7pVqoP5nP4f5is5DKM/eK
 bPwse+Q5pRyd/WohdIkWCCH5XEKaCZZdZPAnPY1zAnHg30toChshXNcyAjNw+jtu5hCpB3
 4OIDLw5ovabb3swNGuSuA03rb/gy09U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-IfgjS3OYNf6iQuUlWVkuVA-1; Wed, 11 Aug 2021 12:41:27 -0400
X-MC-Unique: IfgjS3OYNf6iQuUlWVkuVA-1
Received: by mail-qk1-f198.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so1738909qkd.0
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 09:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FIFKhbsp3Ywm8i8EzSXhIzS4xrzlWb9kFpbIt4Yx8wg=;
 b=rQmypU9iQQv/Q/qwJZnTSwjd3FAE84c7LWrArT1A1Y1bDHbK/Wkj5cJMtLnWxiGQYa
 1qKiaMbJxrI0Qb9OmrLMT7rZCcqjy5aoyphBff32yteTxUGYiHi7Kg7wZrkkvCRnerPG
 3exNG+TDeP1Tk8cUz/lTl/vvvVsO/kH9GOC4MESBU9LO4USO50lZbaduIhQb6gzOgDRR
 YrN/Y9QLyVK7WANEgIw5qH07dKmB/NTvzKblPPs1diot2UJQIztMjDOMlxUUbgWCIUSn
 PPBp+PsiChh5JENnczGtoPFwM8kcDwUqAtnCwocMgsOeY68h+vav/YKbaa04p9aHD7KY
 VCOw==
X-Gm-Message-State: AOAM5325QoPmobmz5prhBtDinOdwJynNbv/SjwzX2ufigzFeEWfV6WgO
 0P3XcuaaqBvecxiEYzicUuI3A+3JEj5d6QyflXapOE5XFmRN84hLQeEx6dJPuAeZRVpjXZ62ix3
 bzpbacWM9lupRvvriMOdpVnTeUPNoDuQ=
X-Received: by 2002:a37:b9c4:: with SMTP id
 j187mr11975696qkf.131.1628700087391; 
 Wed, 11 Aug 2021 09:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0pcc4FWFaJrPVI8At7tpbKt9fyuzJFMMe25z4XyOAKt3Gz922pXIbZC5JRxzXZe4outT/Shnh+2XmP9J+/WU=
X-Received: by 2002:a37:b9c4:: with SMTP id
 j187mr11975675qkf.131.1628700087143; 
 Wed, 11 Aug 2021 09:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210804144402.711594-1-eperezma@redhat.com>
 <CACGkMEuW166WvHeB63aoTvYinqK4u_8hDBFHtUXoexWkQy8PpA@mail.gmail.com>
 <CAJaqyWeQFjG5k1Savtui3cEbha37SUu5WrvObWP+o9Rp=UOA3Q@mail.gmail.com>
 <4b384df7-f0ca-2dd0-a7d8-06a7e82176ae@redhat.com>
In-Reply-To: <4b384df7-f0ca-2dd0-a7d8-06a7e82176ae@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 11 Aug 2021 18:40:51 +0200
Message-ID: <CAJaqyWe6E6MvmiJoj1v7xMa=3ezgUNi=ykM9a7Fq+ZUxqVnjWg@mail.gmail.com>
Subject: Re: [RFC PATCH] vhost-vdpa: Do not send empty IOTLB update batches
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Thu, Aug 5, 2021 at 9:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/8/5 =E4=B8=8B=E5=8D=883:04, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Thu, Aug 5, 2021 at 8:16 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Wed, Aug 4, 2021 at 10:44 PM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> >>> With the introduction of the batch hinting, meaningless batches can b=
e
> >>> created with no IOTLB updates if the memory region was skipped by
> >>> vhost_vdpa_listener_skipped_section. This is the case of host notifie=
rs
> >>> memory regions, but others could fall on this category. This caused t=
he
> >>> vdpa device to receive dma mapping settings with no changes, a possib=
ly
> >>> expensive operation for nothing.
> >>>
> >>> To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have =
a
> >>> meaningful (not skipped section) mapping or unmapping operation, and
> >>> VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
> >>> _INVALIDATE has been issued.
> >> Hi Eugeni:
> >>
> >> This should work but it looks to me it's better to optimize the kernel=
.
> >>
> >> E.g to make sure we don't send set_map() if there is no real updating
> >> between batch start and end.
> >>
> > Hi Jason,
> >
> > I think we should do both in parallel anyway.
>
>
> Ok, I'm fine with this.
>
>
> >   We also obtain an
> > (unmeasured at this moment) decrease in startup time for qemu with
> > vdpa this way, for example. I consider that this particular RFC has
> > room to improve or change totally of course.
> >
> > I've made these changes in the kernel too, just counting the number of
> > memory updates and not calling set_map if no actual changes have been
> > made.
>
>
> Right, that is what we want to have.
>
>
> >
> >> This makes sure that it can work for all kinds of userspace (not only =
for Qemu).
> >>
> >> Another optimization is to batch the memory region transaction by addi=
ng:
> >>
> >> memory_region_transaction_begin() and memory_region_transaction_end() =
in
> >>
> >> both vhost_vdpa_host_notifiers_init() and vhost_vdpa_host_notifiers_un=
init().
> >>
> >> This can make sure only at least one memory transactions when
> >> adding/removing host notifier regions.
> >>
> > That solves the updates about memory regions, but it does not solve
> > the case where updating memory regions are not interesting to the
> > device.
>
>
> Kind of, I guess with this we only get one more set_map().
>
>
> > In other words, where all the changes meet
> > vhost_vdpa_listener_skipped_section() =3D=3D true. I did not spend a lo=
t
> > of time trying to raise these though, maybe it happens when
> > hot-plugging a device, for example?
>
>
> Yes, so transaction is per device optimization that can't help in this ca=
se.
>

I've left it out, since we already obtain 0 IOTLB update commits with
this approach. Let me know if you think it should be included.

>
> >
> > We could abstract these changes in memory_region_transaction_begin() /
> > memory_region_transaction_end() wrappers though.
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>   include/hw/virtio/vhost-vdpa.h |  1 +
> >>>   hw/virtio/vhost-vdpa.c         | 38 +++++++++++++++++++++++--------=
---
> >>>   2 files changed, 27 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> >>> index e98e327f12..0a7edbe4eb 100644
> >>> --- a/include/hw/virtio/vhost-vdpa.h
> >>> +++ b/include/hw/virtio/vhost-vdpa.h
> >>> @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
> >>>       int device_fd;
> >>>       int index;
> >>>       uint32_t msg_type;
> >>> +    size_t n_iotlb_sent_batch;
>
>
> Not a native speaker but we probably need a better name, e.g "n_mr_update=
d?"
>

I totally agree.

>
> >>>       MemoryListener listener;
> >>>       struct vhost_dev *dev;
> >>>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 6ce94a1f4d..2517fc6103 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa=
 *v, hwaddr iova,
> >>>       return ret;
> >>>   }
> >>>
> >>> -static void vhost_vdpa_listener_begin(MemoryListener *listener)
> >>> +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
> >>>   {
> >>> -    struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdp=
a, listener);
> >>> -    struct vhost_dev *dev =3D v->dev;
> >>> -    struct vhost_msg_v2 msg =3D {};
> >>>       int fd =3D v->device_fd;
> >>> -
> >>> -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH)=
)) {
> >>> -        return;
> >>> -    }
> >>> -
> >>> -    msg.type =3D v->msg_type;
> >>> -    msg.iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN;
> >>> +    struct vhost_msg_v2 msg =3D {
> >>> +        .type =3D v->msg_type,
> >>> +        .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> >>> +    };
> >>>
> >>>       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >>>           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >>> @@ -120,6 +114,11 @@ static void vhost_vdpa_listener_commit(MemoryLis=
tener *listener)
> >>>           return;
> >>>       }
> >>>
> >>> +    if (v->n_iotlb_sent_batch =3D=3D 0) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    v->n_iotlb_sent_batch =3D 0;
> >>>       msg.type =3D v->msg_type;
> >>>       msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> >>>
> >>> @@ -170,6 +169,14 @@ static void vhost_vdpa_listener_region_add(Memor=
yListener *listener,
> >>>
> >>>       llsize =3D int128_sub(llend, int128_make64(iova));
> >>>
> >>> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH=
)) {
> >>> +        if (v->n_iotlb_sent_batch =3D=3D 0) {
> >>> +            vhost_vdpa_listener_begin_batch(v);
> >>> +        }
> >>> +
> >>> +        v->n_iotlb_sent_batch++;
> >>> +    }
>
>
> Let abstract this as a helper to be reused by region_del.
>
> Other looks good.
>
> Thanks
>

I sent a PATCH v2 instead of a non-RFC v1 by mistake. Please let me
know if I should do something to change it.

Thanks!

>
> >>> +
> >>>       ret =3D vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> >>>                                vaddr, section->readonly);
> >>>       if (ret) {
> >>> @@ -221,6 +228,14 @@ static void vhost_vdpa_listener_region_del(Memor=
yListener *listener,
> >>>
> >>>       llsize =3D int128_sub(llend, int128_make64(iova));
> >>>
> >>> +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH=
)) {
> >>> +        if (v->n_iotlb_sent_batch =3D=3D 0) {
> >>> +            vhost_vdpa_listener_begin_batch(v);
> >>> +        }
> >>> +
> >>> +        v->n_iotlb_sent_batch++;
> >>> +    }
> >>> +
> >>>       ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >>>       if (ret) {
> >>>           error_report("vhost_vdpa dma unmap error!");
> >>> @@ -234,7 +249,6 @@ static void vhost_vdpa_listener_region_del(Memory=
Listener *listener,
> >>>    * depends on the addnop().
> >>>    */
> >>>   static const MemoryListener vhost_vdpa_memory_listener =3D {
> >>> -    .begin =3D vhost_vdpa_listener_begin,
> >>>       .commit =3D vhost_vdpa_listener_commit,
> >>>       .region_add =3D vhost_vdpa_listener_region_add,
> >>>       .region_del =3D vhost_vdpa_listener_region_del,
> >>> --
> >>> 2.27.0
> >>>
>


