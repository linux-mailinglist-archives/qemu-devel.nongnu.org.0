Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70A9375F19
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:19:51 +0200 (CEST)
Received: from localhost ([::1]:60868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ler1q-0000Z6-Vd
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqzZ-0007Qh-MW; Thu, 06 May 2021 23:17:29 -0400
Received: from ozlabs.org ([203.11.71.1]:46201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqzX-0007lF-BM; Thu, 06 May 2021 23:17:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fbwc26bJwz9sWp; Fri,  7 May 2021 13:17:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620357442;
 bh=w4NmcrfhHQj3R6G8RQMOwyxaBnhecJ8uf+tPvezxSlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gsjEk65LtF6tSr3BgKKDFl++ti3mxEwyfCMO3nz5Oi8goLwrtZHuVNhMtnvJ/Mkmg
 j7VK7QljkD42VaGeWIYPJDawiWheYzat8IYMcuFw7/WJzN/18cCJ4h9JD4TzLgNjPJ
 xEZNQrxxKpFiILC3FKi5pKjpOiYH4mPVgBaQkcoo=
Date: Fri, 7 May 2021 13:13:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v3 2/4] target/ppc: moved function out of mmu-hash64
Message-ID: <YJSwVxa2riXmuF+5@yekko>
References: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
 <20210506163941.106984-3-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcePm+HPZhvCat5F"
Content-Disposition: inline
In-Reply-To: <20210506163941.106984-3-lucas.araujo@eldorado.org.br>
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HcePm+HPZhvCat5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 01:39:39PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> The function ppc_hash64_filter_pagesizes has been moved from a function
> with prototype in mmu-hash64.h and implemented in mmu-hash64.c to
> a static function in hw/ppc/spapr_caps.c as it's only used in that file.
>=20
> Signed-off-by: Lucas Mateus Castro (alqotel)
> <lucas.araujo@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  hw/ppc/spapr_caps.c     | 59 +++++++++++++++++++++++++++++++++++++++++
>  target/ppc/mmu-hash64.c | 57 ---------------------------------------
>  target/ppc/mmu-hash64.h |  3 ---
>  3 files changed, 59 insertions(+), 60 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 9ea7ddd1e9..d0c419b392 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -371,6 +371,65 @@ static bool spapr_pagesize_cb(void *opaque, uint32_t=
 seg_pshift,
>      return true;
>  }
> =20
> +static void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> +                                 bool (*cb)(void *, uint32_t, uint32_t),
> +                                 void *opaque)
> +{
> +    PPCHash64Options *opts =3D cpu->hash64_opts;
> +    int i;
> +    int n =3D 0;
> +    bool ci_largepage =3D false;
> +
> +    assert(opts);
> +
> +    n =3D 0;
> +    for (i =3D 0; i < ARRAY_SIZE(opts->sps); i++) {
> +        PPCHash64SegmentPageSizes *sps =3D &opts->sps[i];
> +        int j;
> +        int m =3D 0;
> +
> +        assert(n <=3D i);
> +
> +        if (!sps->page_shift) {
> +            break;
> +        }
> +
> +        for (j =3D 0; j < ARRAY_SIZE(sps->enc); j++) {
> +            PPCHash64PageSize *ps =3D &sps->enc[j];
> +
> +            assert(m <=3D j);
> +            if (!ps->page_shift) {
> +                break;
> +            }
> +
> +            if (cb(opaque, sps->page_shift, ps->page_shift)) {
> +                if (ps->page_shift >=3D 16) {
> +                    ci_largepage =3D true;
> +                }
> +                sps->enc[m++] =3D *ps;
> +            }
> +        }
> +
> +        /* Clear rest of the row */
> +        for (j =3D m; j < ARRAY_SIZE(sps->enc); j++) {
> +            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
> +        }
> +
> +        if (m) {
> +            n++;
> +        }
> +    }
> +
> +    /* Clear the rest of the table */
> +    for (i =3D n; i < ARRAY_SIZE(opts->sps); i++) {
> +        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
> +    }
> +
> +    if (!ci_largepage) {
> +        opts->flags &=3D ~PPC_HASH64_CI_LARGEPAGE;
> +    }
> +}
> +
>  static void cap_hpt_maxpagesize_cpu_apply(SpaprMachineState *spapr,
>                                            PowerPCCPU *cpu,
>                                            uint8_t val, Error **errp)
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index d517a99832..be3596f27b 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -1200,61 +1200,4 @@ const PPCHash64Options ppc_hash64_opts_POWER7 =3D {
>      }
>  };
> =20
> -void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> -                                 bool (*cb)(void *, uint32_t, uint32_t),
> -                                 void *opaque)
> -{
> -    PPCHash64Options *opts =3D cpu->hash64_opts;
> -    int i;
> -    int n =3D 0;
> -    bool ci_largepage =3D false;
> -
> -    assert(opts);
> -
> -    n =3D 0;
> -    for (i =3D 0; i < ARRAY_SIZE(opts->sps); i++) {
> -        PPCHash64SegmentPageSizes *sps =3D &opts->sps[i];
> -        int j;
> -        int m =3D 0;
> =20
> -        assert(n <=3D i);
> -
> -        if (!sps->page_shift) {
> -            break;
> -        }
> -
> -        for (j =3D 0; j < ARRAY_SIZE(sps->enc); j++) {
> -            PPCHash64PageSize *ps =3D &sps->enc[j];
> -
> -            assert(m <=3D j);
> -            if (!ps->page_shift) {
> -                break;
> -            }
> -
> -            if (cb(opaque, sps->page_shift, ps->page_shift)) {
> -                if (ps->page_shift >=3D 16) {
> -                    ci_largepage =3D true;
> -                }
> -                sps->enc[m++] =3D *ps;
> -            }
> -        }
> -
> -        /* Clear rest of the row */
> -        for (j =3D m; j < ARRAY_SIZE(sps->enc); j++) {
> -            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
> -        }
> -
> -        if (m) {
> -            n++;
> -        }
> -    }
> -
> -    /* Clear the rest of the table */
> -    for (i =3D n; i < ARRAY_SIZE(opts->sps); i++) {
> -        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
> -    }
> -
> -    if (!ci_largepage) {
> -        opts->flags &=3D ~PPC_HASH64_CI_LARGEPAGE;
> -    }
> -}
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index 87729d48b3..5dfd7f8b93 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -18,9 +18,6 @@ unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *c=
pu,
>  void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
>  void ppc_hash64_init(PowerPCCPU *cpu);
>  void ppc_hash64_finalize(PowerPCCPU *cpu);
> -void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
> -                                 bool (*cb)(void *, uint32_t, uint32_t),
> -                                 void *opaque);
>  #endif
> =20
>  /*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HcePm+HPZhvCat5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUsFcACgkQbDjKyiDZ
s5LMYhAAwM0dBA2leuAkR15sAq51TXkj/6ix095UqOIUdIz1G00iDoJO8lFBVIe8
N8jdsj2yRU07VMevA8m24g/uMKGHYKGMV5mzkBsseaiQIX+OET/BXwRVN94GpisY
6xS3mTg4BamdIm5HN2aHREtrB44ZG+XIM8/IXDwfmi+O2ErtN+CCEAm57sFSEiWR
yOzihbYzzmG0MWds0ZriI642a4gtlxZmq0T+Qao9dz4RvtnHkqAdfU0iRWqzE5Kr
L1WR2GNTnem+poVcJyHyd2IGiJ03Z/fR0Z3R3EqEBWWpImAeU+jE4xDf2XH5qQVf
XqO22kM2WGJobf3++bAaYkpwdi1yP/xvNDBoKCOsxwfCsLDFbIteV7u1KbK4DWDy
3r633nsl254YZrcUohNxVkUEAoxuQeAwiJcPUSjV2wCpEq1bhnBUzB/Mih9aYLxv
R+Uhb+tVsmd6lxmaB2fro2y+a1LZJoJMc4TNCgxPwv+jv0cTrr4LSmAAATESxR2F
VQ97t23SwEL9R6jIxZK+D+6IHkrXnfCG9vbVP1o3mR8/3So122BixY3e/I9UAd6P
8QMAo4bOrDrZJk+Sp0LxgKHrQ5ObQ0MOz/kuxKbocmLlThBLPOneFbKYkl6ifcBv
fRIy9KUbQuZzP5NepdjcpcZh3qNjveYX7LY1TpV4gYVSKe4trfE=
=siik
-----END PGP SIGNATURE-----

--HcePm+HPZhvCat5F--

