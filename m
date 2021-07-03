Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B636E3BA7AF
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 09:46:51 +0200 (CEST)
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzaMU-0003mB-NN
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 03:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lzaIo-00021I-P8; Sat, 03 Jul 2021 03:43:02 -0400
Received: from ozlabs.org ([203.11.71.1]:33911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lzaIl-0001Lg-Uk; Sat, 03 Jul 2021 03:43:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GH3p63nd8z9sSs; Sat,  3 Jul 2021 17:42:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625298174;
 bh=VjEcRLS3j3Hs9Jk3pylOw5UOvOnr/ophoWxA0kePYm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W1HPZOh1QBAACtvVFfG7q6fr4b4l6teNgSZ6CSM5mHum98KNsjetr0yn2S3FD98Og
 2wZyK/9HJJyy7yJZEVlypImEUveq+N/ReToo32xumkrCB3u6SWUIE4vTqqyePkTo5F
 1VWwdGQK7tOcw7Y5gbEyPtGAs5FmqAIFWUnV8jZc=
Date: Sat, 3 Jul 2021 17:31:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 2/3] target/ppc: Fix compilation with FLUSH_ALL_TLBS
 debug option
Message-ID: <YOASRXaiS8LW4gla@yekko>
References: <20210702215235.1941771-1-farosas@linux.ibm.com>
 <20210702215235.1941771-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SXoZH4D+b0Xbiabi"
Content-Disposition: inline
In-Reply-To: <20210702215235.1941771-3-farosas@linux.ibm.com>
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


--SXoZH4D+b0Xbiabi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 06:52:34PM -0300, Fabiano Rosas wrote:
> ../target/ppc/mmu_helper.c: In function 'helper_store_ibatu':
> ../target/ppc/mmu_helper.c:1802:17: error: unused variable 'cpu' [-Werror=
=3Dunused-variable]
>  1802 |     PowerPCCPU *cpu =3D env_archcpu(env);
>       |                 ^~~
> ../target/ppc/mmu_helper.c: In function 'helper_store_dbatu':
> ../target/ppc/mmu_helper.c:1838:17: error: unused variable 'cpu' [-Werror=
=3Dunused-variable]
>  1838 |     PowerPCCPU *cpu =3D env_archcpu(env);
>       |                 ^~~
> ../target/ppc/mmu_helper.c: In function 'helper_store_601_batu':
> ../target/ppc/mmu_helper.c:1874:17: error: unused variable 'cpu' [-Werror=
=3Dunused-variable]
>  1874 |     PowerPCCPU *cpu =3D env_archcpu(env);
>       |                 ^~~
> ../target/ppc/mmu_helper.c: In function 'helper_store_601_batl':
> ../target/ppc/mmu_helper.c:1919:17: error: unused variable 'cpu' [-Werror=
=3Dunused-variable]
>  1919 |     PowerPCCPU *cpu =3D env_archcpu(env);
>=20
> Fixes: db70b31144 ("target/ppc: Use env_cpu, env_archcpu")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu_helper.c | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index ff2c6bdd8c..67caba6369 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1798,9 +1798,6 @@ static inline void dump_store_bat(CPUPPCState *env,=
 char ID, int ul, int nr,
>  void helper_store_ibatu(CPUPPCState *env, uint32_t nr, target_ulong valu=
e)
>  {
>      target_ulong mask;
> -#if defined(FLUSH_ALL_TLBS)
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -#endif
> =20
>      dump_store_bat(env, 'I', 0, nr, value);
>      if (env->IBAT[0][nr] !=3D value) {
> @@ -1834,9 +1831,6 @@ void helper_store_ibatl(CPUPPCState *env, uint32_t =
nr, target_ulong value)
>  void helper_store_dbatu(CPUPPCState *env, uint32_t nr, target_ulong valu=
e)
>  {
>      target_ulong mask;
> -#if defined(FLUSH_ALL_TLBS)
> -    PowerPCCPU *cpu =3D env_archcpu(env);
> -#endif
> =20
>      dump_store_bat(env, 'D', 0, nr, value);
>      if (env->DBAT[0][nr] !=3D value) {
> @@ -1871,7 +1865,6 @@ void helper_store_601_batu(CPUPPCState *env, uint32=
_t nr, target_ulong value)
>  {
>      target_ulong mask;
>  #if defined(FLUSH_ALL_TLBS)
> -    PowerPCCPU *cpu =3D env_archcpu(env);
>      int do_inval;
>  #endif
> =20
> @@ -1916,7 +1909,6 @@ void helper_store_601_batl(CPUPPCState *env, uint32=
_t nr, target_ulong value)
>  #if !defined(FLUSH_ALL_TLBS)
>      target_ulong mask;
>  #else
> -    PowerPCCPU *cpu =3D env_archcpu(env);
>      int do_inval;
>  #endif
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SXoZH4D+b0Xbiabi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDgEkUACgkQbDjKyiDZ
s5K7Fw/+PPYflZrscZCSeFqh1BRM2kWMIp8WsLVik5cO90QLdgaX+zrlnY/AzuwM
BaaROUuC5JdOhltY18jGPYGmKJ9FIQqziEzqQsy/w8Ai+WtYM7CTlPvF750O57I+
/B34ZLSDon3Hnl38YcZE2LHbRLXilOmDUX7yOW9u7GA5qF6tvhCBeOepdPy3HQcf
caFfBSmcbYlQbo/X/6mh4ZPl4xfc2EXvmSwiF33uq2xDlaoW2hZdhyBaCXb144bo
0TtOzM2JfM7Yoey6jORxRx4TsSlbjVpqCaWrfJHBMvZ+6i6Cdzx0TSvkT+Mr2BOX
oMKaErT27HtnfmRQwSueZwc975RDyur1TKcj60IBoG3WBa1ir8P8RSkt2skzVPaO
vm0kML6Qx/Up3Gvm/TnLh4bpUz+gbOKkeEhB3EHsTp0MlLN4McAHZK8WkWxrQFi3
0I8IojXY1RVKNgKgybdFR5LDwcCWRE6uX7kCVtONvDQwbT/llTjeYbP2C3Nm77aI
tYIyYYPygYgbYGPyqCWh2fav3AXwjWo8AWK8z/PRgyhglWv9Jwx3+vwFFXVVYD6X
sQ/Ba7sgFv+OmZuHnLFKTxPZ45yDUspuXlIiPCJDNSq4J3FZMTnjo8jypPIYN60Q
LwdSoS3vPTg4VBuMan5KPRzB6xaGhPIuw/AmxJF2vuRc9qrOtro=
=1+jF
-----END PGP SIGNATURE-----

--SXoZH4D+b0Xbiabi--

