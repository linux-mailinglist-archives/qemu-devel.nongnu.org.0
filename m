Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932F493876
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:32:32 +0100 (CET)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8GV-0002q3-J1
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86Z-0003NJ-FU; Wed, 19 Jan 2022 05:22:16 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:34135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86X-0007op-3b; Wed, 19 Jan 2022 05:22:15 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jf1sT1fTkz4y4Z; Wed, 19 Jan 2022 21:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642587725;
 bh=edexkb1ffHu2aJzINkSGpaCWyWJY9GxTMl66Ec3pKkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HXQtaLx6j1pj/uswF8hY3MWN+VIN0XtlDj/zMSt2lmkuio1GS6gbdHfYD+K60NnwV
 mWts1xJZwP6WxePKseR4UoRtqcVTQ29eBFm2Ao8rzTTd4s8GehtWM9TiTyN9inxngc
 whhwC1i/514RqfLEu8nEkB0ZA7rCu98SVMQBn5N0=
Date: Wed, 19 Jan 2022 17:06:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 06/14] target/ppc: 405: Machine check exception cleanup
Message-ID: <Yeeqb5EVo3Up0jeU@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-7-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="707HbEm4cZnMUyyJ"
Content-Disposition: inline
In-Reply-To: <20220118184448.852996-7-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
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


--707HbEm4cZnMUyyJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 03:44:40PM -0300, Fabiano Rosas wrote:
> powerpc_excp_40x applies only to the 405, so remove HV code and
> references to BookE.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  target/ppc/excp_helper.c | 26 ++------------------------
>  1 file changed, 2 insertions(+), 24 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index bddea702be..e98d783ecd 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -457,34 +457,12 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>              cs->halted =3D 1;
>              cpu_interrupt_exittb(cs);
>          }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR).
> -             */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -        }
> =20
>          /* machine check exceptions don't have ME set */
>          new_msr &=3D ~((target_ulong)1 << MSR_ME);
> =20
> -        /* XXX: should also have something loaded in DAR / DSISR */

DAR and DSISR don't apply for 40x, but I wonder if we should be
loading something into DEAR or ESR for machine checks.

> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_MCSRR0;
> -            srr1 =3D SPR_BOOKE_MCSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> -            break;
> -        default:
> -            break;
> -        }
> +        srr0 =3D SPR_40x_SRR2;
> +        srr1 =3D SPR_40x_SRR3;
>          break;
>      case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
>          trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--707HbEm4cZnMUyyJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnqmcACgkQgypY4gEw
YSL4CQ/+PASixCZUQOK372ExLv+Vrf7HX8m/9beA4xIrrg7rf+72Le2kkzotIj+8
HMUXw/Tp66Qjhnbm+zLYU89DgC3OLjVSB5MUfuAHpDEikoHljkU5qfYNBBYjVpyQ
ISMFY15mU+Se2h97X6AZ6FISS/3qktiY3DGUaAha10DjI76XD0slcbm31ue6dJ7L
8KN+2gxl+B4TpyxhIktQOsIzf2Pnz8ITnNagvH4BtCWODYvhAuhzS0HLP7ifDLD2
QqcFEUn7ucZ3Zd6KiMXIHH5v11Zf+O+LO2fhb0wII5uurUbqu6JiHL8XGU02QhA8
GYGRcvNadwCn0vdMghS1HfEDEQZ7mFNrF9q6NDc9mm9iQMe56FxHEJOrk3bOJTYd
YEgq29dKz585u6mzxhhbzjF/g97mf+qYAIKJe2xEtupl/AC6DcXI2GTUZJzMDB92
gqi1x5R4OsqhHujYvbaXfcKBCVPAjKIKCYmBanQfm39xIVCTdeVdH/bzY474vVFg
smuDM45ErAqP6/VwDghATsJ/ZpRekmJJdU4TLZruc8DPHpfm3m2oSrnUb/K1ioys
IwJ7mw/QK/ODV/juD6rPYgU8DwaPul5TPp+ndOUOfykpo3OSSSaWqGUthSLLdRAV
yyxudTJ1Szr3JTMjk2xY6u5ZUF6NJmOqumwavHcNo+IL8JR1854=
=dmXB
-----END PGP SIGNATURE-----

--707HbEm4cZnMUyyJ--

