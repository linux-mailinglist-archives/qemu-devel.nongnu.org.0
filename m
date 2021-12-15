Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FC4759D2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 14:42:25 +0100 (CET)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxUY4-0005iI-SK
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 08:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxUHe-0002Bg-LL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:25:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxUHc-0006DP-R9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639574722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uW/85MDby6BFxlimv7KHEnTFzeiSolmd4nGmVSO+LB0=;
 b=P3Zybu7IAE7jCB0pTDo/jpObloIKZUqjF59CEvuveBZy/fsueB+A4tT7FQ1I+62Q9ePPo4
 FjcYH8fEhcu3SgYGxfbfPOp++pqGuf76dy1RcJJyq8qUr5h7bka6czG8eMLIzIlLz2hURk
 IS0dRR4/I8pRUYv+RoyMTQYQ/Hxwr9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-owExW55KPx-C7UVQIJPqkA-1; Wed, 15 Dec 2021 08:25:18 -0500
X-MC-Unique: owExW55KPx-C7UVQIJPqkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A23671927814;
 Wed, 15 Dec 2021 13:25:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26E6F26DC6;
 Wed, 15 Dec 2021 13:25:16 +0000 (UTC)
Date: Wed, 15 Dec 2021 13:25:15 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 03/18] meson: require liburing >= 0.3
Message-ID: <Ybnsu3Rf+o0ixKgE@stefanha-x1.localdomain>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-4-berrange@redhat.com>
 <977ffa85-1f5f-7493-cb05-5e2024e3c017@redhat.com>
MIME-Version: 1.0
In-Reply-To: <977ffa85-1f5f-7493-cb05-5e2024e3c017@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="agZ+mTZsBjgw6rAF"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--agZ+mTZsBjgw6rAF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 12:27:43PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Cc'ing Stefan & Stefano.
>=20
> On 11/24/21 14:01, Daniel P. Berrang=C3=A9 wrote:
> > openSUSE Leap 15.2 ships with liburing =3D=3D 0.2 against which QEMU fa=
ils
> > to build.
> >=20
> > ../util/fdmon-io_uring.c: In function =E2=80=98fdmon_io_uring_need_wait=
=E2=80=99:
> > ../util/fdmon-io_uring.c:305:9: error: implicit declaration of function=
 =E2=80=98io_uring_sq_ready=E2=80=99; did you mean =E2=80=98io_uring_cq_rea=
dy=E2=80=99? [-Werror=3Dimplicit-function-declaration]
> >      if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
> >          ^~~~~~~~~~~~~~~~~
> >          io_uring_cq_ready
> >=20
> > This method was introduced in liburing 0.3, so set that as a minimum
> > requirement.
> >=20
> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >  meson.build | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meson.build b/meson.build
> > index e2d38a43e6..04d36bf47e 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -427,7 +427,8 @@ if not get_option('linux_aio').auto() or have_block
> >  endif
> >  linux_io_uring =3D not_found
> >  if not get_option('linux_io_uring').auto() or have_block
> > -  linux_io_uring =3D dependency('liburing', required: get_option('linu=
x_io_uring'),
> > +  linux_io_uring =3D dependency('liburing', version: '>=3D0.3',
> > +                              required: get_option('linux_io_uring'),
> >                                method: 'pkg-config', kwargs: static_kwa=
rgs)
> >  endif
> >  libxml2 =3D not_found
> >=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--agZ+mTZsBjgw6rAF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG57LsACgkQnKSrs4Gr
c8gU/gf9F23gK+GCsOpLtEop2+0ELR2I/y+kzYiCRwfy0rlHAbNbeaQ1qifmHmmF
jMasmbvpY8HIWLDvP9IPD0WBxfiFodqYzmnHthKRVIwb9hVR4rSgxhdQe+R31sax
+WvYKy1bq3I7s+8HBfgUjkvcWFNQuOsXTiTaMZBtktZICMkjlYTh7c4zTS2ZkpAn
yQ48rrhL6wk5qymZpH41cqgGQfAVUpD6MiUj8XKn2PWCobwjQhrN1r0GUF/DEcB+
iHMN/+hBrG0PSYn68tSr2shWUyjtGbnF36MdTyAbJgEYyMZEnXykUb5EgaiOEHNL
g79x8t9hss58uJyMhhy7KiSoZ6nuLw==
=3AxX
-----END PGP SIGNATURE-----

--agZ+mTZsBjgw6rAF--


