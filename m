Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F259E37F22C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:28:06 +0200 (CEST)
Received: from localhost ([::1]:50694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh2xC-0002V8-0F
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0007Hn-DF; Thu, 13 May 2021 00:23:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sQ-0004Wx-IH; Thu, 13 May 2021 00:23:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms2qdmz9sjJ; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=NbbPd4nv7QMBFdHmTdo9OM4CPhf4V2yCIEEZEkjCfXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g2FvSvTtLwzGLq1IxLIwIH1f2YGBGMaiO1A7mXFauQI/HasMQBGB2qg+U/dG2ul+H
 BP0AqkhQLBjshwrdaeGmWLMbqmjeBmwzlKiih0uo8UQFJ48qqE3PI8S7inpBwPt2Qw
 GRlLoO/6oAxPxIAHGeuT8lPQTdLf9yq1F2eFT870=
Date: Thu, 13 May 2021 13:51:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 03/11] target/ppc: moved ppc_cpu_dump_state to cpu_init.c
Message-ID: <YJyiW6QSZQV62Elm@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-4-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZpEJtd4G7uM/7QZu"
Content-Disposition: inline
In-Reply-To: <20210512140813.112884-4-bruno.larsen@eldorado.org.br>
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


--ZpEJtd4G7uM/7QZu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 11:08:05AM -0300, Bruno Larsen (billionai) wrote:
> This function was forgotten in the cpu_init code motion series, but it
> seems to be used regardless of TCG, and so needs to be moved to support
> disabling TCG.
>=20
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu_init.c  | 182 +++++++++++++++++++++++++++++++++++++++
>  target/ppc/translate.c | 187 -----------------------------------------
>  2 files changed, 182 insertions(+), 187 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index b4a2d15c6a..d0fa219880 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9366,4 +9366,186 @@ static void ppc_cpu_register_types(void)
>  #endif
>  }
> =20
> +void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +{
> +#define RGPL  4
> +#define RFPL  4
> +
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +    int i;
> +
> +    qemu_fprintf(f, "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx " CTR "
> +                 TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\n",
> +                 env->nip, env->lr, env->ctr, cpu_read_xer(env),
> +                 cs->cpu_index);
> +    qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
> +                 "%08x iidx %d didx %d\n",
> +                 env->msr, env->spr[SPR_HID0], env->hflags,
> +                 cpu_mmu_index(env, true), cpu_mmu_index(env, false));
> +#if !defined(NO_TIMER_DUMP)
> +    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> +#if !defined(CONFIG_USER_ONLY)
> +                 " DECR " TARGET_FMT_lu
> +#endif
> +                 "\n",
> +                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> +#if !defined(CONFIG_USER_ONLY)
> +                 , cpu_ppc_load_decr(env)
> +#endif
> +        );
> +#endif
> +    for (i =3D 0; i < 32; i++) {
> +        if ((i & (RGPL - 1)) =3D=3D 0) {
> +            qemu_fprintf(f, "GPR%02d", i);
> +        }
> +        qemu_fprintf(f, " %016" PRIx64, ppc_dump_gpr(env, i));
> +        if ((i & (RGPL - 1)) =3D=3D (RGPL - 1)) {
> +            qemu_fprintf(f, "\n");
> +        }
> +    }
> +    qemu_fprintf(f, "CR ");
> +    for (i =3D 0; i < 8; i++)
> +        qemu_fprintf(f, "%01x", env->crf[i]);
> +    qemu_fprintf(f, "  [");
> +    for (i =3D 0; i < 8; i++) {
> +        char a =3D '-';
> +        if (env->crf[i] & 0x08) {
> +            a =3D 'L';
> +        } else if (env->crf[i] & 0x04) {
> +            a =3D 'G';
> +        } else if (env->crf[i] & 0x02) {
> +            a =3D 'E';
> +        }
> +        qemu_fprintf(f, " %c%c", a, env->crf[i] & 0x01 ? 'O' : ' ');
> +    }
> +    qemu_fprintf(f, " ]             RES " TARGET_FMT_lx "\n",
> +                 env->reserve_addr);
> +
> +    if (flags & CPU_DUMP_FPU) {
> +        for (i =3D 0; i < 32; i++) {
> +            if ((i & (RFPL - 1)) =3D=3D 0) {
> +                qemu_fprintf(f, "FPR%02d", i);
> +            }
> +            qemu_fprintf(f, " %016" PRIx64, *cpu_fpr_ptr(env, i));
> +            if ((i & (RFPL - 1)) =3D=3D (RFPL - 1)) {
> +                qemu_fprintf(f, "\n");
> +            }
> +        }
> +        qemu_fprintf(f, "FPSCR " TARGET_FMT_lx "\n", env->fpscr);
> +    }
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    qemu_fprintf(f, " SRR0 " TARGET_FMT_lx "  SRR1 " TARGET_FMT_lx
> +                 "    PVR " TARGET_FMT_lx " VRSAVE " TARGET_FMT_lx "\n",
> +                 env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> +                 env->spr[SPR_PVR], env->spr[SPR_VRSAVE]);
> +
> +    qemu_fprintf(f, "SPRG0 " TARGET_FMT_lx " SPRG1 " TARGET_FMT_lx
> +                 "  SPRG2 " TARGET_FMT_lx "  SPRG3 " TARGET_FMT_lx "\n",
> +                 env->spr[SPR_SPRG0], env->spr[SPR_SPRG1],
> +                 env->spr[SPR_SPRG2], env->spr[SPR_SPRG3]);
> +
> +    qemu_fprintf(f, "SPRG4 " TARGET_FMT_lx " SPRG5 " TARGET_FMT_lx
> +                 "  SPRG6 " TARGET_FMT_lx "  SPRG7 " TARGET_FMT_lx "\n",
> +                 env->spr[SPR_SPRG4], env->spr[SPR_SPRG5],
> +                 env->spr[SPR_SPRG6], env->spr[SPR_SPRG7]);
> +
> +#if defined(TARGET_PPC64)
> +    if (env->excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> +        env->excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> +        env->excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> +        env->excp_model =3D=3D POWERPC_EXCP_POWER10)  {
> +        qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "=
\n",
> +                     env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
> +    }
> +#endif
> +    if (env->excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> +        qemu_fprintf(f, "CSRR0 " TARGET_FMT_lx " CSRR1 " TARGET_FMT_lx
> +                     " MCSRR0 " TARGET_FMT_lx " MCSRR1 " TARGET_FMT_lx "=
\n",
> +                     env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1=
],
> +                     env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSR=
R1]);
> +
> +        qemu_fprintf(f, "  TCR " TARGET_FMT_lx "   TSR " TARGET_FMT_lx
> +                     "    ESR " TARGET_FMT_lx "   DEAR " TARGET_FMT_lx "=
\n",
> +                     env->spr[SPR_BOOKE_TCR], env->spr[SPR_BOOKE_TSR],
> +                     env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_DEAR]);
> +
> +        qemu_fprintf(f, "  PIR " TARGET_FMT_lx " DECAR " TARGET_FMT_lx
> +                     "   IVPR " TARGET_FMT_lx "   EPCR " TARGET_FMT_lx "=
\n",
> +                     env->spr[SPR_BOOKE_PIR], env->spr[SPR_BOOKE_DECAR],
> +                     env->spr[SPR_BOOKE_IVPR], env->spr[SPR_BOOKE_EPCR]);
> +
> +        qemu_fprintf(f, " MCSR " TARGET_FMT_lx " SPRG8 " TARGET_FMT_lx
> +                     "    EPR " TARGET_FMT_lx "\n",
> +                     env->spr[SPR_BOOKE_MCSR], env->spr[SPR_BOOKE_SPRG8],
> +                     env->spr[SPR_BOOKE_EPR]);
> +
> +        /* FSL-specific */
> +        qemu_fprintf(f, " MCAR " TARGET_FMT_lx "  PID1 " TARGET_FMT_lx
> +                     "   PID2 " TARGET_FMT_lx "    SVR " TARGET_FMT_lx "=
\n",
> +                     env->spr[SPR_Exxx_MCAR], env->spr[SPR_BOOKE_PID1],
> +                     env->spr[SPR_BOOKE_PID2], env->spr[SPR_E500_SVR]);
> +
> +        /*
> +         * IVORs are left out as they are large and do not change often =
--
> +         * they can be read with "p $ivor0", "p $ivor1", etc.
> +         */
> +    }
> +
> +#if defined(TARGET_PPC64)
> +    if (env->flags & POWERPC_FLAG_CFAR) {
> +        qemu_fprintf(f, " CFAR " TARGET_FMT_lx"\n", env->cfar);
> +    }
> +#endif
> +
> +    if (env->spr_cb[SPR_LPCR].name) {
> +        qemu_fprintf(f, " LPCR " TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> +    }
> +
> +    switch (env->mmu_model) {
> +    case POWERPC_MMU_32B:
> +    case POWERPC_MMU_601:
> +    case POWERPC_MMU_SOFT_6xx:
> +    case POWERPC_MMU_SOFT_74xx:
> +#if defined(TARGET_PPC64)
> +    case POWERPC_MMU_64B:
> +    case POWERPC_MMU_2_03:
> +    case POWERPC_MMU_2_06:
> +    case POWERPC_MMU_2_07:
> +    case POWERPC_MMU_3_00:
> +#endif
> +        if (env->spr_cb[SPR_SDR1].name) { /* SDR1 Exists */
> +            qemu_fprintf(f, " SDR1 " TARGET_FMT_lx " ", env->spr[SPR_SDR=
1]);
> +        }
> +        if (env->spr_cb[SPR_PTCR].name) { /* PTCR Exists */
> +            qemu_fprintf(f, " PTCR " TARGET_FMT_lx " ", env->spr[SPR_PTC=
R]);
> +        }
> +        qemu_fprintf(f, "  DAR " TARGET_FMT_lx "  DSISR " TARGET_FMT_lx =
"\n",
> +                     env->spr[SPR_DAR], env->spr[SPR_DSISR]);
> +        break;
> +    case POWERPC_MMU_BOOKE206:
> +        qemu_fprintf(f, " MAS0 " TARGET_FMT_lx "  MAS1 " TARGET_FMT_lx
> +                     "   MAS2 " TARGET_FMT_lx "   MAS3 " TARGET_FMT_lx "=
\n",
> +                     env->spr[SPR_BOOKE_MAS0], env->spr[SPR_BOOKE_MAS1],
> +                     env->spr[SPR_BOOKE_MAS2], env->spr[SPR_BOOKE_MAS3]);
> +
> +        qemu_fprintf(f, " MAS4 " TARGET_FMT_lx "  MAS6 " TARGET_FMT_lx
> +                     "   MAS7 " TARGET_FMT_lx "    PID " TARGET_FMT_lx "=
\n",
> +                     env->spr[SPR_BOOKE_MAS4], env->spr[SPR_BOOKE_MAS6],
> +                     env->spr[SPR_BOOKE_MAS7], env->spr[SPR_BOOKE_PID]);
> +
> +        qemu_fprintf(f, "MMUCFG " TARGET_FMT_lx " TLB0CFG " TARGET_FMT_lx
> +                     " TLB1CFG " TARGET_FMT_lx "\n",
> +                     env->spr[SPR_MMUCFG], env->spr[SPR_BOOKE_TLB0CFG],
> +                     env->spr[SPR_BOOKE_TLB1CFG]);
> +        break;
> +    default:
> +        break;
> +    }
> +#endif
> +
> +#undef RGPL
> +#undef RFPL
> +}
>  type_init(ppc_cpu_register_types)
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 5e3495e018..6c68d7006a 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -8617,193 +8617,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, =
0x1F, 0x03FFF800, \
>  #include "translate/spe-ops.c.inc"
>  };
> =20
> -#include "helper_regs.h"
> -
> -/***********************************************************************=
******/
> -/* Misc PowerPC helpers */
> -void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> -{
> -#define RGPL  4
> -#define RFPL  4
> -
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> -    int i;
> -
> -    qemu_fprintf(f, "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx " CTR "
> -                 TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\n",
> -                 env->nip, env->lr, env->ctr, cpu_read_xer(env),
> -                 cs->cpu_index);
> -    qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
> -                 "%08x iidx %d didx %d\n",
> -                 env->msr, env->spr[SPR_HID0], env->hflags,
> -                 cpu_mmu_index(env, true), cpu_mmu_index(env, false));
> -#if !defined(NO_TIMER_DUMP)
> -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> -#if !defined(CONFIG_USER_ONLY)
> -                 " DECR " TARGET_FMT_lu
> -#endif
> -                 "\n",
> -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> -#if !defined(CONFIG_USER_ONLY)
> -                 , cpu_ppc_load_decr(env)
> -#endif
> -        );
> -#endif
> -    for (i =3D 0; i < 32; i++) {
> -        if ((i & (RGPL - 1)) =3D=3D 0) {
> -            qemu_fprintf(f, "GPR%02d", i);
> -        }
> -        qemu_fprintf(f, " %016" PRIx64, ppc_dump_gpr(env, i));
> -        if ((i & (RGPL - 1)) =3D=3D (RGPL - 1)) {
> -            qemu_fprintf(f, "\n");
> -        }
> -    }
> -    qemu_fprintf(f, "CR ");
> -    for (i =3D 0; i < 8; i++)
> -        qemu_fprintf(f, "%01x", env->crf[i]);
> -    qemu_fprintf(f, "  [");
> -    for (i =3D 0; i < 8; i++) {
> -        char a =3D '-';
> -        if (env->crf[i] & 0x08) {
> -            a =3D 'L';
> -        } else if (env->crf[i] & 0x04) {
> -            a =3D 'G';
> -        } else if (env->crf[i] & 0x02) {
> -            a =3D 'E';
> -        }
> -        qemu_fprintf(f, " %c%c", a, env->crf[i] & 0x01 ? 'O' : ' ');
> -    }
> -    qemu_fprintf(f, " ]             RES " TARGET_FMT_lx "\n",
> -                 env->reserve_addr);
> -
> -    if (flags & CPU_DUMP_FPU) {
> -        for (i =3D 0; i < 32; i++) {
> -            if ((i & (RFPL - 1)) =3D=3D 0) {
> -                qemu_fprintf(f, "FPR%02d", i);
> -            }
> -            qemu_fprintf(f, " %016" PRIx64, *cpu_fpr_ptr(env, i));
> -            if ((i & (RFPL - 1)) =3D=3D (RFPL - 1)) {
> -                qemu_fprintf(f, "\n");
> -            }
> -        }
> -        qemu_fprintf(f, "FPSCR " TARGET_FMT_lx "\n", env->fpscr);
> -    }
> -
> -#if !defined(CONFIG_USER_ONLY)
> -    qemu_fprintf(f, " SRR0 " TARGET_FMT_lx "  SRR1 " TARGET_FMT_lx
> -                 "    PVR " TARGET_FMT_lx " VRSAVE " TARGET_FMT_lx "\n",
> -                 env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> -                 env->spr[SPR_PVR], env->spr[SPR_VRSAVE]);
> -
> -    qemu_fprintf(f, "SPRG0 " TARGET_FMT_lx " SPRG1 " TARGET_FMT_lx
> -                 "  SPRG2 " TARGET_FMT_lx "  SPRG3 " TARGET_FMT_lx "\n",
> -                 env->spr[SPR_SPRG0], env->spr[SPR_SPRG1],
> -                 env->spr[SPR_SPRG2], env->spr[SPR_SPRG3]);
> -
> -    qemu_fprintf(f, "SPRG4 " TARGET_FMT_lx " SPRG5 " TARGET_FMT_lx
> -                 "  SPRG6 " TARGET_FMT_lx "  SPRG7 " TARGET_FMT_lx "\n",
> -                 env->spr[SPR_SPRG4], env->spr[SPR_SPRG5],
> -                 env->spr[SPR_SPRG6], env->spr[SPR_SPRG7]);
> -
> -#if defined(TARGET_PPC64)
> -    if (env->excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> -        env->excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> -        env->excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> -        env->excp_model =3D=3D POWERPC_EXCP_POWER10)  {
> -        qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
> -    }
> -#endif
> -    if (env->excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        qemu_fprintf(f, "CSRR0 " TARGET_FMT_lx " CSRR1 " TARGET_FMT_lx
> -                     " MCSRR0 " TARGET_FMT_lx " MCSRR1 " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1=
],
> -                     env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSR=
R1]);
> -
> -        qemu_fprintf(f, "  TCR " TARGET_FMT_lx "   TSR " TARGET_FMT_lx
> -                     "    ESR " TARGET_FMT_lx "   DEAR " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_TCR], env->spr[SPR_BOOKE_TSR],
> -                     env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_DEAR]);
> -
> -        qemu_fprintf(f, "  PIR " TARGET_FMT_lx " DECAR " TARGET_FMT_lx
> -                     "   IVPR " TARGET_FMT_lx "   EPCR " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_PIR], env->spr[SPR_BOOKE_DECAR],
> -                     env->spr[SPR_BOOKE_IVPR], env->spr[SPR_BOOKE_EPCR]);
> -
> -        qemu_fprintf(f, " MCSR " TARGET_FMT_lx " SPRG8 " TARGET_FMT_lx
> -                     "    EPR " TARGET_FMT_lx "\n",
> -                     env->spr[SPR_BOOKE_MCSR], env->spr[SPR_BOOKE_SPRG8],
> -                     env->spr[SPR_BOOKE_EPR]);
> -
> -        /* FSL-specific */
> -        qemu_fprintf(f, " MCAR " TARGET_FMT_lx "  PID1 " TARGET_FMT_lx
> -                     "   PID2 " TARGET_FMT_lx "    SVR " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_Exxx_MCAR], env->spr[SPR_BOOKE_PID1],
> -                     env->spr[SPR_BOOKE_PID2], env->spr[SPR_E500_SVR]);
> -
> -        /*
> -         * IVORs are left out as they are large and do not change often =
--
> -         * they can be read with "p $ivor0", "p $ivor1", etc.
> -         */
> -    }
> -
> -#if defined(TARGET_PPC64)
> -    if (env->flags & POWERPC_FLAG_CFAR) {
> -        qemu_fprintf(f, " CFAR " TARGET_FMT_lx"\n", env->cfar);
> -    }
> -#endif
> -
> -    if (env->spr_cb[SPR_LPCR].name) {
> -        qemu_fprintf(f, " LPCR " TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> -    }
> -
> -    switch (env->mmu_model) {
> -    case POWERPC_MMU_32B:
> -    case POWERPC_MMU_601:
> -    case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
> -#if defined(TARGET_PPC64)
> -    case POWERPC_MMU_64B:
> -    case POWERPC_MMU_2_03:
> -    case POWERPC_MMU_2_06:
> -    case POWERPC_MMU_2_07:
> -    case POWERPC_MMU_3_00:
> -#endif
> -        if (env->spr_cb[SPR_SDR1].name) { /* SDR1 Exists */
> -            qemu_fprintf(f, " SDR1 " TARGET_FMT_lx " ", env->spr[SPR_SDR=
1]);
> -        }
> -        if (env->spr_cb[SPR_PTCR].name) { /* PTCR Exists */
> -            qemu_fprintf(f, " PTCR " TARGET_FMT_lx " ", env->spr[SPR_PTC=
R]);
> -        }
> -        qemu_fprintf(f, "  DAR " TARGET_FMT_lx "  DSISR " TARGET_FMT_lx =
"\n",
> -                     env->spr[SPR_DAR], env->spr[SPR_DSISR]);
> -        break;
> -    case POWERPC_MMU_BOOKE206:
> -        qemu_fprintf(f, " MAS0 " TARGET_FMT_lx "  MAS1 " TARGET_FMT_lx
> -                     "   MAS2 " TARGET_FMT_lx "   MAS3 " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_MAS0], env->spr[SPR_BOOKE_MAS1],
> -                     env->spr[SPR_BOOKE_MAS2], env->spr[SPR_BOOKE_MAS3]);
> -
> -        qemu_fprintf(f, " MAS4 " TARGET_FMT_lx "  MAS6 " TARGET_FMT_lx
> -                     "   MAS7 " TARGET_FMT_lx "    PID " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_MAS4], env->spr[SPR_BOOKE_MAS6],
> -                     env->spr[SPR_BOOKE_MAS7], env->spr[SPR_BOOKE_PID]);
> -
> -        qemu_fprintf(f, "MMUCFG " TARGET_FMT_lx " TLB0CFG " TARGET_FMT_lx
> -                     " TLB1CFG " TARGET_FMT_lx "\n",
> -                     env->spr[SPR_MMUCFG], env->spr[SPR_BOOKE_TLB0CFG],
> -                     env->spr[SPR_BOOKE_TLB1CFG]);
> -        break;
> -    default:
> -        break;
> -    }
> -#endif
> -
> -#undef RGPL
> -#undef RFPL
> -}
> -
>  /***********************************************************************=
******/
>  /* Opcode types */
>  enum {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZpEJtd4G7uM/7QZu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcolsACgkQbDjKyiDZ
s5Lkug/9EAkoE0g/PJggBuLvYdRbx9H4RcLktmIDGUSRCRgx4yk2xXj435zu40Cc
xqdG3sZ3t5zsjq/V+zGi//2xp0TEzashuJyQFViuE48jPjBk7qJy2sVyDiZsk5ER
bjXuSDbhWJhMIeLnAyYUkDe9CIldSIig3umm1FZBXz585GeUvSbD4/2SwtF9lN/L
8ZVV9+21O+32LPMpRaGjxa0ZMIFSkhuIoAA6bq8qU81OUmnvVgg6FJxMAB3hqwvM
y2f01P6ouSw4P2WJjLaS89P3wcRtNfDnikwfFZzk215GwKqzv3oZ+p/MWaTJek4r
4iw8VFoOXWyI4RZehrixiJiT44WB4ydyxHPOFGyb3ZUI9j9ffmMayGlvKisvPe2l
b5IM+4gN/8f1Uz9knVNRVTGF91JrhyTuQjldgyhs5fQwrEHFwCfyF/R8wD6K9t0a
yKkHVN6kuUOOBUx1widUdw5rcMSrqMpAa1kkhbqfVEnhSZRR5TllMz4tMsdw82M1
22R/ZhiV7VxjeDT5mn8BfDvSpCIVlS+WbOkNUMKbCv0UfHOgLksJxzYBld8tYlJn
Fw7A1fJGRV+LJi1iSgNmSo0r3FI1QUaj70jWE4PTNwzB+K7kl5gs2KRR2YMq4xJG
JqSLP1uVwDHcN9e9hBE6yct6H4+7Sc56ahEurcodfXWKCERrmx4=
=LsQN
-----END PGP SIGNATURE-----

--ZpEJtd4G7uM/7QZu--

