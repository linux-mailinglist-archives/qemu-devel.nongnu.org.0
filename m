Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC521543C79
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:08:53 +0200 (CEST)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz12y-0001Vm-LJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz11G-0008Vp-NZ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz11B-0004EJ-3W
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654715220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwcxklOyCpmhVPiK7Z0bFVbCyVcmAr3YPqFAEXAwUls=;
 b=RE6lsff47kAC99btFzrfU1u+tawgX4pTxnv8idhXFJPuV2K+CzPJSZFk6srM0YnQjcw2b1
 Wzur7dfc9YEMdmOWbvN10VbQIaTg8Yltzxt27qO3QrVnuJObvN7IopNX6tLg18W5vR6qcv
 ch8855mRNgC8iG1TFp9hVBrb+Y2jHbc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-9noy7C3PMq24108iNN0vUw-1; Wed, 08 Jun 2022 15:06:57 -0400
X-MC-Unique: 9noy7C3PMq24108iNN0vUw-1
Received: by mail-qt1-f198.google.com with SMTP id
 r9-20020a05622a034900b00304ea5d41ddso8570877qtw.20
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nwcxklOyCpmhVPiK7Z0bFVbCyVcmAr3YPqFAEXAwUls=;
 b=YBFRPnJxPWvSE0ouQ4cFqsjZxpKg5PkrykXpItAQ8fLzEwNm8VZU+C6plP0V3BKDsd
 xqLovRx+2zMBdnS9qQ4VA58G3MEKi0gA+YhjXobJeSgLtH6smlJgqgJEY284XRgIn6wj
 SWAuGjPKDM3fbf1Xzq4xWLhDsxeal8EpaSxKPH37IDqpLq4JGQgChwt5JJf1wcP54rhB
 OE6P9Zyar9ReRqTXeuup0FxmSMXznGeMB/web/vmmisbq8HYp18FU7T9OiTNmZNAS/JI
 tlcHQsWiSDlJz8oPSLfChY7ip6tSn1bgPZ9DBJVZh4nXEZa3Ai2OCTJu5NGB2onv7NWV
 EIVA==
X-Gm-Message-State: AOAM532n5uYT/1b/4UyvgL2JLAs5Z3TVVNuoBETRvbIrvB4CwR8Y2bHQ
 G7Sl7btr6U3BEcEGving/l2UFLUN5nGf3h+EnMyb3G/aEcmDcq5j7m14gRu5GCWgO2kYfU6xj/+
 ziT/NaiIVT/2oh1rT34/ih5Z0mIMwHXM=
X-Received: by 2002:a05:622a:1048:b0:305:89c:3ec4 with SMTP id
 f8-20020a05622a104800b00305089c3ec4mr2165039qte.582.1654715216168; 
 Wed, 08 Jun 2022 12:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzv05QWDf4WA757VW1SrXkSOXxCJbuut2ubMKLsRf6dbLe+xbu4vsP2LMa2uJ81SOHSt6mCBavCQgeEKYdDrM=
X-Received: by 2002:a05:622a:1048:b0:305:89c:3ec4 with SMTP id
 f8-20020a05622a104800b00305089c3ec4mr2165020qte.582.1654715215902; Wed, 08
 Jun 2022 12:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-13-eperezma@redhat.com>
 <21204df4-3e92-d1b7-042c-30f769c97893@redhat.com>
In-Reply-To: <21204df4-3e92-d1b7-042c-30f769c97893@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 21:06:19 +0200
Message-ID: <CAJaqyWf1bMhxePBjPz=Z5RCRAWeAV2__PVM6pCLaKCgsyV3niw@mail.gmail.com>
Subject: Re: [RFC PATCH v8 12/21] vdpa: delay set_vring_ready after DRIVER_OK
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
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

On Wed, Jun 8, 2022 at 6:21 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > To restore the device in the destination of a live migration we send th=
e
> > commands through control virtqueue. For a device to read CVQ it must
> > have received DRIVER_OK status bit.
> >
> > However this open a window where the device could start receiving
> > packets in rx queue 0 before it receive the RSS configuration. To avoid
> > that, we will not send vring_enable until all configuration is used by
> > the device.
> >
> > As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> I may miss something, but it looks to me this should be an independent
> patch or it should depend on live migration series.
>

With x-svq it's possible to migrate a VM, because we don't need to
stop the device: VMM always knows the vq state to program in the
destination (assuming no need for inflight etc).

But it will have better context in the next series for sure.

Thanks!

> Thanks
>
>
> > ---
> >   hw/virtio/vhost-vdpa.c | 20 +++++++++++++++-----
> >   1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 31b3d4d013..13e5e2a061 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -748,13 +748,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_d=
ev *dev, int idx)
> >       return idx;
> >   }
> >
> > +/**
> > + * Set ready all vring of the device
> > + *
> > + * @dev: Vhost device
> > + */
> >   static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> >   {
> >       int i;
> >       trace_vhost_vdpa_set_vring_ready(dev);
> > -    for (i =3D 0; i < dev->nvqs; ++i) {
> > +    for (i =3D 0; i < dev->vq_index_end; ++i) {
> >           struct vhost_vring_state state =3D {
> > -            .index =3D dev->vq_index + i,
> > +            .index =3D i,
> >               .num =3D 1,
> >           };
> >           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> > @@ -1117,7 +1122,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev =
*dev, bool started)
> >           if (unlikely(!ok)) {
> >               return -1;
> >           }
> > -        vhost_vdpa_set_vring_ready(dev);
> >       } else {
> >           ok =3D vhost_vdpa_svqs_stop(dev);
> >           if (unlikely(!ok)) {
> > @@ -1131,16 +1135,22 @@ static int vhost_vdpa_dev_start(struct vhost_de=
v *dev, bool started)
> >       }
> >
> >       if (started) {
> > +        int r;
> >           memory_listener_register(&v->listener, &address_space_memory)=
;
> > -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > +        r =3D vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > +        if (unlikely(r)) {
> > +            return r;
> > +        }
> > +        vhost_vdpa_set_vring_ready(dev);
> >       } else {
> >           vhost_vdpa_reset_device(dev);
> >           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                      VIRTIO_CONFIG_S_DRIVER);
> >           memory_listener_unregister(&v->listener);
> >
> > -        return 0;
> >       }
> > +
> > +    return 0;
> >   }
> >
> >   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t ba=
se,
>


