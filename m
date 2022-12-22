Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6093653AC1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 03:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8BYI-0000Ko-0m; Wed, 21 Dec 2022 21:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p8BYE-0000Jw-V5; Wed, 21 Dec 2022 21:43:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1p8BYB-0002il-J2; Wed, 21 Dec 2022 21:43:18 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4NcvkM28FPz4xwl; Thu, 22 Dec 2022 13:43:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1671676987;
 bh=wBsLh2SS/yZsLo3AS6Fn+RwFBFddM5BW2o/7gRYqkNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iCfuQVftC4HDGlbeTJyba7POo0eZvn1Zr9MxQr6iPcnStX+B8oRvhmwl+qMn0gCPp
 NuEht1eMR7FsqKMduGPjmFfz+XmtEFrLutZiyVYkIC/mOD0WTSkvwcSLaK/gYZEvHa
 QFMQXy2BBmElGRVKqPYb/tey69rq4wzwDIWfjIvA=
Date: Thu, 22 Dec 2022 12:56:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Message-ID: <Y6O5aAUgGVytRHRj@yekko>
References: <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
 <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
 <Y6JeXJn1qCkeIzuz@yekko>
 <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
 <7ababaf9-9c00-37e8-a2d0-565b8de57010@kaod.org>
 <CAFEAcA_yh95V-szcDaX1p490FvWi_VwRz9FJVokGwiw3zqqi8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TG4up/prbh2+xsTc"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_yh95V-szcDaX1p490FvWi_VwRz9FJVokGwiw3zqqi8w@mail.gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--TG4up/prbh2+xsTc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2022 at 10:15:28PM +0000, Peter Maydell wrote:
> On Wed, 21 Dec 2022 at 16:03, C=E9dric Le Goater <clg@kaod.org> wrote:
> >
> > On 12/21/22 13:33, Peter Maydell wrote:
> > > On Wed, 21 Dec 2022 at 01:35, David Gibson <david@gibson.dropbear.id.=
au> wrote:
> > >> On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
> > >>> OK. I still think we should consistently change all the places that=
 are
> > >>> accessing this data structure, though, not just half of them.
> > >>
> > >> Yes, that makes sense.  Although what exactly constitutes "this data
> > >> structure" is a bit complex here.  If we mean just the spapr specific
> > >> "external HPT", then there are only a few more references to it.  If
> > >> we mean all instances of a powerpc hashed page table, then there are=
 a
> > >> bunch more in the cpu target code.
> > >
> > > I had in mind "places where we write this specific array of bytes
> > > spapr->htab".

Seems a reasonable amount to tackle for now.

> > spapr_store_hpte() seems to be the most annoying part. It is used
> > by hcalls h_enter, h_remove, h_protect. Reworking the interface
> > to present pte0/pte1 as BE variables means reworking the whole
> > hw/ppc/spapr_softmmu.c file. That's feasible but not a small task
> > since the changes will root down in the target hash mmu code which
> > is shared by all platforms ... :/
>=20
> Don't you just need to change spapr_store_hpte() to use stq_be_p()
> instead of stq_p() ?

I think Peter is right.  The values passed to the function are "host
endian" (really, they don't have an endianness since they'll be in
registers).

> > spapr_hpte_set_c() are spapr_hpte_set_r() are of a different kind.
>=20
> That code seems to suggest we already implicitly assume that
> spapr->htab fields have a given endianness...

Yes, we absolutely do.  We rely on the HPTE always being big-endian.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TG4up/prbh2+xsTc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmOjuUwACgkQgypY4gEw
YSKigxAA1zOcqxQAZARsA5p2zZhtmjsgjFuppOW5Nu/DrYhKO5vDGR7bo+8meQVe
nHVRByHmCx1TlBe6nQ1/hF7aeNmELO3Nvg9LVmt9VY+8M4gqsJPsqaF8qUx1Pey2
EUkHy0OnOhEnSiqXrYEfhac96mfsOFLTO2WCiKbF295nD6yd3ok2T9QWaHk8JN/g
qmXVFndzMtOgbLhl7tg1Gblu5J3Fdgl8wGeORpJqfbB57H+SQmVwRQ5nNDoKtgy3
lU5dKOvbSe98ixe/COwGB3IDx+vxQRgtnbmUc9TMpNq78uaTXNkKSCG3ledfTY2+
adzTIZRZAnq9FzHGYuIaEXqfzkNUWNluP2RiJluZOaflWyGDn0nBsiMUo1yymMRj
bnI6gglldvF6Uk6C7KOBspsetUb/aBjJxGr+8RNfYlXWyiBioBi/xb9mBh2+QfTJ
q3zbafVHDNC0ltTtEgvgI8rDLImDm92tJKc03Gs9x1uQ7RfS6kCV5aJUGbRR7FDw
nt4WQ+OXR7zw3Yx4PYmImkp5GDWbsQ6oH7gVKlBXkMqSXeXaSgaNh78d8P5jIO83
h9O5Rs6OxsPrjMUKjm6yD0Sy4HctKmHyLVgx+nWU2GNrj459z7/vMBxk6EL5r0Rn
RelPUvD8RDbpPaZNSL7Anr8TNa4UrwU8FAbueCvcJ2quYjDoBcI=
=p6T7
-----END PGP SIGNATURE-----

--TG4up/prbh2+xsTc--

