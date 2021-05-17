Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B192383B53
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:32:45 +0200 (CEST)
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lih6i-0004jE-J6
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ligmU-0001c6-Vx
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ligmT-0005jt-0O
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:11:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621271506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQggw6OPbeKuuBFKECCJ2z7h8RWIxp4p6yxs5OcetJ4=;
 b=Y2vVfK56aUdcupAV46m5HyIjpA7kVJF43WmNnr03+O88/TFMvBzAWYB7IOyJoOc+cqyJQu
 +fv4cT4zXXL6n99HC/PuCmvBQbAv8xExRYaybGrOZvplGBSFKPFmVRZolVzpC/pkdeVPP2
 3WRo6eSpnybhUJ8el/2igTe3N8fR0AQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-hEnkqt03OUa8z9POMYVm6Q-1; Mon, 17 May 2021 13:11:42 -0400
X-MC-Unique: hEnkqt03OUa8z9POMYVm6Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 t1-20020a0ca6810000b029019e892416e6so5256638qva.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xQggw6OPbeKuuBFKECCJ2z7h8RWIxp4p6yxs5OcetJ4=;
 b=b7ws6yWhAgSPMqRmn7oZ9t/zrr7hPMaSbTc42EFoqEnnHDGUtcDgbr2q4qLkU69TdW
 MzlF5G6VFrouaUav6sZo3v9boOl5ZjsrQfWaACwXNVZ3HdjbJ77bcITlzO1GsjMRkwW7
 H4BK4wEQ1U6zGM8zcjTeBmn/KLIFcBUKZXTB/nhrkPwufUnSpJ5GNmay2W+cwhtSDaBW
 a4ETkLFs5DxKFkmpNbSiothP9Je6IQ24oEIWgRBVN19abx40EXC8ZfIEI4Qa8tBgOOq6
 BSpTjWLyXjMHY5d8/Zl9XvqjJSJpE93JaEf+il644WkJUa0PVTMQW3P6it/BCo+jac9o
 P7zA==
X-Gm-Message-State: AOAM531SiETvW+TQpNVSmqYm5YaDsL302UGVWTzbiaMtTvdXg72S8MkZ
 LWgKK1+EuxIULVJ3keTHZpis3vMBDZRP3KTcuDGDFu07wlujX3fI1B9TH8dP17UZvlgJnI/54bW
 IQevU7fBSqkkipAFYBYgtaodU/6l5EqU=
X-Received: by 2002:ac8:59cd:: with SMTP id f13mr505145qtf.19.1621271502057;
 Mon, 17 May 2021 10:11:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8qffepvKiRxmahwChbjqJ9FSITuly3JeU6613WjeyRuvwmhI1eGKraeZ/3tkrKKw/WWXNMOvqvEHVWQOhN1E=
X-Received: by 2002:ac8:59cd:: with SMTP id f13mr505107qtf.19.1621271501656;
 Mon, 17 May 2021 10:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-13-eperezma@redhat.com>
 <52806611-8435-f80a-63b4-51cfc7a9ead2@redhat.com>
In-Reply-To: <52806611-8435-f80a-63b4-51cfc7a9ead2@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 17 May 2021 19:11:05 +0200
Message-ID: <CAJaqyWcXy2rL82gO6h6idTLYvhsf-vfOVBYq-mZQqJ0RBqx-GA@mail.gmail.com>
Subject: Re: [RFC v2 12/13] vhost: Check for device VRING_USED_F_NO_NOTIFY at
 shadow virtqueue kick
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 9:07 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 68ed0f2740..7df98fc43f 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -145,6 +145,15 @@ static void vhost_shadow_vq_add(VhostShadowVirtque=
ue *svq,
> >       svq->ring_id_maps[qemu_head] =3D elem;
> >   }
> >
> > +static void vhost_shadow_vq_kick(VhostShadowVirtqueue *svq)
> > +{
> > +    /* Make sure we are reading updated device flag */
> > +    smp_rmb();
>
>
> smp_mb() actually? Or it's better to explain this following read needs
> to be orderd with what read before.
>
> Thanks
>

Sorry for the late reply, I moved to vhost-vdpa usage of SVQ and I
missed these comments.

My intentions were just to order the reading of used ring flags. In
other words, to avoid reading an old value in the next conditional.

Descriptors themselves should be already written because
vhost_shadow_vq_add_split just calls smp_wmb almost at the end of the
execution. avail_ring->idx is not protected by it though. Is that what
you meant about turning it to a full barrier?

Maybe it's clearer just to call smp_mb() between the calls to
vhost_shadow_vq_add_split and vhost_shadow_vq_kick, merging both
memory barriers?

Thanks!

>
> > +    if (!(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY)) {
> > +        event_notifier_set(&svq->kick_notifier);
> > +    }
> > +}
> > +
> >   /* Handle guest->device notifications */
> >   static void vhost_handle_guest_kick(EventNotifier *n)
> >   {
> > @@ -174,7 +183,7 @@ static void vhost_handle_guest_kick(EventNotifier *=
n)
> >               }
> >
> >               vhost_shadow_vq_add(svq, elem);
> > -            event_notifier_set(&svq->kick_notifier);
> > +            vhost_shadow_vq_kick(svq);
> >           }
> >
> >           virtio_queue_set_notification(svq->vq, true);
>


