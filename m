Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6556F3920
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 22:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pta6j-0007jf-UN; Mon, 01 May 2023 16:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pta6g-0007gA-1G
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pta6R-00009R-B2
 for qemu-devel@nongnu.org; Mon, 01 May 2023 16:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682972790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NJe3VOdl4t6OgIBB7yOdzKeSbDGiF1bJcuTCCme9lJ8=;
 b=VrDGPr6rwkby2R+kkftOgq2WFh/wfrfaI+79gKehcE6B1H+KBPNp62x9tv7iPF1AV2XQsX
 AOJEPMVqAwt1b0YZUP/X4uTiDTn+OdlEJFfvHN7KSW8Nve2SnB0KmVWYtQW7lIjjeV3b9t
 ac3K9ObXnQD85QvJ//wkpUx5H3yzphQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-w8LhreTSNKaeJU5d1FFZgw-1; Mon, 01 May 2023 16:26:28 -0400
X-MC-Unique: w8LhreTSNKaeJU5d1FFZgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55AEF29ABA0C;
 Mon,  1 May 2023 20:26:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B095514152F6;
 Mon,  1 May 2023 20:26:27 +0000 (UTC)
Date: Mon, 1 May 2023 16:26:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH] vhost-user: send SET_STATUS 0 after GET_VRING_BASE
Message-ID: <20230501202626.GB167911@fedora>
References: <20230420130706.541219-1-stefanha@redhat.com>
 <7417a79f-bc46-8df3-c21a-2148c5ea513e@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Lhn94hiPDpj8WuFP"
Content-Disposition: inline
In-Reply-To: <7417a79f-bc46-8df3-c21a-2148c5ea513e@nvidia.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--Lhn94hiPDpj8WuFP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 01:30:48PM +0800, Yajun Wu wrote:
>=20
> On 4/20/2023 9:07 PM, Stefan Hajnoczi wrote:
> >=20
> > Setting the VIRTIO Device Status Field to 0 resets the device. The
> > device's state is lost, including the vring configuration.
> >=20
> > vhost-user.c currently sends SET_STATUS 0 before GET_VRING_BASE. This
> > risks confusion about the lifetime of the vhost-user state (e.g. vring
> > last_avail_idx) across VIRTIO device reset.
> >=20
> > Eugenio P=E9rez <eperezma@redhat.com> adjusted the order for vhost-vdpa=
=2Ec
> > in commit c3716f260bff ("vdpa: move vhost reset after get vring base")
> > and in that commit description suggested doing the same for vhost-user
> > in the future.
> >=20
> > Go ahead and adjust vhost-user.c now. I ran various online code searches
> > to identify vhost-user backends implementing SET_STATUS. It seems only
> > DPDK implements SET_STATUS and Yajun Wu <yajunw@nvidia.com> has
> > confirmed that it is safe to make this change.
> >=20
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Cindy Lu <lulu@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   hw/virtio/vhost-user.c | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index e5285df4ba..2d40b1b3e7 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -2677,10 +2677,20 @@ static int vhost_user_dev_start(struct vhost_de=
v *dev, bool started)
> >                                             VIRTIO_CONFIG_S_DRIVER |
> >                                             VIRTIO_CONFIG_S_DRIVER_OK);
> >       } else {
> > -        return vhost_user_set_status(dev, 0);
> > +        return 0;
> >       }
> >   }
> >=20
> > +static void vhost_user_reset_status(struct vhost_dev *dev)
> > +{
> > +    /* Set device status only for last queue pair */
> > +    if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) {
> > +        return;
> > +    }
> > +
> > +    vhost_user_set_status(dev, 0);
> > +}
> > +
> >   const VhostOps user_ops =3D {
> >           .backend_type =3D VHOST_BACKEND_TYPE_USER,
> >           .vhost_backend_init =3D vhost_user_backend_init,
> > @@ -2716,4 +2726,5 @@ const VhostOps user_ops =3D {
> >           .vhost_get_inflight_fd =3D vhost_user_get_inflight_fd,
> >           .vhost_set_inflight_fd =3D vhost_user_set_inflight_fd,
> >           .vhost_dev_start =3D vhost_user_dev_start,
> > +        .vhost_reset_status =3D vhost_user_reset_status,
> >   };
> > --
> > 2.39.2
> >=20
> Thank you for this fix.
>=20
> Can you add protocol feature bit check, just like we do in
> vhost_user_dev_start?
>=20
> =A0=A0=A0 if (!virtio_has_feature(dev->protocol_features,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 VHOST_USER_PROTOCOL_F_STATUS)) {
> =A0=A0=A0=A0=A0=A0=A0 return 0;
> =A0=A0=A0 }

Sure, will fix in v2.

Stefan

--Lhn94hiPDpj8WuFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQIHIACgkQnKSrs4Gr
c8hkSQf9GyX4wcFVytafhuzVnH2eKxHYbfg95vMJ+OLvkr1cj7EBvYVdQw9T6oEw
Y2DUF5FQMIWo8VSQITwWO4zerNPilCSJ69b7R343/mdglTlxsjc+FkPTcGWlsymG
j1CdUQBnNkXEMoPMJTZg8t5xRRm1c/c8E8P3AAjWdISUrvfgo7KQbIllQr3oEi8G
fWW9ES/XwtG0STQEWGxp/tUOzkys6+kPQIODmug7uDvgxxY09mwe665cgtdMiISc
Fk04lZ3FDMswUrS49r4/r/UC5mW/U4vumkNb9ZnZo68zd6veTX58eIqiHWmqmOs1
RauTPh0+NOqTtTKQPxZWMILE2cLf8Q==
=2z7k
-----END PGP SIGNATURE-----

--Lhn94hiPDpj8WuFP--


