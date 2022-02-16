Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E9B4B7FFE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:21:17 +0100 (CET)
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCkd-0004Oc-M5
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7w-0001Re-1q; Tue, 15 Feb 2022 23:41:16 -0500
Received: from [2404:9400:2221:ea00::3] (port=60549 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7t-0000RV-KI; Tue, 15 Feb 2022 23:41:15 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y34Nlzz4y4r; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=SNGoGsF2v2xQTcDVwI8T/LDhnmpHuJutn2SyCtM/hDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jR/jjJ+lxak7abobm9dO9T3P1f9Sxw3xlxC+Ju+T2OZI+6xo4Gssa+l3DHzgoxlNX
 ovO8rOTBTiw7CnE92FT8B/1hdP0YYwVSZ4uaI57qKPwJmOLo5eXFOOJ1ggvhW5+JQB
 KG2yRpaGW7DR6KPi1/KhjvYziHGKIN/DVEhupfmk=
Date: Wed, 16 Feb 2022 14:04:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 26/27] target/ppc: cpu_init: Move check_pow and QOM
 macros to a header
Message-ID: <YgxpuvVtY3Roy9Pr@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-27-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HaWCEVkqFagXw0eT"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-27-farosas@linux.ibm.com>
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


--HaWCEVkqFagXw0eT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:47PM -0300, Fabiano Rosas wrote:
> These will need to be accessed from other files once we move the CPUs
> code to separate files.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/cpu.h      | 57 +++++++++++++++++++++++++++++++++++++++++++
>  target/ppc/cpu_init.c | 55 -----------------------------------------
>  2 files changed, 57 insertions(+), 55 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6a06a7f533..ba0739c43b 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2733,4 +2733,61 @@ void dump_mmu(CPUPPCState *env);
>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int le=
n);
>  void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
>  uint32_t ppc_get_vscr(CPUPPCState *env);
> +
> +/***********************************************************************=
******/
> +/* Power management enable checks                                       =
     */
> +static inline int check_pow_none(CPUPPCState *env)
> +{
> +    return 0;
> +}
> +
> +static inline int check_pow_nocheck(CPUPPCState *env)
> +{
> +    return 1;
> +}
> +
> +static inline int check_pow_hid0(CPUPPCState *env)

I'm a little nervous about moving this to a more exposed location.  By
definition the HID register is implementation dependent, and we can
see immediately below that not all things use the same interpretation
of it in practice.  So at the very least it seems like it has a bad
name to be exposed more widely.  It also seems like it might better
belong next to the code for the cpus that actually use this version.

