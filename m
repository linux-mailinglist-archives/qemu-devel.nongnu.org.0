Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58AE3618EC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:33:20 +0200 (CEST)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGAS-0004fY-0a
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXG6R-0000uZ-6I; Fri, 16 Apr 2021 00:29:11 -0400
Received: from ozlabs.org ([203.11.71.1]:55207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXG6O-0005kU-Em; Fri, 16 Apr 2021 00:29:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM3BR44T8z9s1l; Fri, 16 Apr 2021 14:29:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618547343;
 bh=I6rAh0jptNHWsDghIClpeKu7A11Mh59COqeUXdAWAyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SwHEzggiQh33u4A2wBnqxqIGQSUqzXOybFW4CHVaoF/laIvkcUBl9N729LkC5Lu0+
 migkiBOch3c51sWJ8PORahwI4LlZWFp7Y46/iPRgfGmctRmF38kM6zRy7uv7Usbl+X
 ZOMQiKlC3ISRgQ04kIRPPgO9ILowoYaa6DDy08fE=
Date: Fri, 16 Apr 2021 14:15:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [EXTERNAL] [PATCH v2 2/4] target/ppc: POWER10 supports scv
Message-ID: <YHkPRM83d0x3krxN@yekko.fritz.box>
References: <20210415054227.1793812-1-npiggin@gmail.com>
 <20210415054227.1793812-3-npiggin@gmail.com>
 <adc7acbc-f083-5e9c-c1ae-e00c2ec8b85c@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZC3dGK6HkvL7Bdy2"
Content-Disposition: inline
In-Reply-To: <adc7acbc-f083-5e9c-c1ae-e00c2ec8b85c@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZC3dGK6HkvL7Bdy2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 09:43:23AM +0200, C=E9dric Le Goater wrote:
> On 4/15/21 7:42 AM, Nicholas Piggin wrote:
> > This must have slipped through the cracks between adding POWER10 support
> > and scv support.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.1, thanks.

>=20
>=20
> > ---
> >  target/ppc/translate_init.c.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_ini=
t.c.inc
> > index c03a7c4f52..70f9b9b150 100644
> > --- a/target/ppc/translate_init.c.inc
> > +++ b/target/ppc/translate_init.c.inc
> > @@ -9323,7 +9323,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *da=
ta)
> >      pcc->flags =3D POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
> >                   POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
> >                   POWERPC_FLAG_BUS_CLK | POWERPC_FLAG_CFAR |
> > -                 POWERPC_FLAG_VSX | POWERPC_FLAG_TM;
> > +                 POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
> >      pcc->l1_dcache_size =3D 0x8000;
> >      pcc->l1_icache_size =3D 0x8000;
> >      pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZC3dGK6HkvL7Bdy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5D0QACgkQbDjKyiDZ
s5LQjA//ReCv+HFcEO9DY6+ZmyzhxYgxYFf2xI9b5a0fzA93+6xk30U45GxeiGlR
6JvNoHquVbmFMID8WJ2zw3KUMl6S9z1VKsS5SvnWhZ4sgYXoNNtOZROsRSFFMWdx
FZJbhGsbOdTgsqJzpGs+tHd0EZd/aZbPC9bMBvT/BFdOHHdGvK+VHFJ9v32/fBFR
dSc8yiKDsJzBoeFPMl0RT0Pm1z19rpHp0fWAK23klTetqSZxGYNXNnQ1PqQ92ldo
QUyx8AKgRZczP7U+0wCEOtihF+9Bh4obVta2XvO54FWtRcBmhufI7sSoc8PLnT3v
Z8ZMQUKqI/gjO60/QbaOkclioQkGMlNMR4Ho3vjVC8w2UfAEEFiXnW+KWhuhqAag
yFlRvJKhPqf4hoABnDwXO2DHTxkvKdRD3hhiC+PZrycwAZjsY2tD30yFM4zXXizp
X5P1/mFLRde3dKpgzcth/X7vzQw4dfsdR40yc9bg/DmDTfEvIplZ3+3b+ynYjdGZ
i0WTXYIdMAFHvWEoDWtk5bDG/NnryDPbC+S+iCub3c53lhHkwsRkx8LdaP5idZ0t
Qp7qcqIU2bXobRKrtYZNe/OetUgl9IuLpdAwo4YnW4Gc3XYLKx+Aaa1AT8eCziYK
+RsRrPWcjP9eXKjgIzJU+aceNNK4JITkspRE0LPorG6a+AXo460=
=LDVn
-----END PGP SIGNATURE-----

--ZC3dGK6HkvL7Bdy2--

