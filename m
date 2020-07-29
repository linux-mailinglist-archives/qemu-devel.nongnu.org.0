Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA512319AD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 08:44:43 +0200 (CEST)
Received: from localhost ([::1]:43914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0fpR-0001W4-JM
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 02:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k0foB-0000yT-LQ; Wed, 29 Jul 2020 02:43:23 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:48413 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k0fo6-0003kv-8G; Wed, 29 Jul 2020 02:43:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BGkWg3hpPz9sSy; Wed, 29 Jul 2020 16:43:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1596004991;
 bh=DK0Yn1emDQ/m3iTES0yBtw/fbiy/K1ZoynzUw0Q9kf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXNhDOrp9FpOrf38uuxNjfak0/iKHv9jGwfl4mcIBVpLRwyxgYkoqpAKtlX7v4jiS
 L2NKL7/UNtlq+xtZf4TzZB7oKRE1GHnQMI0T+cbxB82GHEgCGu5yibpKU3Q88cCkFP
 AZtKzzUjlCOi99osAXRZr8B8dtZC3pzsYzYzbosI=
Date: Wed, 29 Jul 2020 15:30:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v5 for-5.2] spapr: Use error_append_hint() in spapr_caps.c
Message-ID: <20200729053042.GL84173@umbus.fritz.box>
References: <159594297421.8262.14314530897345809924.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gwtGiOGliFx8mAnm"
Content-Disposition: inline
In-Reply-To: <159594297421.8262.14314530897345809924.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gwtGiOGliFx8mAnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 03:29:34PM +0200, Greg Kurz wrote:
> We have a dedicated error API for hints. Use it instead of embedding
> the hint in the error message, as recommanded in the "qapi/error.h"
> header file.
>=20
> While here, have cap_fwnmi_apply(), which already uses
> error_append_hint(), to call ERRP_GUARD() as well.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> ---
> v5: same patch as v4 with an updated changelog (dropped misleading
>     sentence about the need to use ERRP_GUARD) as suggested by Markus.
>=20
> This is a replacement for commit ff9feac2a9291e9a7875ae289dfe7bc71abc2590
> in the ppc-for-5.2 branch.

Applied to ppc-for-5.2, thanks.

