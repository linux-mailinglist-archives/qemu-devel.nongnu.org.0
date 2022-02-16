Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06C4B7FFA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:19:20 +0100 (CET)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCil-0002Yj-Nh
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:19:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC8F-0001Ye-K3; Tue, 15 Feb 2022 23:41:35 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:41445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7y-0000SG-Mk; Tue, 15 Feb 2022 23:41:29 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y34K2Tz4y4q; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=RgVOUF3Z2W7Cy+2BF13N5lsiBD8fE+bY/QonnLAgHO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LHzjlEVUqTZ2Kz4MC+hVLZRSAzmXKrvhJFmQvbhY6BhUE5N827mOmKJ4Pm1bf7V38
 /4KlZEE3WnWmNly4Bbrnf7dk7hc6QwpklHGYkE8HuLWZsrg9wlKItOz3bzig+UIxDX
 pQyTMY0J84zJaENn6K5n7ezoYEcqWFpHpg3yGHtc=
Date: Wed, 16 Feb 2022 14:01:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 25/27] target/ppc: cpu_init: Move SPR registration macros
 to a header
Message-ID: <YgxpGLXmM3HH9RC0@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-26-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3cnVhJgAF2hCYkRt"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-26-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--3cnVhJgAF2hCYkRt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:46PM -0300, Fabiano Rosas wrote:
> Put the SPR registration macros in a header that is accessible outside
> of cpu_init.c. The following patches will move CPU-specific code to
> separate files and will need to access it.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> The spr_tcg.h header has always been used for both TCG and KVM, due to
> its usage in cpu_init.c, but maybe we should change it to spr_common.h
> to avoid confusion?

That's probably a good idea.

> ---
>  target/ppc/cpu_init.c | 65 ++++++-------------------------------------
>  target/ppc/spr_tcg.h  | 56 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 56 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 74e26f60dd..3327ea15fd 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -67,35 +67,15 @@ static inline void vscr_init(CPUPPCState *env, uint32=
_t val)
>   * may be compiled out, and the system kvm header may not be available
>   * for supplying the ID numbers.  This is ugly, but the best we can do.
>   */
> -
> -#ifdef CONFIG_TCG
> -# define USR_ARG(X)    X,
> -# ifdef CONFIG_USER_ONLY
> -#  define SYS_ARG(X)
> -# else
> -#  define SYS_ARG(X)   X,
> -# endif
> -#else
> -# define USR_ARG(X)
> -# define SYS_ARG(X)
> -#endif
> -#ifdef CONFIG_KVM
> -# define KVM_ARG(X)    X,
> -#else
> -# define KVM_ARG(X)
> -#endif
> -
> -typedef void spr_callback(DisasContext *, int, int);
> -
> -static void _spr_register(CPUPPCState *env, int num, const char *name,
> -                          USR_ARG(spr_callback *uea_read)
> -                          USR_ARG(spr_callback *uea_write)
> -                          SYS_ARG(spr_callback *oea_read)
> -                          SYS_ARG(spr_callback *oea_write)
> -                          SYS_ARG(spr_callback *hea_read)
> -                          SYS_ARG(spr_callback *hea_write)
> -                          KVM_ARG(uint64_t one_reg_id)
> -                          target_ulong initial_value)
> +void _spr_register(CPUPPCState *env, int num, const char *name,
> +                   USR_ARG(spr_callback *uea_read)
> +                   USR_ARG(spr_callback *uea_write)
> +                   SYS_ARG(spr_callback *oea_read)
> +                   SYS_ARG(spr_callback *oea_write)
> +                   SYS_ARG(spr_callback *hea_read)
> +                   SYS_ARG(spr_callback *hea_write)
> +                   KVM_ARG(uint64_t one_reg_id)
> +                   target_ulong initial_value)
>  {
>      ppc_spr_t *spr =3D &env->spr_cb[num];
> =20
> @@ -122,33 +102,6 @@ static void _spr_register(CPUPPCState *env, int num,=
 const char *name,
>  #endif
>  }
> =20
> -/* spr_register_kvm_hv passes all required arguments. */
> -#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
     \
> -                            oea_read, oea_write, hea_read, hea_write,   =
     \
> -                            one_reg_id, initial_value)                  =
     \
> -    _spr_register(env, num, name,                                       =
     \
> -                  USR_ARG(uea_read) USR_ARG(uea_write)                  =
     \
> -                  SYS_ARG(oea_read) SYS_ARG(oea_write)                  =
     \
> -                  SYS_ARG(hea_read) SYS_ARG(hea_write)                  =
     \
> -                  KVM_ARG(one_reg_id) initial_value)
> -
> -/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. */
> -#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
     \
> -                         oea_read, oea_write, one_reg_id, ival)         =
     \
> -    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
> -                        oea_write, oea_read, oea_write, one_reg_id, ival)
> -
> -/* spr_register_hv and spr_register are similar, except there is no kvm =
id. */
> -#define spr_register_hv(env, num, name, uea_read, uea_write,            =
     \
> -                        oea_read, oea_write, hea_read, hea_write, ival) =
     \
