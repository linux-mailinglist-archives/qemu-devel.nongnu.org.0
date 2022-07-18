Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E1577C68
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:23:13 +0200 (CEST)
Received: from localhost ([::1]:58696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDL60-0000SH-Ct
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDL3u-000764-Gy
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDL3r-0006b0-Oh
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658128858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtviDcIwbH+O1e7rmuALIkisHDIUv9fDpW7E7DlWu4Q=;
 b=ErL/l6dJVufn48/urVfgNhFBPQ5EBJ+JcOHyAUYbNAuWt/Q3P2ZvqxkO+9VyNr14uGzVaO
 PEebxCRV2W19du7XLfPpeSz9VuAq7M/bWysOD0DO4kjcsnvgE+OxG2rY7zIR5Y2AhpEkuD
 cvwF88Ioj4ZzHuJnzmCsOqU5wFu1rA4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-WV6OC3E2OYCaDRhvlgS3SQ-1; Mon, 18 Jul 2022 03:20:51 -0400
X-MC-Unique: WV6OC3E2OYCaDRhvlgS3SQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 az32-20020a05620a172000b006b58ce94435so8804302qkb.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 00:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WtviDcIwbH+O1e7rmuALIkisHDIUv9fDpW7E7DlWu4Q=;
 b=wmeATMPbEby2INs33vwhXEpanRmQQ3bcWhjhQvd9xQqpOiUNm6pVWf3aE8YyO2/Ob6
 JyM+hMAtm2LBo/1QDsQELBrD4Uce97n0QMfGm3KoPGLaSu0XjBOTLvOTTaJZPBBLd5mv
 ULp+mus8cpOQmu3iyR1lC7+Ja8s/it/P/QU8a3ZbXDrJJVpC5z+QZM79qSPEbCZvpMH1
 2w9If8agyjpaKUeKZ6Wavh6vGrlPvbKZW+CUqy2xajMR0oNRwLuybB9mVKfYCvHCDocs
 Mai0mepVwd+dLlPUrwhKDfQU/drOdJwJ/g6qAS1TnzjljMmwXIr/o4gkvTK3Kui7dF/P
 M4OQ==
X-Gm-Message-State: AJIora+dPrRjK/4t38X6pn3yFzeKRkjliZvwkNnqXwViyPy2GHF66re/
 rjYVfPjqPNnd3UQnRwPfIztuJsUSBXv5fD8U07xlmH4mM+VVKnfcJPKnKE+UCHjv5uTnQgGjuWz
 G3L9lPKAOXqE++STKJ9bpldmt29fLBKE=
X-Received: by 2002:a05:6214:27c9:b0:473:9f3b:1ca with SMTP id
 ge9-20020a05621427c900b004739f3b01camr16487160qvb.108.1658128850984; 
 Mon, 18 Jul 2022 00:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tJPp+LjIQbSg0RpCL0pv0ojbRgXpVwTkVvi5bjovBx7oc8rr3WW8ILphfu9I6ZL9Dz1pZb8HShn1jHnG6M6cc=
X-Received: by 2002:a05:6214:27c9:b0:473:9f3b:1ca with SMTP id
 ge9-20020a05621427c900b004739f3b01camr16487153qvb.108.1658128850799; Mon, 18
 Jul 2022 00:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-3-eperezma@redhat.com>
 <CACGkMEvXgWWwrPLTWW7TCRH7z+dg2rn4kK3WbPBCTWHQpcZoTw@mail.gmail.com>
In-Reply-To: <CACGkMEvXgWWwrPLTWW7TCRH7z+dg2rn4kK3WbPBCTWHQpcZoTw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Jul 2022 09:20:14 +0200
Message-ID: <CAJaqyWcU0afb7YmfCM5Fp8WZZfa0wn4rh8pZjEz3OvseEr4M3g@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] vhost: Move SVQ queue rewind to the destination
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 18, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Migration with SVQ already migrate the inflight descriptors,
>
> How is this done?
>

Migration between vhost-vdpa with x-svq=3Don maintain the guest's
visible state in VirtQueues, and they already have all the protocols
to migrate them.

We cannot migrate if we cannot restore the state / inflight in the
destination, but since we need x-svq=3Don at this point, we can restore
both of them. Extra care will be needed when ASID is introduced.

> > so the
> > destination can perform the work.
> >
> > This makes easier to migrate between backends or to recover them in
> > vhost devices that support set in flight descriptors.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 24 +++++++++++-------------
> >  1 file changed, 11 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 18820498b3..4458c8d23e 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1178,7 +1178,18 @@ static int vhost_vdpa_set_vring_base(struct vhos=
t_dev *dev,
> >                                         struct vhost_vring_state *ring)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > +    VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> >
> > +    /*
> > +     * vhost-vdpa devices does not support in-flight requests. Set all=
 of them
> > +     * as available.
> > +     *
> > +     * TODO: This is ok for networking, but other kinds of devices mig=
ht
> > +     * have problems with these retransmissions.
> > +     */
> > +    while (virtqueue_rewind(vq, 1)) {
> > +        continue;
> > +    }
> >      if (v->shadow_vqs_enabled) {
> >          /*
> >           * Device vring base was set at device start. SVQ base is hand=
led by
> > @@ -1197,19 +1208,6 @@ static int vhost_vdpa_get_vring_base(struct vhos=
t_dev *dev,
> >      int ret;
> >
> >      if (v->shadow_vqs_enabled) {
> > -        VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> > -
> > -        /*
> > -         * Setting base as last used idx, so destination will see as a=
vailable
> > -         * all the entries that the device did not use, including the =
in-flight
> > -         * processing ones.
> > -         *
> > -         * TODO: This is ok for networking, but other kinds of devices=
 might
> > -         * have problems with these retransmissions.
> > -         */
> > -        while (virtqueue_rewind(vq, 1)) {
> > -            continue;
> > -        }
>
> I think it's not a good idea to partially revert the code that was
> just introduced in the previous patch (unless it can be backported to
> -stable independently).
>
> We probably need to squash the changes.
>

You definitely have a point. Maybe it's better to remove the "Fixes"
tag? -stable version cannot enable SVQ anyway (it doesn't have the
parameter).

I'll send a v2 when we have all the comments sorted out. Maybe a
better alternative is to delay the x-svq parameter to the top of both
series if both of them go in?

Thanks!

> Thanks
>
> >          ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring-=
>index);
> >          return 0;
> >      }
> > --
> > 2.31.1
> >
>