> +{
> +    if (env->spr[SPR_HID0] & 0x00E00000) {
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static inline int check_pow_hid0_74xx(CPUPPCState *env)

Similar remarks here.

> +{
> +    if (env->spr[SPR_HID0] & 0x00600000) {
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +/***********************************************************************=
******/
> +/* PowerPC implementations definitions                                  =
     */
> +
> +#define POWERPC_FAMILY(_name)                                           =
    \
> +    static void                                                         =
    \
> +    glue(glue(ppc_, _name), _cpu_family_class_init)(ObjectClass *, void =
*); \
> +                                                                        =
    \
> +    static const TypeInfo                                               =
    \
> +    glue(glue(ppc_, _name), _cpu_family_type_info) =3D {                =
      \
> +        .name =3D stringify(_name) "-family-" TYPE_POWERPC_CPU,         =
      \
> +        .parent =3D TYPE_POWERPC_CPU,                                   =
      \
> +        .abstract =3D true,                                             =
      \
> +        .class_init =3D glue(glue(ppc_, _name), _cpu_family_class_init),=
      \
> +    };                                                                  =
    \
> +                                                                        =
    \
> +    static void glue(glue(ppc_, _name), _cpu_family_register_types)(void=
)   \
> +    {                                                                   =
    \
> +        type_register_static(                                           =
    \
> +            &glue(glue(ppc_, _name), _cpu_family_type_info));           =
    \
> +    }                                                                   =
    \
> +                                                                        =
    \
> +    type_init(glue(glue(ppc_, _name), _cpu_family_register_types))      =
    \
> +                                                                        =
    \
> +    static void glue(glue(ppc_, _name), _cpu_family_class_init)
> +
> +
>  #endif /* PPC_CPU_H */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 3327ea15fd..34306e2360 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2484,61 +2484,6 @@ static void init_excp_POWER10(CPUPPCState *env)
> =20
>  #endif
> =20
> -/***********************************************************************=
******/
> -/* Power management enable checks                                       =
     */
> -static int check_pow_none(CPUPPCState *env)
> -{
> -    return 0;
> -}
> -
> -static int check_pow_nocheck(CPUPPCState *env)
> -{
> -    return 1;
> -}
> -
> -static int check_pow_hid0(CPUPPCState *env)
> -{
> -    if (env->spr[SPR_HID0] & 0x00E00000) {
> -        return 1;
> -    }
> -
> -    return 0;
> -}
> -
> -static int check_pow_hid0_74xx(CPUPPCState *env)
> -{
> -    if (env->spr[SPR_HID0] & 0x00600000) {
> -        return 1;
> -    }
> -
> -    return 0;
> -}
> -
> -/***********************************************************************=
******/
> -/* PowerPC implementations definitions                                  =
     */
> -
> -#define POWERPC_FAMILY(_name)                                           =
    \
> -    static void                                                         =
    \
> -    glue(glue(ppc_, _name), _cpu_family_class_init)(ObjectClass *, void =
*); \
> -                                                                        =
    \
> -    static const TypeInfo                                               =
    \
> -    glue(glue(ppc_, _name), _cpu_family_type_info) =3D {                =
      \
> -        .name =3D stringify(_name) "-family-" TYPE_POWERPC_CPU,         =
      \
> -        .parent =3D TYPE_POWERPC_CPU,                                   =
      \
> -        .abstract =3D true,                                             =
      \
> -        .class_init =3D glue(glue(ppc_, _name), _cpu_family_class_init),=
      \
> -    };                                                                  =
    \
> -                                                                        =
    \
> -    static void glue(glue(ppc_, _name), _cpu_family_register_types)(void=
)   \
> -    {                                                                   =
    \
> -        type_register_static(                                           =
    \
> -            &glue(glue(ppc_, _name), _cpu_family_type_info));           =
    \
> -    }                                                                   =
    \
> -                                                                        =
    \
> -    type_init(glue(glue(ppc_, _name), _cpu_family_register_types))      =
    \
> -                                                                        =
    \
> -    static void glue(glue(ppc_, _name), _cpu_family_class_init)
> -
>  static void init_proc_405(CPUPPCState *env)
>  {
>      register_40x_sprs(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HaWCEVkqFagXw0eT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMabMACgkQgypY4gEw
YSI+Qw//Y4LxhJHX4KyK7Pul14oHNGI8rMk/Ds3YpRb8pTL4sMCqF0bL/bHSh0Pc
B2cMrjwxoO5qV2cK0MowU1kJXKZFa8F01Vi62i+5Q9aHqAvtEwn5MmKWiUPHICxJ
fyWxS4m7+62jiFnLPsn/wPyECms+8W1Qrt2zyOO/oYP9N/vmKEQ6zjk2l0GGwGx5
tsYs7HK7NFvyMOdutJq4Z/1ZiqbFxHTme/ex2ujvyYpIBMBq9kxGO4Mfz5BX6aS3
W6HNM/nF5xQvrl3GVWP9x1B3CgPUSFR6oyZ2GlovpvqEEIWTz9dkyl1ptyX3XyHc
ahWKXe1rO1KR1nprWHSWBincagQVjokCm1sGkerD/20xAf1HCupS3LfWUpHuwXeS
AxUW58ASHI7L+qzbah6lNKDdoeUN2xqdi1CMy/ZuL8biP7r99a5C6w2IP/12sFON
MiFr+tAoRZWB9cc5gIoCTs8CIqR1J7PMFLfmNvk3Yhzo+w1NDWemP8Vu2Jaracb5
Wye9tNfsOPFj33EhZr8Igo0myxMeghpTgLQKKYkn1eJ+rHyE7hBqavKtxb7u6Kb4
RlsCxJUqQUeQBkwHrkQq/e6egQVkd8wLSeaC0ACZYFVDZnqqsdFUhMBvzoQdW2YF
zZejRPFyH4YdjWmDRWmhxEfocQcoW/cmDTh4dwN/OBYYfLNyt5M=
=ZAkZ
-----END PGP SIGNATURE-----

--HaWCEVkqFagXw0eT--

