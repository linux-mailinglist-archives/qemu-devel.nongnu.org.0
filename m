Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8104B7FEA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:13:58 +0100 (CET)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCda-0004Lo-0Y
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:13:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7v-0001RY-0e; Tue, 15 Feb 2022 23:41:16 -0500
Received: from [2404:9400:2221:ea00::3] (port=44127 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7t-0000RI-5t; Tue, 15 Feb 2022 23:41:14 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y34B06z4y4n; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=cbpWe3LSKET99M0L6sdDV/Vxqpfu6rqkB3Ucrx6dd08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6zEReo1Y7lmIfwkjizQCw4BwFkwcUnxUTJ4vQlLEuqUfXVzQxx/a0mTagwldFvsC
 6WPEZNBBdOwtAEDkx1HRAYWlGDeSbkUPwRz/NybWJiNtR9wDy3xJVKuEMY3NUtEYGF
 mYLxzPPAqHH5oEpXJId47JfFkMEa7BLb8jegXpqc=
Date: Wed, 16 Feb 2022 13:59:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 23/27] target/ppc: cpu_init: Remove register_usprg3_sprs
Message-ID: <YgxopGxFTgiMigOl@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-24-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dG1tThV20thHARi+"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-24-farosas@linux.ibm.com>
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


--dG1tThV20thHARi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:44PM -0300, Fabiano Rosas wrote:
> This function registers just one SPR and has only two callers, so open
> code it.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 621812d079..3585dc69bc 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1072,14 +1072,6 @@ static void register_l3_ctrl(CPUPPCState *env)
>                   0x00000000);
>  }
> =20
> -static void register_usprg3_sprs(CPUPPCState *env)
> -{
> -    spr_register(env, SPR_USPRG3, "USPRG3",
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 &spr_read_ureg, SPR_NOACCESS,
> -                 0x00000000);
> -}
> -
>  static void register_usprgh_sprs(CPUPPCState *env)
>  {
>      spr_register(env, SPR_USPRG4, "USPRG4",
> @@ -3310,7 +3302,12 @@ static void init_proc_e500(CPUPPCState *env, int v=
ersion)
>          break;
>      }
>      register_BookE_sprs(env, ivor_mask);
> -    register_usprg3_sprs(env);
> +
> +    spr_register(env, SPR_USPRG3, "USPRG3",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
> +
>      /* Processor identification */
>      spr_register(env, SPR_BOOKE_PIR, "PIR",
>                   SPR_NOACCESS, SPR_NOACCESS,
> @@ -6200,7 +6197,6 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
>  static void init_proc_book3s_common(CPUPPCState *env)
>  {
>      register_non_embedded_sprs(env);
> -    register_usprg3_sprs(env);
>      register_book3s_altivec_sprs(env);
>      register_book3s_pmu_sup_sprs(env);
>      register_book3s_pmu_user_sprs(env);
> @@ -6210,6 +6206,11 @@ static void init_proc_book3s_common(CPUPPCState *e=
nv)
>       * value is the one used by 74xx processors.
>       */
>      vscr_init(env, 0x00010000);
> +
> +    spr_register(env, SPR_USPRG3, "USPRG3",
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 &spr_read_ureg, SPR_NOACCESS,
> +                 0x00000000);
>  }
> =20
>  static void init_proc_970(CPUPPCState *env)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dG1tThV20thHARi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMaJ0ACgkQgypY4gEw
YSIZKhAAqEPcSlSywRH4CZY2xzzgjAXCEbZVEQTpmBqUF5sNxdhZ0ma9TCcoVgbM
Is+JNvizENM5Zqi47Nbrh08s22NLYzX1QHB7CbDDwxJnjKwR5g8RYEcUui6ad4Ej
sjopWAhelZikrmy+6XDibD0fnZiNbXfpOBAJkp+lFavG4qYmtzG7CkiJujPNxoYa
kbXX/N8+Y2AEgIX9bKkeC41Ludj46MsPWS3xV3D3WEIh3g5Lusk63MELSRn0P25a
Fp2fWvuDNyLeiAaihSoRiUVuksLP3hhcL+M9tAN2pv+pxqlnggrQ1FH1GVtqcICe
pTS89XvzJxWjx0/uNVZTNd9Ynz6DbSRUWi0HXeETmtzjTL0N9LsBskBfEn+Tnu75
wA1wq4hB2jfu72HaDUPEXhtDbJ0YGCiMZEBVoU79EcByQVwmt6/aHa6P+7sfLdvu
m2p75Z+/ci0O3v+cIV6xaQqoDVfqAuiuhYT51MupqFYMMNeRgCvMYZTWGPcjATLN
elqRgWjo7b4Sl81S03Yn5+/sS8FY0FbFQT3F0iGVMz5uy4s+qT98ndferGvw/7ht
VhWsle0RVyqK6RXQKw/5fyyUm+b0ojXwPx78T3OJMz8wYUmt2DHfsikYokrt6lj+
FP0+cLS81DKK4f++HgUFa7Mm3f5td/plCeQ2R7TVuK5ZSzxxI30=
=DpTI
-----END PGP SIGNATURE-----

--dG1tThV20thHARi+--

