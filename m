Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE00398383
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:47:45 +0200 (CEST)
Received: from localhost ([::1]:38050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLbM-0000yl-KQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loLYO-0004Kn-DV; Wed, 02 Jun 2021 03:44:41 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loLYM-0000BU-4A; Wed, 02 Jun 2021 03:44:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw1JB50D4z9sCD; Wed,  2 Jun 2021 17:44:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622619866;
 bh=W2tlBo2ARWCElRe5U/oHS932+s6mh6ttmZTIQA0gY0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a3MIBfUwm16scHWeQmGz/o+ZUj5nOTc+HLMUl2crg5cAM9IVG+WyTTfZU8xYtUJi2
 pRRxkaccORkZHZZ4mn3NOIwwKi7j2rhnHPGqujCCaExyIxMFAPfx4UeTBfh5JuOOb6
 dLh88PD1JfEJxJLyqc+09sb6hWiPJ4btI5w2/bg0=
Date: Wed, 2 Jun 2021 17:37:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 2/5] target/ppc: powerpc_excp: Remove
 dump_syscall_vectored
Message-ID: <YLc1NzwJjofIWq4w@yekko>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pitlzu2wrbfWiWzG"
Content-Disposition: inline
In-Reply-To: <20210601214649.785647-3-farosas@linux.ibm.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pitlzu2wrbfWiWzG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 06:46:46PM -0300, Fabiano Rosas wrote:
> This function is identical to dump_syscall, so use the latter for
> system call vectored as well.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/excp_helper.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 5ea8503b46..9e3aae1c96 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -70,18 +70,6 @@ static inline void dump_syscall(CPUPPCState *env)
>                    ppc_dump_gpr(env, 8), env->nip);
>  }
> =20
> -static inline void dump_syscall_vectored(CPUPPCState *env)
> -{
> -    qemu_log_mask(CPU_LOG_INT, "syscall r0=3D%016" PRIx64
> -                  " r3=3D%016" PRIx64 " r4=3D%016" PRIx64 " r5=3D%016" P=
RIx64
> -                  " r6=3D%016" PRIx64 " r7=3D%016" PRIx64 " r8=3D%016" P=
RIx64
> -                  " nip=3D" TARGET_FMT_lx "\n",
> -                  ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
> -                  ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
> -                  ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
> -                  ppc_dump_gpr(env, 8), env->nip);
> -}
> -
>  static inline void dump_hcall(CPUPPCState *env)
>  {
>      qemu_log_mask(CPU_LOG_INT, "hypercall r3=3D%016" PRIx64
> @@ -564,7 +552,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          break;
>      case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
>          lev =3D env->error_code;
> -        dump_syscall_vectored(env);
> +        dump_syscall(env);
>          env->nip +=3D 4;
>          new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
>          new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pitlzu2wrbfWiWzG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3NTcACgkQbDjKyiDZ
s5IIuxAAg/0keVA1L2zjDbWd2+RdMaOTWlXadiFkdUX9L7FwD4KfKCmH1ORj4VvX
f4ALJRU5u/36aPwDyVduZ1+dcn9nOGoLigx8Z+vUJUw7HEGHlWxuA5yi7qGNCIDB
J5GkE6nqnErTD5v8cTskZFz1DP0NLbVoDqAvZZem+odAaApOEhI+lhH49TNf9L0b
N5hQbDdecfajR3w+GvwMEKUcWaEh0Lf9X5WDCfZNEAGv3YhNs+AgrM/0AiLHd8dN
8KjGtdKUyfGzYrfd5lJPZHloCqiLjN7JSOeUmIlzGvwP3ccJ6l2wG/LIP5wMSuwk
bNoXS+3fO0KdZ6V0guDc0RXBAnTdvCqgpUR4hRigr8fmXkpiYZsuXnftIdKDRpig
UgMLadR61fu8wwDOT7FI7I6qt0z5/My0eJulS1cexKvJkQbOwvXQSxTaXELsFP2G
yMtQfK08AyllujMSHTXkFqY4GhBbKDG00qkhXPLT+y8+WJZG1yGLKYYNlFxzQTdc
j+ZvWddcKnfn5ft3KGV9LhxsukVfMvAFPJ/2KzEV70QJATqerkoZUM4A51sT34wG
xw00ILT38ngVIXxxvaBwnGQFF+WNTJ4RNAWBjH3P18b5SKYgpduDh1hB6oV0eMfC
lL720oxExzCxhwdZGm/7uDpyHqtVr3oCBr4zIxPFP1uMliylEF8=
=IDt0
-----END PGP SIGNATURE-----

--pitlzu2wrbfWiWzG--

