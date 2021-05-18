Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43214386F8C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:43:56 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liom3-0006O2-3L
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeK-000714-IP; Mon, 17 May 2021 21:35:58 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38213 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeG-00074X-P5; Mon, 17 May 2021 21:35:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqd13SMz9sfG; Tue, 18 May 2021 11:35:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301741;
 bh=kjYjU9oWywOrkCHr+NWWQU5SHQz4utU95BEUswJ7j9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pskkGQ3WAYylEqtM7hZEx3bwZiv/mMVJgW8b0P+u/6uyVdGVxgWy/9tF8qv0aGljz
 1ObiBCPD+V8CR9FVZkpOMzIm2QPql0wUzdxfeV7KwN6hm3FYVK2UNX4H0GKXA2juuU
 hlRZevLaRihHbQhtahSUqjmxUudSFycaCjixCIl4=
Date: Tue, 18 May 2021 10:25:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 11/23] target/ppc: Add infrastructure for prefixed insns
Message-ID: <YKMJezGNvGxmoOib@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-12-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XVrS9ME72+l1Cd30"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-12-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XVrS9ME72+l1Cd30
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:13PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.h                           |  1 +
>  target/ppc/insn32.decode                   | 18 ++++++++++++
>  target/ppc/insn64.decode                   | 18 ++++++++++++
>  target/ppc/meson.build                     |  9 ++++++
>  target/ppc/translate.c                     | 34 +++++++++++++++++++---
>  target/ppc/translate/fixedpoint-impl.c.inc | 18 ++++++++++++
>  6 files changed, 94 insertions(+), 4 deletions(-)
>  create mode 100644 target/ppc/insn32.decode
>  create mode 100644 target/ppc/insn64.decode
>  create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index cab33a3680..351fcdf5f8 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -144,6 +144,7 @@ enum {
>      POWERPC_EXCP_ALIGN_PROT    =3D 0x04,  /* Access cross protection bou=
ndary  */
>      POWERPC_EXCP_ALIGN_BAT     =3D 0x05,  /* Access cross a BAT/seg boun=
dary   */
>      POWERPC_EXCP_ALIGN_CACHE   =3D 0x06,  /* Impossible dcbz access     =
       */
> +    POWERPC_EXCP_ALIGN_INSN    =3D 0x07,  /* Pref. insn x-ing 64-byte bo=
undary */
>      /* Exception subtypes for POWERPC_EXCP_PROGRAM                      =
     */
>      /* FP exceptions                                                    =
     */
>      POWERPC_EXCP_FP            =3D 0x10,
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> new file mode 100644
> index 0000000000..a3a8ae06bf
> --- /dev/null
> +++ b/target/ppc/insn32.decode
> @@ -0,0 +1,18 @@
> +#
> +# Power ISA decode for 32-bit insns (opcode space 0)
> +#
> +# Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2.1 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <http://www.gnu.org/licen=
ses/>.
> +#
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> new file mode 100644
> index 0000000000..a38b1f84dc
> --- /dev/null
> +++ b/target/ppc/insn64.decode
> @@ -0,0 +1,18 @@
> +#
> +# Power ISA decode for 64-bit prefixed insns (opcode space 0 and 1)
> +#
> +# Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2.1 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <http://www.gnu.org/licen=
ses/>.
> +#
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index d1aa7d5d39..512e3a0288 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -17,6 +17,15 @@ ppc_ss.add(files(
> =20
>  ppc_ss.add(libdecnumber)
> =20
> +gen =3D [
> +  decodetree.process('insn32.decode',
> +                     extra_args: '--static-decode=3Ddecode_insn32'),
> +  decodetree.process('insn64.decode',
> +                     extra_args: ['--static-decode=3Ddecode_insn64',
> +                                  '--insnwidth=3D64']),
> +]
> +ppc_ss.add(gen)
> +
>  ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files(=
'kvm-stub.c'))
>  ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'=
))
> =20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index b1873d2dcc..64d6acb078 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7776,6 +7776,10 @@ static inline void set_avr64(int regno, TCGv_i64 s=
rc, bool high)
>  # define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
>  #endif
> =20
> +#include "decode-insn32.c.inc"
> +#include "decode-insn64.c.inc"
> +#include "translate/fixedpoint-impl.c.inc"
> +
>  #include "translate/fp-impl.c.inc"
> =20
>  #include "translate/vmx-impl.c.inc"
> @@ -9089,11 +9093,18 @@ static bool ppc_tr_breakpoint_check(DisasContextB=
ase *dcbase, CPUState *cs,
>      return true;
>  }
> =20
> +static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    return opc1(insn) =3D=3D 1;
> +}
> +
>  static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      CPUPPCState *env =3D cs->env_ptr;
> +    target_ulong pc;
>      uint32_t insn;
>      bool ok;
> =20
> @@ -9101,11 +9112,26 @@ static void ppc_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cs)
>      LOG_DISAS("nip=3D" TARGET_FMT_lx " super=3D%d ir=3D%d\n",
>                ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
> =20
> -    ctx->cia =3D ctx->base.pc_next;
> -    insn =3D translator_ldl_swap(env, ctx->base.pc_next, need_byteswap(c=
tx));
> -    ctx->base.pc_next +=3D 4;
> +    ctx->cia =3D pc =3D ctx->base.pc_next;
> +    insn =3D translator_ldl_swap(env, pc, need_byteswap(ctx));
> +    ctx->base.pc_next =3D pc +=3D 4;
> =20
> -    ok =3D decode_legacy(cpu, ctx, insn);
> +    if (!is_prefix_insn(ctx, insn)) {
> +        ok =3D (decode_insn32(ctx, insn) ||
> +              decode_legacy(cpu, ctx, insn));
> +    } else if ((pc & 63) =3D=3D 0) {
> +        /*
> +         * Power v3.1, section 1.9 Exceptions:
> +         * attempt to execute a prefixed instruction that crosses a
> +         * 64-byte address boundary (system alignment error).
> +         */
> +        gen_exception_err(ctx, POWERPC_EXCP_ALIGN, POWERPC_EXCP_ALIGN_IN=
SN);
> +        ok =3D true;
> +    } else {
> +        uint32_t insn2 =3D translator_ldl_swap(env, pc, need_byteswap(ct=
x));
> +        ctx->base.pc_next =3D pc +=3D 4;
> +        ok =3D decode_insn64(ctx, deposit64(insn2, 32, 32, insn));
> +    }
>      if (!ok) {
>          gen_invalid(ctx);
>      }
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> new file mode 100644
> index 0000000000..be75085cee
> --- /dev/null
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -0,0 +1,18 @@
> +/*
> + * Power ISA decode for Fixed-Point Facility instructions
> + *
> + * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XVrS9ME72+l1Cd30
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjCXoACgkQbDjKyiDZ
s5JJEg//cC6c578cWKW6fpNyHYf3gu0CcjEzuu+7owoT+eRX9cS7RmVbjA8oUBR1
7QUWQU5Q6kZ6AEaEhgeZl53zHPrtKJdrzbmUpVu5+A0Gl0wpw3IKMZLU0wKVmegI
m/el5V++sCZxO4xYPXBbUuZoPBKPdeVup2YVLMxpJuMn5WzOPsLtn7OhMJKXda81
TkfhxKDM0dhcBiDKzJa1zgIVeJkQjbbi45MtAluz57RvBn7EDiuI4pXbywLUbXIU
Me43II1L6JNHBi4SnNaiYfL3ZCIt6XK1qFEr3m2cfW4lgeeebt/0G9YpGP1xKBkd
ZeP4/hGg7cFYQFIvOoWCPEOWVZMIn4je4HpNSAMF3F1+Z1+ZZwM1U+23JPs0xf6T
Rrreg/UWKEEu/Z4QgPnpZZgAlVfLGCng8paX9XVoFeHDhUd1b5Ys7w1GhxfVxuqj
uMypxFul0PzSfx0cuqQ4JVOv4Dscu3czZ3q9dQl3JdB/z8Jslq4sdD8XA0nJMWC5
08UuMrNVpVPFP9Kv+Ug16+NasVFVS2WU3brBzS6b0vdgPplNfzlDxBrZ5efeA2Yg
EIBssdFiaaMwF4O9ofqX9n7jLRH4oUUi6UAWx2+eMOwStvgZtq4gwLYXayDJ3KJy
pVwjfMLVpl2UKWDNlEuZ6cY5ISpditl1h0CSsXObTiraMt0wYCU=
=CrOw
-----END PGP SIGNATURE-----

--XVrS9ME72+l1Cd30--

