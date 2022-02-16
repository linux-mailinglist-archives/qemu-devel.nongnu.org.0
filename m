Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6974B7FE4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:11:03 +0100 (CET)
Received: from localhost ([::1]:52504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCak-0000Uj-1q
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:11:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7T-0001H6-J9; Tue, 15 Feb 2022 23:40:53 -0500
Received: from [2404:9400:2221:ea00::3] (port=55783 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7B-0000Hg-V8; Tue, 15 Feb 2022 23:40:47 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y3379Pz4y4C; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=2RfE2YOO0mgNi1A4305/zG9T7NxU10/jbordeYq0OtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cu754U4UFWF8R145Jg7SXQcHP/7HS83rwA21vbJtATMoYlbp8v4H5zKVcAVXxuBS4
 NR4rrHv96cR3lpphRlbS21vbF6QXW84pFS8uvQXPb3JErdbce9XuZokz5nVR31MYnY
 HFWaq+Wd5o4D3pC83Ib4X39QPH+v5m9i4ymLadHE=
Date: Wed, 16 Feb 2022 13:15:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 08/27] target/ppc: cpu_init: Decouple G2 SPR registration
 from 755
Message-ID: <YgxePnUUM9n1QEGn@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-9-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2lU2WlTWkp/6tsQG"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-9-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


--2lU2WlTWkp/6tsQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:29PM -0300, Fabiano Rosas wrote:
> We're considering these two to be in different CPU families (6xx and
> 7xx), so keep their SPR registration separate.
>=20
> The code was copied into register_G2_sprs and the common function was
> renamed to apply only to the 755.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 29f25e093f..6a367f2bbc 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -466,8 +466,7 @@ static void register_6xx_7xx_soft_tlb(CPUPPCState *en=
v, int nb_tlbs, int nb_ways
>  #endif
>  }
> =20
> -/* SPR common to MPC755 and G2 */
> -static void register_G2_755_sprs(CPUPPCState *env)
> +static void register_755_sprs(CPUPPCState *env)
>  {
>      /* SGPRs */
>      spr_register(env, SPR_SPRG4, "SPRG4",
> @@ -783,6 +782,23 @@ static void register_G2_sprs(CPUPPCState *env)
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> =20
> +    /* SGPRs */
> +    spr_register(env, SPR_SPRG4, "SPRG4",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG5, "SPRG5",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG6, "SPRG6",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +    spr_register(env, SPR_SPRG7, "SPRG7",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
>  }
> =20
>  static void register_74xx_sprs(CPUPPCState *env)
> @@ -2852,7 +2868,6 @@ static void init_proc_G2(CPUPPCState *env)
>  {
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
> -    register_G2_755_sprs(env);
>      register_G2_sprs(env);
> =20
>      /* Memory management */
> @@ -4474,7 +4489,7 @@ static void init_proc_745(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    register_G2_755_sprs(env);
> +    register_755_sprs(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
>      /* Hardware implementation registers */
> @@ -4547,7 +4562,7 @@ static void init_proc_755(CPUPPCState *env)
>      register_ne_601_sprs(env);
>      register_sdr1_sprs(env);
>      register_7xx_sprs(env);
> -    register_G2_755_sprs(env);
> +    register_755_sprs(env);
>      /* L2 cache control */
>      spr_register(env, SPR_L2CR, "L2CR",
>                   SPR_NOACCESS, SPR_NOACCESS,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2lU2WlTWkp/6tsQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMXjcACgkQgypY4gEw
YSJfKw//ZE/m4DobF/mVvVu6SmVz79HQMbyaWo/5UY2NLtQkapQYOocZnG9IG+aL
/mOHTfWOPcpDWBRosbu5+IDgTGu1DQKO/WfpDH8ljsz0t1qtG8pEWpkOeMC4LJaS
KWyDgMZxnuRvYskZfSTDsyWOVYJni5DXg5+6EvOnR/TrjX84F3BSBg+N6I3ysLme
OJR3q4CnezcIay4Kp8uOaPKvnaXZziMoixlJDDvEVGt8G6pPkJMwUCKijxqzeJeb
B3Jof6iv6L/w0eJ6qbgifuzf6kXl982accILAN2FxQ9BA3m1eQMwJg/sIOuonvW7
F7GRSTBoh3YjSUmJa4RLbq98U0scDkMdS6VRlS1MeVzUArGIb7bny3FOs4ENAn1n
llE+JYC+yJ6/4/CRRua32GIfG9DAucgebskoQF4hbdBi8gjez3zj7bsw+dNEERS9
zrvvgBScgDMSIiel0DQS+gLAjluojbHgiQZFFbuW1LoaHTsum7FvngZj0EHqzoDN
e97k+doUIEog/Az9BRE6w8WUch+4nYCrvt7pQP4eh5iVsVGqJjuyDJD8T1cXsrgw
U3GFpiGvUnrsT6eyIfCSZZu2CIv0zglqdH0RI+ZWRTHbs2HevmqQ7kufhYV36lBN
IPvLJZphnivwKdfQTBd/ejCNJSMOjh7qEdKy3qeB0HPggwyga0w=
=Jd7x
-----END PGP SIGNATURE-----

--2lU2WlTWkp/6tsQG--

