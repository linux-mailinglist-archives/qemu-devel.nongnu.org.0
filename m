Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E27373487
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:04:33 +0200 (CEST)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9i4-0004Z6-Qv
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le9eR-0001y2-IU; Wed, 05 May 2021 01:00:49 -0400
Received: from ozlabs.org ([203.11.71.1]:36059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le9eP-0007uY-1M; Wed, 05 May 2021 01:00:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZl0766CMz9sT6; Wed,  5 May 2021 15:00:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620190839;
 bh=hQTtstFpP9BENIs1rVAjhmpvc7zlS/wantXa4MrKK40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZF1gYgzWpgNhrghYEe/kxEueTKM19w8ycVU68LREDC9AksO4Isb7CHdXDZzcNHxCI
 gFNnEMSgAiWqITi63iWpt0+vDuuwIzXKxK/693vdcy9cUno54B635M6Qttz/oJfrLt
 TITAWhaVQlYsXWK418707fsslJVQPOs9drc0o6nk=
Date: Wed, 5 May 2021 15:00:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] target/ppc: Do not check for LPCR[HAIL] on power10_v1.0
 CPUs
Message-ID: <YJImcn2SyNdWZCfW@yekko>
References: <20210504095900.505668-1-clg@kaod.org>
 <1620125242.e97yybasbv.astroid@bobo.none>
 <850b8bb4-0e79-f5ee-ef95-a0e8d95ff9b0@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zv3F1yiXFjamtt/B"
Content-Disposition: inline
In-Reply-To: <850b8bb4-0e79-f5ee-ef95-a0e8d95ff9b0@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Zv3F1yiXFjamtt/B
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 01:54:39PM +0200, C=E9dric Le Goater wrote:
> On 5/4/21 12:49 PM, Nicholas Piggin wrote:
> > Excerpts from C=E9dric Le Goater's message of May 4, 2021 7:59 pm:
> >> The LPCR[HAIL] bit only applies to POWER10 DD2 CPUs. On POWER10 DD1,
> >> the ail value should be extracted using the LPCR_AIL mask like on P9.
> >>
> >> Cc: Nicholas Piggin <npiggin@gmail.com>
> >> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >=20
> > Thanks for this, my oversight for not realising the P10 CPU is DD1=20
> > (which doesn't have HAIL).
> >=20
> > I wonder if it could just use the POWER9 excp_model?
>=20
> Yes. Why not. It does bring up another problem which is how to define
> (cleanly) different characteristics for CPUs of the same POWER family.
>=20
> Currently, all P10s are under POWERPC_FAMILY(POWER10). This is a base=20
> abstract class and definitions can not depend on the PVR. See below
> what needs to be done to add a custom LPCR mask for DD2 :/
>=20
> We could also simply switch P10 to DD2. I would favor that instead of=20
> adding complexity.

Definitely.  I'm guessing DD1 POWER10s will never be seen outside IBM,
so I don't think we want support for them in upstream qemu at all.

>=20
> David, what is your opinion on this ?=20
>=20
> Thank,
>=20
> C.=20
>=20
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  target/ppc/cpu-models.c |   13 +++++++++++--
>  target/ppc/cpu-models.h |    1 +
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> Index: qemu-powernv-6.1.git/target/ppc/cpu-models.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-powernv-6.1.git.orig/target/ppc/cpu-models.c
> +++ qemu-powernv-6.1.git/target/ppc/cpu-models.c
> @@ -32,7 +32,7 @@
>  /* PowerPC CPU definitions                                              =
   */
>  #define POWERPC_DEF_PREFIX(pvr, svr, type)                              =
    \
>      glue(glue(glue(glue(pvr, _), svr), _), type)
> -#define POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type)                =
    \
> +#define __POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type, _lpcr)       =
    \
>      static void                                                         =
    \
>      glue(POWERPC_DEF_PREFIX(_pvr, _svr, _type), _cpu_class_init)        =
    \
>      (ObjectClass *oc, void *data)                                       =
    \
> @@ -40,6 +40,7 @@
>          DeviceClass *dc =3D DEVICE_CLASS(oc);                           =
      \
>          PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);                 =
      \
>                                                                          =
    \
> +        pcc->lpcr_mask    |=3D _lpcr;                                   =
      \
>          pcc->pvr          =3D _pvr;                                     =
      \
>          pcc->svr          =3D _svr;                                     =
      \
>          dc->desc          =3D _desc;                                    =
      \
