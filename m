Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2941B3BF46D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:08:26 +0200 (CEST)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LKr-00068j-5J
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFV-0001QF-Js; Thu, 08 Jul 2021 00:02:53 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34529 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFR-0004eI-LR; Thu, 08 Jul 2021 00:02:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL2gk4Rkbz9sXL; Thu,  8 Jul 2021 14:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625716962;
 bh=uhvlaHddDhqgoVtbefUJeN2mXymIWkgUZA6k40F3ZB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PkBPfDowxQgG/MCtemnd2I/ESEqVLlgmW+iXxRxo2vZcecCpCpi3Am2uDeYD3Vcc8
 8KpG02XIgaT0qJB3PX7NMTRLlXCA3g3J0YqxfEIsOaOdiZnjjGaP3dfLbnL+QHOmSu
 r7aO5vfH7VWgmvqRnV8n1dypMHYvC56BZgtmEgmM=
Date: Thu, 8 Jul 2021 12:48:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/4] target/ppc: Allow virtual hypervisor on CPU without HV
Message-ID: <YOZnmxJQjsT40TVc@yekko>
References: <cover.1624811233.git.balaton@eik.bme.hu>
 <21c7745aabbb68fcc50bb2ffaf16b939ba21261c.1624811233.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QXBLzTNxfB/6l8Gd"
Content-Disposition: inline
In-Reply-To: <21c7745aabbb68fcc50bb2ffaf16b939ba21261c.1624811233.git.balaton@eik.bme.hu>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QXBLzTNxfB/6l8Gd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 27, 2021 at 06:27:13PM +0200, BALATON Zoltan wrote:
> Change the assert in ppc_store_sdr1() to allow vhyp to be set on CPUs
> without HV bit. This allows using the vhyp interface for firmware
> emulation on pegasos2.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Kind of a hack, but a simple one, so applied to ppc-for-6.1.

> ---
>  target/ppc/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 19d67b5b07..a29299882a 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -72,7 +72,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong valu=
e)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
>      qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, valu=
e);
> -    assert(!cpu->vhyp);
> +    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
>  #if defined(TARGET_PPC64)
>      if (mmu_is_64bit(env->mmu_model)) {
>          target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QXBLzTNxfB/6l8Gd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmZ5sACgkQbDjKyiDZ
s5JS5g//UEzBYK/LiaMAMEEL/ksCfvx+e7qV1w4mNE4zc76dYyltvCGu8Hbp5Ub8
1tvedmnzVUlqu9Uzi+N87uW40jOoK/wPQOKIriNAx/pOAcOYVlH7m9kEAcAOrU5R
cz5DvBsyklapmsZdfLimGFUKuVGdvjfxYYZDK5kxWdTdF+FT9DV4bMEDVK21LUrA
AqwkxVNL133qVuFHz5OnwZMRoC1+Nb5ICJTdmumNvhH7h1U36FTAZny01qLNe5WC
/2VsffH544M8gvy5UKS9U6Ut8CH57D1bNbTTsAm10C6K8uJpoVsjh8+L8KxlAcnN
QOOIZSOhn+TCmnZaQmFnY7IRFzfihU9rPD5rGsDkd3JlzI8/Tc9ZFZOGFPyWuWdZ
R11DqqH3tHfXpuCzyGc1/23FC3NotbWMCDmPAMVyZlHfyA4+3ToG9fnK2Nmqk4RY
dU+Ait9SVKQDuEVyWzMFyMbbfTkUaqYG5Q2/2RKaF0UA/foVvi1OYXRz+jrU8wTm
NlAr2uj9Ri0tYu7SwI54kzV7Q6WpTs4X4KPLYBPmdA5I5Fg0fM/tlG8+fMpPPqql
jbvTIfY73DKYn8Z+LsR0kpVc8fJkigHCKvF4nTeTvMZndiL+WO133oEGm35elHCM
vdpk1O7U2qFPxi8+y2OFk+7ZZvh6Ic490mnrN0wfTqjjSaKltEA=
=wM9b
-----END PGP SIGNATURE-----

--QXBLzTNxfB/6l8Gd--

