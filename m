Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92A357A7E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 04:41:08 +0200 (CEST)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUKbT-0004Hs-Gl
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 22:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKZx-00030Y-8m; Wed, 07 Apr 2021 22:39:33 -0400
Received: from ozlabs.org ([203.11.71.1]:42329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKZu-0000ec-T7; Wed, 07 Apr 2021 22:39:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FG57X0lj9z9sWH; Thu,  8 Apr 2021 12:39:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617849560;
 bh=uyvlZ+QOvOdp+ci+R5Mz7SCx8nEIFphoupEWuy6t19k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A7sR5grqxIPfVUn6kvBJN0J4UWSqtmTxEd8PZqQcPxZRlGa/BhKb5wv80q7csp39J
 Bgw6MFmyU3UGDG6uIH3ci9vR0I+NV1fvneLGy11hVkeOJQ0eLc4H5pr54D/31Nud3O
 pml22Mf4iMNDc80m4PP0ihvXpVHOOC5FYvT78JDk=
Date: Thu, 8 Apr 2021 12:33:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.0] hw/ppc/mac_newworld: Restrict RAM to 2 GiB
Message-ID: <YG5rauU5KteEsoyG@yekko.fritz.box>
References: <20210406084842.2859664-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PbFuTN/74ZzW3GoQ"
Content-Disposition: inline
In-Reply-To: <20210406084842.2859664-1-f4bug@amsat.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?iso-8859-1?Q?H=E5vard?= Eidnes <he@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PbFuTN/74ZzW3GoQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 10:48:42AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On Mac99 and newer machines, the Uninorth PCI host bridge maps
> the PCI hole region at 2GiB, so the RAM area beside 2GiB is not
> accessible by the CPU. Restrict the memory to 2GiB to avoid
> problems such the one reported in the buglink.
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1922391
> Reported-by: H=E5vard Eidnes <he@NetBSD.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Simple, and a bugfix.  Applied to ppc-for-6.0.

> ---
>  hw/ppc/mac_newworld.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 21759628466..d88b38e9258 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -157,6 +157,10 @@ static void ppc_core99_init(MachineState *machine)
>      }
> =20
>      /* allocate RAM */
> +    if (machine->ram_size > 2 * GiB) {
> +        error_report("RAM size more than 2 GiB is not supported");
> +        exit(1);
> +    }
>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> =20
>      /* allocate and load firmware ROM */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PbFuTN/74ZzW3GoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBua2gACgkQbDjKyiDZ
s5I9SQ/+IdA3rj/TsE+hBpxVniAu2NrGsd2mYNbMswotlsl4COfA9iSK/dUlVSzv
VFkmbd1L28lZ7AtZ8hPj24e/KOFoDtTKnnqRmUEj1r4sIMxm6smCOPK8rmmIluRK
lOqq5GNlYFKGDhF6Trar5d3VwXddorjgOKMwAbf//jyV6KgSF7O68j9GzGkafLBL
U693mo6Bx6Q/YdpnlY/lr0qRTJXKFcqkAG2yw28rybdD+0wSMcyvJ0VGCckIb+Yj
1VU8QbUIArUywHDWFXhqTOH8Ux/bNC81p5cbZqdy+53UAnKcLOA9YLdg/PXJFE2G
C9CHZUOMaSkx+H/S9DvmwcQXnvVTsIMFfkDtXDm5MS5OjmfCVT4lx9n6xoPV/Y05
twTAVYHdFOoCvORpbr1YjYMRBa5DzRKx+wQSHW23V6JUpmyvS5d/vf1xw2avfLed
Sqncb7yKJeM7PVVGW+u7/ax0S5Fjg46sDQ0lmlkBNyl205uzo+i+IUjQ6EAgqqYU
Ww2JCy5E2dD7qvMQiYJCGV24fjCOWO0LYXLginl88ZDhhcEkiE+/aiaLsu7cbb/X
66T6wBNuaIezhX7uFt+nw/c6rccC6Tm0vlcQcLcYW1xZhK7DL1uSzBVBjKUu41f9
NH9y2tsH7wR9UEWvvhXaTYyUh6rrHJ9g/18jhllUD71jk4H/knY=
=8p3d
-----END PGP SIGNATURE-----

--PbFuTN/74ZzW3GoQ--

