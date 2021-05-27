Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C830A39285D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:18:48 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAI3-0007MI-JD
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC0-0006ls-7E; Thu, 27 May 2021 03:12:32 -0400
Received: from ozlabs.org ([203.11.71.1]:41373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmABw-0004eV-LR; Thu, 27 May 2021 03:12:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsw6fGGz9sTD; Thu, 27 May 2021 17:12:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099540;
 bh=pHDTxhb7+REjbt7Hl3YtTUDjOsZaFNebC4wnRJSn8mU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fqC/yi0x8SQe2j8VkOvuv9Li1cnbSXXlStXdx/FPTo+dJJZhCftEvBp0svIkg0XII
 iET+ZL9eRIJDhvNi+Ixl9UaraAUfWb7W9Ff7XP7e3E1TAbeRKI5VV/JXWRfg9HUoH4
 4nQ2zMxEhy+NClyL787yVGy80ZxUVS2G+N/a66xU=
Date: Thu, 27 May 2021 14:18:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v5 3/4] target/ppc: created tcg-stub.c file
Message-ID: <YK8dqlhcXQzZ8AC2@yekko>
References: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
 <20210525115355.8254-4-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6CaaegC8Q9vFc5X3"
Content-Disposition: inline
In-Reply-To: <20210525115355.8254-4-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6CaaegC8Q9vFc5X3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:53:54AM -0300, Bruno Larsen (billionai) wrote:
> Created a file with stubs needed to compile disabling TCG. *_ppc_opcodes
> were created to make cpu_init.c have a few less ifdefs, since they are
> not needed. softmmu_resize_hpt_* have to be created because the compiler
> can't automatically know they aren't used, but they should never be
> reached.
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/meson.build |  4 ++++
>  target/ppc/tcg-stub.c  | 45 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
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
> index 0000000000..aadcf59d26
> --- /dev/null
> +++ b/target/ppc/tcg-stub.c
> @@ -0,0 +1,45 @@
> +/*
> + *  PowerPC CPU initialization for qemu.
> + *
> + *  Copyright (C) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "internal.h"
> +#include "hw/ppc/spapr.h"
> +
> +void create_ppc_opcodes(PowerPCCPU *cpu, Error **errp)
> +{
> +}
> +
> +void destroy_ppc_opcodes(PowerPCCPU *cpu)
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

--6CaaegC8Q9vFc5X3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvHaoACgkQbDjKyiDZ
s5KVJQ/+IJJFmgJHuO/nG5uNTZ39i5ITGvgfjQHJQ+VWa3+guYC2fja2EW+rTm40
d/kV5RNSVUmd77zVXOZZwQEwSCJSLVwI8u2WVHpkFRzySZrjWSBhqEsXTO+z/9WG
n+ZWzdGnve9FG6jFEY4LEt7/i6A7FbrIwa5f6sB26Gf24nuLXPsDcEUUTOCUeL/d
8m3eRTV0Owc4nr8gBupRiCeDGGLTGH11uw23BvIpVvQoTq869xFEaWREKybX3JaH
zrVQBnkybLfJLOWJacJXhKynNfCfUPLrlfG0IvLJCbV3J7imImPiwBeixlOcoGOa
FokE5/6vC5ffp6NZAM1eZv8SDNfV3Ls9OD/iEuttAgNVbr7+txNXJEGqmIr1U0Wz
mDX3qhBX9nE45bAQYPo4hWw+BNxyW3Eiy/6UrV7YmpwjRW9ZDGvKWFaWqvdAKZ/5
Ymb7VQhmDn3lTiL+0ITA/DGNXJVSLXqbiuO3SUyMXLzNTP25RT+k22C/M1lriprx
C9HAxWvgajPj6E5UbN2NdCx8SE1Nj8ib4WW5YU+SyUHp+NTYnkb9fwR9KchFlF3S
a9bNDv6cwTIg+LwoXv8NPWRhWVx1MXoc2VDx+z+zetQMnsoNxZz9Jz5/O27GXS94
o8NSVU4fTK7Q0GtYvN622cIptYwJ7tQjCSNVQ4ct1h54czdgKTY=
=Erxn
-----END PGP SIGNATURE-----

--6CaaegC8Q9vFc5X3--

