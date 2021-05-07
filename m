Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95EE375EF6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:03:54 +0200 (CEST)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqmP-0001I3-N9
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqjT-0007x5-Gm; Thu, 06 May 2021 23:00:55 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41105 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqjP-0004rY-6v; Thu, 06 May 2021 23:00:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbwDm4fldz9sj1; Fri,  7 May 2021 13:00:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620356440;
 bh=OBKrYM0v0pKBf8Az23k0cgeFlH+j9zznH+6zNw6Ze/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgFxHxCVQr08gVM27EsLMyWdfZ7IHdZZIApXXoeJ8+Xu1yx1rHsLZLHNecIBecq4F
 SXAVMp/RTh+F8xo7UvviSbnn5cyTGXyTC3P2GjagCLAhXGyS34dXose7utsLR5zBT7
 /A0yly6Z/zNjX+f25KXZFXC/HpkGCN7ywuVIfmZ0=
Date: Fri, 7 May 2021 13:00:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v5 4/4] target/ppc: isolated cpu init from translation
 logic
Message-ID: <YJStUWAUq5g7AcMp@yekko>
References: <20210505155310.62710-1-bruno.larsen@eldorado.org.br>
 <20210505155310.62710-5-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="urfEr3gcn8owYfD5"
Content-Disposition: inline
In-Reply-To: <20210505155310.62710-5-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--urfEr3gcn8owYfD5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 12:53:10PM -0300, Bruno Larsen (billionai) wrote:
> finished isolation of CPU initialization logic from
> translation logic. CPU initialization now only has common code
> and may or may not call accelerator-specific code, as the
> build options require.
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/{translate_init.c.inc =3D> cpu_init.c} | 6 ++++++
>  target/ppc/meson.build                          | 1 +
>  target/ppc/spr_tcg.h                            | 2 ++
>  target/ppc/translate.c                          | 4 ++--
>  4 files changed, 11 insertions(+), 2 deletions(-)
>  rename target/ppc/{translate_init.c.inc =3D> cpu_init.c} (99%)
>=20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
> similarity index 99%
> rename from target/ppc/translate_init.c.inc
> rename to target/ppc/cpu_init.c
> index 2f4e463bb6..faece1dca2 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/cpu_init.c
> @@ -18,6 +18,7 @@
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
> =20
> +#include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
>  #include "exec/gdbstub.h"
>  #include "kvm_ppc.h"
> @@ -42,6 +43,11 @@
>  #include "fpu/softfloat.h"
>  #include "qapi/qapi-commands-machine-target.h"
> =20
> +#include "exec/helper-proto.h"
> +#include "helper_regs.h"
> +#include "internal.h"
> +#include "spr_tcg.h"
> +
>  /* #define PPC_DEBUG_SPR */
>  /* #define USE_APPLE_GDB */
> =20
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index 4079d01ee3..d1aa7d5d39 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -2,6 +2,7 @@ ppc_ss =3D ss.source_set()
>  ppc_ss.add(files(
>    'cpu-models.c',
>    'cpu.c',
> +  'cpu_init.c',
>    'dfp_helper.c',
>    'excp_helper.c',
>    'fpu_helper.c',
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> index 1d2890dea0..0be5f347d5 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_tcg.h
> @@ -19,6 +19,8 @@
>  #ifndef SPR_TCG_H
>  #define SPR_TCG_H
> =20
> +#define SPR_NOACCESS (&spr_noaccess)
> +
>  /* prototypes for readers and writers for SPRs */
>  void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>  void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 8feececba0..cc209e5999 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -38,6 +38,8 @@
>  #include "qemu/atomic128.h"
>  #include "spr_tcg.h"
> =20
> +#include "qemu/qemu-print.h"
> +#include "qapi/error.h"
> =20
>  #define CPU_SINGLE_STEP 0x1
>  #define CPU_BRANCH_STEP 0x2
> @@ -380,7 +382,6 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sp=
rn)
>      printf("ERROR: try to access SPR %d !\n", sprn);
>  #endif
>  }
> -#define SPR_NOACCESS (&spr_noaccess)
> =20
>  /* #define PPC_DUMP_SPR_ACCESSES */
> =20
> @@ -8617,7 +8618,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x=
1F, 0x03FFF800, \
>  };
> =20
>  #include "helper_regs.h"
> -#include "translate_init.c.inc"
> =20
>  /***********************************************************************=
******/
>  /* Misc PowerPC helpers */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--urfEr3gcn8owYfD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUrVEACgkQbDjKyiDZ
s5L3Rw//YV0I4NWDwaZomH24+1xYBkphOcWwzKAG7Ei0AnrGfLbbVIKxwGp/Zq/Y
XpssW5oUHZYoO8vJN3be5r+1i1O3vWzImvzuxPi2IlIbvGNKSWYS0Bd1NAKTjxUk
AUVR6Blt/+f4Z0GSZhoKukSlupCOHIwbgsRkSeXAt+qdKy9P7T+8lg3th2FjmGBu
DUPRR5RilConHOBqPRx08uKlX6v8J/kXv6BUnY8bXvk8q7bFAGxR4EfRlZxlpCKL
Pbu7L/d7tH0zMboKZg9Neltvfq+PoC4NmKSXUp4vW1mrvsKWsbKLD9YJadfMuBmK
mz0DccE9DCG3Obcn214R02mnmsRo8XbukGr4MBhduHlBF2+8rmeo0IXpxqWU2T0l
EkAn/yklER6RjV3LJG+LeFjL6XMZY8KVogfeSUGcYkR0v4ReE8zN8+3Ugw0SVyxu
fiIa22cRWaClN9UWdtce0RD/m/M89TfxFUJ3xAsMB1+VJZjobJeCWgsuNwbMtlvn
Nj0OcBrX3HLBflFVr6mQp2/mSelLG6Mvf/KIc3Z5P9qr0ebcWJADwqPYVx36c1iU
TAaojsNP0pKhn/5MvGzCrBVoFcJsaWO5D2QTOCPUHSk1CWQf2/DwYX8YEs8AbISN
azCN9mv4XkSzk8VJzO06iZfCms+50ZEvvl4ev+GeKZ2vRyPwMSs=
=AC9R
-----END PGP SIGNATURE-----

--urfEr3gcn8owYfD5--

