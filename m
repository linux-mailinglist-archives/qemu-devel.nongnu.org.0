Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6AB3FA429
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 09:06:14 +0200 (CEST)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJsPt-0006Sj-8A
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 03:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJsJg-0004en-G6; Sat, 28 Aug 2021 02:59:49 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50679 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJsJZ-0002D1-JO; Sat, 28 Aug 2021 02:59:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GxSB45GDbz9sX3; Sat, 28 Aug 2021 16:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630133964;
 bh=l1dk7G9ghszAHOGoBCHOic7YBUEC9zDcOEC9XySrK4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LCmlmHD28uneTFDk70w/s2ISgYJZq7RjChtlo8CVn4XffMQiAx6pf3ZAaXwygLwhI
 63DzZyGe6u/W+Y8S/493GE2UyPnxNw7ZwYzyJgkC5nE5nD5haI6aFrvxpCl1TbLS6G
 6W6fo++VK9CCJAUe67mEc6SSPjdqsdX7I9j66vz0=
Date: Sat, 28 Aug 2021 15:29:57 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
Message-ID: <YSnJ1f8AZA1TnTbI@yekko>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <bbcac344-99e2-f74a-2b72-145bbd5b4716@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aBGE09KTpPmRUQzN"
Content-Disposition: inline
In-Reply-To: <bbcac344-99e2-f74a-2b72-145bbd5b4716@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: John Arbuckle <programmingkidx@gmail.com>, hsp.cat7@gmail.com,
 qemu-ppc@nongnu.org, groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aBGE09KTpPmRUQzN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 11:15:26PM +0200, BALATON Zoltan wrote:
> On Fri, 27 Aug 2021, John Arbuckle wrote:
> > I was having a problem with missing video resolutions in my Mac OS 9 VM=
=2E When I
> > ran QEMU it gave no indication as to why these resolutions were missing=
=2E I found
> > out that the OpenFirmware VGA driver was not being loaded. To prevent a=
nyone from
> > going thru the same trouble I went thru I added messages that the user =
can see
> > when a problem takes place with loading this driver in the future.
> >=20
> > Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> > ---
> > hw/ppc/mac_newworld.c | 6 ++++++
> > hw/ppc/mac_oldworld.c | 6 ++++++
> > 2 files changed, 12 insertions(+)
> >=20
> > diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> > index 7bb7ac3997..c1960452b8 100644
> > --- a/hw/ppc/mac_newworld.c
> > +++ b/hw/ppc/mac_newworld.c
> > @@ -526,8 +526,14 @@ static void ppc_core99_init(MachineState *machine)
> >=20
> >         if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)=
) {
> >             fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, nd=
rv_size);
> > +        } else {
> > +            printf("Warning: failed to load driver %s. This may cause =
video"
> > +                   " problems.\n");
>=20
> I think you should use warn_report for these instead of printf and watch =
out
> if that needs \n or not (some functions add \n while some others may not =
and
> I always forget which is which but checkpatch should warn for it so you
> should get nofified if you leave \n there but it's not needed).

Yes, it definitely should be warn_report() rather than a raw printf.
Patches for Macintosh should also go to the relevant maintainer Mark
Cave-Ayland <mark.cave-ayland@ilande.co.uk>.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aBGE09KTpPmRUQzN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEpydMACgkQbDjKyiDZ
s5KYMBAAiVJuHC24fYdTfXzkC7T66pLw2OMbmj1meDFoATHm0tMXUKf47k5644Kq
0xRamaqF7BP6YPBgZAW9l+jYU3V0VoGJ+4LpvcWjLXH5Fu6kH9MXnNqmf5uwldtb
uJYIucl60cYxi7cxXxfGybT/y5B0s0nb/6lQlc6sbK9elg04VNpeGDJ/IUIj3ByR
k/X09LuYpyl/9k4hE5rQ8nUr+vYCGgnaYt8jDtFsL4yN9M+otLHitLRZLMsEAsEd
ejgwnvShXlPQdomAE8TF/DBrgTzE+WEXBwvMI0yLg3pSHHRL5uiUETT2ILPvJAEm
ZgV2/296uICD1OklyFj753Q10zF83M0LRJL31PeGeZ3lDL3fC1P8jL7A08FbEkvd
NnMxMmH2y+h5IZsQvDsJDUYXE5Zfr/gNqw8A0APAEM1Ud0dFr3+ZzRzdgH9XLrhC
1GvMvNSkIzIuqyNecWMhp4sQcAS9VHX/bE8yf1mXAeqp0HXm13y1i/V7ZeRuWvEU
p0UizHkuBN5dEOAnv/W5LncUe+07ceUnNIjNl7aXPg60ER34+/AY043e6LCoWaJ8
AENCq+QZurKtGERQevvI3OvIgFnrsu46u6SePSyK6DwLJRPmHGtBtfRH145r7Y9L
DC9o0qPAQSr1fRXeRahpkxLwkpIJj5eU5clOMTr/FP/ODdzg1OM=
=yGbI
-----END PGP SIGNATURE-----

--aBGE09KTpPmRUQzN--

