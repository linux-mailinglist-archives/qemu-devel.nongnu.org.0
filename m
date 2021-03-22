Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87F343832
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:17:02 +0100 (CET)
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCw0-00060j-Aw
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCtz-0004HW-Ct; Mon, 22 Mar 2021 01:14:55 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOCtw-0004aw-7L; Mon, 22 Mar 2021 01:14:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jNk3LZhz9sWP; Mon, 22 Mar 2021 16:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390086;
 bh=RReFNwkNXddDPnYtmlDbgmw93yEKIAn5msGpBVEADFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fwJzPQlFgQEkI8Bjsblf0HYlgemtyzTOho/OujDof8jKoQ8EYWK+lhNhy4gwRAapq
 otQzt+3yWzXKDdeUuXO/D8SyqxxKrl5JfirbWhMKUhEufmO3jHTXTZKtzNk60PsJ96
 rqYwBYdWiQsRMUurGNAuFMqWaZor9tX1bzSZKSDc=
Date: Mon, 22 Mar 2021 15:27:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 15/17] hw/ppc/spapr_rtas: Update hflags after setting
 msr
Message-ID: <YFgcy8GT6zWzQLNH@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-16-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TH6dS0bv3U8eoMZe"
Content-Disposition: inline
In-Reply-To: <20210315184615.1985590-16-richard.henderson@linaro.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TH6dS0bv3U8eoMZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:46:13PM -0600, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr_rtas.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8a79f9c628..6ec3e71757 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -51,6 +51,7 @@
>  #include "target/ppc/mmu-hash64.h"
>  #include "target/ppc/mmu-book3s-v3.h"
>  #include "migration/blocker.h"
> +#include "helper_regs.h"
> =20
>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *s=
papr,
>                                     uint32_t token, uint32_t nargs,
> @@ -163,6 +164,7 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spapr=
MachineState *spapr,
>      cpu_synchronize_state(CPU(newcpu));
> =20
>      env->msr =3D (1ULL << MSR_SF) | (1ULL << MSR_ME);
> +    hreg_compute_hflags(env);
> =20
>      /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
>      lpcr =3D env->spr[SPR_LPCR];

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TH6dS0bv3U8eoMZe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYHMsACgkQbDjKyiDZ
s5IqexAAv35QaOPi1+5nut26TbUysVVUVGfCrDuqJfK8hDk44FDMnb2dGUSW8VbD
kRQIi7IAHUvuyXSe4keGBnn4JNgq9gXljVV6zDPa5CdiQZyY/RKYCPAP4FD/kwKE
ns6pqTKMtvxiIJJIxXkJzYBr3Y9cTHA+eGO//NLcLYkfM8mGJ12DS+9IdRiSSxx0
Lvr1MDPAW/Q17YXu+GEIP8/xsCj7k/0zLhIsbP82NWCYEhjUNN0eWvvR4YKqQC2L
i1Cjj9LIjhmhTHypJGOcnhZW7UDrUUccD8/ptmsrtPytXSiT7hHJoWPMvVgEmiwX
466zoxvl6cPo7n2LP0N6Zbdb/tVVTp+lh1lHFHpRlV92IWUTu0OMiD4ATPeLmTz4
T7Qdnd4iie7wVt5deN/cFjJd9TyLwbjiz6TvLKvkcYj/BSJrSx8e5X2lOlt/Kf/+
wk946L61Ntb9jGzGKZ9a+n3CLhfsvNagWe3iZHlsv9j6Le4pH+liQ9gwpIkkB+BR
yBgSPn/dtsEw8vXe6e9bW+l3f2V6RSs4eQWguuMAY8VSLrQecBed+fj2bLejnEJs
Z+5uF2knpUWR4vbWjN/tyYbbzgnS0ptoxqyvLh15+H6mNQaYM3Q50fQ1G+qXLuyq
8OiFsXKDGqV+eVJYP1kb/pJyCr4R8T0rlryjU4Dhi26G/UunNBg=
=62wQ
-----END PGP SIGNATURE-----

--TH6dS0bv3U8eoMZe--

