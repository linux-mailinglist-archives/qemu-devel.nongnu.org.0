Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C44B9592
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 02:39:54 +0100 (CET)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKVlx-00057o-TE
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 20:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVe9-0002br-EP; Wed, 16 Feb 2022 20:31:49 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:41569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVe6-0002QG-3C; Wed, 16 Feb 2022 20:31:49 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jzck42Wfgz4xv3; Thu, 17 Feb 2022 12:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645061500;
 bh=D/JNyxsSI9J36OApW0gSU7IGc7OIGnfAHbgkHIS7RrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JSmpoKKfiqw/qX2CA9EO1dGNztV7RJvQtDyK7dM1I/U7cju7AiD8yGRVhe2qBZo3z
 Uua9HOLcRnBEbfoUmzqhSGlY1Hdngdng9oY4ocCJiEoAh/oQHQIsVlelb+9ONWJHle
 ZAicT7Hg0qa1T/Y5NuL9EkvHbDWaVb2aukfhKB5U=
Date: Thu, 17 Feb 2022 10:35:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 26/27] target/ppc: cpu_init: Move check_pow and QOM
 macros to a header
Message-ID: <Yg2KTM6TiMAFQxfp@yekko>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
 <20220216162426.1885923-27-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cEJQVZRgMdoAhZEy"
Content-Disposition: inline
In-Reply-To: <20220216162426.1885923-27-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--cEJQVZRgMdoAhZEy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 01:24:25PM -0300, Fabiano Rosas wrote:
> These will need to be accessed from other files once we move the CPUs
> code to separate files.
>=20
> The check_pow_hid0 and check_pow_hid0_74xx are too specific to be
> moved to a header so I'll deal with them later when splitting this
> code between the multiple CPU families.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h      | 39 +++++++++++++++++++++++++++++++++++++++
>  target/ppc/cpu_init.c | 37 -------------------------------------
>  2 files changed, 39 insertions(+), 37 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6a06a7f533..1d33e8afea 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2733,4 +2733,43 @@ void dump_mmu(CPUPPCState *env);
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
> index 4c6b462cad..5bbbcceb55 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2484,18 +2484,6 @@ static void init_excp_POWER10(CPUPPCState *env)
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
>  static int check_pow_hid0(CPUPPCState *env)
>  {
>      if (env->spr[SPR_HID0] & 0x00E00000) {
> @@ -2514,31 +2502,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
>      return 0;
>  }
> =20
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

--cEJQVZRgMdoAhZEy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmINikUACgkQgypY4gEw
YSKh1g/+Iva0OBZUPqhusUBkPVEQYRslL0yiBqbXOMg8wogoPmib6+aG9B3wJFUr
MAUSY4i5yUQOCtorTPGEs1H9bCpF0VKi7Q1zo3Jvh9SI/LPDcLKhCHiAdDB81En7
i2jNAmzjxAIxFoVYAM9yl7Bmkgltk4pOHv7daFMh//5SKpfBTg3Yq/zaLD542wfY
coFQwZP2V2AEFrZ11U/Zr3ePi4hjbR9WJhZg6nKz16Pjj+4y7oHERfeATfttmo4u
pbXcIfiERknjRv8h9Jak8zdxhh9+wtZTIhbClmV+rwgpaX78FiHfQBOrkYDpV6QW
+TI7FXF6zOrndGUJDpWP4AI9OpR6sqKx2HlTCE+zsX0LpZzJL7cY2o1U5KMenS0o
NEqB+4RMleTsnVlE1xKpMcJK/oBTloZcTJVXg/xMEju0ViaVgnRaKzKitKNWdtvt
SGBvypIq119sTQuOSkvnqlBSQkZIZF8290V9LkmOQIb6++soec9G3GCeDuqKYSV5
97TI2UxQMGoabpdNndL7om0S/F8ofTd+mFl/3+eCzipahR7S44h8gFYs7TtoZG2H
Nlty87D9E8DJkqZEr8Ng6QooMswMTvPaMMIX5PDnOZV2moaSFYl5bDcgrXUolZkz
Dubg8bzpqwGN8Of0y00tJLC2HcfBrmwS7jexBLwU7vOU8fl9PMg=
=CllP
-----END PGP SIGNATURE-----

--cEJQVZRgMdoAhZEy--

