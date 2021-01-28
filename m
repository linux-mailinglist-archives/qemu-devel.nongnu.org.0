Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD7307315
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 10:47:38 +0100 (CET)
Received: from localhost ([::1]:41128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l53tp-0003X2-3S
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 04:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l53lA-0004Ts-9P
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 04:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l53l7-0005H4-At
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 04:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611826715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peY5q429sbQ3MYFtVN+MGaNN8pbAkRilLJ9ppq1B7Ww=;
 b=Ic27k5SDO/Baw+Sh09Gsjxfw+AMeo9tMF9rEYKHcCqBlJOIzzE+FeNQMagBtU4WMEvxk7Z
 el5C761zwTqqgLXuzdQXSi6q4/tdSLqdKDH9jTxhPFWdnGRfl4sOK1VsRCqjvmev2N80jO
 Bz5cTDFwL0JIidUhqDo4xjUl6xErRew=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-SxybJ3ixO_ul-NO1bJ2Tow-1; Thu, 28 Jan 2021 04:38:33 -0500
X-MC-Unique: SxybJ3ixO_ul-NO1bJ2Tow-1
Received: by mail-qk1-f197.google.com with SMTP id l124so3727026qke.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 01:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=peY5q429sbQ3MYFtVN+MGaNN8pbAkRilLJ9ppq1B7Ww=;
 b=Ia4ItHDD8NElU7Aa4VS7WP09Iml2uINYNXabmoccGxateM1ZOLgsIqjo7BdYdb315X
 h4eLb7UtjAXa+0t8lISR9mDnZ3tyCorlHAzn4YD3SRCc+438/giexEuzX24dyOAm6Feh
 mB3Vv9KoWYdq+5YxxF3lzedz5J3B5lYsiimzjp2GDzmQz+lth9fMq5QGOYE1N3lBuP6Q
 u5nfjT7yO9OHbcMZ0vSYsBftWfPKLvD7QZLeN7KFrIoxAM+xvMSpjRiffhtEPFn9YWw0
 bxYV6SrA8qDmyESAXlQzyy23/EU+ogH5qoTS4Ll+9ligdSOJnGx+9Ygy3BemJWOFHOVG
 7HkQ==
X-Gm-Message-State: AOAM532witmk6wdwNXHGbcIXRnx2dzHbGRrvIWYgmn9IMZ7siZPvazsX
 3TozDVGDPzJXd1dEFQVEPjuiWPLAqUe3x8p8tUu8ZUyP35EOdePDZY7uO6sbKcaHenYP5Fb9vn7
 hjkxqGw98ISD+pAz3S5yuCdSUgCk6r+k=
X-Received: by 2002:a37:88b:: with SMTP id 133mr14196293qki.425.1611826713351; 
 Thu, 28 Jan 2021 01:38:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0avVXuiSmt04L89hZ/ZMivaUy+R9WVjpJW41/hHyJQQCA1AT54KqBn54mwkwBKG1Sqg+Z4EjzmVu3kTIuF4U=
X-Received: by 2002:a37:88b:: with SMTP id 133mr14196285qki.425.1611826713114; 
 Thu, 28 Jan 2021 01:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20210127204449.745365-1-eperezma@redhat.com>
 <ad299544-8762-a5fd-e102-1cf9829131fb@redhat.com>
In-Reply-To: <ad299544-8762-a5fd-e102-1cf9829131fb@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 28 Jan 2021 10:37:57 +0100
Message-ID: <CAJaqyWfUaS9+xKJ8FM9JHnu7YBP9=p9FjNKG067X0waeiVhAXQ@mail.gmail.com>
Subject: Re: [PATCH] vhost-user: Check for iotlb callback in iotlb_miss
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason.

On Thu, Jan 28, 2021 at 3:32 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/28 =E4=B8=8A=E5=8D=884:44, Eugenio P=C3=A9rez wrote:
> > Not registering this can lead to vhost_backend_handle_iotlb_msg and
> > vhost_device_iotlb_miss if backend issue a miss after qemu vhost device
> > stop.
> >
> > This causes a try to access dev->vdev->dma_as with vdev =3D=3D NULL.
>
>
> Hi Eugenio:
>
> What condition can we get this? Did you mean we receive IOTLB_MISS
> before vhost_dev_start()?
>

In the VM reboot case, yes, between vhost_dev_stop() and
vhost_dev_start(). But I can reproduce the bug in VM shutdown too,
with no vhost_dev_start expected.

I didn't try to send IOTLB_MISS before starting vhost_dev, but this
patch should solve that problem too.

I think we can get this with whatever malicious/buggy vhost-user
backend sending unexpected iotlb misses, but I didn't test so deeply.

> If yes, it looks to me a bug somewhere else.

Where should I look for it?

Thanks!

>
> Thanks
>
>
> >
> > Reproduced rebooting a guest with testpmd in txonly forward mode.
> >   #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
> >       dev=3Ddev@entry=3D0x55a0012f6680, iova=3D10245279744, write=3D1)
> >       at ../hw/virtio/vhost.c:1013
> >   #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
> >       imsg=3D0x7ffddcfd32c0, dev=3D0x55a0012f6680)
> >       at ../hw/virtio/vhost-backend.c:411
> >   #2  vhost_backend_handle_iotlb_msg (dev=3Ddev@entry=3D0x55a0012f6680,
> >       imsg=3Dimsg@entry=3D0x7ffddcfd32c0)
> >       at ../hw/virtio/vhost-backend.c:404
> >   #3  0x0000559fffeded7b in slave_read (opaque=3D0x55a0012f6680)
> >       at ../hw/virtio/vhost-user.c:1464
> >   #4  0x000055a0000c541b in aio_dispatch_handler (
> >       ctx=3Dctx@entry=3D0x55a0010a2120, node=3D0x55a0012d9e00)
> >       at ../util/aio-posix.c:329
> >
> > Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-user.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index 2fdd5daf74..a49b2229fb 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -238,6 +238,7 @@ struct vhost_user {
> >       /* Shared between vhost devs of the same virtio device */
> >       VhostUserState *user;
> >       int slave_fd;
> > +    bool iotlb_enabled;
> >       NotifierWithReturn postcopy_notifier;
> >       struct PostCopyFD  postcopy_fd;
> >       uint64_t           postcopy_client_bases[VHOST_USER_MAX_RAM_SLOTS=
];
> > @@ -1461,7 +1462,11 @@ static void slave_read(void *opaque)
> >
> >       switch (hdr.request) {
> >       case VHOST_USER_SLAVE_IOTLB_MSG:
> > -        ret =3D vhost_backend_handle_iotlb_msg(dev, &payload.iotlb);
> > +        if (likely(u->iotlb_enabled)) {
> > +            ret =3D vhost_backend_handle_iotlb_msg(dev, &payload.iotlb=
);
> > +        } else {
> > +            ret =3D -EFAULT;
> > +        }
> >           break;
> >       case VHOST_USER_SLAVE_CONFIG_CHANGE_MSG :
> >           ret =3D vhost_user_slave_handle_config_change(dev);
> > @@ -2044,7 +2049,8 @@ static int vhost_user_send_device_iotlb_msg(struc=
t vhost_dev *dev,
> >
> >   static void vhost_user_set_iotlb_callback(struct vhost_dev *dev, int =
enabled)
> >   {
> > -    /* No-op as the receive channel is not dedicated to IOTLB messages=
. */
> > +    struct vhost_user *u =3D dev->opaque;
> > +    u->iotlb_enabled =3D enabled;
> >   }
> >
> >   static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *conf=
ig,
>


