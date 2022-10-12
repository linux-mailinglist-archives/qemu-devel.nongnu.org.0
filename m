Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415BA5FC7F4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:08:27 +0200 (CEST)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidLN-0007pa-BK
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidG8-0002uj-6s
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidG6-000320-OX
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665586977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FhIBD/AwGEWy/vwoy0Ufg+xg1nIf17Pzg/SOBX0zs8=;
 b=BS7P2ssg7fmcdLpAtKzJ5RlN6H69l6D9SSm2p7TNvw9fv8YB5ic3VmiXV9IGncFvn9yBmh
 bQVtz+mF8Eju/Fb8MkG6UCuDVA4Mp3t9Cy3tlXyyYivMg2WVI4k+nnGkFy+RhL7ZKjnPXr
 Ue7Bhs6EmRN2SAjciPnQx9tWODnV8EQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-AlsltSGgNSSYEsC6GR5Xxw-1; Wed, 12 Oct 2022 11:02:53 -0400
X-MC-Unique: AlsltSGgNSSYEsC6GR5Xxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCB2E858F13;
 Wed, 12 Oct 2022 15:02:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24455492B0A;
 Wed, 12 Oct 2022 15:02:51 +0000 (UTC)
Date: Wed, 12 Oct 2022 11:02:50 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
Subject: Re: [RFC PATCH  0/4] docs/devel suggestions for discussion
Message-ID: <Y0bXGmSNngicSxxt@fedora>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1cFlWNBBsNCY/5Sa"
Content-Disposition: inline
In-Reply-To: <20221012121152.1179051-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


--1cFlWNBBsNCY/5Sa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 01:11:48PM +0100, Alex Benn=E9e wrote:
> Hi,
>=20
> This is an attempt to improve our processes documentation by:
>=20
>  - adding an explicit section on maintainers
>  - reducing the up-front verbiage in patch submission
>  - emphasising the importance to respectful reviews
>=20
> I'm sure the language could be improved further so I humbly submit
> this RFC for discussion.
>=20
> Alex Benn=E9e (4):
>   docs/devel: add a maintainers section to development process
>   docs/devel: make language a little less code centric
>   docs/devel: simplify the minimal checklist
>   docs/devel: try and improve the language around patch review
>=20
>  docs/devel/code-of-conduct.rst           |   2 +
>  docs/devel/index-process.rst             |   1 +
>  docs/devel/maintainers.rst               |  84 +++++++++++++++++++
>  docs/devel/submitting-a-patch.rst        | 101 +++++++++++++++--------
>  docs/devel/submitting-a-pull-request.rst |  12 +--
>  roms/qboot                               |   2 +-
>  6 files changed, 157 insertions(+), 45 deletions(-)
>  create mode 100644 docs/devel/maintainers.rst
>=20
> --=20
> 2.34.1
>=20

Modulo comments:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1cFlWNBBsNCY/5Sa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNG1xoACgkQnKSrs4Gr
c8i3kwf/bs5ZFSmpdLoIB9VG6ZSUKlVpVH0GGk5xKlt83lnVPSlfy5TvDRgXCyBL
yHLycNDO8AlfgkYT9lSNe4SimiSuu/0kJ4dgP1LWLth3/f8HRLg/1mOQGn0aQD8n
QJDitaib6qUgTroX84o1J8sVeV1r2Yq7UZesil+u+LnPnpeqXr1losb+3tCJAuOe
VD8sLy6cSYFXWObatTi4P5IkHYhI5goaCgU3b+bt1ia3Cv2XjgnGdtUlB5kNti14
5tMyU01+Br178rVIrxXlpTchSaMGELv7GWb1Yh9MQ5li/+xrJQX+Bzp9Bz/uMa9E
yIbsVH4f4wcu9ZH68kWI84SGBtCV2A==
=uRC/
-----END PGP SIGNATURE-----

--1cFlWNBBsNCY/5Sa--


