Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA56057D4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 09:03:25 +0200 (CEST)
Received: from localhost ([::1]:38006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olPaN-0005RB-LE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 03:03:23 -0400
Received: from [::1] (port=38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olPRz-0005vq-Hn
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 02:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olP8m-0002ml-Iv
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olP8k-0005Iy-NX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 02:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666247687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc2mYiXXYGu5uzK23Pd21Zl2xcgArM5mTXgn0rUNhAI=;
 b=MHwKFbbKk/pO36t0Vn1zhTzVSRnoY+UaOAluC+iAC9F9jIQRDT1eiQ8cdSOTjT1NbKSOjv
 2CIahXBBnoUDB43q30pNIMf8lFG9fmbvSV4SIsUIldolFCSCkDPlhjspYM97JcapRn2FVM
 sO5+o7nRF5RCSJBbfjgSlzvIpiqgKNQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-FYqNVNSfNz-I-l4KNNEBBA-1; Thu, 20 Oct 2022 02:34:46 -0400
X-MC-Unique: FYqNVNSfNz-I-l4KNNEBBA-1
Received: by mail-pl1-f200.google.com with SMTP id
 y1-20020a17090322c100b001853a004c1bso12777148plg.19
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 23:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mc2mYiXXYGu5uzK23Pd21Zl2xcgArM5mTXgn0rUNhAI=;
 b=EsJGoJAo5y+MCqiSXTdsFAyJFqmJ0zbFFJqrZLmfJABZga1ii9zUuc5OJTWK0uLc+i
 0TfaY8FflHPccpY62eu6kt0N9Zz9B/JVjubd2sh98pJPHyQCstyHA9zVRiNPv71x9npF
 UMZEs+Q/hVZEdCQIKsxu6Qm5SinKuZdbhg6X7YoKQRhF83cbP/mXhm3h6KrOshj2dxYe
 8quilfEEyvEBTkHTRch/CNynGr2yoLF2v/O6O7ZolARH2lbHtaHDjPdPuShxdH97yHxN
 TyTpc+PVWdTalKeOTmUHQoFNZ6Qa75kTxmfFhf41Y3gKbJ3zR9Pi/V1YBp9udGBQm4U8
 SScg==
X-Gm-Message-State: ACrzQf0EjsYzaxwYcAB3DdB3uQyWUUS6WxT751VSeUdIULIFyjZWaDgU
 2BOCiXo3gtSqiVZojcpUHqXrkc2Chm68YayFbH4f1zxUMHsKth7qJMAQu78873l1mA5ikaXR9r0
 eHfQBZ++Zb5hne6jTFJyh72DbtWJFt1A=
X-Received: by 2002:a17:90a:6845:b0:210:7ef5:ab99 with SMTP id
 e5-20020a17090a684500b002107ef5ab99mr5504539pjm.80.1666247683161; 
 Wed, 19 Oct 2022 23:34:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53SXSexWh3/JYW81xfgSZ5p2j6CYAj5lRtzntilBXCbkVinjM8JqrR4aAPVwneTy2nVNXzcLthAyqnElTWW0Y=
X-Received: by 2002:a17:90a:6845:b0:210:7ef5:ab99 with SMTP id
 e5-20020a17090a684500b002107ef5ab99mr5504512pjm.80.1666247682906; Wed, 19 Oct
 2022 23:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
 <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
In-Reply-To: <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 20 Oct 2022 08:34:06 +0200
Message-ID: <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] vdpa: Save emulated features list in vhost_vdpa
To: Jason Wang <jasowang@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 20, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > At this moment only _F_LOG is added there.
> >
> > However future patches add features that depend on the kind of device.
> > In particular, only net devices can add VIRTIO_F_GUEST_ANNOUNCE. So
> > let's allow vhost_vdpa creator to set custom emulated device features.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h | 2 ++
> >  hw/virtio/vhost-vdpa.c         | 8 ++++----
> >  net/vhost-vdpa.c               | 4 ++++
> >  3 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 1111d85643..50083e1e3b 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
> >      bool iotlb_batch_begin_sent;
> >      MemoryListener listener;
> >      struct vhost_vdpa_iova_range iova_range;
> > +    /* VirtIO device features that can be emulated by qemu */
> > +    uint64_t added_features;
>
> Any reason we need a per vhost_vdpa storage for this? Or is there a
> chance that this field could be different among the devices?
>

Yes, one device could support SVQ and the other one could not support
it because of different feature sets for example.

Thanks!

> Thanks
>
> >      uint64_t acked_features;
> >      bool shadow_vqs_enabled;
> >      /* IOVA mapping used by the Shadow Virtqueue */
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 7468e44b87..ddb5e29288 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct vhost_dev=
 *dev,
> >
> >          v->acked_features =3D features;
> >
> > -        /* We must not ack _F_LOG if SVQ is enabled */
> > -        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > +        /* Do not ack features emulated by qemu */
> > +        features &=3D ~v->added_features;
> >      }
> >
> >      trace_vhost_vdpa_set_features(dev, features);
> > @@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(struct vhost_d=
ev *dev,
> >      int ret =3D vhost_vdpa_get_dev_features(dev, features);
> >
> >      if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > -        /* Add SVQ logging capabilities */
> > -        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > +        /* Add emulated capabilities */
> > +        *features |=3D v->added_features;
> >      }
> >
> >      return ret;
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index eebf29f5c1..3803452800 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >      s->vhost_vdpa.index =3D queue_pair_index;
> >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > +    if (svq) {
> > +        /* Add SVQ logging capabilities */
> > +        s->vhost_vdpa.added_features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > +    }
> >      if (!is_datapath) {
> >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_si=
ze(),
> >                                              vhost_vdpa_net_cvq_cmd_pag=
e_len());
> > --
> > 2.31.1
> >
>


