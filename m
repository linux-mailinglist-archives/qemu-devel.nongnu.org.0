Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB0383B67
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:37:14 +0200 (CEST)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihB3-0007pZ-M1
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lih7E-0005bO-Tc
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lih7A-00052l-7D
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621272787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=caBTaPhNtzyEEhLsTlZG4EMjCRLu5PP/POrwqxzfQpk=;
 b=FVmHH1tmoFZN82NeYA71Buo+yXjZvdmZasx3GmBxRcsroMXLibe69PcxolsB5IkuiuCiNL
 hddU+NYXiCIUBDkVwOwMVnaEJ8vQc9U8ISm0HJsu5Ef6hXYkali3z5uo0xdy5WHYHxcwwu
 /fBu6NzejC0tlyPRpQbD72/ZnNry54c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-BD4S1l0MPtyaMjsLlpn60g-1; Mon, 17 May 2021 13:33:05 -0400
X-MC-Unique: BD4S1l0MPtyaMjsLlpn60g-1
Received: by mail-qv1-f72.google.com with SMTP id
 z93-20020a0ca5e60000b02901ec19d8ff47so5315420qvz.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=caBTaPhNtzyEEhLsTlZG4EMjCRLu5PP/POrwqxzfQpk=;
 b=rkm3JTWigwYbR7wD9gZrQCsuIcr9So5iheIiO/az1H14H6gL7Si1f22H7zAh8tVZfE
 WDInHzHdTINrJNCw5OLWlsI1xU5dgM+e8Fp/Uynb1gYjPdvOyHk4PR47u2BGsirz348i
 CXfsUYWwpXxrv4wOSiCWr3L+qzIzlHulEb5GFrd9MwYSCHtOJsukeTvyuUxpGT5NGa/q
 TuXYJZU33aKSGghWgWZ6KcJqHLQHRskqXFP+MzaFehGODQ+4uRCLxnymctTx/UDzlgY+
 dUh9XBAKBBEL8/tlfvYgFbxIbCy1DxacFtjv9fT5PkJO2RQV5co2yOQGx9Y8y6FiC5gm
 YYng==
X-Gm-Message-State: AOAM5303jfd+xlCN8ALsNh9ClyuEb3e4lqCEsSg1LnH/P2KR9fsNQ2cd
 IYKWDafCXNFuaxfAhgjcvzIXHVE/gf8wQen59YuJ5vvJfCLeBtuUrOW4KMCO8+9SKjjYBgZBig9
 J6pTxjbX4k6dhM3rIR+WjTMEneHZ5EB0=
X-Received: by 2002:ac8:59cd:: with SMTP id f13mr595830qtf.19.1621272784760;
 Mon, 17 May 2021 10:33:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdAjhYwnjI+hZqQRK9nfxQrGuoRvM647Il6nkEWEGMN4dFfRMWU/7IeynALu9GL6TigJF7/tykmAUjrRGzTTs=
X-Received: by 2002:ac8:59cd:: with SMTP id f13mr595814qtf.19.1621272784573;
 Mon, 17 May 2021 10:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-14-eperezma@redhat.com>
 <6a5a542d-9640-36b3-401a-9208576c6588@redhat.com>
In-Reply-To: <6a5a542d-9640-36b3-401a-9208576c6588@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 17 May 2021 19:32:28 +0200
Message-ID: <CAJaqyWdOH6aEgrY8R=htL87FOSKKWjZdNTem3Z9qWZyj3wFGKA@mail.gmail.com>
Subject: Re: [RFC v2 13/13] vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device
 call on shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Tue, Mar 16, 2021 at 9:08 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/16 =E4=B8=8A=E5=8D=883:48, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 28 +++++++++++++++++++++++++++-
> >   1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 7df98fc43f..e3879a4622 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -71,10 +71,35 @@ typedef struct VhostShadowVirtqueue {
> >       /* Next head to consume from device */
> >       uint16_t used_idx;
> >
> > +    /* Cache for the exposed notification flag */
> > +    bool notification;
> > +
> >       /* Descriptors copied from guest */
> >       vring_desc_t descs[];
> >   } VhostShadowVirtqueue;
> >
> > +static void vhost_shadow_vq_set_notification(VhostShadowVirtqueue *svq=
,
> > +                                             bool enable)
> > +{
> > +    uint16_t notification_flag;
> > +
> > +    if (svq->notification =3D=3D enable) {
> > +        return;
> > +    }
> > +
> > +    notification_flag =3D virtio_tswap16(svq->vdev, VRING_AVAIL_F_NO_I=
NTERRUPT);
> > +
> > +    svq->notification =3D enable;
> > +    if (enable) {
> > +        svq->vring.avail->flags &=3D ~notification_flag;
> > +    } else {
> > +        svq->vring.avail->flags |=3D notification_flag;
> > +    }
> > +
> > +    /* Make sure device reads our flag */
> > +    smp_mb();
>
>
> This is a hint, so we don't need memory barrier here.
>
> Thanks
>

I will delete it for the next revision.

Thanks!

>
> > +}
> > +
> >   static void vhost_vring_write_descs(VhostShadowVirtqueue *svq,
> >                                       const struct iovec *iovec,
> >                                       size_t num, bool more_descs, bool=
 write)
> > @@ -251,7 +276,7 @@ static void vhost_shadow_vq_handle_call_no_test(Eve=
ntNotifier *n)
> >       do {
> >           unsigned i =3D 0;
> >
> > -        /* TODO: Use VRING_AVAIL_F_NO_INTERRUPT */
> > +        vhost_shadow_vq_set_notification(svq, false);
> >           while (true) {
> >               g_autofree VirtQueueElement *elem =3D vhost_shadow_vq_get=
_buf(svq);
> >               if (!elem) {
> > @@ -269,6 +294,7 @@ static void vhost_shadow_vq_handle_call_no_test(Eve=
ntNotifier *n)
> >               svq->masked_notifier.signaled =3D true;
> >               event_notifier_set(svq->masked_notifier.n);
> >           }
> > +        vhost_shadow_vq_set_notification(svq, true);
> >       } while (vhost_shadow_vq_more_used(svq));
> >
> >       if (masked_notifier) {
>


