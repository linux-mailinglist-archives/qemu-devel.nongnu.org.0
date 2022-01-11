Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA10748A5BC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:40:45 +0100 (CET)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n775Y-00070U-2Y
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:40:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wq-0006FG-9L; Mon, 10 Jan 2022 21:31:44 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=55179
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wk-0000ys-D0; Mon, 10 Jan 2022 21:31:41 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXvpB1Rgxz4y4d; Tue, 11 Jan 2022 13:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641868290;
 bh=XzTgqL2Z8UhB1DiLj0Sa8LLyNgFGELUqGDC6HHJhAno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMsfuVAkeoo6MYsHf/gubkG5lnZhf8Sd1RaV+4k3qHKPRrgYX1rFUFLbVWFNTpHUN
 tw01tNl2h9p4EWck64NSBv9TZodPQ2BY0YS279pSljdJi3xSTSgvMIBl2pKDJT+VO4
 Gcem+BEXSFA+Vqan/XGp9Ji4NLCSYIdfD/DHiUco=
Date: Tue, 11 Jan 2022 13:10:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 2/8] target/ppc: 405: Add missing exception handlers
Message-ID: <YdznIKAOxcLRSPDl@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cMbVlGZtnXciRPTT"
Content-Disposition: inline
In-Reply-To: <20220110181546.4131853-3-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cMbVlGZtnXciRPTT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 03:15:40PM -0300, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/cpu_init.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index a50ddaeaae..9097948e67 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1951,7 +1951,9 @@ static void init_excp_4xx_softmmu(CPUPPCState *env)
>      env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
>      env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
>      env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> +    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;

I have a vague recollection from my days of working on 405 that there
may have been something funky with FP emulation on there: e.g. FP
instructions causing 0x700 program interrupts instead of FP unavailble
interrupts or something.

I might be remembering incorrectly - the manual does seem to imply
that 0x800 FP unavailable is there as normal, but it might be worth
double checking this (against real hardware, if possible).

>      env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> +    env->excp_vectors[POWERPC_EXCP_APU]      =3D 0x00000F20;
>      env->excp_vectors[POWERPC_EXCP_PIT]      =3D 0x00001000;
>      env->excp_vectors[POWERPC_EXCP_FIT]      =3D 0x00001010;
>      env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00001020;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cMbVlGZtnXciRPTT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHc5yAACgkQbDjKyiDZ
s5LGuQ/9FdoRWsQ3HoLt8r8y5umiSFszGwguFm6kFdfeCoHdbSGfyAfyBCgjUZy+
mOznUqNDJbnUBUxuVbuvQeVI1qBmwZ8CRwF5jcpMpxf9fUN/4XHbAPUr2rsVSGYB
NvhYxUoKrha70+dE/l0zvwLZnF5jYYSmSbCj0auVwdjPHhGlOekHL0Al4L5dPurs
L3NOGjWFFVSgYf0z5ngzABDLbdAzCaYFrQI5R+fCLmqaAbXMM02qfwunoeDtgejo
TbPaMFX4Hkv7om2oCFNUpf0E+6rcBhCuZ3Rxay9l2fjEkcKidXmmkxxckuf98bAp
KcP2zdvJRWguT/ykX5TUZspwgXxV14lXhYDfbebIrg8MSTv1ROoCpEcTGpgXc65W
TAtLZhs0Gmc/tYE7twtbgK6BduYtjmDMpKsz0+m4uZZqGwBWmVxQVmyxFq9oXUZ0
+23PK094ELnpIu6dyHdLDz2vIuk/cY71gnfiCQUQLa8sJ14/l+TC1TUUR7k0C1Mw
GadrzBlZsxKWaxsnqO/S+qFymlpg8Nem/jHElWwl1yMpcvpVQhBjTx1Ok1e+d423
yf2xL90XT15OhPldeev4ASBggismZ1FhImBFHyHpl5i66zzh7EB2zMW/VYapp2Mf
d0uoXhRpFSL0jkj6SGlL1YrKGQmQHlAUf/A5wrVyUYxkCkQqMy4=
=nBCt
-----END PGP SIGNATURE-----

--cMbVlGZtnXciRPTT--

