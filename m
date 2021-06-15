Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DBC3A736E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:45:08 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsy8Z-00081Q-9u
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lsy6o-0005nb-2E; Mon, 14 Jun 2021 21:43:18 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36901 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lsy6k-0008NX-R9; Mon, 14 Jun 2021 21:43:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3rgF6KmCz9sSn; Tue, 15 Jun 2021 11:43:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623721385;
 bh=nVal9WXGAjTmDxjZTzqLICDbQ/YsZANqfNS513N6LT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwSCTcmyBDNoF+RvHcSDqOxF5z5UWFYFFjJpveCKAKfumvtZrl1CjbBC2rdVIxCnf
 +b2CiQWkcMlkjtS8RwPMtNcfmdN2iU9jZWrM5lH94C29Nr8EAzEYyOaJ3pHqwy58BU
 do0huRtYRQdzwbRKPV6Zz6Vycn6oYkVIrxscJQ5s=
Date: Tue, 15 Jun 2021 11:41:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
Message-ID: <YMgFZk5d9GDqKZQ/@yekko>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
 <d7254eff-c9f8-36bf-b951-242c1b21f5f8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QPzhDn7/8dKcNAib"
Content-Disposition: inline
In-Reply-To: <d7254eff-c9f8-36bf-b951-242c1b21f5f8@redhat.com>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QPzhDn7/8dKcNAib
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 09:37:54PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 6/14/21 9:16 PM, Bruno Larsen (billionai) wrote:
> > This patch changes ppc_cpu_get_phys_page_debug so that it is now
> > able to translate both, priviledged and real mode addresses
> > independently of whether the CPU executing it has those permissions
> >=20
> > This was mentioned by Fabiano as something that would be very useful to
> > help with debugging, but could possibly constitute a security issue if
> > that debug function can be called in some way by prodution code. the
> > solution was implemented such that it would be trivial to wrap it around
> > ifdefs for building only with --enable-debug, for instance, but we are
> > not sure this is the best approach, hence why it is an RFC.
> >=20
> > Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > ---
> >  target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >=20
> > diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> > index 9dcdf88597..41c727c690 100644
> > --- a/target/ppc/mmu_helper.c
> > +++ b/target/ppc/mmu_helper.c
> > @@ -2947,6 +2947,29 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs,=
 vaddr addr)
> >                    cpu_mmu_index(&cpu->env, true), false)) {
> >          return raddr & TARGET_PAGE_MASK;
> >      }
> > +
> > +    /*
> > +     * This is a fallback, in case we're asking for priviledged memory=
 to
> > +     * be printed, but the PCU is not executing in a priviledged
> > manner.

s/PCU/CPU/

> > +     *
> > +     * The code could be considered a security vulnerability if
> > +     * this function can be called in a scenario that does not involve
> > +     * debugging.
> > +     * Given the name and how useful using real addresses may be for
> > +     * actually debugging, however, we decided to include it anyway and
> > +     * discuss how to best avoid the possible security concerns.
> > +     * The current plan is that, if there is a chance this code is cal=
led in
> > +     * a production environment, we can surround it with ifdefs so tha=
t it
> > +     * is only compiled with --enable-debug
>=20
> Nothing forbid us to use --enable-debug in a production environment.
>=20
> > +     */
> > +        /* attempt to translate first with virtual addresses */
> > +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 1, false) =
||
> > +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 1, false)=
 ||
> > +        /* if didn't work, attempt to translate with real addresses */
> > +        ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 3, false) =
||
> > +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 3, false)=
) {
> > +        return raddr & TARGET_PAGE_MASK;
> > +    }
> >      return -1;
> >  }
> > =20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QPzhDn7/8dKcNAib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIBWYACgkQbDjKyiDZ
s5IIuQ//UzQtMZnEiRo34pXcVp1B3skXYYgCjuuysb0OsdAlzjGjGlTdxsgXuUER
2Ajuu1IRDNk1ksJjDcwLS2DlUoOi/tlkywf4eFcahXpQ/SUfU/Mfmfd5B+oNSEpg
L7MDchQBjNj/L6Qs1pGQjWYxP/+wNBnB2nwzgB2aH3phC5KtJ7fDOUOZfvDrc0xF
zHJnzhypsmfZN0xPNzrTUBdaCy31s/0aejcHpeDY6hwfs87bCbKy90qjH8QudIE3
oavblYvrxAguH2U66Aolv725MDbXFTHDmFF/VqVmSBkCYB4y5swuv0C0xGT1Yjkj
JNnhQz6iN92AXGrY5H7zNYVdgz6J3BkHDBfhf0/xRpOABebnuUDvZgFXdvddbBG9
13VK+1F0AlYUxHFvJwQM7FevTOFstHyHQsEo/0Vu8hysyLAJzYPXPIwL2VGAnRrc
BNmDPejHy7VAqnYfuXAVznEZ4g6R76p2YINzHrx6F6iUKYyMdzRmDoG7fpD7RRwH
AEvqR/BOrKkmo1oy0qprS0E6ZjIK84+GztSZDDDHbtjGEFEdlKgNqsBDsQjqYweu
pSXm5bPeGXKVJfwXZWSjJq48j4KIkE3TNuk/jTg9a8dKnB6JRBl894sNk2QBApin
pKpNGwjAtfEHaNb2qi5hckkGYTtUfzSd5r96onsZqfvYkMnfjUA=
=Iaxf
-----END PGP SIGNATURE-----

--QPzhDn7/8dKcNAib--

