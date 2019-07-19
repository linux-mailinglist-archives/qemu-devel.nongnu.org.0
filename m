Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957C6E830
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 17:47:55 +0200 (CEST)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoV6w-0002cJ-Bi
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 11:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35482)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hoV6W-0001LP-3S
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hoV6O-0005vo-4m
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:47:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48936)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1hoV5m-0003ju-RQ; Fri, 19 Jul 2019 11:46:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6386FC09AD1C;
 Fri, 19 Jul 2019 15:42:36 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C83C85D978;
 Fri, 19 Jul 2019 15:42:29 +0000 (UTC)
Date: Fri, 19 Jul 2019 16:42:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Message-ID: <20190719154228.GH24412@stefanha-x1.localdomain>
References: <20190719133530.28688-1-mehta.aaru20@gmail.com>
 <20190719133530.28688-13-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Content-Disposition: inline
In-Reply-To: <20190719133530.28688-13-mehta.aaru20@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 19 Jul 2019 15:42:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 12/14] qemu-img: adds option to use aio
 engine
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
Cc: Fam Zheng <fam@euphon.net>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, saket.sinha89@gmail.com,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefan@redhat.com>,
 Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2019 at 07:05:28PM +0530, Aarushi Mehta wrote:
> Use -i AIOMODE instead of -n.
>=20
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> ---
>  qemu-img.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/qemu-img.c b/qemu-img.c
> index 79983772de..b7a962afff 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -4192,7 +4192,7 @@ static int img_bench(int argc, char **argv)
>              {"force-share", no_argument, 0, 'U'},
>              {0, 0, 0, 0}
>          };
> -        c =3D getopt_long(argc, argv, ":hc:d:f:no:qs:S:t:wU", long_optio=
ns, NULL);
> +        c =3D getopt_long(argc, argv, ":hc:d:f:io:qs:S:t:wU", long_optio=
ns, NULL);

Please preserve -n for backwards compability.

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0x5OQACgkQnKSrs4Gr
c8hywwgAii3L8RaVV8Z4imuZg1Zl8m2KLMD6lm38uWZvFY9T4YYglmi32/SFixuN
L/BjSbOTo50icVT2JRsB4pcKaibu3uB/qwFJnsccNdYJtBNVQddswaTTg9oAP9PA
vSoFM+ub1MdZcqbwEOOEs1UCVKz2hWp3o1Aw5/mfZ/T2NcZzFodNWmGW79RdZIc+
5M132YDcrP13AvjRdsQF2e80+RYXt4i02b/VaKMijs3YAziFJP6dcanwIyek+Set
h9PeDCmdHIbTmmR0s/g2a+wDED9bK53w3C3q4hXrB13oSiq6dXsK/6tLAwGEy4iX
SN5hQauWsrlG97T5lZyEs4trelokWA==
=AouD
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--

