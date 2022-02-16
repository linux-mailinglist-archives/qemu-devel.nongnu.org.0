Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C414B7FD2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:02:06 +0100 (CET)
Received: from localhost ([::1]:44076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCS5-0002hF-Ki
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:02:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7X-0001HH-0b; Tue, 15 Feb 2022 23:40:58 -0500
Received: from [2404:9400:2221:ea00::3] (port=57021 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7T-0000PN-3t; Tue, 15 Feb 2022 23:40:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33jCWz4y4f; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=1hSRZ8GOyqkuP5fbvnENHb8nX034taLQB44O0BwVP14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aUvxNAdhWjhIXyzPkdqfqyQtyy7w6ch/NNWgPKZ+tzHG2BouVdihWLjLYhDB8uhKO
 LXI5NCBZ47gOUHG9nsD7CclcTjdFNBu0Uq2YDkyF05LneaBmzriqgcFIWLlUPsM3AE
 pbkLtao8X65hlo3LTFuFiuALt5CRUZVMMq/dXPKE=
Date: Wed, 16 Feb 2022 13:27:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 18/27] target/ppc: cpu_init: Reuse init_proc_603 for the
 e300
Message-ID: <YgxhDGf1xKOrce4c@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-19-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QSbEOI70VebWclHc"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-19-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--QSbEOI70VebWclHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:39PM -0300, Fabiano Rosas wrote:
> init_proc_603 is defined after init_proc_e300, so I had to move some
> code around to make it work.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 104 +++++++++++++++++++-----------------------
>  1 file changed, 46 insertions(+), 58 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index baf6be5b0d..8fbd205699 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -3269,64 +3269,6 @@ POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_BUS_CLK;
>  }
> =20
> -static void init_proc_e300(CPUPPCState *env)
> -{
> -    register_ne_601_sprs(env);
> -    register_sdr1_sprs(env);
> -    register_603_sprs(env);
> -    register_e300_sprs(env);
> -
> -    /* Memory management */
> -    register_low_BATs(env);
> -    register_high_BATs(env);
> -    register_6xx_7xx_soft_tlb(env, 64, 2);
> -    init_excp_603(env);
> -    env->dcache_line_size =3D 32;
> -    env->icache_line_size =3D 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc6xx_irq_init(env_archcpu(env));
> -}
> -
> -POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc =3D DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc =3D "e300 core";
> -    pcc->init_proc =3D init_proc_e300;
> -    pcc->check_pow =3D check_pow_hid0;
> -    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> -                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
> -                       PPC_FLOAT_STFIWX |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
> -                       PPC_SEGMENT | PPC_EXTERN;
> -    pcc->msr_mask =3D (1ull << MSR_POW) |
> -                    (1ull << MSR_TGPR) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_FP) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_FE0) |
> -                    (1ull << MSR_SE) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_FE1) |
> -                    (1ull << MSR_AL) |
> -                    (1ull << MSR_EP) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR) |
> -                    (1ull << MSR_RI) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
> -    pcc->excp_model =3D POWERPC_EXCP_6xx;
> -    pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
> -    pcc->bfd_mach =3D bfd_mach_ppc_603;
> -    pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
> -                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
> -}
> -
>  enum fsl_e500_version {
>      fsl_e500v1,
>      fsl_e500v2,
> @@ -3882,6 +3824,52 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
>                   POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
>  }
> =20
> +static void init_proc_e300(CPUPPCState *env)
> +{
> +    init_proc_603(env);
> +    register_e300_sprs(env);
> +}
> +
> +POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> +
> +    dc->desc =3D "e300 core";
> +    pcc->init_proc =3D init_proc_e300;
> +    pcc->check_pow =3D check_pow_hid0;
> +    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> +                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
> +                       PPC_FLOAT_STFIWX |
> +                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
> +                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> +                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
> +                       PPC_SEGMENT | PPC_EXTERN;
> +    pcc->msr_mask =3D (1ull << MSR_POW) |
> +                    (1ull << MSR_TGPR) |
> +                    (1ull << MSR_ILE) |
> +                    (1ull << MSR_EE) |
> +                    (1ull << MSR_PR) |
> +                    (1ull << MSR_FP) |
> +                    (1ull << MSR_ME) |
> +                    (1ull << MSR_FE0) |
> +                    (1ull << MSR_SE) |
> +                    (1ull << MSR_DE) |
> +                    (1ull << MSR_FE1) |
> +                    (1ull << MSR_AL) |
> +                    (1ull << MSR_EP) |
> +                    (1ull << MSR_IR) |
> +                    (1ull << MSR_DR) |
> +                    (1ull << MSR_RI) |
> +                    (1ull << MSR_LE);
> +    pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
> +    pcc->excp_model =3D POWERPC_EXCP_6xx;
> +    pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
> +    pcc->bfd_mach =3D bfd_mach_ppc_603;
> +    pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
> +                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
> +}
> +
>  static void init_proc_604(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QSbEOI70VebWclHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMYQUACgkQgypY4gEw
YSKf5xAA11k4/NFndzcGB1l0XexC5DjOZqtnfGxRY0vGsVKZ5qeIAu7gniO37uE3
qOE8AuA2PuBciNBVi6gaVzs8vatvwNPJEwBhpC8CsgrB+NLNijPSZBRdIfA4UGTh
g3CxsgFcdjMxBGXcHquZXifovyfZOlM445eHzpCSu/fmDTDTqv1rFCVbrrZ7msUD
zqV5/aUOCY5WJ6j93VxRdn4pOlaYCni4X+aWHbuFP7qizS0z3qjFgKHUG8eZ6E4d
cBRt88WhQrZ1tUhkSGvq3yxNMbgZnGDCH/4PCltRYmau1+T8ktMZVIgSWwZUu1jh
83brnhGtqN9E9CF3lRixDoB9OlxzFAkwvbAHgNmyc8jK1mIO3df4fwVunGvJm73m
2eHWnGnPurGwiWlKR9zLQVnHE0WmNbBDwAHIzP79OlTROIIfhB1HV78TIpo4hwJt
sx8SiXDKPD/EjeLLpOdNHHvu0gY00McucV3Gp/z7iNy9DMv/6nfrkGFxidCLRawE
mhE+wtdgCfftkRMZG1BeVcw+Vphp+OBjKqaCAIyJnvsn0hB2l8nHSYf9CJ0uBT+R
LGLR078jkZcEDbXnfwhBgPkuhv/h5nSIQwixLi1MevCe6wYWbPKeGGn9iyEPzQMO
WvTg+riBMO8Fiw9Up89+/1jFn3HRfn7elK9MWQfzLlqlL78HEL0=
=7l/V
-----END PGP SIGNATURE-----

--QSbEOI70VebWclHc--

