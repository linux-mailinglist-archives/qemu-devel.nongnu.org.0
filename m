Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5FE56B6BE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 12:13:17 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9kz6-00036g-JE
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 06:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9kxN-0002Qm-MO
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1o9kxK-0003GM-40
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 06:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657275085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQd8t6KKj3oJ+EdLkZlVA1RXKJJawUnSjToE38xIpoY=;
 b=ME5y/SCDugdx5syhDA2i1PQxSfaIoa9J1JZWkVdQF3K19Q78MvqJjFVtS+oVucYGcKnqMU
 xikTSIGKhcAor4pSaIiQjspYBu7WzmaAEvjAYLWjrz/j3oi+K4O8YQtYsylgwZ5MdgE60c
 N/8tPEBqu/O05sXqCxtVtGJO8pizPxI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-dqu-ay1ZM1eFOWEpr8AMXA-1; Fri, 08 Jul 2022 06:11:24 -0400
X-MC-Unique: dqu-ay1ZM1eFOWEpr8AMXA-1
Received: by mail-qt1-f197.google.com with SMTP id
 fw9-20020a05622a4a8900b0031e7a2ed350so12685680qtb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 03:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQd8t6KKj3oJ+EdLkZlVA1RXKJJawUnSjToE38xIpoY=;
 b=LoW7i84MEMTaa6omWh+lrbpe8UB4mg8HXRYcZA2VaxvpKbyIBSmBNIjJzM8+6fnIZO
 jS4owZxXQR2z8F/hPDifOxwxBx33uPkK4fX8ffDXBA8ZOdg6L+xX+IPkLVYqcv1Gd4+O
 VETbFZXNNnoZ3Imfjzjdj6VRdEvHdVvQeZPOBibVTD4g3YHJMIubhAu6Ro4h5x92Zw20
 ls34/rvG5+PcmKtsPcFbsAi1vXN18dV+qskPGwdR/hcjq6m04c2scAAfr0i0Ijq96BMl
 +L96g/z/Wcd1qqMXpxfhzcUrdUZYtvJq2/0s3nd1/W2gmYNgby8p2zPUpaI+cRPoqijG
 h6Jw==
X-Gm-Message-State: AJIora923mYY6zQXD6qVNnkM977KwA5Nn3rxQjz3EmVkEcS+avtTfJkC
 LPVfkaBcSPycyPLoY5s/8qU2MFD+GMsbcO2S9HSFZBh19VU/ZGWsJQ9/mOBoHC9VYfLL8HK7RjW
 TubmLWfTzWZC6do2jPTUdgpVEz3xX5Ok=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr1862768qvb.45.1657275083926; 
 Fri, 08 Jul 2022 03:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ugPq2WGXpTktVEdC+2nzsdGDkG2DXdiAo8sCMK8s4A+x0Dz6iUbSJcSIidzvkdsj6/ScI4J9gWlgvQJXz1ggM=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr1862748qvb.45.1657275083705; Fri, 08
 Jul 2022 03:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-5-eperezma@redhat.com>
 <CACGkMEv660pXKK9-E+eLhph_Pq346PVELVEryg=MKNtB0BL5eg@mail.gmail.com>
In-Reply-To: <CACGkMEv660pXKK9-E+eLhph_Pq346PVELVEryg=MKNtB0BL5eg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 8 Jul 2022 12:10:47 +0200
Message-ID: <CAJaqyWcqmpyXGvz6OvJaO=qJG+PFyjF_M+Bm0o-9cSQ+fbuApg@mail.gmail.com>
Subject: Re: [RFC PATCH v9 04/23] vhost: Get vring base from vq, not svq
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jul 8, 2022 at 11:12 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Jul 7, 2022 at 2:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > The used idx used to match with this, but it will not match from the
> > moment we introduce svq_inject.
>
> It might be better to explain what "svq_inject" means here.
>

Good point, I'll change for the next version.

> > Rewind all the descriptors not used by
> > vdpa device and get the vq state properly.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/virtio.h | 1 +
> >  hw/virtio/vhost-vdpa.c     | 7 +++----
> >  hw/virtio/virtio.c         | 5 +++++
> >  3 files changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index db1c0ddf6b..4b51ab9d06 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -302,6 +302,7 @@ hwaddr virtio_queue_get_desc_size(VirtIODevice *vde=
v, int n);
> >  hwaddr virtio_queue_get_avail_size(VirtIODevice *vdev, int n);
> >  hwaddr virtio_queue_get_used_size(VirtIODevice *vdev, int n);
> >  unsigned int virtio_queue_get_last_avail_idx(VirtIODevice *vdev, int n=
);
> > +unsigned int virtio_queue_get_in_use(const VirtQueue *vq);
> >  void virtio_queue_set_last_avail_idx(VirtIODevice *vdev, int n,
> >                                       unsigned int idx);
> >  void virtio_queue_restore_last_avail_idx(VirtIODevice *vdev, int n);
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 2ee8009594..de76128030 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1189,12 +1189,10 @@ static int vhost_vdpa_get_vring_base(struct vho=
st_dev *dev,
> >                                         struct vhost_vring_state *ring)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > -    int vdpa_idx =3D ring->index - dev->vq_index;
> >      int ret;
> >
> >      if (v->shadow_vqs_enabled) {
> > -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 vdpa_idx);
> > -
> > +        const VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->inde=
x);
> >          /*
> >           * Setting base as last used idx, so destination will see as a=
vailable
> >           * all the entries that the device did not use, including the =
in-flight
> > @@ -1203,7 +1201,8 @@ static int vhost_vdpa_get_vring_base(struct vhost=
_dev *dev,
> >           * TODO: This is ok for networking, but other kinds of devices=
 might
> >           * have problems with these retransmissions.
> >           */
> > -        ring->num =3D svq->last_used_idx;
> > +        ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring-=
>index) -
> > +                    virtio_queue_get_in_use(vq);
>
> I think we need to change the above comment as well otherwise readers
> might get confused.
>

Re-thinking this: This part has always been buggy, so this is actually
a fix. I'll tag it for next versions or, even better, send it
separately.

But the comment still holds: We cannot use the device's used idx since
it could not match with the guest visible one. This is actually easy
to trigger if we migrate a guest many times with traffic.

Maybe it's cleaner to export directly used_idx from VirtQueue? Extra
care is needed with packed vq, but SVQ still does not support it. I
didn't want to duplicate that logic in virtio ring handling.

> I wonder why we need to bother at this time. Is this an issue for
> networking devices?

Every device has this issue when migrating as soon as the device's
used index is not the same as the guest's one.

> And for block device, it's not sufficient since
> there's no guarantee that the descriptor is handled in order?
>

Right, that part still hold here.

Thanks!


