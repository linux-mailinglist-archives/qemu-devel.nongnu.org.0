Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32435BBF8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:20:13 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrno-0004VO-6E
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVrn2-00045T-Ln
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVrmz-0005lT-0c
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618215559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATztAEKVAX+reqPFFQ7LhG3UdNPbxsT+obx0XkKAA0U=;
 b=PdreTCygIwRlo+PFoNrOsVzTPAHn7dVYxyWJ85Q3EI2jjTN9sksfw7ZB4FPaMlVkwjz55s
 4i04HVkxXGSl7Whb7a9BFkMPqhh4Xsvonpq21AyyoSyBAn5ZnqmOnj7D5OKvu/7ru9ZwI1
 IrGOxroUzwOvllY4Jnn08ihsc7iBG9I=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-yMIJ-YXMM_Kob6BpA60fJg-1; Mon, 12 Apr 2021 04:19:18 -0400
X-MC-Unique: yMIJ-YXMM_Kob6BpA60fJg-1
Received: by mail-pl1-f198.google.com with SMTP id
 z12-20020a170903018cb02900e5e0c43d00so2810854plg.0
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ATztAEKVAX+reqPFFQ7LhG3UdNPbxsT+obx0XkKAA0U=;
 b=iQ+ZZQAIKQkCY4ioarA5KZhPAY7IVV0H3mj4eXWCjdf3P5gzBP/rpRPB+voXYnjwWk
 MtO1HDQoKdZ2awFkI2BvR3rshkxA0HKMEWXl71xxEQi8ww3BDZZ1APzaU2VYgfHoC9Gw
 qYFZ5ljI9pp/fifdMFEPZ0UUvlP149oU53IcNxp1+9a6y/XOFKD3gP4/T35PUXe8sf2j
 RFdu5qLzLyFmyi3FMOqtSA+VxMCH+bst6o1wwre0GwY7Ix/fGtGBQ6yGRatGC/piW3v3
 NjhlZgWmPOhI2zgPZYEZW7+Yg92xU1ht1gQJ5lTdDQnAQoBH17G3h0WynpsWWQNqjVpB
 X5+A==
X-Gm-Message-State: AOAM530sL2hjplOecg0qo4XwIBPgTekyIbGGRSoVvHOi+j3GSdVTynXR
 oYthLoLWyLK73M35WUrLku0t5n4H4NzVTKyr+lGwOKMANWuMZc+C3jzUgZzWUnK7pUs4jCpcmIm
 mzu3z2ctfu7S9YkAX0zdxgV0tqOK0+fc=
X-Received: by 2002:a17:902:6b81:b029:ea:dcc5:b841 with SMTP id
 p1-20020a1709026b81b02900eadcc5b841mr7564333plk.29.1618215556836; 
 Mon, 12 Apr 2021 01:19:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCLZksv4XuxHuGs5UPz1opBhO6tbEv/zh9QCBdtR6sV94vcOzyi4BEm11+ARszuvWKXxE2ow9hRrDwxPpf0yY=
X-Received: by 2002:a17:902:6b81:b029:ea:dcc5:b841 with SMTP id
 p1-20020a1709026b81b02900eadcc5b841mr7564315plk.29.1618215556614; Mon, 12 Apr
 2021 01:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-5-lulu@redhat.com>
 <d23aa6a5-8794-c61e-f84c-1d0f96c9e5d9@redhat.com>
In-Reply-To: <d23aa6a5-8794-c61e-f84c-1d0f96c9e5d9@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 12 Apr 2021 16:18:40 +0800
Message-ID: <CACLfguVp1sw_D0905Y1t_pApkNUcag3O0nzH59cq-BCfq=btMQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] vhost-vdpa: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 3:24 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/8 =E4=B8=8B=E5=8D=885:38, Cindy Lu =E5=86=99=E9=81=93:
> > Add support for configure interrupt. Set the notifier's fd to
> > the kernel driver when vdpa start. also set -1 while vdpa stop.
> > then the kernel will release the related resource
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 26 +++++++++++++++++++++++++-
> >   1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 9ba2a2bed4..7825366f64 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -467,11 +467,33 @@ static int vhost_vdpa_get_config(struct vhost_dev=
 *dev, uint8_t *config,
> >       }
> >       return ret;
> >    }
> > -
>
>
> Let's keep this blank line.
>
>
sure will fix this
> > +static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
> > +                                struct VirtIODevice *vdev, bool start)
> > +{
> > +    int fd =3D 0;
> > +    int r =3D 0;
> > +    if (!(dev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
> > +        return;
> > +    }
> > +    if (start) {
> > +        fd =3D event_notifier_get_fd(&vdev->config_notifier);
> > +        r =3D dev->vhost_ops->vhost_set_config_call(dev, &fd);
>
>
> So you introduce a general vhost ops but it's call by devic specific
> code (vhost-vdpa).
>
> Any reason that we don't do that in vhost_dev_start/vhost_dev_stop?
>
> Thanks
>
sure, will move this part to dev_start/stop
>
> > +        if (!r) {
> > +            vdev->use_config_notifier =3D true;
> > +            event_notifier_set(&vdev->config_notifier);
> > +        }
> > +    } else {
> > +        fd =3D -1;
> > +        vdev->use_config_notifier =3D false;
> > +        r =3D dev->vhost_ops->vhost_set_config_call(dev, &fd);
> > +    }
> > +    return;
> > +}
> >   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> >       trace_vhost_vdpa_dev_start(dev, started);
> > +    VirtIODevice *vdev =3D dev->vdev;
> >       if (started) {
> >           uint8_t status =3D 0;
> >           memory_listener_register(&v->listener, &address_space_memory)=
;
> > @@ -479,8 +501,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *=
dev, bool started)
> >           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> >           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
> >
> > +        vhost_vdpa_config_notify_start(dev, vdev, true);
> >           return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
> >       } else {
> > +        vhost_vdpa_config_notify_start(dev, vdev, false);
> >           vhost_vdpa_reset_device(dev);
> >           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                      VIRTIO_CONFIG_S_DRIVER);
>


