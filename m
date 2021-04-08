Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A316C357A7D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 04:41:08 +0200 (CEST)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUKbT-0004Ij-6L
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 22:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKZy-00030n-IU; Wed, 07 Apr 2021 22:39:34 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKZu-0000ef-Rw; Wed, 07 Apr 2021 22:39:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FG57X1X07z9sWC; Thu,  8 Apr 2021 12:39:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617849560;
 bh=yvup9AF+pJ8qZiO/i5Ip7H21h3yM/B5VQ+zSkDtM+bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Apsv9Ymj/5C8AeOxCRFDlY+iY1nt5ZByfnx3nnUQT7cnkzQY52IxsaR/XN2j9oLSQ
 JvBDjuzFb6Tl5RcG4V2agnhFtPgrqZ8nL1cq9lC1a0mASCHbj+laZ6PsTlrEXXJIJK
 bmAvjiyEOVO/n4QVVTnzXwcGee097zyhnkzSKJsc=
Date: Thu, 8 Apr 2021 12:34:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.0] hw/ppc/mac_newworld: Restrict RAM to 2 GiB
Message-ID: <YG5rzxqMhiE0LE4j@yekko.fritz.box>
References: <20210406084842.2859664-1-f4bug@amsat.org>
 <97ed2955-e177-1ee5-cc68-052d7dd30b24@ilande.co.uk>
 <b3211b93-62de-c36b-45ca-33da02a15736@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PetMglccD7Xl2Ng/"
Content-Disposition: inline
In-Reply-To: <b3211b93-62de-c36b-45ca-33da02a15736@amsat.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, 1922391@bugs.launchpad.net,
 Igor Mammedov <imammedo@redhat.com>,
 =?iso-8859-1?Q?H=E5vard?= Eidnes <he@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PetMglccD7Xl2Ng/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 03:44:35PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 4/7/21 3:11 PM, Mark Cave-Ayland wrote:
> > On 06/04/2021 09:48, Philippe Mathieu-Daud=E9 wrote:
> >=20
> >> On Mac99 and newer machines, the Uninorth PCI host bridge maps
> >> the PCI hole region at 2GiB, so the RAM area beside 2GiB is not
> >> accessible by the CPU. Restrict the memory to 2GiB to avoid
> >> problems such the one reported in the buglink.
> >>
> >> Buglink: https://bugs.launchpad.net/qemu/+bug/1922391
> >> Reported-by: H=E5vard Eidnes <he@NetBSD.org>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> >> ---
> >> =A0 hw/ppc/mac_newworld.c | 4 ++++
> >> =A0 1 file changed, 4 insertions(+)
> >>
> >> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> >> index 21759628466..d88b38e9258 100644
> >> --- a/hw/ppc/mac_newworld.c
> >> +++ b/hw/ppc/mac_newworld.c
> >> @@ -157,6 +157,10 @@ static void ppc_core99_init(MachineState *machine)
> >> =A0=A0=A0=A0=A0 }
> >> =A0 =A0=A0=A0=A0=A0 /* allocate RAM */
> >> +=A0=A0=A0 if (machine->ram_size > 2 * GiB) {
> >> +=A0=A0=A0=A0=A0=A0=A0 error_report("RAM size more than 2 GiB is not s=
upported");
> >> +=A0=A0=A0=A0=A0=A0=A0 exit(1);
> >> +=A0=A0=A0 }
> >> =A0=A0=A0=A0=A0 memory_region_add_subregion(get_system_memory(), 0, ma=
chine->ram);
> >> =A0 =A0=A0=A0=A0=A0 /* allocate and load firmware ROM */
> >=20
> > I think the patch is correct, however I'm fairly sure that the default
> > g3beige machine also has the PCI hole located at 0x80000000 so the same
> > problem exists there too.
> >=20
> > Also are you keen to get this merged for 6.0? It doesn't seem to solve a
> > security issue/release blocker and I'm sure the current behaviour has
> > been like this for a long time...
>=20
> No problem. I wanted to revisit this bug anyway, I realized during the
> night, while this patch makes QEMU exit cleanly, it hides the bug which
> is likely in TYPE_MACIO_IDE (I haven't tried H=E5vard's full
> reproducer).

Ah, given the comments above, I've pulled this out of ppc-for-6.0 and
moved it to ppc-for-6.1.

>=20
> Regards,
>=20
> Phil.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PetMglccD7Xl2Ng/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBua88ACgkQbDjKyiDZ
s5L+kA//QGYBoooI01UDnWRWmB0m5pQXwMLZChGxsBPvyQN6ylWOeqLWb2ybPvtE
JTp4R6mE0r40jjyq5TxzpSIbiU9twJZeOz8oWWZD3CXMiFy7CkkMNuBBItMJR947
F79Xc5roGnEJf5boS4XGym4D4vk5UkcYseI3tl5D6M82uNpajwZk7Nq5FvmSO1JE
N/UC4biWdEQhlC+Whm1PUhoHrDdnspsXN1uFvaFtrffZGn3dO2LTmHUhTWR2DwaN
d3qgAcmPiHD307PDHRljfCslX7vIVobDx5HCMeWDoecmnPLygCqKMAdzwzEl7HhP
u1zDN66qB/4pYTSvh9aqRpM/4tHMpE7I8OTgwg586/xQcCdhHSDAMBTuL0YcvrFA
tanuEVXu8D8WsYulRllvSEnriGmBUtljDz0YNcMzQBWxiJbVmV071iBvttrfbKj3
ceE5ULHPggYYu76Gb/bOvGqKTSDYKL45vUWCuCiAHGCfKjO0lOyChc26SqHFr5ni
uwgJZhSn21ATXzqUK33MJg192u9nN7UkZGBLk4S8hzmVczKin5upTozGhzKqVbDS
YfNKb7Jk0ef5yxEpFyWOWHvWPnAXAgmj/wywJ69NUP1C9Tn1fSl26cvF9durxuRh
7j0N1FdtF9Zo4dRu9VDWbKOzgyn0+yq2ZDaBkQP55VRgON/o0Z8=
=R4Hx
-----END PGP SIGNATURE-----

--PetMglccD7Xl2Ng/--

