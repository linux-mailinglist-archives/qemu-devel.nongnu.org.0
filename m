Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DCE411055
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:41:01 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSDvA-0003Hs-Hr
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDrI-0001eq-45; Mon, 20 Sep 2021 03:37:00 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDrG-0001b5-64; Mon, 20 Sep 2021 03:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632123412;
 bh=yUEKcRs9IkyMYlrU8gX5tFALFgFPYIJr15ALqLsZjgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVZcjRC7rnBquK2rvfAlWFc0s4IVP5RWrtPCQQ1OoHQnj+lPZLXKf3/xzcfhro6Tl
 BjnzB4Zly1vu9TkxmU3uAEc/jyjTq20RGylK93STlysHvfjD0DlZxuS7eSLmkbe1wc
 /NpZw/df3hNNkYohsnndQHc/KwxLErGWV5TO54j8=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCbwh4Jxfz9sSs; Mon, 20 Sep 2021 17:36:52 +1000 (AEST)
Date: Mon, 20 Sep 2021 17:36:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v4 4/4] target/ppc: Fix 64-bit decrementer
Message-ID: <YUg59wEwIFQLqcQi@yekko>
References: <20210920061203.989563-1-clg@kaod.org>
 <20210920061203.989563-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B2DYzSAA8ThEP4IU"
Content-Disposition: inline
In-Reply-To: <20210920061203.989563-5-clg@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--B2DYzSAA8ThEP4IU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 08:12:03AM +0200, C=E9dric Le Goater wrote:
> The current way the mask is built can overflow with a 64-bit decrementer.
> Use sextract64() to extract the signed values and remove the logic to
> handle negative values which has become useless.
>=20
> Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for=
 TCG")
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

LGTM, but not applying because of the comments on 3/4.

> ---
>  hw/ppc/ppc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index b813ef732ec1..f5d012f860af 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -821,14 +821,12 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, u=
int64_t *nextp,
>      CPUPPCState *env =3D &cpu->env;
>      ppc_tb_t *tb_env =3D env->tb_env;
>      uint64_t now, next;
> -    bool negative;
> +    int64_t signed_value;
> +    int64_t signed_decr;
> =20
>      /* Truncate value to decr_width and sign extend for simplicity */
> -    value &=3D ((1ULL << nr_bits) - 1);
> -    negative =3D !!(value & (1ULL << (nr_bits - 1)));
> -    if (negative) {
> -        value |=3D (0xFFFFFFFFULL << nr_bits);
> -    }
> +    signed_value =3D sextract64(value, 0, nr_bits);
> +    signed_decr =3D sextract64(decr, 0, nr_bits);
> =20
>      trace_ppc_decr_store(nr_bits, decr, value);
> =20
> @@ -850,16 +848,16 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, u=
int64_t *nextp,
>       * On MSB edge based DEC implementations the MSB going from 0 -> 1 t=
riggers
>       * an edge interrupt, so raise it here too.
>       */
> -    if ((value < 3) ||
> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && negative) ||
> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && negative
> -          && !(decr & (1ULL << (nr_bits - 1))))) {
> +    if ((signed_value < 3) ||
> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0)=
 ||
> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value =
< 0
> +          && signed_decr >=3D 0)) {
>          (*raise_excp)(cpu);
>          return;
>      }
> =20
>      /* On MSB level based systems a 0 for the MSB stops interrupt delive=
ry */
> -    if (!negative && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL)) {
> +    if (signed_value >=3D 0 && (tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL=
)) {
>          (*lower_excp)(cpu);
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B2DYzSAA8ThEP4IU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFIOfcACgkQbDjKyiDZ
s5K+ig/+ItzWbAOyt50/uWNLvqfMwevS7He6bf5WTfmVDMs77dq+CIBe+JSrdLCH
PcNvVw1sHsCGMZ6sRPJwKzvu8UWwTVsrZ40Et+uMoxV+Bbsdhh7sPDoAYuw1SdpH
PMbaGWvvvanftJ2TOOVf0SJUfMyqVRWF4KWoFbjLhpt01AtGLmkSDFj3Rh0y4XDL
+nzmi3MOJAQVKbxnTljZHKqr0n8X7hr/CH8sDOn5QtACWWgfXTVU0A0XGBbIFqYD
bfZrD9Ssxdt5trdxFiEDI+cGTl5twVGXmxfXIxwKrv1yUyL15IHFSQbV1JPKn/YX
NSvFRw2aKVR0+6yUM3IbxbqacTsf+in8OmEG/6MgYkURvoOW8poH0Ov+w5V0515X
nTDbey+zDvsMOsA2gpVWlzcexSkcYZTwObNoK1oIiC+JlW3JNcvAAM5bjbivU1+6
T3s167IPQ2B64GUC9QfgJi6BPgmQTQMBxNhN9BkRs7JD6CsdKqjf+57fWzO+sdam
ghpSwvGheDE6BY7D/t7ff31KET51dqpJNyiQhxceYEvaW2v1hbCP0FBJQqS9q+pe
BcKzCvj2PyhiROGw4wGnnUW/UfmbD6G+u2mV7LMD7fM+z5/izp1VqeQUbVtVHt56
1R2A5JrGQ1ZO0NIooWPT+4gk9pqpEOFRb4fZjB8zzr6Gi3SqOOY=
=Het2
-----END PGP SIGNATURE-----

--B2DYzSAA8ThEP4IU--

