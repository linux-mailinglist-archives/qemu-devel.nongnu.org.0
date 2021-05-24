Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE76938DFC7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:12:16 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll10p-0006oS-Pm
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sc-0008He-D3; Sun, 23 May 2021 23:03:46 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43655 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sY-0000hr-I3; Sun, 23 May 2021 23:03:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpMV50SZtz9sW7; Mon, 24 May 2021 13:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621825405;
 bh=6rtQ9n1zDf3NXnTlqzQgJ5NC2BjJwMc65iqp67osmh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fd6QY4+VqFPxg5OoCvoxf8N+IB9C1/4/N8vuVzrMjNn6+QSiUG/HxRQUP2q0plWvk
 Zv8N0H0RGKUPYqNpajUzFnbX1+T9yAhWh2x46mYbMqLkcQDSrsQwCf10EJqXRtuioD
 2ofCCCb/hjuWH2w/V6J77uCIuTr7t8o0vNU1dweQ=
Date: Mon, 24 May 2021 13:02:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 8/9] target/ppc: created tcg-stub.c file
Message-ID: <YKsXWvxV8aLRauoe@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-9-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ipOxSrFcvyZCf6kJ"
Content-Disposition: inline
In-Reply-To: <20210521201759.85475-9-bruno.larsen@eldorado.org.br>
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


--ipOxSrFcvyZCf6kJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 05:17:58PM -0300, Bruno Larsen (billionai) wrote:
> Created a file with stubs needed to compile disabling TCG. *_ppc_opcodes
> were created to make cpu_init.c have a few less ifdefs, since they are
> not needed. coftmmu_resize_hpt_* have to be created because the compiler
> can't automatically know they aren't used, but they should never be
> reached.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/meson.build |  4 ++++
>  target/ppc/tcg-stub.c  | 25 +++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 target/ppc/tcg-stub.c
>=20
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index d1aa7d5d39..848e625302 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -28,6 +28,10 @@ ppc_softmmu_ss.add(files(
>    'mmu_helper.c',
>    'monitor.c',
>  ))
> +ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
> +  'tcg-stub.c'
> +))
> +
>  ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
>    'compat.c',
>    'mmu-book3s-v3.c',
> diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
> new file mode 100644
> index 0000000000..6d99834274
> --- /dev/null
> +++ b/target/ppc/tcg-stub.c

New file needs a copyright banner.

> @@ -0,0 +1,25 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "internal.h"
> +#include "hw/ppc/spapr.h"
> +
> +void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
> +{}

I believe style dictates this be
{
}

rather than
{}


> +
> +void destroy_ppc_opcodes(PowerPCCPU *cpu)
> +{}
> +
> +target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
> +                                        SpaprMachineState *spapr,
> +                                        target_ulong shift)
> +{
> +    g_assert_not_reached();
> +}
> +
> +target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu,
> +                                       SpaprMachineState *spapr,
> +                                       target_ulong flags,
> +                                       target_ulong shift)
> +{
> +    g_assert_not_reached();
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ipOxSrFcvyZCf6kJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrF1oACgkQbDjKyiDZ
s5JLLRAAioUXfrZT8ZFREYUsf8UgeDkD9nQE2aMm9idax3rR7eciULKm6HxgCtOF
8SwNzQ3vlcotChyimcHy0+T3DC3p2xPUiaiga14d6Wqp0fd3PJUwXMlGiNsX1edM
fQQNonYsW6+GbUByjbDa27eJ1JGnn1u9lnoHrLjgYgt/bSOU6GzXg6JFgW4UJKs+
zLtdC/bzdTUCi+HPaq3ZCMNStTzDBNEaMDI+kevnqiMkefIMc0M3VyCgpHnLDIkJ
3MM0gvZhXpaF0pyCqio+bCkgIOXYB3e0lV5l8wihbCxO5s3TUAdLHu8h1F0PLWz6
C1a9MmJCIpsCJKTtLx/9V/NzAFsip8z3NZAAm/diBF9n/2PSJk+d61EJUnUkri5l
OFg9s5RdYKa5BhQl27igbUWKKeNU0/Sh6EZH/j8ZJQuFwLYd5wyNYcG6VAxRzxpx
lNYCp1kKJsC5YqriIumu1opcDPC44d2l2AcNcaEjwZRnvd5gV+EDILOgkXTBuC7Q
u3+u4wGOUWFEMrFDH2QLHRgx7SeRkFEXLV8P3r/69EKfK/lS8xQ7b8QS2Lz40QlN
vAVA3VeSGf+3HpcxScX0zn3jNw+VBmYWVtE9uayZZXFD5NBAc414yQB02iPswknq
g2pNlDLv+PdSoYln0yRjLogllbxzv75gWOkLgLgZAInIZ9lNpIE=
=gnKA
-----END PGP SIGNATURE-----

--ipOxSrFcvyZCf6kJ--

