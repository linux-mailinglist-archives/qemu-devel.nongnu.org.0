Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1716A7457
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXSCc-0006oM-Ak; Wed, 01 Mar 2023 14:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXSCW-0006oA-Jb
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:33:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXSCV-00030R-2f
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677699198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rpffg0TK6nYqUM0E+K9lNl0QJW7v3n7iFKfst3E8Uk=;
 b=eAtufDxWOX0dTgMg4wSUhMUSg7Sv/+DNisWT3jhwBC4Jfx26+g3axcJX+DDLXLxTq1adGr
 kOl49+S7aZ+QGlTzFhORmOPXOeBX09SmtmpJOPk3Miqelni/rCB5K4LOnQ3gai51RJySrV
 Ac0ojxqtNyV/7RgER0kMv2y5zQPxy3Q=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-PploW82HN9WTRmjSHQVluw-1; Wed, 01 Mar 2023 14:33:17 -0500
X-MC-Unique: PploW82HN9WTRmjSHQVluw-1
Received: by mail-yb1-f198.google.com with SMTP id
 e195-20020a25e7cc000000b00a1e59ba7ed9so1399284ybh.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677699196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rpffg0TK6nYqUM0E+K9lNl0QJW7v3n7iFKfst3E8Uk=;
 b=FAyUsJ1K84VnylKLCHZT2+7uSwBxY7Lhc5e/S4AW8U8naIsqnML8C4TWsO9oLahkVP
 lobqOtjwIO9pNDU1V7JqaG4O9EWRqkI2+jNom6k5GvX5KxLTQ4TIKmcoghHU58j+E49V
 VSNJDZJ1WpjWDfe09B24m4xzFDAK9waQNeKzR8dxyLFJBcFVN7yfkraVbfhJqET0EcKI
 hJP3EtgGSS7mLeSZLxIEahtu1yt6zcJryw7vPK/Wr7MWJY3w+dXqLmyKfVx/8CNrAtIw
 ZiEmmgwxcSg/uIkoc7X6btXdHPwZaXVRh7s2w3uBkT8S8lurCVeliVJCi7izBF76IAEZ
 Qm1w==
X-Gm-Message-State: AO0yUKXjp3TxwrWEUwsF6QMdpAFom5q1eep15X6yow+BexZtZjffiEUe
 PgpcX9ywqsdBWJx3bJzXir75E+etJ185NtJQwYGckGE+vUPPj+71j9Knt5Q4R2owABmYpSKi0i+
 Ji/5md08yJQTtl4FI1aG7y7eXd2eZv9o=
X-Received: by 2002:a81:ae23:0:b0:535:18be:4126 with SMTP id
 m35-20020a81ae23000000b0053518be4126mr4596994ywh.6.1677699196415; 
 Wed, 01 Mar 2023 11:33:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9y7BBost/h6Dy4E9rqEZkxWpzxm6ZA2mTuUG5IdFBCa1gQQYXNM7M038zyi2C1ffOWmhgIh/oEDi7iQXHdK4g=
X-Received: by 2002:a81:ae23:0:b0:535:18be:4126 with SMTP id
 m35-20020a81ae23000000b0053518be4126mr4596962ywh.6.1677699196183; Wed, 01 Mar
 2023 11:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-13-eperezma@redhat.com>
 <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
 <CACGkMEs13RdzLfU8nZwHT0YsZ_hXy47or4t9jkHCoJ1EVa3q9w@mail.gmail.com>
In-Reply-To: <CACGkMEs13RdzLfU8nZwHT0YsZ_hXy47or4t9jkHCoJ1EVa3q9w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Mar 2023 20:32:40 +0100
Message-ID: <CAJaqyWcUMwchHZ66=o+aayVvsAT78iOnWo0g3jbg4A1TiAupfQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] vdpa: block migration if device has unsupported
 features
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>, 
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
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

On Mon, Feb 27, 2023 at 9:20 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Mon, Feb 27, 2023 at 4:15=E2=80=AFPM Jason Wang <jasowang@redhat.com> =
wrote:
> >
> >
> > =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > A vdpa net device must initialize with SVQ in order to be migratable =
at
> > > this moment, and initialization code verifies some conditions.  If th=
e
> > > device is not initialized with the x-svq parameter, it will not expos=
e
> > > _F_LOG so the vhost subsystem will block VM migration from its
> > > initialization.
> > >
> > > Next patches change this, so we need to verify migration conditions
> > > differently.
> > >
> > > QEMU only supports a subset of net features in SVQ, and it cannot
> > > migrate state that cannot track or restore in the destination.  Add a
> > > migration blocker if the device offer an unsupported feature.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > > v3: add mirgation blocker properly so vhost_dev can handle it.
> > > ---
> > >   net/vhost-vdpa.c | 12 ++++++++----
> > >   1 file changed, 8 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 4f983df000..094dc1c2d0 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> > >                                          int nvqs,
> > >                                          bool is_datapath,
> > >                                          bool svq,
> > > -                                       struct vhost_vdpa_iova_range =
iova_range)
> > > +                                       struct vhost_vdpa_iova_range =
iova_range,
> > > +                                       uint64_t features)
> > >   {
> > >       NetClientState *nc =3D NULL;
> > >       VhostVDPAState *s;
> > > @@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(NetCl=
ientState *peer,
> > >       s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > >       s->vhost_vdpa.iova_range =3D iova_range;
> > >       s->vhost_vdpa.shadow_data =3D svq;
> > > -    if (!is_datapath) {
> > > +    if (queue_pair_index =3D=3D 0) {
> > > +        vhost_vdpa_net_valid_svq_features(features,
> > > +                                          &s->vhost_vdpa.migration_b=
locker);
> >
> >
> > Since we do validation at initialization, is this necessary to valid
> > once again in other places?
>
> Ok, after reading patch 13, I think the question is:
>
> The validation seems to be independent to net, can we valid it once
> during vhost_vdpa_init()?
>

vhost_vdpa_net_valid_svq_features also checks for net features. In
particular, all the non transport features must be in
vdpa_svq_device_features.

This is how we protect that the device / guest will never negotiate
things like VLAN filtering support, as SVQ still does not know how to
restore at the destination.

In the VLAN filtering case CVQ is needed to restore VLAN, so it is
covered by patch 11/15. But other future features may need support for
restoring it in the destination.

Thanks!

> Thanks
>
> >
> > Thanks
> >
> >
> > > +    } else if (!is_datapath) {
> > >           s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page=
_size(),
> > >                                               vhost_vdpa_net_cvq_cmd_=
page_len());
> > >           memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_pag=
e_len());
> > > @@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >       for (i =3D 0; i < queue_pairs; i++) {
> > >           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > >                                        vdpa_device_fd, i, 2, true, op=
ts->x_svq,
> > > -                                     iova_range);
> > > +                                     iova_range, features);
> > >           if (!ncs[i])
> > >               goto err;
> > >       }
> > > @@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >       if (has_cvq) {
> > >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > >                                    vdpa_device_fd, i, 1, false,
> > > -                                 opts->x_svq, iova_range);
> > > +                                 opts->x_svq, iova_range, features);
> > >           if (!nc)
> > >               goto err;
> > >       }
>