> -    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
> -                        oea_write, hea_read, hea_write, 0, ival)
> -
> -#define spr_register(env, num, name, uea_read, uea_write,               =
     \
> -                     oea_read, oea_write, ival)                         =
     \
> -    spr_register_kvm(env, num, name, uea_read, uea_write,               =
     \
> -                     oea_read, oea_write, 0, ival)
> -
>  /* Generic PowerPC SPRs */
>  static void register_generic_sprs(PowerPCCPU *cpu)
>  {
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index a4f912faa4..786cdca80d 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -21,6 +21,62 @@
> =20
>  #define SPR_NOACCESS (&spr_noaccess)
> =20
> +#ifdef CONFIG_TCG
> +# define USR_ARG(X)    X,
> +# ifdef CONFIG_USER_ONLY
> +#  define SYS_ARG(X)
> +# else
> +#  define SYS_ARG(X)   X,
> +# endif
> +#else
> +# define USR_ARG(X)
> +# define SYS_ARG(X)
> +#endif
> +#ifdef CONFIG_KVM
> +# define KVM_ARG(X)    X,
> +#else
> +# define KVM_ARG(X)
> +#endif
> +
> +typedef void spr_callback(DisasContext *, int, int);
> +
> +void _spr_register(CPUPPCState *env, int num, const char *name,
> +                   USR_ARG(spr_callback *uea_read)
> +                   USR_ARG(spr_callback *uea_write)
> +                   SYS_ARG(spr_callback *oea_read)
> +                   SYS_ARG(spr_callback *oea_write)
> +                   SYS_ARG(spr_callback *hea_read)
> +                   SYS_ARG(spr_callback *hea_write)
> +                   KVM_ARG(uint64_t one_reg_id)
> +                   target_ulong initial_value);
> +
> +/* spr_register_kvm_hv passes all required arguments. */
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
     \
> +                            oea_read, oea_write, hea_read, hea_write,   =
     \
> +                            one_reg_id, initial_value)                  =
     \
> +    _spr_register(env, num, name,                                       =
     \
> +                  USR_ARG(uea_read) USR_ARG(uea_write)                  =
     \
> +                  SYS_ARG(oea_read) SYS_ARG(oea_write)                  =
     \
> +                  SYS_ARG(hea_read) SYS_ARG(hea_write)                  =
     \
> +                  KVM_ARG(one_reg_id) initial_value)
> +
> +/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. */
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,           =
     \
> +                         oea_read, oea_write, one_reg_id, ival)         =
     \
> +    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
> +                        oea_write, oea_read, oea_write, one_reg_id, ival)
> +
> +/* spr_register_hv and spr_register are similar, except there is no kvm =
id. */
> +#define spr_register_hv(env, num, name, uea_read, uea_write,            =
     \
> +                        oea_read, oea_write, hea_read, hea_write, ival) =
     \
> +    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,  =
     \
> +                        oea_write, hea_read, hea_write, 0, ival)
> +
> +#define spr_register(env, num, name, uea_read, uea_write,               =
     \
> +                     oea_read, oea_write, ival)                         =
     \
> +    spr_register_kvm(env, num, name, uea_read, uea_write,               =
     \
> +                     oea_read, oea_write, 0, ival)
> +
>  /* prototypes for readers and writers for SPRs */
>  void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_generic(DisasContext *ctx, int gprn, int sprn);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3cnVhJgAF2hCYkRt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMaREACgkQgypY4gEw
YSKiCA//Y5pa92VeX9TCYaMCcNhMiADWd53g+hMhdPwLnQeKQJ2gFZgrkWCMZJjC
k7ZkbbxYM8mA3sgzwj6EPQWu6J6pB4BHBIALNgqeZRAXCxklqS/ij1bEkGXNVdT3
/cFiE+wlyGJ7GXrFCdQgmPeDUYfsNyQyaw8ywqkcagDZlFHVdHpaGXjIsnRBb0ik
bJ9NzEJprCLciXvUsE46Xgwe5QRin09dNi+kb/AiqTozuvxdKES/mxnvvhKT478W
gruNUKdpHOmFPB9iMb06LgucI1mB36r/mjTtWAc7aAnIgA4ppNUkoK3xrGLKjUBx
CGOK+1svvXN14GILE2xl3FoDAxpYfI7ra/svM4na2PMuHf5l014hInzb+EymE3ok
tPdcUR16HBeVQqe7VY/jeCxbkbRiZzXHsUzBoZpgc8pixnyEx7IxLXMGejK1E+ja
x/teuyDv3WPzspFnHZy3tfjCwF4YtmawwVkwiJKcGGE5J+nTdNsSX1sBmn4O6d4o
miVNpIM5F59gJCWsN0sc+W57eVf5AzbF472FejxXMk70eQx+FLUeqlsnTUkOUbL1
78TRho3ygBTRJOmxr5z5mQPIgy8OxgwrByUxTfb8wVoxI9WrHZYW6L4la0sAf+Hy
DyI1ChBOOZiZo/hG4Y2dy1WBedd/y6NOjtp/te0ikbMqz2qkjbQ=
=bvPk
-----END PGP SIGNATURE-----

--3cnVhJgAF2hCYkRt--

