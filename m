Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC86D92B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 04:45:42 +0200 (CEST)
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoItx-0007Jo-N5
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 22:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hoItQ-0005tA-WC
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 22:45:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hoItK-0000Br-HR
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 22:45:05 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52281)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hoItH-0008UN-Rc; Thu, 18 Jul 2019 22:45:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45qb2G0RGNz9s4Y; Fri, 19 Jul 2019 12:44:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1563504294;
 bh=xpE/O2f9HvHURJt6AaJyB5megT3/OTDW2v2i97S+jBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UFNHKWtikZsVbNg4YZA6ir4rjLh0IDRAGd+JbC9XPPz3McAkjhD7M1Tv7dPJBJq8R
 6PuyZjpnpdcVYIwI+AJnMz+7yYvC9U8Ihdz7NO2Nwb8UTX7J9fNIugVHUPIRI+Gp3p
 W+1cy1KBcRFohb2stfs3gNFwn6FFVE865uCVXa4Y=
Date: Fri, 19 Jul 2019 12:27:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <20190719022723.GQ8468@umbus.fritz.box>
References: <20190718034214.14948-1-npiggin@gmail.com>
 <20190718034214.14948-2-npiggin@gmail.com>
 <20190718121322.663cb5ec@bahia.lab.toulouse-stg.fr.ibm.com>
 <1563491322.dlreynwzv6.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XG0jWBK27HhJN4nS"
Content-Disposition: inline
In-Reply-To: <1563491322.dlreynwzv6.astroid@bobo.none>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH v6 1/4] spapr: Implement dispatch tracking
 for tcg
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XG0jWBK27HhJN4nS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2019 at 09:12:16AM +1000, Nicholas Piggin wrote:
> Greg Kurz's on July 18, 2019 8:13 pm:
> > On Thu, 18 Jul 2019 13:42:11 +1000
> > Nicholas Piggin <npiggin@gmail.com> wrote:
> >=20
> >> Implement cpu_exec_enter/exit on ppc which calls into new methods of
> >> the same name in PPCVirtualHypervisorClass. These are used by spapr
> >> to implement the splpar VPA dispatch counter initially.
> >>=20
> >> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >> ---
> >> Changes since v5:
> >> - Move 'prod' into next patch.
> >> - Use uint32_t type for dispatch counter.
> >> - Add guest error message for incorrect dispatch counter.
> >> - Conditionally compile away if CONFIG_USER_ONLY
> >> - Small cleanups
> >>=20
> >> Changes since v4:
> >> - Store to VPA on the way out as well.
> >> - Increment the dispatch counter directly in the VPA, which means it w=
ill
> >>   migrate with guest memory the same as KVM.
> >> - Prod need not be migrated, add a comment.
> >>=20
> >>  hw/ppc/spapr.c                  | 52 +++++++++++++++++++++++++++++++++
> >>  hw/ppc/spapr_hcall.c            |  5 ----
> >>  include/hw/ppc/spapr.h          |  7 +++++
> >>  target/ppc/cpu.h                |  4 +++
> >>  target/ppc/translate_init.inc.c | 27 +++++++++++++++++
> >>  5 files changed, 90 insertions(+), 5 deletions(-)
> >>=20
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index 821f0d4a49..3e5678d467 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -4302,6 +4302,54 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
> >>      return NULL;
> >>  }
> >> =20
> >> +#ifndef CONFIG_USER_ONLY
> >=20
> > This file is for system emulation only, no need to guard here.
> >=20
> > This is minor and rest looks good.
> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> Thanks for all the reviews Greg (and others), they made significant=20
> improvements. David I'm not sure how you like to work with merging
> patches, but if you can add the Reviewed-by tags and this issue, then
> I won't have to resend.

I've fixed it up in my tree.

>=20
> Or if you prefer I can fix it up and send to you privately to reduce
> list spam.
>=20
> Thanks,
> Nick
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XG0jWBK27HhJN4nS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0xKosACgkQbDjKyiDZ
s5IMxxAAngYXHLIz5YDMwXP7dxUeiScK9i7UkccueCTvco78PhH1G349Q045Y/Am
WaOuazf96IBBxAZXa17lsYzNALJ5U3GtkVB5Ofd/38yEEVlOohciKVMlALgGeUv3
FYaM06C69CFilOaI9wDK/GEMuc3QxYD/AiE/HbAoGjLenn4ntTR1sP433IISEosU
goV95lDbj2ucu+nSG5Qrs1Y3uuVAGtnIY5FqTdcr54sEgRxaB8YCEYLr2Xwqp3Np
Si1uuM9KQ0V/xx9mHYq5MsSLBODHUefb7vqVWP9AvHFhW1qg2b+OAoy322w+knPG
PeXydjmIanRvNVtYMx5p0xrqv8Lfm8MGts/DrQ5fgwTORjLB/m4VLzFCFA+E6t5f
t3YxbLYfN3o2G0wDKxBAcKk8Nb2a5vrNZ8WX+C87km+68hGXVuDbin0zj7D+ZTVS
S+Vi3nhC92TZMkAOBiMe9xqX4uyb0XIowVSt8tlg0SOhvnq5m6ZZKQXHhH6Egke9
wObXH1zDcviStJ67VySY3xsh2MUEFKxaU4ejSJQilJUVy/KyXE8mOpNUaFwbug0X
vvVOgHH6EUyPpqWTET2Pqt2xTN+tUI67XtNkUxmY6RZhJz7UJUGK2pFi0G2tFBHR
yJsgrUAnQRhAcyiz/IwYsRgcZBBjFJXrtZdeNWbcJe+YUVT/RQY=
=2sl0
-----END PGP SIGNATURE-----

--XG0jWBK27HhJN4nS--

