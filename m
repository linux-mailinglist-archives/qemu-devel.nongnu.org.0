Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AF606E24
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 05:09:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliPR-0003NO-ED
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:09:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliEN-0007HD-Vr
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 22:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliED-00070n-71
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliDz-0006d7-PJ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 22:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666321050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaujB546uz5TU4igWmYYvt8fvYIzMH272irUSr9Oje4=;
 b=AQ/tCk/Uu0mz+3UnmmtdrjWTHCoFwOppfbH1zIQXcTdDVj4Vu5lEG5tlsqYefHN52jMJPh
 XuuCryY9POJHGxJ17v0fLEM9k6foaiy2nzjEWvGRqfX0CiEa7l26AIV1HUJaxs1huCOtrG
 TgdHPAs7VJjntNCrbBYFSRXcnHKRxUc=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-6AJcNgtBO8WsNmNPdE7qXQ-1; Thu, 20 Oct 2022 22:57:29 -0400
X-MC-Unique: 6AJcNgtBO8WsNmNPdE7qXQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 a11-20020a4a80cb000000b004805cba57f1so914505oog.11
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 19:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaujB546uz5TU4igWmYYvt8fvYIzMH272irUSr9Oje4=;
 b=DqyE2t62LmtCs2wIuP0zy1gv+m4HJY0O5oxJoBWxDrsBj7eiXcaMB5JZxQoyeOV5jd
 oToOcQR6FUeGcSZxih6Fx1PxMWIQKJDeMauKAyWEQVSlJlunPRoxTYCC3IOzjVB7Gy9+
 A/XVBcnYRrY7LACs0kEJ39sP331OMKUdhUybB/LUafnj4bsbx/wOgLnWyrcTl4YcCmXw
 V3bDmVdsvdT1d+xMfjQTNAcy6OElDFUK39pZ2Ub6SW/dEteuR3RBKKNSka/yenzgZXKD
 2x2YZ73nvQ+DriVvG7Bg4EyeO8p29KWZv3r1kZmYkstmf9qldIanhJydItxiuMTO14Hb
 +jgQ==
X-Gm-Message-State: ACrzQf2pjnc1q8qPK3T1KGXo6uLUwNbTcGWi/l0Zw4xBMGDRFHbHJ8PB
 QRIyUwCsbmH2XwqYWr+2dn7ej50hKsNcnEncdFb2Xu9wS1177rqynUKzfMbANzw/wOPex2ne/Us
 CFI45uIYnYnSbPmGgXegh0VVVy3BiBaM=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr11039668oab.280.1666321045540; 
 Thu, 20 Oct 2022 19:57:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SGvOrBDb5CisPYSc0zQBixlj6pmuN9p6ILPQC3Y1e2RheGq9IO2SgOT2qgfYsZbUk7bvVhXoFn4lJv5BJ0qU=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr11039661oab.280.1666321045335; Thu, 20
 Oct 2022 19:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
 <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
 <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
In-Reply-To: <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 10:57:13 +0800
Message-ID: <CACGkMEs9mc5pqRr8XNhVw8pvQZ+hvnPRiMmyuzJvNsSU=Cfoxg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] vdpa: Save emulated features list in vhost_vdpa
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 20, 2022 at 2:34 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > At this moment only _F_LOG is added there.
> > >
> > > However future patches add features that depend on the kind of device=
.
> > > In particular, only net devices can add VIRTIO_F_GUEST_ANNOUNCE. So
> > > let's allow vhost_vdpa creator to set custom emulated device features=
.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  include/hw/virtio/vhost-vdpa.h | 2 ++
> > >  hw/virtio/vhost-vdpa.c         | 8 ++++----
> > >  net/vhost-vdpa.c               | 4 ++++
> > >  3 files changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> > > index 1111d85643..50083e1e3b 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
> > >      bool iotlb_batch_begin_sent;
> > >      MemoryListener listener;
> > >      struct vhost_vdpa_iova_range iova_range;
> > > +    /* VirtIO device features that can be emulated by qemu */
> > > +    uint64_t added_features;
> >
> > Any reason we need a per vhost_vdpa storage for this? Or is there a
> > chance that this field could be different among the devices?
> >
>
> Yes, one device could support SVQ and the other one could not support
> it because of different feature sets for example.

Right, but for those devices that don't support SVQ, we don't even
need mediation for feature like F_LOG and _F_STATUS?

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >      uint64_t acked_features;
> > >      bool shadow_vqs_enabled;
> > >      /* IOVA mapping used by the Shadow Virtqueue */
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 7468e44b87..ddb5e29288 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct vhost_d=
ev *dev,
> > >
> > >          v->acked_features =3D features;
> > >
> > > -        /* We must not ack _F_LOG if SVQ is enabled */
> > > -        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > > +        /* Do not ack features emulated by qemu */
> > > +        features &=3D ~v->added_features;
> > >      }
> > >
> > >      trace_vhost_vdpa_set_features(dev, features);
> > > @@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(struct vhost=
_dev *dev,
> > >      int ret =3D vhost_vdpa_get_dev_features(dev, features);
> > >
> > >      if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > > -        /* Add SVQ logging capabilities */
> > > -        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > > +        /* Add emulated capabilities */
> > > +        *features |=3D v->added_features;
> > >      }
> > >
> > >      return ret;
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index eebf29f5c1..3803452800 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_init(NetCl=
ientState *peer,
> > >      s->vhost_vdpa.index =3D queue_pair_index;
> > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > > +    if (svq) {
> > > +        /* Add SVQ logging capabilities */
> > > +        s->vhost_vdpa.added_features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > > +    }
> > >      if (!is_datapath) {
> > >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_=
size(),
> > >                                              vhost_vdpa_net_cvq_cmd_p=
age_len());
> > > --
> > > 2.31.1
> > >
> >
>


