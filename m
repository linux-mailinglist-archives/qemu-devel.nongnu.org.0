Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBC3BA7AE
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 09:46:17 +0200 (CEST)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzaLw-0003SL-5L
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 03:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lzaIo-00021L-Tz; Sat, 03 Jul 2021 03:43:02 -0400
Received: from ozlabs.org ([203.11.71.1]:53161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lzaIl-0001Lq-TP; Sat, 03 Jul 2021 03:43:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GH3p6460vz9shx; Sat,  3 Jul 2021 17:42:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625298174;
 bh=mhr34zkegg9p0MNwmB1C+FM3U6VTmLFkpuw/3Q/hdAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OV9lZatckAy0JrTXjKzf6R2JAnDL480FwWXkLImJESdn0vWJSa61chhLq3V0YyT+P
 J6WrvMR/Zx0fs2P2CM88fecIofFbKDTNKNOdBV64hsGovoONgcv7/9yAHxwiBF24Cv
 yfiOYFqqQ8nSjn78kw2OEZDAE8rogqzmR8w2lZc0=
Date: Sat, 3 Jul 2021 17:32:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 3/3] target/ppc: Fix compilation with DEBUG_BATS debug
 option
Message-ID: <YOASorRJAusWKkam@yekko>
References: <20210702215235.1941771-1-farosas@linux.ibm.com>
 <20210702215235.1941771-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZCRj7i+pmrQlJnwM"
Content-Disposition: inline
In-Reply-To: <20210702215235.1941771-4-farosas@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZCRj7i+pmrQlJnwM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 06:52:35PM -0300, Fabiano Rosas wrote:
> ../target/ppc/mmu-hash32.c: In function 'ppc_hash32_bat_lookup':
> ../target/ppc/mmu-hash32.c:204:13: error: 'BATu' undeclared (first use in=
 this function);
>   204 |             BATu =3D &BATut[i];
>       |             ^~~~
>       |             BATut
> ../target/ppc/mmu-hash32.c:205:13: error: 'BATl' undeclared (first use in=
 this function);
>   205 |             BATl =3D &BATlt[i];
>       |             ^~~~
>       |             BATlt
> ../target/ppc/mmu-hash32.c:206:13: error: 'BEPIu' undeclared (first use i=
n this function)
>   206 |             BEPIu =3D *BATu & BATU32_BEPIU;
>       |             ^~~~~
> ../target/ppc/mmu-hash32.c:206:29: error: 'BATU32_BEPIU' undeclared (firs=
t use in this function);
>   206 |             BEPIu =3D *BATu & BATU32_BEPIU;
>       |                             ^~~~~~~~~~~~
>       |                             BATU32_BEPI
> ../target/ppc/mmu-hash32.c:207:13: error: 'BEPIl' undeclared (first use i=
n this function)
>   207 |             BEPIl =3D *BATu & BATU32_BEPIL;
>       |             ^~~~~
> ../target/ppc/mmu-hash32.c:207:29: error: 'BATU32_BEPIL' undeclared (firs=
t use in this function);
>   207 |             BEPIl =3D *BATu & BATU32_BEPIL;
>       |                             ^~~~~~~~~~~~
>       |                             BATU32_BEPI
> ../target/ppc/mmu-hash32.c:208:13: error: 'bl' undeclared (first use in t=
his function)
>   208 |             bl =3D (*BATu & 0x00001FFC) << 15;
>       |             ^~
>=20
> Fixes: 9813279664 ("target-ppc: Disentangle BAT code for 32-bit hash MMUs=
")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu-hash32.c | 5 ++++-
>  target/ppc/mmu-hash32.h | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index 9f0a497657..330bb0432e 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -27,7 +27,7 @@
>  #include "mmu-hash32.h"
>  #include "exec/log.h"
> =20
> -/* #define DEBUG_BAT */
> +/* #define DEBUG_BATS */
> =20
>  #ifdef DEBUG_BATS
>  #  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
> @@ -199,6 +199,9 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, =
target_ulong ea,
>      /* No hit */
>  #if defined(DEBUG_BATS)
>      if (qemu_log_enabled()) {
> +        target_ulong *BATu, *BATl;
> +        target_ulong BEPIl, BEPIu, bl;
> +
>          LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", ea);
>          for (i =3D 0; i < 4; i++) {
>              BATu =3D &BATut[i];
> diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
> index 898021f0d8..4fdeaf1937 100644
> --- a/target/ppc/mmu-hash32.h
> +++ b/target/ppc/mmu-hash32.h
> @@ -22,6 +22,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr =
address, int rw,
>   * Block Address Translation (BAT) definitions
>   */
> =20
> +#define BATU32_BEPIU            0xf0000000
> +#define BATU32_BEPIL            0x0ffe0000
>  #define BATU32_BEPI             0xfffe0000
>  #define BATU32_BL               0x00001ffc
>  #define BATU32_VS               0x00000002

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZCRj7i+pmrQlJnwM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDgEqIACgkQbDjKyiDZ
s5J3thAAiwDljm0H6PoI+PV+gGjQqFXLFnuKPgbA+Qa/oh5jU/5zrsWAiV+m/T2f
8PRe0rov2ekP3dPNCHtSoaEUQtLuFHo8yAI/SpWn9+UD/9iZkTP9Rl5eaomHOa2m
gl0CRONuMSQxHVG3Jf9m+MdUDWToo0H2MF1h4jKJDIrEZI89BGacbT7+HSXW2vTd
FyOKakd4sxFkg9B7aLsAFpjaR0F8yHxtCrbY7Li8HRSATMJGK2qm1kRZ72dNaEBq
wO0OoLgufWFahuQNrJOUWuU762/Oh5pcXMQzhY9t7iysQ6lyL8tWyy3lzvrYKIJ+
Ku8E2tqQxrf/ZdU5diD2xjfH4RxuIguto3Pk7mrwf8C6g63Lwz7YWbXVVn4HRqlL
W2jtF2xombU5BFkyXy7dxTNK5pP6Vh0/P850/zCS3LSgBF5LnTbsvc9jlC6eE5OK
sBNmfauhP1Keo77nwdlzH1XAGyHAQUlfB0VVNimwRd1QClL/4DC4fp6QuwB1R7GG
0DlvjyGRhwxcyCWDJ4kJilxVFGUCUNFajvf3GCn0Y6H9gZAqKBB6xRaoQfPXvY2d
4i8TIlU+C4/FSZ+fZsygloMEGTwTxvD4x+iEN9zR3WJ6ovqkXC9cj64CcCAMH7U6
Bzij6dFVcj3P+ZnOX7Xal/8vyZaoEwS7YonkhBqBG1Ga5gjRwlo=
=S7rk
-----END PGP SIGNATURE-----

--ZCRj7i+pmrQlJnwM--

