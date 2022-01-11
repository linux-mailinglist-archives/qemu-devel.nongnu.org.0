Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5348A5B8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:35:54 +0100 (CET)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n770r-0001Fh-Uh
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:35:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wq-0006FI-9n; Mon, 10 Jan 2022 21:31:44 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:48221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wk-0000yo-7i; Mon, 10 Jan 2022 21:31:40 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXvpB1sxcz4y4f; Tue, 11 Jan 2022 13:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641868290;
 bh=TqM3ukatbtQElS4QSK8MFTCaq13xINDtSYuj0ngANjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JAXSRF3/uaaEgWYlhNz93bPHCqzILGRFpTIy6AhUKduodTc37SjyhCwo9XpO5aoPi
 qF/e8DtRPp6q1zXNhHoE8FMTtmxK5IixbDBEhOmwttEyd7Ij7107qwT/rm6A0McQgn
 gEgDUbUovO3o7d/DQm+ZY/noYJ9h1TDB1m4zlmLU=
Date: Tue, 11 Jan 2022 13:26:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 5/8] target/ppc: 405: Critical exceptions cleanup
Message-ID: <Ydzqv5Tij9BNu6QT@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-6-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uHeB9qKC7VXWqzu1"
Content-Disposition: inline
In-Reply-To: <20220110181546.4131853-6-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uHeB9qKC7VXWqzu1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 03:15:43PM -0300, Fabiano Rosas wrote:
> In powerpc_excp_40x the Critical exception is now for 405 only, so we
> can remove the BookE and G2 blocks.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 1d997c4d6b..fecf4d5a4e 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -431,20 +431,8 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int ex=
cp)
> =20
>      switch (excp) {
>      case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            srr0 =3D SPR_BOOKE_CSRR0;
> -            srr1 =3D SPR_BOOKE_CSRR1;
> -            break;
> -        case POWERPC_EXCP_G2:
> -            break;
> -        default:
> -            goto excp_invalid;
> -        }
> +        srr0 =3D SPR_40x_SRR2;
> +        srr1 =3D SPR_40x_SRR3;
>          break;
>      case POWERPC_EXCP_MCHECK:    /* Machine check exception             =
     */
>          if (msr_me =3D=3D 0) {
> @@ -698,7 +686,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int exc=
p)
>                    powerpc_excp_name(excp));
>          break;
>      default:
> -    excp_invalid:
>          cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>          break;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uHeB9qKC7VXWqzu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHc6r8ACgkQbDjKyiDZ
s5JgTxAAt3u2fUPuV5p1DFPYXheDMwPluEvkPOJwb0/4YNmIWTACPYI+JfD24HFR
uUubZ6yyS0wkAeb4IKKd9WiWOrLOSszil/t4Otcpax8Xx6mOI5mprZFTldE3mlkK
f06Cffd2Bg5zDOXVGIk/44l2vR/caMd1nHOaTyeOyzXCim7txfTvnaPjcvOQXxEC
OBQr5wKgld91JYqiO0EwH/Uk45O5FDuME65Ha5PnnIzCs24Fuc3MEz1vrHlQrC1T
kCzTA/pzpM7JQtVpSIIzgEKM5OK3XBHCxapfcE33voMPoLQje7xs91FE0Gvn2dKH
uQdkxL7Yh8my9+2jkdhdPtgpYIGm/WN2g0Ko3tue7/EuoexB9JtoW79r2/fnaQ2l
SRJa1+9FwnXFIaumUsXwj4QOCyeOLjP3pSDswsol1n4Vodtq10HdgTDf4MF4jauy
cLaTMeXkruFKiKHstaA178bff/L4OFGh9QUH0gDHI8cvZwNAMc+V5CrK4rkcD632
IFZoaWfBN+pZt2EhcskJmMZjuwLo6G7xbanlOuEwJ8mk+k/C2yWfXH1wg43mpIQo
wMLaYFPENE0cf0tpzj4WsNke3jtIhOHHj2yuCrYJ8gM6z6uk38Grml2Xue6Dm0A5
xLM9EWLVPnOE3wKE4yAfufaJ9kRsCKTG0m6V+Z7zSAGzFh6kGdE=
=UK4b
-----END PGP SIGNATURE-----

--uHeB9qKC7VXWqzu1--

