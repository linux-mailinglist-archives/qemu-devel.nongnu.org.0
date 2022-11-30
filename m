Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FE63CFCA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 08:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0HiF-0008Gn-5f; Wed, 30 Nov 2022 02:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0HiB-0008GR-Qk
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:40:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p0HiA-00084j-00
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 02:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669794050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqsdq4+gbDbt6QLOdb+PUFxkECVhWTcDal9kfMorJH0=;
 b=Ku5GM7CN+DG7n2r8uJ0By2TKrr9zys76cJBqzc2LxqdnYSNwB7Fp33rVJp69h74+5zBL+k
 wKYf2LGUrCbqrtRUXxBL/bxi70AMyAQ9UWTe4EE3lfD948ZvvJ3gLfbp13Dtm0Dlhn1iWu
 1FvUCJf/woOeKGoshbBvu3VZm6GmzPI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-sE41UdMuMhOAyVymmrPZjg-1; Wed, 30 Nov 2022 02:40:46 -0500
X-MC-Unique: sE41UdMuMhOAyVymmrPZjg-1
Received: by mail-ej1-f71.google.com with SMTP id
 oz34-20020a1709077da200b007adc8d68e90so7947104ejc.11
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 23:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fqsdq4+gbDbt6QLOdb+PUFxkECVhWTcDal9kfMorJH0=;
 b=F+JJJxwlLI3ISuLRovUeSNEtgrNQSYZgk91g0eqKLRR31remSNBMh6uOTiVgg/pNL3
 +w/KmRtfY0FO59Bz9XKU4L9XyyjO4szwg3fa7Mnl/M1tYqS+Viz19nVQgwKUcybf2KQQ
 mP7Y7MG2dIOHRWHEQTpsvDkoD54VBl5iV/rsuS1PUyEb+SVWCTXdkP+E7eHSewCJZMQS
 cLfcDkQFfoBSlQs8lxp8ZKWGrsu+gfUgCXxYl3XrdxpDmrJ+E76R3J04ekOwEloA1mj9
 osYle7w6wRZVyHX+5wAcuypVJ+At7lGu06HtYxjdzSN6uuQvmrevLoVJaMAeox1vHDwU
 S7lQ==
X-Gm-Message-State: ANoB5pkdzmgNgS7x8Gr+mjObw06L1W9nMLPCM3ZtkTTf7NQ9nRVmUnnd
 XNntyQasQ7NeEoUq1XmGXFEE0hkiS8chLvIzLWGipMgqwWD0X5xglRyVzeK7hykt+MMKl2osmqO
 pY76VxOlAvQdTfwjOtAVBbSHrp6MGons=
X-Received: by 2002:a05:6402:4284:b0:461:8156:e0ca with SMTP id
 g4-20020a056402428400b004618156e0camr357802edc.271.1669794045683; 
 Tue, 29 Nov 2022 23:40:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Ax4pmTEP78aJ8j098xQBZ+I5N2Zza6C/OzSIo5c7paoOyBpi09BnoxT9VtU6GsL1yqGy5ri/VBFxje8vwiRA=
X-Received: by 2002:a05:6402:4284:b0:461:8156:e0ca with SMTP id
 g4-20020a056402428400b004618156e0camr357776edc.271.1669794045408; Tue, 29 Nov
 2022 23:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20221124155158.2109884-1-eperezma@redhat.com>
 <20221124155158.2109884-7-eperezma@redhat.com>
 <CACGkMEubBA9NYR5ynT_2C=iMEk3fph2GEOBvcw73BOuqiFKzJg@mail.gmail.com>
In-Reply-To: <CACGkMEubBA9NYR5ynT_2C=iMEk3fph2GEOBvcw73BOuqiFKzJg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 30 Nov 2022 08:40:07 +0100
Message-ID: <CAJaqyWcR_3vdXLJ4=z+_uaoVN47gEXr7KHx3w6z8HtmqquK7zA@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v8 06/12] vdpa: extract
 vhost_vdpa_svq_allocate_iova_tree
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 30, 2022 at 7:43 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Nov 24, 2022 at 11:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > It can be allocated either if all virtqueues must be shadowed or if
> > vdpa-net detects it can shadow only cvq.
> >
> > Extract in its own function so we can reuse it.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 29 +++++++++++++++++------------
> >  1 file changed, 17 insertions(+), 12 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 88e0eec5fa..9ee3bc4cd3 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -240,6 +240,22 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> >  };
> >
> > +static int vhost_vdpa_get_iova_range(int fd,
> > +                                     struct vhost_vdpa_iova_range *iov=
a_range)
> > +{
> > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > +
> > +    return ret < 0 ? -errno : 0;
> > +}
>
> I don't get why this needs to be moved to net specific code.
>

It was already in net, this code just extracted it in its own function.

It's done in net because iova_tree must be the same for all queuepair
vhost, so we need to allocate before them.

Thanks!

> Thanks
>
> > +
> > +static VhostIOVATree *vhost_vdpa_svq_allocate_iova_tree(int vdpa_devic=
e_fd)
> > +{
> > +    struct vhost_vdpa_iova_range iova_range;
> > +
> > +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > +    return vhost_iova_tree_new(iova_range.first, iova_range.last);
> > +}
> > +
> >  static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
> >  {
> >      VhostIOVATree *tree =3D v->iova_tree;
> > @@ -587,14 +603,6 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >      return nc;
> >  }
> >
> > -static int vhost_vdpa_get_iova_range(int fd,
> > -                                     struct vhost_vdpa_iova_range *iov=
a_range)
> > -{
> > -    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > -
> > -    return ret < 0 ? -errno : 0;
> > -}
> > -
> >  static int vhost_vdpa_get_features(int fd, uint64_t *features, Error *=
*errp)
> >  {
> >      int ret =3D ioctl(fd, VHOST_GET_FEATURES, features);
> > @@ -690,14 +698,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >      }
> >
> >      if (opts->x_svq) {
> > -        struct vhost_vdpa_iova_range iova_range;
> > -
> >          if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> >              goto err_svq;
> >          }
> >
> > -        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range=
.last);
> > +        iova_tree =3D vhost_vdpa_svq_allocate_iova_tree(vdpa_device_fd=
);
> >      }
> >
> >      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> > --
> > 2.31.1
> >
>


