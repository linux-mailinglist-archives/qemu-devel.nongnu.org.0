Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96B7350CE4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:06:34 +0200 (CEST)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnfF-00071D-E2
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRncv-0005hg-QI; Wed, 31 Mar 2021 23:04:10 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59563 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRncq-00083P-49; Wed, 31 Mar 2021 23:04:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9p1B6qVhz9sX1; Thu,  1 Apr 2021 14:03:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617246238;
 bh=YmgAG/0IfwGwUak+hvjfFCv/FtH3hcn9ydXkd9pboaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nwYpL//9tvbxS2Mord24Z0Jtvq5EYCnr3Esdq46RLTO4ZtAbuSYh9lRl7Kco5kAcH
 7FtmLBYhSkQ7Va12Kq3mEIC5KoxcqCw+utopDyyHJI2/Rfv/mKHWSVjShLePw3z00f
 j/noKr+Jt7PsQBj6XsayFKpp6RN55L5Xn6mTTh7o=
Date: Thu, 1 Apr 2021 13:29:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: Rename RTAS_MAX_ADDR to FDT_MAX_ADDR
Message-ID: <YGUwIV+dobOk7VZ8@yekko.fritz.box>
References: <20210331025123.29310-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yiciZYsev1Ixh9Ux"
Content-Disposition: inline
In-Reply-To: <20210331025123.29310-1-aik@ozlabs.ru>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yiciZYsev1Ixh9Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 01:51:23PM +1100, Alexey Kardashevskiy wrote:
> SLOF instantiates RTAS since
> 744a928ccee9 ("spapr: Stop providing RTAS blob")
> so the max address applies to the FDT only.
>=20
> This renames the macro and fixes up the comment.
>=20
> This should not cause any behavioral change.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/spapr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 73a06df3b1b1..1e18a0a62839 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -100,7 +100,7 @@
>   *
>   * We load our kernel at 4M, leaving space for SLOF initial image
>   */
> -#define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that =
*/
> +#define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
>  #define FW_MAX_SIZE             0x400000
>  #define FW_FILE_NAME            "slof.bin"
>  #define FW_OVERHEAD             0x2800000
> @@ -1617,11 +1617,11 @@ static void spapr_machine_reset(MachineState *mac=
hine)
>      spapr_clear_pending_events(spapr);
> =20
>      /*
> -     * We place the device tree and RTAS just below either the top of th=
e RMA,
> +     * We place the device tree just below either the top of the RMA,
>       * or just below 2GB, whichever is lower, so that it can be
>       * processed with 32-bit real mode code if necessary
>       */
> -    fdt_addr =3D MIN(spapr->rma_size, RTAS_MAX_ADDR) - FDT_MAX_SIZE;
> +    fdt_addr =3D MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
> =20
>      fdt =3D spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
> =20
> @@ -2694,7 +2694,7 @@ static void spapr_machine_init(MachineState *machin=
e)
>      spapr->rma_size =3D spapr_rma_size(spapr, &error_fatal);
> =20
>      /* Setup a load limit for the ramdisk leaving room for SLOF and FDT =
*/
> -    load_limit =3D MIN(spapr->rma_size, RTAS_MAX_ADDR) - FW_OVERHEAD;
> +    load_limit =3D MIN(spapr->rma_size, FDT_MAX_ADDR) - FW_OVERHEAD;
> =20
>      /*
>       * VSMT must be set in order to be able to compute VCPU ids, ie to

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yiciZYsev1Ixh9Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlMCEACgkQbDjKyiDZ
s5Iq/A//We6F+3Tq14OY6NhnqZZNlfXr9bjFz5PyTSMOd88sGMNO/XG67Hde4Gp9
YrLCZIzkqLMpKEzF0J1nZl6DZ3CJdj9MjDdGS314A3bV1tbOPbEWyc2ZLSxQLi+9
ua9f9+cdjcKOO5oN174iGxk8BKgRbcfmZuGGfaadCykmWe9vHr3gL92G7zi3tFnk
8Va00ZgqLvDXo655LVLipw1OYeUt+yle1LgLQB7YU639KWOByKfhnE0H5bsaDRM6
lnQfwUCpkAS5Te3xy48G7d8X6TdrHrQZZUf6TDHX3hihvY7H1bV7v4x8Q59DXQhp
YEP9QPBHm2UXgLWIDTw/95CBLQCHc0ralUQ4ZoE6jvldRVWM6NNDYVgl7z2arXCE
HLLiv2zuPRYjL3K/6ujqyvgtFuoYrRJc210gl7B0iGXRu4Ds+GMlGFwbjY3LPwkh
ScL+Qv6lK+Pmgw3nahfNrbM/qxgZikRY7F3VZUvJgqdRKco/cacMHuzitxvl3YnO
n3GkNk3fYMscgVdgdzh4TUJEaWuPKG3OG6ukrjKoW1nDbZ0Z2CWj2EjH06w/D8Nc
SRKW1ZEullx4SAa+2cehsBXrQIVdp0j5K0VYzzWwVL2wgllUj/7U02mWN+PmKZ8f
/ordAmSQDFkYONntNA+HsQORTaeJacW5BQLKC195XA4i9WGXzko=
=57NM
-----END PGP SIGNATURE-----

--yiciZYsev1Ixh9Ux--

