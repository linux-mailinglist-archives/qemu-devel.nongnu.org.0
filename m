Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45762CD2FF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:56:13 +0100 (CET)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklLQ-00025i-Ue
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kklHV-00078B-2v
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kklHT-0004zt-Cd
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606989126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r+tgLvPZFKvKeCaWkDYatF/aX7SwLW8qof5R5bl6kN8=;
 b=WlF2u14stkpLTLrdKmyhRj7mQTXvYasKIGxAAX1Uq4cBjjlVOJbMz1bA0DItcOw6F52HBv
 XLNJ2B2BFfdwAPXpS8ktsUbfWTUiqYNo90i7pbJNw1joyKVC2OCmse17UX/UTRyGYQpPhE
 c4p2DG325cmpT7T0IoHfAh4HPqgprxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-GLob8OtvNZKq-Fg--PZrmg-1; Thu, 03 Dec 2020 04:52:04 -0500
X-MC-Unique: GLob8OtvNZKq-Fg--PZrmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5591F19057AF;
 Thu,  3 Dec 2020 09:52:03 +0000 (UTC)
Received: from localhost (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8AD160861;
 Thu,  3 Dec 2020 09:51:57 +0000 (UTC)
Date: Thu, 3 Dec 2020 09:51:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 2/4] contrib/vhost-user-gpu: avoid g_return_val_if()
 input validation
Message-ID: <20201203095119.GA689053@stefanha-x1.localdomain>
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201202152611.677753-3-stefanha@redhat.com>
 <CAJ+F1CLrba5T02Dy1=dXSE4ye9rgHZ4r5S-mWwL-7UACeFLVuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLrba5T02Dy1=dXSE4ye9rgHZ4r5S-mWwL-7UACeFLVuw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 07:50:51PM +0400, Marc-Andr=E9 Lureau wrote:
> On Wed, Dec 2, 2020 at 7:27 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>=20
> > Do not validate input with g_return_val_if(). This API is intended for
> > checking programming errors and is compiled out with -DG_DISABLE_CHECKS=
.
> >
> > Use an explicit if statement for input validation so it cannot
> > accidentally be compiled out.
> >
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c
> > b/contrib/vhost-user-gpu/vhost-user-gpu.c
> > index a019d0a9ac..534bad24d1 100644
> > --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> > +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> > @@ -1044,7 +1044,11 @@ vg_get_config(VuDev *dev, uint8_t *config, uint3=
2_t
> > len)
> >  {
> >      VuGpu *g =3D container_of(dev, VuGpu, dev.parent);
> >
> > -    g_return_val_if_fail(len <=3D sizeof(struct virtio_gpu_config), -1=
);
> > +    if (len > sizeof(struct virtio_gpu_config)) {
> > +        g_critical("%s: len %u is larger than %zu",
> > +                   __func__, len, sizeof(struct virtio_gpu_config));
> >
>=20
> g_critical() already has __FILE__ __LINE__ and G_STRFUNC.

I did this for consistency with the logging in this source file. The
other g_critical() calls in the file also print __func__.

Stefan

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/ItRcACgkQnKSrs4Gr
c8iQrggAw81svgufowONVz8bTsRVJAwCrV9yvz2t23bZwA5T0eQa91ywhZJXDTEp
4r8j0mXHN87hTLoMNKNVdXe4IEqBsDZDXKQC2+quZ8f5yEZ9MS6adyz0dn2vpkX7
MnVRm53xmQCWbu8s5h98v3Y7PcYIYi77OeA8Ue4PG2oLeGwVlxMSmUXlnRPwRWrZ
GfTWhyS3tJEBSw/pjT+LBIQdotDRRhCkgdVpY5P3R8cXZUUW6zrfmqtZV6K3T7Nx
TayThFtlCZXA7lvjBTtqKG701gf9TF68yrc5jPDZ0EfaEoovQfnFTjUEnaXcrx3t
A3m/uGcglq34jNMnbmm+5RVkp7DFsQ==
=vRGU
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--


