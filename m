Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D0392497
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:53:18 +0200 (CEST)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5D3-0006EZ-Qy
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58U-00062y-Ll; Wed, 26 May 2021 21:48:34 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35385 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58S-0001tK-Hl; Wed, 26 May 2021 21:48:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gz1ZrBz9sWc; Thu, 27 May 2021 11:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080095;
 bh=g+xTXyRaN0kIIrDI7sBwFS+GkR/rlJ+sPWN/VYjMu6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJrC3IAQyf05NkimJvSu5IdI/AORf4jUTpPreK5dH+w2Siq12qEMh5aj2XmroSuJN
 q/TkXhJaC4QujxoM64JVxCkAjs9Zs1V/ymKhlWpSOL/+RhIheWXGI6Tk0uajJvNvD3
 lHba2ybYMXb7MvNDfWqMk2f+QlnGBfpraFJMKWpY=
Date: Thu, 27 May 2021 11:28:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 1/3] spapr: Remove stale comment about power-saving
 LPCR bits
Message-ID: <YK71sJkPVHbt5FXi@yekko>
References: <20210526091626.3388262-1-npiggin@gmail.com>
 <20210526091626.3388262-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jsN+Zzn0HEnH537y"
Content-Disposition: inline
In-Reply-To: <20210526091626.3388262-2-npiggin@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jsN+Zzn0HEnH537y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 07:16:24PM +1000, Nicholas Piggin wrote:
> Commit 47a9b551547 ("spapr: Clean up handling of LPCR power-saving exit
> bits") moved this logic but did not remove the comment from the
> previous location.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/spapr_rtas.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 03355b4c0a..63d96955c0 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -164,7 +164,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spapr=
MachineState *spapr,
>      env->msr =3D (1ULL << MSR_SF) | (1ULL << MSR_ME);
>      hreg_compute_hflags(env);
> =20
> -    /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
>      lpcr =3D env->spr[SPR_LPCR];
>      if (!pcc->interrupts_big_endian(callcpu)) {
>          lpcr |=3D LPCR_ILE;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jsN+Zzn0HEnH537y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu9bAACgkQbDjKyiDZ
s5KWGw/7BK3PsnMGEMSMpCVTJP0TD/094sje1nS13V0he+6gf4vP9U7iIVMKufh6
HjRNbl0sG79vSH8Zr0Qy5AFGN3VKpp5JSxSU6JKMtGyhG41n8C5QcDaucjWkn2Cd
u3TU4JpGGQ1+J8SbotnVc6wJBqHzrMKWL6kLA1FUCcIqX4OQl2LwN3fA4lYmzybU
okbLOmza/VKV96C16ISwQBY8RYWwZbAGViCECyTxOFTtgCBGWR0ObopGNWfR8Bm1
HS5l5CWRclqHpsnYzXC6dtyhLTU15yU88dMcs/VFx3QG42biLW5Hj7EESEtd6AIE
DhHyp0oxu8Ttu+oMOxO9yU+7i2CgFXHzNr69/PBMYrDo/UWguSJkHi4U4eXxicrr
HGW4kFd/2Isbkrjt8t5/9/HoUREc8150R5fp0WUz1tEoBlx8c3I7G3mqV4wk8Mll
k9qhOxaxhJPlM9Mddtm8FsLs7Cnx4xvlQ4gZcOn0OREahJT1tDHjYL9qD/Npme/v
uJtBTLyCK/a+zp6aoSp+Dt2ntwpNywGvbK9vyzW6jGDwmB3CEuWnnEOewjXHuIgG
oG1jWSLLZX3aiNAGrQAbSVs6MHlJb6OxHwNwH/zwJJ+nlC3XputPW515tjpfEON0
bdUJv40mIQWiRpCAp8gBKCv+PW67oF0BZ1pEr+Q+BuNiT+PIdd0=
=UqwH
-----END PGP SIGNATURE-----

--jsN+Zzn0HEnH537y--

