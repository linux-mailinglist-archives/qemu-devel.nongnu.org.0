Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A847E9F3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 02:02:24 +0100 (CET)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0YyU-0003yn-TG
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 20:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n0Yt9-0002rh-El; Thu, 23 Dec 2021 19:56:51 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:57389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n0Ysz-0007zC-PB; Thu, 23 Dec 2021 19:56:48 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JKpXy3Gmsz4xn1; Fri, 24 Dec 2021 11:56:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1640307394;
 bh=lIsmWBe7xLmnIbRpaMGIBgPE8lNbsQ+vWecebHJJMUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vx00s8kyF+h2IQiZdRb3E8y0h4E93vH3GQL5PaT2qN0VQCPYu6WnOvVEAJtTNZYBJ
 FIamju0nrpqK2C0JJam50RrmLFZVV5AG6IF5wUH8EDT0LNZ/+81QIZ9v3nNwOCyuej
 6SZ27Rw51AHFeDo/GkV7Xh1ZymgUwkRp7cKUTDnQ=
Date: Thu, 23 Dec 2021 15:39:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC v2 01/12] target/ppc: powerpc_excp: Set alternate SRRs
 directly
Message-ID: <YcP9cLgrrXyqIyOH@yekko>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lh0R6PhhgBVo/hhH"
Content-Disposition: inline
In-Reply-To: <20211220181903.3456898-2-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lh0R6PhhgBVo/hhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 03:18:52PM -0300, Fabiano Rosas wrote:
> There are currently only two interrupts that use alternate SRRs, so
> let them write to them directly during the setup code.
>=20
> No functional change intented.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index f90e616aac..8b9c6bc5a8 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -298,7 +298,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      target_ulong msr, new_msr, vector;
> -    int srr0, srr1, asrr0, asrr1, lev =3D -1;
> +    int srr0, srr1, lev =3D -1;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                    " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
> @@ -319,8 +319,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>      /* target registers */
>      srr0 =3D SPR_SRR0;
>      srr1 =3D SPR_SRR1;
> -    asrr0 =3D -1;
> -    asrr1 =3D -1;
> =20
>      /*
>       * check for special resume at 0x100 from doze/nap/sleep/winkle on
> @@ -410,8 +408,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>              /* FIXME: choose one or the other based on CPU type */
>              srr0 =3D SPR_BOOKE_MCSRR0;
>              srr1 =3D SPR_BOOKE_MCSRR1;
> -            asrr0 =3D SPR_BOOKE_CSRR0;
> -            asrr1 =3D SPR_BOOKE_CSRR1;
> +
> +            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> +            env->spr[SPR_BOOKE_CSRR1] =3D msr;
>              break;
>          default:
>              break;
> @@ -570,8 +569,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>              /* FIXME: choose one or the other based on CPU type */
>              srr0 =3D SPR_BOOKE_DSRR0;
>              srr1 =3D SPR_BOOKE_DSRR1;
> -            asrr0 =3D SPR_BOOKE_CSRR0;
> -            asrr1 =3D SPR_BOOKE_CSRR1;
> +
> +            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> +            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> +
>              /* DBSR already modified by caller */
>          } else {
>              cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
> @@ -838,14 +839,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
> =20
>      vector |=3D env->excp_prefix;
> =20
> -    /* If any alternate SRR register are defined, duplicate saved values=
 */
> -    if (asrr0 !=3D -1) {
> -        env->spr[asrr0] =3D env->nip;
> -    }
> -    if (asrr1 !=3D -1) {
> -        env->spr[asrr1] =3D msr;
> -    }
> -
>  #if defined(TARGET_PPC64)
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
>          if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lh0R6PhhgBVo/hhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHD/W4ACgkQbDjKyiDZ
s5KQbA/8D6dprVsFw7KWF/vRa7xaDQx3ia56UldWWg9GLHhKp8cR3Wj9ShWigVBu
hCMbeuSpHgs3UwiuOYFHaS7WwzfrxER4b96sozSJdAhLc5KgV7u6j+0DHmZpmvt7
Y+XJX8QE23HSyn55XEsJl/wuOopp2Tzb+9uvWBwwf/TaW5iaEqYWPfJTnfc/O6dY
xNMaSUxKRyVe+Yip5Ph2EXkFlRYvS0iUmj/PoPqv1ZCQyLA9LCJWVB+EVIL2UE5W
B8CJEv4Tj2/SIqR7pGovawcL/HfpLJQSEJZjgHKH4Vdcrqf7/FqhxudhQefrvwyW
vxD7Y+buoIHmx8W7MbWcq/I+r/lIA5yOHuLXyk7TdVcugfI/XoCLe6Fh3Q7XKOsq
M6v7eOevJWYwUs1ZJMbRw8kq6JIaRdUZXINaa/iuW2pK8O3H3bIkM39cxkS59L2z
FznZGYMjnI1tSmHIX7uqyPWOs4Ydxdz5RT/dd/yYWOGyCN0HKEi3vq50R5Y0qpu3
dMx+Yw9h99o8UtjRbVMdJ4E09phaQWTy3iUIZ0ODWQH55Vp3nTXEkHdEs00rNooN
/tHxW2DKQLAB/1ybazV7U+olveCCeG7cCcOtipubmGtT+JjEUu5LQ6Sf6c0QCRAP
Z9gGeHV0XMPhp1oor3aNu4T5Wn9G1N/6vp0xPOncVpV6wWGn3+Y=
=Woay
-----END PGP SIGNATURE-----

--lh0R6PhhgBVo/hhH--