> ---
>  hw/ppc/spapr_caps.c |   89 +++++++++++++++++++++++++++++----------------=
------
>  1 file changed, 50 insertions(+), 39 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 3225fc5a2edc..275f5bd0342c 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -180,24 +180,24 @@ static void spapr_cap_set_pagesize(Object *obj, Vis=
itor *v, const char *name,
> =20
>  static void cap_htm_apply(SpaprMachineState *spapr, uint8_t val, Error *=
*errp)
>  {
> +    ERRP_GUARD();
>      if (!val) {
>          /* TODO: We don't support disabling htm yet */
>          return;
>      }
>      if (tcg_enabled()) {
> -        error_setg(errp,
> -                   "No Transactional Memory support in TCG,"
> -                   " try appending -machine cap-htm=3Doff");
> +        error_setg(errp, "No Transactional Memory support in TCG");
> +        error_append_hint(errp, "Try appending -machine cap-htm=3Doff\n"=
);
>      } else if (kvm_enabled() && !kvmppc_has_cap_htm()) {
>          error_setg(errp,
> -"KVM implementation does not support Transactional Memory,"
> -                   " try appending -machine cap-htm=3Doff"
> -            );
> +                   "KVM implementation does not support Transactional Me=
mory");
> +        error_append_hint(errp, "Try appending -machine cap-htm=3Doff\n"=
);
>      }
>  }
> =20
>  static void cap_vsx_apply(SpaprMachineState *spapr, uint8_t val, Error *=
*errp)
>  {
> +    ERRP_GUARD();
>      PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
>      CPUPPCState *env =3D &cpu->env;
> =20
> @@ -209,13 +209,14 @@ static void cap_vsx_apply(SpaprMachineState *spapr,=
 uint8_t val, Error **errp)
>       * rid of anything that doesn't do VMX */
>      g_assert(env->insns_flags & PPC_ALTIVEC);
>      if (!(env->insns_flags2 & PPC2_VSX)) {
> -        error_setg(errp, "VSX support not available,"
> -                   " try appending -machine cap-vsx=3Doff");
> +        error_setg(errp, "VSX support not available");
> +        error_append_hint(errp, "Try appending -machine cap-vsx=3Doff\n"=
);
>      }
>  }
> =20
>  static void cap_dfp_apply(SpaprMachineState *spapr, uint8_t val, Error *=
*errp)
>  {
> +    ERRP_GUARD();
>      PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
>      CPUPPCState *env =3D &cpu->env;
> =20
> @@ -224,8 +225,8 @@ static void cap_dfp_apply(SpaprMachineState *spapr, u=
int8_t val, Error **errp)
>          return;
>      }
>      if (!(env->insns_flags2 & PPC2_DFP)) {
> -        error_setg(errp, "DFP support not available,"
> -                   " try appending -machine cap-dfp=3Doff");
> +        error_setg(errp, "DFP support not available");
> +        error_append_hint(errp, "Try appending -machine cap-dfp=3Doff\n"=
);
>      }
>  }
> =20
> @@ -239,6 +240,7 @@ SpaprCapPossible cap_cfpc_possible =3D {
>  static void cap_safe_cache_apply(SpaprMachineState *spapr, uint8_t val,
>                                   Error **errp)
>  {
> +    ERRP_GUARD();
>      uint8_t kvm_val =3D  kvmppc_get_cap_safe_cache();
> =20
>      if (tcg_enabled() && val) {
> @@ -247,9 +249,9 @@ static void cap_safe_cache_apply(SpaprMachineState *s=
papr, uint8_t val,
>                      cap_cfpc_possible.vals[val]);
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
> -                   "Requested safe cache capability level not supported =
by kvm,"
> -                   " try appending -machine cap-cfpc=3D%s",
> -                   cap_cfpc_possible.vals[kvm_val]);
> +                   "Requested safe cache capability level not supported =
by KVM");
> +        error_append_hint(errp, "Try appending -machine cap-cfpc=3D%s\n",
> +                          cap_cfpc_possible.vals[kvm_val]);
>      }
>  }
> =20
> @@ -263,6 +265,7 @@ SpaprCapPossible cap_sbbc_possible =3D {
>  static void cap_safe_bounds_check_apply(SpaprMachineState *spapr, uint8_=
t val,
>                                          Error **errp)
>  {
> +    ERRP_GUARD();
>      uint8_t kvm_val =3D  kvmppc_get_cap_safe_bounds_check();
> =20
>      if (tcg_enabled() && val) {
> @@ -271,9 +274,9 @@ static void cap_safe_bounds_check_apply(SpaprMachineS=
tate *spapr, uint8_t val,
>                      cap_sbbc_possible.vals[val]);
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
> -"Requested safe bounds check capability level not supported by kvm,"
> -                   " try appending -machine cap-sbbc=3D%s",
> -                   cap_sbbc_possible.vals[kvm_val]);
> +"Requested safe bounds check capability level not supported by KVM");
> +        error_append_hint(errp, "Try appending -machine cap-sbbc=3D%s\n",
> +                          cap_sbbc_possible.vals[kvm_val]);
>      }
>  }
> =20
> @@ -290,6 +293,7 @@ SpaprCapPossible cap_ibs_possible =3D {
>  static void cap_safe_indirect_branch_apply(SpaprMachineState *spapr,
>                                             uint8_t val, Error **errp)
>  {
> +    ERRP_GUARD();
>      uint8_t kvm_val =3D kvmppc_get_cap_safe_indirect_branch();
> =20
>      if (tcg_enabled() && val) {
> @@ -298,9 +302,9 @@ static void cap_safe_indirect_branch_apply(SpaprMachi=
neState *spapr,
>                      cap_ibs_possible.vals[val]);
>      } else if (kvm_enabled() && (val > kvm_val)) {
>          error_setg(errp,
> -"Requested safe indirect branch capability level not supported by kvm,"
> -                   " try appending -machine cap-ibs=3D%s",
> -                   cap_ibs_possible.vals[kvm_val]);
> +"Requested safe indirect branch capability level not supported by KVM");
> +        error_append_hint(errp, "Try appending -machine cap-ibs=3D%s\n",
> +                          cap_ibs_possible.vals[kvm_val]);
>      }
>  }
> =20
> @@ -377,23 +381,25 @@ static void cap_hpt_maxpagesize_cpu_apply(SpaprMach=
ineState *spapr,
>  static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
>                                      uint8_t val, Error **errp)
>  {
> +    ERRP_GUARD();
>      if (!val) {
>          /* capability disabled by default */
>          return;
>      }
> =20
>      if (tcg_enabled()) {
> -        error_setg(errp,
> -                   "No Nested KVM-HV support in tcg,"
> -                   " try appending -machine cap-nested-hv=3Doff");
> +        error_setg(errp, "No Nested KVM-HV support in TCG");
> +        error_append_hint(errp, "Try appending -machine cap-nested-hv=3D=
off\n");
>      } else if (kvm_enabled()) {
>          if (!kvmppc_has_cap_nested_kvm_hv()) {
>              error_setg(errp,
> -"KVM implementation does not support Nested KVM-HV,"
> -                       " try appending -machine cap-nested-hv=3Doff");
> +                       "KVM implementation does not support Nested KVM-H=
V");
> +            error_append_hint(errp,
> +                              "Try appending -machine cap-nested-hv=3Dof=
f\n");
>          } else if (kvmppc_set_cap_nested_kvm_hv(val) < 0) {
> -                error_setg(errp,
> -"Error enabling cap-nested-hv with KVM, try cap-nested-hv=3Doff");
> +                error_setg(errp, "Error enabling cap-nested-hv with KVM"=
);
> +                error_append_hint(errp,
> +                                  "Try appending -machine cap-nested-hv=
=3Doff\n");
>          }
>      }
>  }
> @@ -401,6 +407,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState=
 *spapr,
>  static void cap_large_decr_apply(SpaprMachineState *spapr,
>                                   uint8_t val, Error **errp)
>  {
> +    ERRP_GUARD();
>      PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> =20
> @@ -411,22 +418,23 @@ static void cap_large_decr_apply(SpaprMachineState =
*spapr,
>      if (tcg_enabled()) {
>          if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
>                                spapr->max_compat_pvr)) {
> -            error_setg(errp,
> -                "Large decrementer only supported on POWER9, try -cpu PO=
WER9");
> +            error_setg(errp, "Large decrementer only supported on POWER9=
");
> +            error_append_hint(errp, "Try -cpu POWER9\n");
>              return;
>          }
>      } else if (kvm_enabled()) {
>          int kvm_nr_bits =3D kvmppc_get_cap_large_decr();
> =20
>          if (!kvm_nr_bits) {
> -            error_setg(errp,
> -                       "No large decrementer support,"
> -                        " try appending -machine cap-large-decr=3Doff");
> +            error_setg(errp, "No large decrementer support");
> +            error_append_hint(errp,
> +                              "Try appending -machine cap-large-decr=3Do=
ff\n");
>          } else if (pcc->lrg_decr_bits !=3D kvm_nr_bits) {
>              error_setg(errp,
> -"KVM large decrementer size (%d) differs to model (%d),"
> -                " try appending -machine cap-large-decr=3Doff",
> -                kvm_nr_bits, pcc->lrg_decr_bits);
> +                       "KVM large decrementer size (%d) differs to model=
 (%d)",
> +                       kvm_nr_bits, pcc->lrg_decr_bits);
> +            error_append_hint(errp,
> +                              "Try appending -machine cap-large-decr=3Do=
ff\n");
>          }
>      }
>  }
> @@ -435,14 +443,15 @@ static void cap_large_decr_cpu_apply(SpaprMachineSt=
ate *spapr,
>                                       PowerPCCPU *cpu,
>                                       uint8_t val, Error **errp)
>  {
> +    ERRP_GUARD();
>      CPUPPCState *env =3D &cpu->env;
>      target_ulong lpcr =3D env->spr[SPR_LPCR];
> =20
>      if (kvm_enabled()) {
>          if (kvmppc_enable_cap_large_decr(cpu, val)) {
> -            error_setg(errp,
> -                       "No large decrementer support,"
> -                       " try appending -machine cap-large-decr=3Doff");
> +            error_setg(errp, "No large decrementer support");
> +            error_append_hint(errp,
> +                              "Try appending -machine cap-large-decr=3Do=
ff\n");
>          }
>      }
> =20
> @@ -457,6 +466,7 @@ static void cap_large_decr_cpu_apply(SpaprMachineStat=
e *spapr,
>  static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
>                                   Error **errp)
>  {
> +    ERRP_GUARD();
>      uint8_t kvm_val =3D kvmppc_get_cap_count_cache_flush_assist();
> =20
>      if (tcg_enabled() && val) {
> @@ -479,14 +489,15 @@ static void cap_ccf_assist_apply(SpaprMachineState =
*spapr, uint8_t val,
>              return;
>          }
>          error_setg(errp,
> -"Requested count cache flush assist capability level not supported by kv=
m,"
> -                   " try appending -machine cap-ccf-assist=3Doff");
> +                   "Requested count cache flush assist capability level =
not supported by KVM");
> +        error_append_hint(errp, "Try appending -machine cap-ccf-assist=
=3Doff\n");
>      }
>  }
> =20
>  static void cap_fwnmi_apply(SpaprMachineState *spapr, uint8_t val,
>                                  Error **errp)
>  {
> +    ERRP_GUARD();
>      if (!val) {
>          return; /* Disabled by default */
>      }
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gwtGiOGliFx8mAnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8hCYAACgkQbDjKyiDZ
s5InpQ/8C/LD0FeR6JqN+AC5jTXeEjwcWpyrkMva2G3no+xFXWbMQTi+0dQYxuS3
7TIczbZxb38cZrLSZL8QBGHKZb2OOT+dSUb8FOfkmKDN8Fc7Q2N7nYX+qA8ZbW/R
3L/E3/qpX1TAINWSylUqMPmq0Dcp0Kust8RAmvPJ7jPaXi298rEv0mliFVZ2ZLMc
T2kZNH1lWnLd88Im9ZScUmkj5J3imEoO2W6MEA1U5HOv+G7TsxPtRkICECrrjd25
hnDSNaDa0269hbv8LuujhwQlF7Hi7rzkfBx2ecWWJrJcDvZSZZ0mWV2WChs+Kta4
BAYCSROg/0ceTonm1rZnSnPZFakss+YkVDkakwIe2Um9du2gAYW6kfKfDcoBjWhs
+pDgjlwmtukaEMRURdVPNkpkbNY+9nIuUmwPxKvUCFRa3a3AdzV1w1/b6SgT2fT9
c3HEN2HqKb8ogSXp3Mib5Ha1i1EFt8FZ2mBfZqalfXC6YK9xvgrF1tmTh9vlHO8S
ZCteKFXyO30B67XuNL3CbKJxaVTgLdHa3nd4i7ASTRm8qZwC+X73rxt4tMfbaQsM
vI+eblA8i/lknJp+EsVfFx08yk08JVi6YfixftKlc0PBc8aI9lXQxt/i2BAp5io8
+7j5UfYRfzE7XVOGthMrtfQd0awjx/zDV6zPq6DbzlpvekhjJ2g=
=s4u2
-----END PGP SIGNATURE-----

--gwtGiOGliFx8mAnm--

