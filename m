Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E0346EFC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:46:14 +0100 (CET)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsb7-0006YH-3a
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPw-0004Pp-CE; Tue, 23 Mar 2021 21:34:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:32833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsPt-0001lj-UE; Tue, 23 Mar 2021 21:34:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rPc2mqDz9sWv; Wed, 24 Mar 2021 12:34:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616549668;
 bh=7gVIxMJxxR6mXi4rdfC6ePEkIaKBRNzt9MVi75lD25U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBXgArm8UO3E9Hgxy0kaPJzXm6kvQC5vy10dPWAfDWX6ULW8CI3VyMZspF47dqjxk
 2WDejJz7Q6nWxSQtpNtySre+O5WrxzBKSne8B7sQ/D3gF0KgeTxqszTfq0Mr0lLr7c
 kjMxDeldeuTC7MVXbZXHu3adBN1bQ03xJn1k44WI=
Date: Wed, 24 Mar 2021 11:08:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 07/10] target/ppc: Remove MSR_SA and MSR_AP from hflags
Message-ID: <YFqC44h5MIFqmZ/x@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-8-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="udzx3wCMgoHe3At1"
Content-Disposition: inline
In-Reply-To: <20210323184340.619757-8-richard.henderson@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--udzx3wCMgoHe3At1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:43:37PM -0600, Richard Henderson wrote:
> Nothing within the translator -- or anywhere else for that
> matter -- checks MSR_SA or MSR_AP on the 602.  This may be
> a mistake.  However, for the moment, we need not record these
> bits in hflags.

And frankly, even if it's wrong, I suspect the chances of someone
caring enough to fix 602 logic are pretty slim.

> This allows us to simplify HFLAGS_VSX computation by moving
> it to overlap with MSR_VSX.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0.

> ---
>  target/ppc/cpu.h         |  4 +---
>  target/ppc/helper_regs.c | 10 ++++------
>  2 files changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 3c28ddb331..2f72f83ee3 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -600,14 +600,12 @@ enum {
>      HFLAGS_DR =3D 4,   /* MSR_DR */
>      HFLAGS_IR =3D 5,   /* MSR_IR */
>      HFLAGS_SPE =3D 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ =
MSR_VR */
> -    HFLAGS_VSX =3D 7,  /* from MSR_VSX if cpu has VSX; avoid overlap w/ =
MSR_AP */
>      HFLAGS_TM =3D 8,   /* computed from MSR_TM */
>      HFLAGS_BE =3D 9,   /* MSR_BE -- from elsewhere on embedded ppc */
>      HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded ppc */
>      HFLAGS_FP =3D 13,  /* MSR_FP */
>      HFLAGS_PR =3D 14,  /* MSR_PR */
> -    HFLAGS_SA =3D 22,  /* MSR_SA */
> -    HFLAGS_AP =3D 23,  /* MSR_AP */
> +    HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
>      HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
>  };
> =20
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index f85bb14d1d..dd3cd770a3 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -99,11 +99,8 @@ void hreg_compute_hflags(CPUPPCState *env)
>      QEMU_BUILD_BUG_ON(MSR_DR !=3D HFLAGS_DR);
>      QEMU_BUILD_BUG_ON(MSR_IR !=3D HFLAGS_IR);
>      QEMU_BUILD_BUG_ON(MSR_FP !=3D HFLAGS_FP);
> -    QEMU_BUILD_BUG_ON(MSR_SA !=3D HFLAGS_SA);
> -    QEMU_BUILD_BUG_ON(MSR_AP !=3D HFLAGS_AP);
>      msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
> -                (1 << MSR_DR) | (1 << MSR_IR) |
> -                (1 << MSR_FP) | (1 << MSR_SA) | (1 << MSR_AP));
> +                (1 << MSR_DR) | (1 << MSR_IR) | (1 << MSR_FP));
> =20
>      if (ppc_flags & POWERPC_FLAG_HID0_LE) {
>          /*
> @@ -143,8 +140,9 @@ void hreg_compute_hflags(CPUPPCState *env)
>          QEMU_BUILD_BUG_ON(MSR_VR !=3D HFLAGS_VR);
>          msr_mask |=3D 1 << MSR_VR;
>      }
> -    if ((ppc_flags & POWERPC_FLAG_VSX) && (msr & (1 << MSR_VSX))) {
> -        hflags |=3D 1 << HFLAGS_VSX;
> +    if (ppc_flags & POWERPC_FLAG_VSX) {
> +        QEMU_BUILD_BUG_ON(MSR_VSX !=3D HFLAGS_VSX);
> +        msr_mask |=3D 1 << MSR_VSX;
>      }
>      if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
>          hflags |=3D 1 << HFLAGS_TM;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--udzx3wCMgoHe3At1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBaguMACgkQbDjKyiDZ
s5IyCA/+I9qlEPkt1P8+ZeQWFnTM/0h7/lgOZwswFeWEqxXIzaenRExeWkJV9Mjd
ncGuWJALvSYrzRKAsDyyfaM6tKhX1h7orl6kLzhlb4jyP4MaQGGIS5YCUlZ3QNIP
Sv8HCQV9qiNXeBvnGXWf1j6y4vXENTlRf21sYiE2dx7osnkSUVLfJDutrB9Dbjpg
hW2QdjawrJuiRkO3Sc1cv/SEYZ0Db2SmA1l4r2A3uBS5rNa1hJ+44kDyzT5hEQTE
FU4Rd7w8y+2XpKgfvtQIbXAVhlFzDld3rmyEQpKBecYB12bVrHrwyvG3xLHtAidG
fCyzt87gdr8/N+5OatkPWsNPvD3QSg+aMBbH0iHdH7nt60BG37WxlY13a0rmxOVK
iNmlJeq6Tkk4NoIVGmgcIqlphxpFaND0KuaTiWTOWR/Und0PmukDgM+AawIrv097
5yM57TU7u53QaElrU+B3/lHNTp/eC4f+CUWsUc2SC+HmxhbhVNyWq2TXSXzgbh8I
6+fwf3VLJf/i2EJsgl7sGnuTor0DpzDrULA4q/SWc0Hm38Rou+xMTUE04P8kw5Sm
naSFlNmznA1dS8nsgEHWKnPeTtQ646t6OvJ1DH9JdUkr8phkeqGbrVwbwcmnwpNF
WLKgy34MAeWrTRctqs5pvr/MmqPfb0zTyBAiLkIpcYshmAYAKpc=
=3zRo
-----END PGP SIGNATURE-----

--udzx3wCMgoHe3At1--

