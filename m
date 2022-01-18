Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43214492160
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 09:38:56 +0100 (CET)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9k11-0004vp-9L
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 03:38:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9jdy-0006OT-RV; Tue, 18 Jan 2022 03:15:06 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:35987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9jdv-0003JP-TU; Tue, 18 Jan 2022 03:15:06 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JdM592Ch4z4y3V; Tue, 18 Jan 2022 19:14:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642493693;
 bh=YJGQmu5MLcgIzkmqmpCteQaKboxawYX5Pr5n7QrOkuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBCkBV4tdifdzyT+lyDQ3DAUZePF3LN83l4IcNAVSDYRdZ1DfdzwO9jL4Vqt6jhsW
 qUzl8bc67epPmVRGSd9xBGmwVY+V85gQh1kYXY20P5ev7Brp6yjcL/bosVezwf6t3K
 tc9DIKKl2y4MNUt/zygjweVJLHKSLkrNcXV+tkWU=
Date: Tue, 18 Jan 2022 11:44:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] target/ppc: Finish removal of 401/403 CPUs
Message-ID: <YeYNaZCC+kj7b5iK@yekko.fritz.box>
References: <20220117091541.1615807-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AZgFY3PsVp5C/QNm"
Content-Disposition: inline
In-Reply-To: <20220117091541.1615807-1-clg@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AZgFY3PsVp5C/QNm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 10:15:41AM +0100, C=E9dric le Goater wrote:
> Commit c8f49e6b938e ("target/ppc: remove 401/403 CPUs") left a few
> things behind.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

=2E. although I'm not sure "finish" is totally accurate since env->pb is
still there.

> ---
>  target/ppc/helper.h      |  1 -
>  target/ppc/cpu-models.c  |  1 -
>  target/ppc/machine.c     | 23 -----------------------
>  target/ppc/misc_helper.c |  9 ---------
>  target/ppc/translate.c   | 16 +---------------
>  5 files changed, 1 insertion(+), 49 deletions(-)
>=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index f9c72dcd504d..d318837ea5cc 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -703,7 +703,6 @@ DEF_HELPER_FLAGS_2(store_hdecr, TCG_CALL_NO_RWG, void=
, env, tl)
>  DEF_HELPER_FLAGS_2(store_vtb, TCG_CALL_NO_RWG, void, env, tl)
>  DEF_HELPER_FLAGS_2(store_tbu40, TCG_CALL_NO_RWG, void, env, tl)
>  DEF_HELPER_2(store_hid0_601, void, env, tl)
> -DEF_HELPER_3(store_403_pbr, void, env, i32, tl)
>  DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl, env)
>  DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
>  DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index c9fcb6119f40..96fec9c2e501 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -750,7 +750,6 @@
>  /* PowerPC CPU aliases                                                  =
   */
> =20
>  PowerPCCPUAlias ppc_cpu_aliases[] =3D {
> -    { "403", "403gc" },
>      { "405", "405d4" },
>      { "405cr", "405crc" },
>      { "405gp", "405gpd" },
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 756d8de5d8dd..ea0a0d4e4c7a 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -709,25 +709,6 @@ static bool tlbemb_needed(void *opaque)
>      return env->nb_tlb && (env->tlb_type =3D=3D TLB_EMB);
>  }
> =20
> -static bool pbr403_needed(void *opaque)
> -{
> -    PowerPCCPU *cpu =3D opaque;
> -    uint32_t pvr =3D cpu->env.spr[SPR_PVR];
> -
> -    return (pvr & 0xffff0000) =3D=3D 0x00200000;
> -}
> -
> -static const VMStateDescription vmstate_pbr403 =3D {
> -    .name =3D "cpu/pbr403",
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> -    .needed =3D pbr403_needed,
> -    .fields =3D (VMStateField[]) {
> -        VMSTATE_UINTTL_ARRAY(env.pb, PowerPCCPU, 4),
> -        VMSTATE_END_OF_LIST()
> -    },
> -};
> -
>  static const VMStateDescription vmstate_tlbemb =3D {
>      .name =3D "cpu/tlb6xx",
>      .version_id =3D 1,
> @@ -742,10 +723,6 @@ static const VMStateDescription vmstate_tlbemb =3D {
>          /* 403 protection registers */
>          VMSTATE_END_OF_LIST()
>      },
> -    .subsections =3D (const VMStateDescription*[]) {
> -        &vmstate_pbr403,
> -        NULL
> -    }
>  };
> =20
>  static const VMStateDescription vmstate_tlbmas_entry =3D {
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index c33f5f39b90b..1bcefa7c843c 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -226,15 +226,6 @@ void helper_store_hid0_601(CPUPPCState *env, target_=
ulong val)
>      }
>  }
> =20
> -void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong v=
alue)
> -{
> -    if (likely(env->pb[num] !=3D value)) {
> -        env->pb[num] =3D value;
> -        /* Should be optimized */
> -        tlb_flush(env_cpu(env));
> -    }
> -}
> -
>  void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
>  {
>      /* Bits 26 & 27 affect single-stepping. */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index abbc3a5bb9f0..059956bc59b3 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -911,22 +911,8 @@ void spr_write_booke_tsr(DisasContext *ctx, int sprn=
, int gprn)
>  }
>  #endif
> =20
> -/* PowerPC 403 specific registers */
> -/* PBL1 / PBU1 / PBL2 / PBU2 */
> +/* PIR */
>  #if !defined(CONFIG_USER_ONLY)
> -void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
> -{
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
> -                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
> -}
> -
> -void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
> -{
> -    TCGv_i32 t0 =3D tcg_const_i32(sprn - SPR_403_PBL1);
> -    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
> -    tcg_temp_free_i32(t0);
> -}
> -
>  void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
>  {
>      TCGv t0 =3D tcg_temp_new();

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AZgFY3PsVp5C/QNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHmDUsACgkQgypY4gEw
YSJB2g//XdLknjKP0sf5RpjK7RRVkcN/ylB8iSG9T2GabINXvzX1s8q36TpVMFS1
WZnqfqh+YYZ1Cd16cLMkW/X56KrQVnfo7D8kLo5/R4Vgdv58+Db/1M0GGHvMf4jR
tAT9n09xLsACvbGACk/9ix3Zt4tSlggvLPGM3b8iKtrZupWMh2ondEF89iaxQlMz
Up+K9ecJ/CP2mXA7x9QdQJKHsslk5LXFsPGud6RfXoLET5t9rRbvpKuC1ua6XgSR
OYRMXm/vaHX6MZZlmylW42XgBDom+2tBItxL8WLh+bxDs34uWXsMhyCthmhhzKHP
/wb94HbOJXSoFwhXDx3JokGHySK4zFMEfET9wHKJJqWwc8/6mMYNwVEwNspMpsiI
jNEvnrVua0QsAa328CTMcc49uWKWkFNhU3ZDCtTr130px2e0WH+efMyiqVhOZUEH
oTwlXElWrDLp5ETisfxTNiLzsfbZpSu94/LQZeWxSodqalxzp/rIdfdLF8b3xoaH
CbZpRhfN2kXgezpOpp4XfPRywxgl8bI5bkaUfmkTUR5V9IgStoKXKUG1uVXEI6VD
QnlNY/1Lgtd4qfHPhiD/nQtHAYLw1I4yp/qm8NEeO9uPytBLF06l1ZjJ0Pikhmku
s5H2HazDsoXSqreGZPAmWiJPggY1O99by+TiXtmNovjXVxtIomo=
=eRDt
-----END PGP SIGNATURE-----

--AZgFY3PsVp5C/QNm--

