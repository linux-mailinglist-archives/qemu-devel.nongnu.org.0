Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE64B7FCD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:00:12 +0100 (CET)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCQF-0001IL-SJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:00:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7B-0000yk-76; Tue, 15 Feb 2022 23:40:29 -0500
Received: from [2404:9400:2221:ea00::3] (port=60535 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC75-00009c-HM; Tue, 15 Feb 2022 23:40:26 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y32QNSz4y3s; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=vBjyiAlYYNj23fRy3dDYel1Ym9apfdDyYREJnn218PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YezdeaP9ncuW1zvH2z3IRxB964rynEjbnI1V/N79TuRo4/+27NRHbh1P8dQX+Vl8r
 txeEY8bABT4TdfXdruykgOOJ4t1IwUZVYzHlFplsoh6zrZf/KvT0p4qD1JFilcVk8O
 JO67/F8aLLGP5QBqDHqBzIXWQdWqOseDRJ8CZ2BM=
Date: Wed, 16 Feb 2022 13:10:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 03/27] target/ppc: cpu_init: Group registration of
 generic SPRs
Message-ID: <Ygxc/sgNqohLEDdn@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CSiOzBVKJfXeDSle"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-4-farosas@linux.ibm.com>
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


--CSiOzBVKJfXeDSle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:24PM -0300, Fabiano Rosas wrote:
> The top level init_proc calls register_generic_sprs but also registers
> some other SPRs outside of that function. Let's group everything into
> a single place.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Of course the SVR probably doesn't belong in this generic function,
but that can be a later cleanup.

> ---
>  target/ppc/cpu_init.c | 58 ++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 26 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 7488001385..5dc097f2fc 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -150,8 +150,11 @@ static void _spr_register(CPUPPCState *env, int num,=
 const char *name,
>                       oea_read, oea_write, 0, ival)
> =20
>  /* Generic PowerPC SPRs */
> -static void register_generic_sprs(CPUPPCState *env)
> +static void register_generic_sprs(PowerPCCPU *cpu)
>  {
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
>      /* Integer processing */
>      spr_register(env, SPR_XER, "XER",
>                   &spr_read_xer, &spr_write_xer,
> @@ -192,6 +195,32 @@ static void register_generic_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> +
> +    spr_register(env, SPR_PVR, "PVR",
> +                 /* Linux permits userspace to read PVR */
> +#if defined(CONFIG_LINUX_USER)
> +                 &spr_read_generic,
> +#else
> +                 SPR_NOACCESS,
> +#endif
> +                 SPR_NOACCESS,
> +                 &spr_read_generic, SPR_NOACCESS,
> +                 pcc->pvr);
> +
> +    /* Register SVR if it's defined to anything else than POWERPC_SVR_NO=
NE */
> +    if (pcc->svr !=3D POWERPC_SVR_NONE) {
> +        if (pcc->svr & POWERPC_SVR_E500) {
> +            spr_register(env, SPR_E500_SVR, "SVR",
> +                         SPR_NOACCESS, SPR_NOACCESS,
> +                         &spr_read_generic, SPR_NOACCESS,
> +                         pcc->svr & ~POWERPC_SVR_E500);
> +        } else {
> +            spr_register(env, SPR_SVR, "SVR",
> +                         SPR_NOACCESS, SPR_NOACCESS,
> +                         &spr_read_generic, SPR_NOACCESS,
> +                         pcc->svr);
> +        }
> +    }
>  }
> =20
>  /* SPR common to all non-embedded PowerPC, including 601 */
> @@ -7241,31 +7270,8 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>      env->tlb_type =3D TLB_NONE;
>  #endif
>      /* Register SPR common to all PowerPC implementations */
> -    register_generic_sprs(env);
> -    spr_register(env, SPR_PVR, "PVR",
> -                 /* Linux permits userspace to read PVR */
> -#if defined(CONFIG_LINUX_USER)
> -                 &spr_read_generic,
> -#else
> -                 SPR_NOACCESS,
> -#endif
> -                 SPR_NOACCESS,
> -                 &spr_read_generic, SPR_NOACCESS,
> -                 pcc->pvr);
> -    /* Register SVR if it's defined to anything else than POWERPC_SVR_NO=
NE */
> -    if (pcc->svr !=3D POWERPC_SVR_NONE) {
> -        if (pcc->svr & POWERPC_SVR_E500) {
> -            spr_register(env, SPR_E500_SVR, "SVR",
> -                         SPR_NOACCESS, SPR_NOACCESS,
> -                         &spr_read_generic, SPR_NOACCESS,
> -                         pcc->svr & ~POWERPC_SVR_E500);
> -        } else {
> -            spr_register(env, SPR_SVR, "SVR",
> -                         SPR_NOACCESS, SPR_NOACCESS,
> -                         &spr_read_generic, SPR_NOACCESS,
> -                         pcc->svr);
> -        }
> -    }
> +    register_generic_sprs(cpu);
> +
>      /* PowerPC implementation specific initialisations (SPRs, timers, ..=
=2E) */
>      (*pcc->init_proc)(env);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CSiOzBVKJfXeDSle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXPcACgkQgypY4gEw
YSLLrA/+KNeZZV/KgbMj3hPk70pkaR+dwTwUCarwe9ESrGJl5asCFb5MIDDpf7d5
bgKuewEYJL2KpLt32t/t0QzePmlzPARDq5TMMyd5cJwbfZQExRXah+x/PlsfYaw6
EFdMT4mo2Htv98brXod+jOrq2Ey5nSygPgacELQiuL/WuFqQP79Ho8fpkArwxQEs
NlmJCIRpWb8G8hxHPsDWhpphkafOK0KH1h2zozrOll70pJq7sShj9qfku3yKh75o
jOXxhnDAFBfnAlJcDVN1cdAQXdnwpu7RKF+D7K1bKeqK3Pvmu0Ymp+b4uu9fjARI
8gODpqGH7V3CfiPAmA1uI3G3wONNKzKfTnv5iJJMiCIqLlPZCKKmth8N4Fkq5OoY
y+/PNRkFOr3gQrDqRpn4BHUkirrtyV5hfHJhUCjOs0+AtR/dLwhevNTmI02IbMTI
tTOcZ2fweIyl3w9qHOEH8E5Bk9wtAZ+/zM6pTwIdDiwZAx7ObZK5chBygijgNspg
lzRVjIX62i10yhj6kGDuI8DlpTc3FbocKVY2C01EFxxGm5RCestO/CcjYKXohbhH
T/9yYSn3k7F94yCYvXpwJzoosziguK5/XiRVsI+TgF5Vg2AGL5Jm7vUHFod0w1W4
pYGV9qHMOet6Tr2PMD/u1tgfdIL3DL0H+TCiJQgb0Q7M+pDh49w=
=am9C
-----END PGP SIGNATURE-----

--CSiOzBVKJfXeDSle--

