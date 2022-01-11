Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8307848A5C1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:42:46 +0100 (CET)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n777V-00005c-Hn
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:42:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wx-0006Nq-MC; Mon, 10 Jan 2022 21:31:51 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:40367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76ws-000158-G5; Mon, 10 Jan 2022 21:31:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXvpB26lvz4y4j; Tue, 11 Jan 2022 13:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641868290;
 bh=mVfpKYEOGsfluuFg7Qc1hbcl3pdLRopAQED1rvVb8bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TbUcGJSc29R9aTyq9sZhu8krU5GJcLQHNKAuo6SfbRGQcJBHvTQsi5nY/ZlbGJQxW
 yuJOiagcsctZhlDU9emNMUMBzg/xliXLNqhmP9Q2+PkIrrFSkKrCwRV0PvAjfBxOKm
 Bbe2w+Gml/TWkI2SdjhPaWz6rQVhRf1nQFm13G/4=
Date: Tue, 11 Jan 2022 13:28:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 7/8] target/ppc: 405: External exception cleanup
Message-ID: <YdzrP2Gb+sbSlI1X@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-8-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TFdmIUr2vPAV/4SJ"
Content-Disposition: inline
In-Reply-To: <20220110181546.4131853-8-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TFdmIUr2vPAV/4SJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 03:15:45PM -0300, Fabiano Rosas wrote:
> 405 has no MSR_HV and EPR is BookE only so we can remove it all.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 37 -------------------------------------
>  1 file changed, 37 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 82ade5d7bd..f7b9af5065 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -464,44 +464,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int ex=
cp)
>          msr |=3D env->error_code;
>          break;
>      case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
> -    {
> -        bool lpes0;
> -
> -        cs =3D CPU(cpu);
> -
> -        /*
> -         * Exception targeting modifiers
> -         *
> -         * LPES0 is supported on POWER7/8/9
> -         * LPES1 is not supported (old iSeries mode)
> -         *
> -         * On anything else, we behave as if LPES0 is 1
> -         * (externals don't alter MSR:HV)
> -         */
> -#if defined(TARGET_PPC64)
> -        if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER10) {
> -            lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        } else
> -#endif /* defined(TARGET_PPC64) */
> -        {
> -            lpes0 =3D true;
> -        }
> -
> -        if (!lpes0) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -            new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -            srr0 =3D SPR_HSRR0;
> -            srr1 =3D SPR_HSRR1;
> -        }
> -        if (env->mpic_proxy) {
> -            /* IACK the IRQ on delivery */
> -            env->spr[SPR_BOOKE_EPR] =3D ldl_phys(cs->as, env->mpic_iack);
> -        }
>          break;
> -    }
>      case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
>          /* Get rS/rD and rA from faulting opcode */
>          /*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TFdmIUr2vPAV/4SJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHc6z8ACgkQbDjKyiDZ
s5Lh2Q/+MWnNW4Vk1+dVM1wr+IO7EExi+hYFU2428tfL3TredNp6prSGSiIeP6r2
blRbXjAf18paxIBk5aPr8NvP4Yyr6Q7o/o4ziKdXR/cSmWJf5PdDaWPzFJXdLWhJ
XtFMIbijdnLU8OI8gLO+UAKW92OoFLKK+gO8QNgWYvW9GOkgguFa7v9lzCCr8sEH
POTdRoAzLWtMZbveAukoJXjloWo+jJcZcEu3SyZaNQYAuPUAvsrLRJ01wxD1A5Fq
/XROG4+iA4EDSpLMnvL5G3INTOm9LHJ5YnTLz7V1dF//wImcDHDHV+bID+tj4gRO
71TKxnKxXYtvRkALePTqbaOmBTfl/QKN1CMpFC/TQhWf+EB4xTB5r0xfxuUWxynB
cF4oUuG/Uct8rYQKob2C3j6DwduqQf18cVtTl9O0jHyzwnBXylZsn6jUFp6Xsyyp
dBR4+Edppmi4vTgc70Sl2oRWcgXkFFo9OL6HGsRAIvLmgtlXifM/e8sCIogZ6wgf
lF7c4ht3M9/X0LaPw9pBY2NF6uO/kdGTrmUKp8e/7PR7X8ye9er0fJEqu5e9hD+B
rxzQQ2YszpTojWR9ZNvnIcFoCW1krqSWS40HdTfRW3Cwr8FMs4YGZh3ahX1N42SA
W0Ja6xe7rMwzY1kxU4CxORoFpluywsnNLbbrleDfJTF/BZZui+o=
=S3L/
-----END PGP SIGNATURE-----

--TFdmIUr2vPAV/4SJ--

