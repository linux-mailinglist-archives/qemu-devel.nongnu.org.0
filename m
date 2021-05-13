Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3FD37F22F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:29:56 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2yx-0006TM-Mp
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0007Ht-Dx; Thu, 13 May 2021 00:23:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sT-0004ZG-8E; Thu, 13 May 2021 00:23:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms40B0z9sxS; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=lKUeTq65gpyX4YTEBPWn7C6POCuHqnnrf1Z+siZUbYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V9ItLxDQk7akBon3tph3lQvsxeVNbDVKmd93u7TNwpRF4K6uD0kBFrYDmxIJeG8OU
 TH2k883wuvZS1XS8D8zamz/orvA1Db74UF1EPp9qTd301D2LApc8aoKy/XC/raTDtD
 lr5rpR1Nlp8rxGNP/j9CdvrHiDXqjpu5bPQvbvxc=
Date: Thu, 13 May 2021 13:59:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 10/11] target/ppc: created tcg-stub.c file
Message-ID: <YJykOuYj9xgjVPZQ@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zuzwCrk9AvukcV2P"
Content-Disposition: inline
In-Reply-To: <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zuzwCrk9AvukcV2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 11:08:12AM -0300, Bruno Larsen (billionai) wrote:
> Created a file with stubs needed to compile disabling TCG.
>=20
> We're not sure about keeping the softmmu stubs in this file. if there is
> a better place to put them, please let us know.
>=20
> The other 3 functions have been stubbed because we didn't know what to
> do with them. Making the file compile in the !TCG case would create an
> ifdef hell, but extracting the functions meant moving many others as
> well, and there weren't any good places to put them.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/tcg-stub.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 target/ppc/tcg-stub.c
>=20
> diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
> new file mode 100644
> index 0000000000..67099e2676
> --- /dev/null
> +++ b/target/ppc/tcg-stub.c
> @@ -0,0 +1,33 @@
> +
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +#include "cpu.h"
> +#include "hw/ppc/spapr.h"
> +
> +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +{
> +    return 0;
> +}
> +
> +void dump_mmu(CPUPPCState *env)
> +{
> +}
> +
> +void ppc_tlb_invalidate_all(CPUPPCState *env)
> +{
> +}
> +
> +target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
> +                                        SpaprMachineState *spapr,
> +                                        target_ulong shift)
> +{
> +    g_assert_not_reached();
> +}
> +
> +target_ulong softmmu_resize_hpt_commit(PowerPCCPU* cpu,
> +                                       SpaprMachineState *spapr,
> +                                       target_ulong flags,
> +                                       target_ulong shift)
> +{
> +    g_assert_not_reached();
> +}

I think these last two stubs should be obsoleted by the patch from
Lucas I already merged "hw/ppc: moved hcalls that depend on softmmu".

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zuzwCrk9AvukcV2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpDoACgkQbDjKyiDZ
s5KbGRAArgKEZTGMxhnc+6vwCjshG3peub2ZiwJRdtWsIlK5SJwqBQ3nSX6mUDaU
VmXdR86TW9qnxE26EeYIyS5kViMp56sY5ijzcCYQp0B1aTei3tFtvJYhIp6QizKv
gCAuWJ1uJ/BUyvchcBc/k3vQYtnowm10PVnFx5WaXbDBLivF50iozG5FOP9tVKiR
EctnaC3n/rZtN4ekNeuJQZLGpPaLNTFZ0Zp7d+IkxNHSPh+PLAByUIiT1Fn3J5tn
jrOvn5DaD4u/yWrF3NdtV+H9ZWQNXYvD3BQQhx1Xp4VGLpCrdUrzOOS+DcPeD1CN
leLs5esUs0um+AhsN7BHLtk4Q+DuFoxyG4qEu8HvvALHsDFmoW1u0OBxscYlIMfn
C3pAlS/bw18GDAQmzRgcER0+Mrmm+m4muimdcoD6/lo2iW2e116tnUvQpRHshs4D
ym3TJDUXhMuD61GdVzFTqxcgooByBdEoCdR1ZgtVxf34sm00binVLaDPG0sroR9Z
+nQwRbRal5P61Ofw/dxQ1mNX9vchd7ft1R8e9XMJv/fbB5mi3uj7+3+4alD1+hYx
ABowWHXzMzHlI77iuqKqwh0+zv7TBDnr78HiioqrZuZJdZa8S0OP3kMIKgVNCS4y
KIoivy7w4wlCCCFBLdHDhz1n5QHk0GiYRVpA6tz4dJfxsfX5Lpk=
=R9eR
-----END PGP SIGNATURE-----

--zuzwCrk9AvukcV2P--

