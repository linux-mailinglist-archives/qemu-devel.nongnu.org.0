Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C400A577C14
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:01:52 +0200 (CEST)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDKlL-0000ih-1E
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDKhx-0006ox-Iw
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 02:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDKhu-0003Fq-21
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 02:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658127491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LOH17QLGio8IKUldIKT8u3ezYs6BjZDvNqKqOL4HIM=;
 b=RFhinwzXHcIAXaM8XHn4sU2S/cDCo6fnlW0b/D2Czos5bYwypJ5RY7zS+KnoeNpKYTISQ6
 fbeeBvY4Srs7zMb2Sg7blViwQfoBMxXN+c8AwabhxrWVFZYM5SyUu/ByzBkRBblya9H47F
 h8cHKtFsDywAIedYKW4WePel/Np4Frc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-o4KdTnc0MoakyU_7npS3_g-1; Mon, 18 Jul 2022 02:58:04 -0400
X-MC-Unique: o4KdTnc0MoakyU_7npS3_g-1
Received: by mail-qv1-f69.google.com with SMTP id
 q4-20020a0ce9c4000000b00473004919ddso4990288qvo.16
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 23:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/LOH17QLGio8IKUldIKT8u3ezYs6BjZDvNqKqOL4HIM=;
 b=EjzVECD2Kn4xOwqPhMFWlVKPFOgUcz3RN4fLbJOVgcpNElt0YNhqlTd0hFa7wwmpW2
 rz+nVPw1hvJqoj5i7ntQas/hd/SzTrsIhaN+/eh1182B9iW8KEwe9Rb0dCmHFak7qr5p
 Ly4vulRo/tR/VtlbaVa2IXAO1AHT5cKUBkfRx5U0l/Q/ZLZUjZR7dmn7JSduGPERherD
 FpUai4lN/OIbwpouBmz2WM/3IvKqBHIlMcE2r3928Q5yUHnW92gPlDv9/vjpfUSB98jA
 eHBwY5StwRhQ4H5YHLG8BsqndbOKaR8XTAJR65oh02v4VHU/zxlNzN5H1cnN5/CeMbE6
 jrRA==
X-Gm-Message-State: AJIora/qC6sjce0i0UOcp+MgP7VtH2gQJ4gNJQcvDkgvUEp8Uo15x/Z+
 ygq3kFeO5ary+g6riJaof/Tu1mnaLpYYFWy+cGTiEbEVxAG5uVWHQk9kE7E44tPhSpYtli1b+Tz
 6AWMuS6jqEaGzI/WNMwDa5VdJU4q08pE=
X-Received: by 2002:a05:6214:27c9:b0:473:9f3b:1ca with SMTP id
 ge9-20020a05621427c900b004739f3b01camr16444971qvb.108.1658127483879; 
 Sun, 17 Jul 2022 23:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/qyA4FqtQy1PodXDuG+wLjITYallZPINKK/HChpWtY1EmE2B5IHRF+NsvI6lgoSpezFGyrsxqOp8SsMjcveY=
X-Received: by 2002:a05:6214:27c9:b0:473:9f3b:1ca with SMTP id
 ge9-20020a05621427c900b004739f3b01camr16444959qvb.108.1658127483672; Sun, 17
 Jul 2022 23:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-5-eperezma@redhat.com>
 <CACGkMEtuMB8iB=4JYCWSwgq46enfEWuDxwSoT4J+v4RzNSVY8w@mail.gmail.com>
In-Reply-To: <CACGkMEtuMB8iB=4JYCWSwgq46enfEWuDxwSoT4J+v4RzNSVY8w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Jul 2022 08:57:27 +0200
Message-ID: <CAJaqyWfwRHFP9Lo32gqFbnbMgi7cxYofLoJV0XQ_2KUnpRQSUw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/12] vdpa: delay set_vring_ready after DRIVER_OK
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

On Mon, Jul 18, 2022 at 8:34 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > To restore the device in the destination of a live migration we send th=
e
> > commands through control virtqueue. For a device to read CVQ it must
> > have received DRIVER_OK status bit.
> >
> > However this open a window where the device could start receiving
> > packets in rx queue 0 before it receive the RSS configuration.
>
> A note here is that, after chatting with Michael, the device should
> not start processing the buffer until a kick. So I wonder if it's more
> than enough to not kick the data vq paris until we've recovered the
> state via cvq?
>

Oh, I see I misunderstood the mail now :). You both have a very good point.

Take into account the set of the state will also happen when
transitioning from passthrough mode to SVQ mode. In that switch we're
not pausing the VM (AFAIK), so guests are free to kick dvqs.

But it is totally right that it is not strictly needed for this
particular series, as:
* We're in full control of the device with SVQ.
* Guest still has not seen the DRIVER_OK bit set.

So I'll delay that part for the one able to do the transition. It's
totally safe that the guest kicks before DRIVER_OK at this moment (as
I explained in the other mail).

Thanks!

>
> > To avoid
> > that, we will not send vring_enable until all configuration is used by
> > the device.
> >
> > As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 906c365036..1d8829c619 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -730,13 +730,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_d=
ev *dev, int idx)
> >      return idx;
> >  }
> >
> > +/**
> > + * Set ready all vring of the device
>
> It should be better to mention, for device we mean virtio device
> instead of vhost device (which we may have multiple ones if mq is
> enabled).
>
> Thanks
>
> > + *
> > + * @dev: Vhost device
> > + */
> >  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >  {
> >      int i;
> >      trace_vhost_vdpa_set_vring_ready(dev);
> > -    for (i =3D 0; i < dev->nvqs; ++i) {
> > +    for (i =3D 0; i < dev->vq_index_end; ++i) {
> >          struct vhost_vring_state state =3D {
> > -            .index =3D dev->vq_index + i,
> > +            .index =3D i,
> >              .num =3D 1,
> >          };
> >          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > @@ -1111,7 +1116,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >          if (unlikely(!ok)) {
> >              return -1;
> >          }
> > -        vhost_vdpa_set_vring_ready(dev);
> >      } else {
> >          ok =3D vhost_vdpa_svqs_stop(dev);
> >          if (unlikely(!ok)) {
> > @@ -1125,16 +1129,22 @@ static int vhost_vdpa_dev_start(struct vhost_de=
v *dev, bool started)
> >      }
> >
> >      if (started) {
> > +        int r;
> > +
> >          memory_listener_register(&v->listener, &address_space_memory);
> > -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > +        r =3D vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > +        if (unlikely(r)) {
> > +            return r;
> > +        }
> > +        vhost_vdpa_set_vring_ready(dev);
> >      } else {
> >          vhost_vdpa_reset_device(dev);
> >          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                     VIRTIO_CONFIG_S_DRIVER);
> >          memory_listener_unregister(&v->listener);
> > -
> > -        return 0;
> >      }
> > +
> > +    return 0;
> >  }
> >
> >  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t bas=
e,
> > --
> > 2.31.1
> >
>


