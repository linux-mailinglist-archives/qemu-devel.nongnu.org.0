Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C75147DE45
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 05:36:05 +0100 (CET)
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Fpk-000712-3I
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 23:36:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n0FmF-0005Mx-Cc; Wed, 22 Dec 2021 23:32:27 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:36193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n0FmC-0005Pf-9z; Wed, 22 Dec 2021 23:32:26 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JKHNG2Ml6z4xgt; Thu, 23 Dec 2021 15:32:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1640233934;
 bh=X9IZec/pEPwjNRwP+bOA83ub3oMWAyE6wNCRkf2vNyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nLMdDUCtfL/jBNjCwrfsLkCrVHS8sLPj4imaLukJBGYM83ZCMcruQVdEom6BkbjRx
 /vBhroTduXfA9OxwxjJKViuEVswUvfkPtkpGzYZ2F9dJ3TAT/+9KpkZ+fcgSvRLsZR
 QjbRpFYBHFUfq1VJl0yVWzs/c4MXGFr95xFGijTs=
Date: Thu, 23 Dec 2021 15:25:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/8] target/ppc: Print out literal exception names in logs
Message-ID: <YcP6ME4lnSZe2Gpj@yekko>
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XzkuDUM+Jo9xT6Ld"
Content-Disposition: inline
In-Reply-To: <20211222064025.1541490-2-clg@kaod.org>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XzkuDUM+Jo9xT6Ld
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2021 at 07:40:18AM +0100, C=E9dric le Goater wrote:
> It facilitates reading the logs when mask CPU_LOG_INT is activated. We
> should do the same for error codes.
>=20
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 75 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index f90e616aacda..71ad983e67d6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -32,6 +32,78 @@
> =20
>  /* #define DEBUG_SOFTWARE_TLB */
> =20
> +static inline const char *powerpc_excp_name(int excp)
> +{
> +    switch (excp) {
> +    case POWERPC_EXCP_CRITICAL: return "CRITICAL";
> +    case POWERPC_EXCP_MCHECK:   return "MCHECK";
> +    case POWERPC_EXCP_DSI:      return "DSI";
> +    case POWERPC_EXCP_ISI:      return "ISI";
> +    case POWERPC_EXCP_EXTERNAL: return "EXTERNAL";
> +    case POWERPC_EXCP_ALIGN:    return "ALIGN";
> +    case POWERPC_EXCP_PROGRAM:  return "PROGRAM";
> +    case POWERPC_EXCP_FPU:      return "FPU";
> +    case POWERPC_EXCP_SYSCALL:  return "SYSCALL";
> +    case POWERPC_EXCP_APU:      return "APU";
> +    case POWERPC_EXCP_DECR:     return "DECR";
> +    case POWERPC_EXCP_FIT:      return "FIT";
> +    case POWERPC_EXCP_WDT:      return "WDT";
> +    case POWERPC_EXCP_DTLB:     return "DTLB";
> +    case POWERPC_EXCP_ITLB:     return "ITLB";
> +    case POWERPC_EXCP_DEBUG:    return "DEBUG";
> +    case POWERPC_EXCP_SPEU:     return "SPEU";
> +    case POWERPC_EXCP_EFPDI:    return "EFPDI";
> +    case POWERPC_EXCP_EFPRI:    return "EFPRI";
> +    case POWERPC_EXCP_EPERFM:   return "EPERFM";
> +    case POWERPC_EXCP_DOORI:    return "DOORI";
> +    case POWERPC_EXCP_DOORCI:   return "DOORCI";
> +    case POWERPC_EXCP_GDOORI:   return "GDOORI";
> +    case POWERPC_EXCP_GDOORCI:  return "GDOORCI";
> +    case POWERPC_EXCP_HYPPRIV:  return "HYPPRIV";
> +    case POWERPC_EXCP_RESET:    return "RESET";
> +    case POWERPC_EXCP_DSEG:     return "DSEG";
> +    case POWERPC_EXCP_ISEG:     return "ISEG";
> +    case POWERPC_EXCP_HDECR:    return "HDECR";
> +    case POWERPC_EXCP_TRACE:    return "TRACE";
> +    case POWERPC_EXCP_HDSI:     return "HDSI";
> +    case POWERPC_EXCP_HISI:     return "HISI";
> +    case POWERPC_EXCP_HDSEG:    return "HDSEG";
> +    case POWERPC_EXCP_HISEG:    return "HISEG";
> +    case POWERPC_EXCP_VPU:      return "VPU";
> +    case POWERPC_EXCP_PIT:      return "PIT";
> +    case POWERPC_EXCP_IO:       return "IO";
> +    case POWERPC_EXCP_RUNM:     return "RUNM";
> +    case POWERPC_EXCP_EMUL:     return "EMUL";
> +    case POWERPC_EXCP_IFTLB:    return "IFTLB";
> +    case POWERPC_EXCP_DLTLB:    return "DLTLB";
> +    case POWERPC_EXCP_DSTLB:    return "DSTLB";
> +    case POWERPC_EXCP_FPA:      return "FPA";
> +    case POWERPC_EXCP_DABR:     return "DABR";
> +    case POWERPC_EXCP_IABR:     return "IABR";
> +    case POWERPC_EXCP_SMI:      return "SMI";
> +    case POWERPC_EXCP_PERFM:    return "PERFM";
> +    case POWERPC_EXCP_THERM:    return "THERM";
> +    case POWERPC_EXCP_VPUA:     return "VPUA";
> +    case POWERPC_EXCP_SOFTP:    return "SOFTP";
> +    case POWERPC_EXCP_MAINT:    return "MAINT";
> +    case POWERPC_EXCP_MEXTBR:   return "MEXTBR";
> +    case POWERPC_EXCP_NMEXTBR:  return "NMEXTBR";
> +    case POWERPC_EXCP_ITLBE:    return "ITLBE";
> +    case POWERPC_EXCP_DTLBE:    return "DTLBE";
> +    case POWERPC_EXCP_VSXU:     return "VSXU";
> +    case POWERPC_EXCP_FU:       return "FU";
> +    case POWERPC_EXCP_HV_EMU:   return "HV_EMU";
> +    case POWERPC_EXCP_HV_MAINT: return "HV_MAINT";
> +    case POWERPC_EXCP_HV_FU:    return "HV_FU";
> +    case POWERPC_EXCP_SDOOR:    return "SDOOR";
> +    case POWERPC_EXCP_SDOOR_HV: return "SDOOR_HV";
> +    case POWERPC_EXCP_HVIRT:    return "HVIRT";
> +    case POWERPC_EXCP_SYSCALL_VECTORED: return "SYSCALL_VECTORED";
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  /***********************************************************************=
******/
>  /* Exception processing */
>  #if !defined(CONFIG_USER_ONLY)
> @@ -301,7 +373,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>      int srr0, srr1, asrr0, asrr1, lev =3D -1;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
> +                  " =3D> %s (%d) error=3D%02x\n", env->nip, powerpc_excp=
_name(excp),
> +                  excp, env->error_code);
> =20
>      /* new srr1 value excluding must-be-zero bits */
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XzkuDUM+Jo9xT6Ld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHD+isACgkQbDjKyiDZ
s5KWuxAAoap9lAyhbaEteTfzWaAuzK5/WNvHrmbCkWNTm/6wVbMq6Mjff38WzP6E
+pK8ZTYjp2gY6JOYesR1lXB8ccp2CueSbU4VfJlcjackldMNr3qTs26VLymzlOFM
8AGn/WltpguW2bGFceQ+0wFAGZvz6exK2RPp+PMiRsUMGEY1kMbzoUDQ8Orl7cTT
wKBUaUyXzmpODq2QqvWob+jdn717SkQKlzEC98Xubwj09bfarfDcFxwx04xZtsKv
2GRwpBbvASuybRZ6I4Iq0ArHBDrYmZ5Ee/bAthL1MQebya7jcNbpVtAAIzs6982b
KUAt8A/eNLJyNquqrP9EGs+ItnvMvZ8wsSepTdE6RYKszb2GEn6f+C6iAGzEGb0T
fGr8KspUU++b+cHR15Bf6xCrFoANM/rsIfbyf6jkjBj30UpzrV+Ygo5Pc0iHuOyd
khz0lItgxo+eKqS8Z9FofoYLH3T9nCOTbFHcmRuIxeTIofjSul6VIeO/U5FWJJ5b
J48V1zjcERPcd6UFJ4/15RxMhyY0t4/qoOWx4SwReq0V4wYjAZaz9oSAehdmAEfR
Iikcv0o2AVvFgLTP7tDdSRgRbvNW+M0nkFI0mB2Yl6/pl6yi8Cu3CtsOFLSP8i7y
4lyVTfP2ofTxizOng8lKHmGpGoMwao9sTkwTyF3w6f3K6M7XCWc=
=fJWV
-----END PGP SIGNATURE-----

--XzkuDUM+Jo9xT6Ld--