> @@ -63,6 +64,12 @@
>      type_init(                                                          =
    \
>          glue(POWERPC_DEF_PREFIX(_pvr, _svr, _type), _cpu_register_types))
> =20
> +#define POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type)                =
    \
> +    __POWERPC_DEF_SVR(_name, _desc, _pvr, _svr, _type, 0)
> +
> +#define POWERPC_DEF_LPCR(_name, _pvr, _type, _desc, _lpcr)              =
    \
> +    __POWERPC_DEF_SVR(_name, _desc, _pvr, POWERPC_SVR_NONE, _type, _lpcr)
> +
>  #define POWERPC_DEF(_name, _pvr, _type, _desc)                          =
    \
>      POWERPC_DEF_SVR(_name, _desc, _pvr, POWERPC_SVR_NONE, _type)
> =20
> @@ -776,6 +783,8 @@
>                  "POWER9 v2.0")
>      POWERPC_DEF("power10_v1.0",  CPU_POWERPC_POWER10_DD1,            POW=
ER10,
>                  "POWER10 v1.0")
> +    POWERPC_DEF_LPCR("power10_v2.0",  CPU_POWERPC_POWER10_DD20,      POW=
ER10,
> +                     "POWER10 v2.0", LPCR_HAIL)
>  #endif /* defined (TARGET_PPC64) */
> =20
>  /***********************************************************************=
****/
> @@ -952,7 +961,7 @@ PowerPCCPUAlias ppc_cpu_aliases[] =3D {
>      { "power8", "power8_v2.0" },
>      { "power8nvl", "power8nvl_v1.0" },
>      { "power9", "power9_v2.0" },
> -    { "power10", "power10_v1.0" },
> +    { "power10", "power10_v2.0" },
>  #endif
> =20
>      /* Generic PowerPCs */
> Index: qemu-powernv-6.1.git/target/ppc/cpu-models.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-powernv-6.1.git.orig/target/ppc/cpu-models.h
> +++ qemu-powernv-6.1.git/target/ppc/cpu-models.h
> @@ -375,6 +375,7 @@ enum {
>      CPU_POWERPC_POWER9_DD20        =3D 0x004E1200,
>      CPU_POWERPC_POWER10_BASE       =3D 0x00800000,
>      CPU_POWERPC_POWER10_DD1        =3D 0x00800100,
> +    CPU_POWERPC_POWER10_DD20       =3D 0x00800200,
>      CPU_POWERPC_970_v22            =3D 0x00390202,
>      CPU_POWERPC_970FX_v10          =3D 0x00391100,
>      CPU_POWERPC_970FX_v20          =3D 0x003C0200,
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zv3F1yiXFjamtt/B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCSJnIACgkQbDjKyiDZ
s5IMVg/9Fu5VD3saZujrDzbAuuxYoYJ1zQr+5qzq5UWZ8eOe1n/YT6/WI4u7c+rk
MMDYJTocVZtmmi5mrf4OLN6uvI7pUq+jnPqzGEKxuKRVL8luIgYGu0a47ouYHZ0r
xKhEqSlJND0e7LvFhRg8/p25Lii8kv5f8HDCfuOJv3toyqF/5E1u20WpZ05n/ZPM
EahrI7CUbGfdeyXPzfvmzkQbKVmtEAcXpwa7WSjR9HFQ8y0iH67NfCFl62gGNx+S
YWDzrJJW67eKtJtHQWKyixTcnxvWZR/8dM5m29kHcyfT2Rwi7ckNXT43YdLv+y/j
bA59xP+Ig57rF5mMZBJ0qpYq8AeHTLM/f6scG/PLCUnViZ5bJfd4wALuw3Nx2lPh
uKwZSG3loEHPH8vy8U+AQQlHWM8+3tdYuxOMW7mEFKaDOo0AzLh40oak1A6P5tLK
5vQsqH1YxAZ5ogtemkO0bZCQN0Ee+FDOn+eORZDYRIbQ6MIm3ap5Ue688Ti+eJ5w
V7foODks38KJHbXjIUyfyizr9KaSOfxLKN9vwgOE49mGsonBkTlm9VA9FtFOIOVY
C2z6QWewlzFWxQ6uvEG7jKIotIO2Zlji76hogckb58a+EjutmSGkgjSqJkBLX0ln
Pj83yuxKM3dqYW+h4mNWeKL1jqMC1fdgNU4YLlAO4kUkZ1I699I=
=UM7x
-----END PGP SIGNATURE-----

--Zv3F1yiXFjamtt/B--

