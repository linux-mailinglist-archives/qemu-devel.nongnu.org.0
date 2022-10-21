Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423EE6073C1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:17:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo9O-0004RF-4y
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:17:14 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnq1-0005gx-Tz
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olnpo-00057r-1e
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:56:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olnpm-00046I-Cr
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666342613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvp/GIhG5bIckQK8XcpP4LthShB/WB6Ksn47XF7IXfs=;
 b=XXjSVFM3keiLn2smS9RoN+7wvmlJAuW6pZY6+LBwcqjcMK4cV9s829qrXSfAXbAD4H3inc
 skFoiCnwkKG25vesiPa2vjd8yzLFAhjML8C6+0zGRQJuKyigNabYXcqIih+fTiJEhQ+E+3
 xLrCnrmC2ciMzrBe+4uhUkghM5Y55sA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-bz8Fa6JKPb2AHCmmSizhlw-1; Fri, 21 Oct 2022 04:56:52 -0400
X-MC-Unique: bz8Fa6JKPb2AHCmmSizhlw-1
Received: by mail-pg1-f197.google.com with SMTP id
 7-20020a630007000000b0045bb8a49ae6so1113195pga.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvp/GIhG5bIckQK8XcpP4LthShB/WB6Ksn47XF7IXfs=;
 b=0uODsUauJmvb8mutt3Ix5wtmKyD4Htq0aMs/ANsDIMClegopioBJSM/oHG/D9Mwdmg
 7yGPDkb2W0ydcz3j81snCqhtUWL1rasyniSmHxEjqwXsApYlqjUhJIQmT1INS7jqF7XV
 TiLV4GSuIiutCFseZTmgZ67eq78VMcBvRrjhI41P7r+eN4kQdUBhNk98qbXHQF0FgPFw
 oFPJBbPkykanRTZBCCqggW0Hv2LkODyUy77p/kKLaFC2f8re+0peIlTUUGAs8xeLzN1O
 MR86Ktd194oysiBsMV6uDKrcUOUZCSesGkeqU9n1HwVEJ+uWh1W/elbcs8Jap1lUJCII
 Yo4A==
X-Gm-Message-State: ACrzQf36IUQT7JLQ962ivSumsedNLHsLPg6wfd9V+7k/S6h4il4Cs03X
 bC+T+awdNvVMlt5CxS29YwkFvTmp5fStyJl8I5UnK7vmMrxy+pi2MV7Rg4RPatqH0UVSWB3WQt1
 +EBnkcdM1mwGttN1BVVtm8HCMM67RbD4=
X-Received: by 2002:a17:903:52:b0:186:5ce5:8016 with SMTP id
 l18-20020a170903005200b001865ce58016mr10441690pla.17.1666342609606; 
 Fri, 21 Oct 2022 01:56:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65BVFTfcoQxJGMjuAYIxtjDcPZwKKJexa6Tbk141N7eSg0xzALzXOdii3RHFQXiqCoW5IipbZlqhNl808dt+s=
X-Received: by 2002:a17:903:52:b0:186:5ce5:8016 with SMTP id
 l18-20020a170903005200b001865ce58016mr10441658pla.17.1666342609314; Fri, 21
 Oct 2022 01:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
 <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
 <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
 <CACGkMEs9mc5pqRr8XNhVw8pvQZ+hvnPRiMmyuzJvNsSU=Cfoxg@mail.gmail.com>
In-Reply-To: <CACGkMEs9mc5pqRr8XNhVw8pvQZ+hvnPRiMmyuzJvNsSU=Cfoxg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 21 Oct 2022 10:56:12 +0200
Message-ID: <CAJaqyWfCn0gPc=+GY-0ASutwSP+1-AyFhp0XO4v6K+3JJZktuA@mail.gmail.com>
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
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Oct 21, 2022 at 4:57 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 2:34 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Thu, Oct 20, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.c=
om> wrote:
> > > >
> > > > At this moment only _F_LOG is added there.
> > > >
> > > > However future patches add features that depend on the kind of devi=
ce.
> > > > In particular, only net devices can add VIRTIO_F_GUEST_ANNOUNCE. So
> > > > let's allow vhost_vdpa creator to set custom emulated device featur=
es.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  include/hw/virtio/vhost-vdpa.h | 2 ++
> > > >  hw/virtio/vhost-vdpa.c         | 8 ++++----
> > > >  net/vhost-vdpa.c               | 4 ++++
> > > >  3 files changed, 10 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vho=
st-vdpa.h
> > > > index 1111d85643..50083e1e3b 100644
> > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
> > > >      bool iotlb_batch_begin_sent;
> > > >      MemoryListener listener;
> > > >      struct vhost_vdpa_iova_range iova_range;
> > > > +    /* VirtIO device features that can be emulated by qemu */
> > > > +    uint64_t added_features;
> > >
> > > Any reason we need a per vhost_vdpa storage for this? Or is there a
> > > chance that this field could be different among the devices?
> > >
> >
> > Yes, one device could support SVQ and the other one could not support
> > it because of different feature sets for example.
>
> Right, but for those devices that don't support SVQ, we don't even
> need mediation for feature like F_LOG and _F_STATUS?
>

No, and we cannot offer it to the guest either.

> Thanks
>
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >      uint64_t acked_features;
> > > >      bool shadow_vqs_enabled;
> > > >      /* IOVA mapping used by the Shadow Virtqueue */
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index 7468e44b87..ddb5e29288 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -660,8 +660,8 @@ static int vhost_vdpa_set_features(struct vhost=
_dev *dev,
> > > >
> > > >          v->acked_features =3D features;
> > > >
> > > > -        /* We must not ack _F_LOG if SVQ is enabled */
> > > > -        features &=3D ~BIT_ULL(VHOST_F_LOG_ALL);
> > > > +        /* Do not ack features emulated by qemu */
> > > > +        features &=3D ~v->added_features;
> > > >      }
> > > >
> > > >      trace_vhost_vdpa_set_features(dev, features);
> > > > @@ -1244,8 +1244,8 @@ static int vhost_vdpa_get_features(struct vho=
st_dev *dev,
> > > >      int ret =3D vhost_vdpa_get_dev_features(dev, features);
> > > >
> > > >      if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > > > -        /* Add SVQ logging capabilities */
> > > > -        *features |=3D BIT_ULL(VHOST_F_LOG_ALL);
> > > > +        /* Add emulated capabilities */
> > > > +        *features |=3D v->added_features;
> > > >      }
> > > >
> > > >      return ret;
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index eebf29f5c1..3803452800 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -599,6 +599,10 @@ static NetClientState *net_vhost_vdpa_init(Net=
ClientState *peer,
> > > >      s->vhost_vdpa.index =3D queue_pair_index;
> > > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > > > +    if (svq) {
> > > > +        /* Add SVQ logging capabilities */
> > > > +        s->vhost_vdpa.added_features |=3D BIT_ULL(VHOST_F_LOG_ALL)=
;
> > > > +    }
> > > >      if (!is_datapath) {
> > > >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_pag=
e_size(),
> > > >                                              vhost_vdpa_net_cvq_cmd=
_page_len());
> > > > --
> > > > 2.31.1
> > > >
> > >
> >
>


