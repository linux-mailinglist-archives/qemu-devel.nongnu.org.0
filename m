Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404A3088AE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:58:09 +0100 (CET)
Received: from localhost ([::1]:60818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SPg-0008Ci-Cy
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5SMp-0006VX-4V; Fri, 29 Jan 2021 06:55:11 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38821 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5SMm-0004mn-2l; Fri, 29 Jan 2021 06:55:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRwkZ0Bnmz9sW0; Fri, 29 Jan 2021 22:55:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611921302;
 bh=hC3OWkLuM14REd/Y8gePpCMKkSYjXNHCxr/KXpHjMAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E+Ulzd9q4GeoMDTlcHDFhgKyG/kSj/qRbk/JWUtGvje7idjh0yFa1ZrJSlteXa3Ev
 DPrSVNT+auN/13yZDr91cVidbhJiVhDLNcDj364J43NE4/3cPENE/8MQeg5ONiHOFm
 yOT7peL9Lx/kyFktm59uLHQhMU5fEqGAaQrk805E=
Date: Fri, 29 Jan 2021 22:54:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] pnv/ppc: Set default RAM size to 1 GB
Message-ID: <20210129115454.GN6951@yekko.fritz.box>
References: <20210129092936.769412-1-clg@kaod.org>
 <efcf457d-8390-4352-6180-ac9fd6d78b24@redhat.com>
 <20210129111115.52d1d862@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8MZM6zh5Bb05FW+3"
Content-Disposition: inline
In-Reply-To: <20210129111115.52d1d862@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8MZM6zh5Bb05FW+3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 11:11:15AM +0100, Greg Kurz wrote:
> On Fri, 29 Jan 2021 10:39:12 +0100
> Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
>=20
> > On 1/29/21 10:29 AM, C=E9dric Le Goater wrote:
> > > Any value below will result in a skiboot crash :
> > >=20
> > >     [    0.034949905,3] MEM: Partial overlap detected between regions:
> > >     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a4500=
00] (new)
> > >     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000=
-0x38400000]
> > >     [    0.034980367,3] Out of memory adding skiboot reserved areas
> > >     [    0.035074945,3] *********************************************=
**
> > >     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
> > >     [    0.035104247,3]     .
> > >     [    0.035108025,3]      .
> > >     [    0.035111651,3]       .
> > >     [    0.035115231,3]         OO__)
> > >     [    0.035119198,3]        <"__/
> > >     [    0.035122980,3]         ^ ^
> > >=20
> > > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > > ---
> > >  hw/ppc/pnv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > > index 50810df83815..70ce12f6dc73 100644
> > > --- a/hw/ppc/pnv.c
> > > +++ b/hw/ppc/pnv.c
> > > @@ -1994,7 +1994,7 @@ static void pnv_machine_class_init(ObjectClass =
*oc, void *data)
> > >       * RAM defaults to less than 2048 for 32-bit hosts, and large
> > >       * enough to fit the maximum initrd size at it's load address
> > >       */
> > > -    mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
> > > +    mc->default_ram_size =3D 1 * GiB;
> >=20
> > Maybe also just in case add before the definitions:
> >=20
> >   QEMU_BUILD_BUG_ON(INITRD_LOAD_ADDR + INITRD_MAX_SIZE > 1 * GiB);
> >=20
>=20
> or
>=20
>     mc->default_ram_size =3D MAX(1 * GiB, INITRD_LOAD_ADDR +
>     INITRD_MAX_SIZE)

I prefer the BUILD_BUG_ON approach, less mysterious effects of one
setting on another.

>=20
> > ?
> >=20
> > >      mc->default_ram_id =3D "pnv.ram";
> > >      ispc->print_info =3D pnv_pic_print_info;
> > >      nc->nmi_monitor_handler =3D pnv_nmi;
> > >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8MZM6zh5Bb05FW+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAT94wACgkQbDjKyiDZ
s5LNIw//ZCKAiH8WuLPcrERRDz+EZgHPa69Wc1ThsOQVqpJznT3awUWedu9iroSv
NVBB7NT4Z/HZak4P6CHpPgsc9S3Jslh1fjiIfzl9hkCcUv4kNnUsrD91Dy/Mlkn0
fzWNM96lBG5vp3+3iTwLegFnt7PAXhzxM1DVAQRN69r+ZikGImsTrbIFFH0kOY5x
MfU7tVej+0oMYXBxjazwx9mw5jEf/IsX9cNbN0az5OtdobcZss33Q//koaDDl2hk
pAFQcG2g6J6PerW42AP39pZ8WeT4urwgmKX/fyzeGgmIrszAENE5Cg7Mb02Jqpl1
UvQWnKGESlwsE/nS5Ie3gD+HnDY5Vu3ZFexVIrrZ1yEmiP0HZiQuO3ETXZT+JyCN
34vI9U+VSuQHMDLV79DIY7MwYUsUQU7pw6/txuIq2flzPj82gjuRLpVJFE8Cmu+m
eKIZkZNPCHcge6wngHOdfTnMvEpgJiPscKi54ExHQKh+9/TBlmEGHVIp6Omcd/xc
vkiZJhwPjMqqJnSfl9NgNDYehN/lnZisbUfTJgyvw5Nh2jPbsZo8WlEZpi6deTUl
0IIQduFCzWuxG832sVxM2v+sjxCEyXjHNzoMAdTuWHyMInWk6/UJgEWWh+kZrWqS
XM6N4qCEJtzXJScd8dV8juTUntMYh9LQCUYntxbKL6V2gAaItmg=
=t95b
-----END PGP SIGNATURE-----

--8MZM6zh5Bb05FW+3--

