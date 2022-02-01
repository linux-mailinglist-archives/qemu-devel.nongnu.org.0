Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E04A558E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 04:24:11 +0100 (CET)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEjm6-0006ec-0y
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 22:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjkY-0005Z8-67
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:22:34 -0500
Received: from [2607:f8b0:4864:20::d35] (port=36805
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjkV-00073h-U3
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:22:33 -0500
Received: by mail-io1-xd35.google.com with SMTP id h7so19572010iof.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 19:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=epPFIMTBX1Chlg9F6P18wnGVrtcodWoBVQbd6tb3tOk=;
 b=otFiodEKP5o5dNToj3dx2IZfvzHD2XCAKMC9LYt9D8PqTPT/en2pMH7Xg2GcrHUq6w
 PEGkoksxNP2AGtsnUU3Hd2UAHWeSwHkZFE/V7hUUAwSXQubQPQhGvjvvFvpMbTba041O
 XyDz4DB2lZdZ284u4Ebp8p+IV0zUQsBzBDEY8ZUv/To2Ogiw/ISC4s4jmacvlcBCRTrH
 7zv8Z0ga7uzE6t7eAQe4sduBRo/mD3eI8Ymagjf5xTuWQ3BG6wOlWDbtFNJ8LXSXnD4P
 J3HXCsGlUpLoCfIfPAo0SuWVks/4pmWsBYLnk8M5zuURahOzz6GHGCUDOg9HX//jCwMJ
 jE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=epPFIMTBX1Chlg9F6P18wnGVrtcodWoBVQbd6tb3tOk=;
 b=m2h8+22r1kGTV/kJVDMeO/TPUSRaqxlPR3yxslcJzQBPjEC7CmB1m6/NYbd0BpoTBW
 +wBfIy37pPwpcxwLSEirP79aCFoRspAK45j7eovBkltx3fGFlCZhFbNKRESC8ot8J/xP
 Eo9+vit5SBtKWcf6utzrqgFho1nlUQr51TOXobtqM+ZnsqNGfS7Yal+bDMFMHL7KShfh
 O2tbIb3Oj8qQhIKquvCfx3rI9GMWLKy+ebSeEsOkhz+cF12l4Vd8ch5p7c7M5oTLC60s
 PYZ68ewSWAR3kJkhtZtmdVZ2nGHcjqWuRBlz51MOof2hTDQXtpkvtHes/VgC9Ix/wIip
 aJtg==
X-Gm-Message-State: AOAM5314FokgMpP3x8tUuVfskxfIsHpjepZDhmIEtRx8F/LhCGfVEWq/
 EBRDBKjBkFInnmLyTa2VxcAGrW4cr1HUA5FoFDE=
X-Google-Smtp-Source: ABdhPJznCXKuUq4yoB8E/dPqDmLKAK/LQbXgjLv+uHag8584Y+DhgYKZWKM5Q8cGn0ldFZ0RUf9chDZedPHbR2dAdgI=
X-Received: by 2002:a05:6638:1028:: with SMTP id
 n8mr12426894jan.318.1643685750520; 
 Mon, 31 Jan 2022 19:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-7-philipp.tomsich@vrull.eu>
In-Reply-To: <20220131110201.2303275-7-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 13:22:04 +1000
Message-ID: <CAKmqyKPo+fk0piXOoifbCpNvGZahRpKaKPsEqBEOQWQDGg2+Yw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] target/riscv: Add XVentanaCondOps custom extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 9:23 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> This adds the decoder and translation for the XVentanaCondOps custom
> extension (vendor-defined by Ventana Micro Systems), which is
> documented at https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
>
> This commit then also adds a guard-function (has_XVentanaCondOps_p)
> and the decoder function to the table of decoders, enabling the
> support for the XVentanaCondOps extension.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - rename to trans_xventanacondops.c.inc (i.e. with the '.c')
> - (in MATERIALISE_EXT_PREDICATE) don't annotate the predicate function
>   for testing the availability of individual extensions as 'inline'
>   and don't make CPURISCVState* visible to these predicate functions
>
> Changes in v2:
> - Split off decode table into XVentanaCondOps.decode
> - Wire up XVentanaCondOps in the decoder-table
>
>  target/riscv/XVentanaCondOps.decode           | 25 ++++++++++++
>  target/riscv/cpu.c                            |  3 ++
>  target/riscv/cpu.h                            |  3 ++
>  .../insn_trans/trans_xventanacondops.c.inc    | 39 +++++++++++++++++++
>  target/riscv/meson.build                      |  1 +
>  target/riscv/translate.c                      | 12 ++++++
>  6 files changed, 83 insertions(+)
>  create mode 100644 target/riscv/XVentanaCondOps.decode
>  create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc
>
> diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/XVentanaCondOps.decode
> new file mode 100644
> index 0000000000..5aef7c3d72
> --- /dev/null
> +++ b/target/riscv/XVentanaCondOps.decode
> @@ -0,0 +1,25 @@
> +#
> +# RISC-V translation routines for the XVentanaCondOps extension
> +#
> +# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
> +#
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +#
> +# Reference: VTx-family custom instructions
> +#            Custom ISA extensions for Ventana Micro Systems RISC-V cores
> +#            (https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf)
> +
> +# Fields
> +%rs2  20:5
> +%rs1  15:5
> +%rd    7:5
> +
> +# Argument sets
> +&r    rd rs1 rs2  !extern
> +
> +# Formats
> +@r         .......  ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
> +
> +# *** RV64 Custom-3 Extension ***
> +vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> +vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1cb0436187..6df07b8289 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -734,6 +734,9 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>
> +    /* Vendor-specific custom extensions */
> +    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
> +
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1175915c0d..aacc997d56 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -329,6 +329,9 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>
> +    /* Vendor-specific custom extensions */
> +    bool ext_XVentanaCondOps;
> +
>      char *priv_spec;
>      char *user_spec;
>      char *bext_spec;
> diff --git a/target/riscv/insn_trans/trans_xventanacondops.c.inc b/target/riscv/insn_trans/trans_xventanacondops.c.inc
> new file mode 100644
> index 0000000000..b8a5d031b5
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_xventanacondops.c.inc
> @@ -0,0 +1,39 @@
> +/*
> + * RISC-V translation routines for the XVentanaCondOps extension.
> + *
> + * Copyright (c) 2021-2022 VRULL GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)

This should also have a vendor prefix

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
> +{
> +    return gen_condmask(ctx, a, TCG_COND_NE);
> +}
> +
> +static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
> +{
> +    return gen_condmask(ctx, a, TCG_COND_EQ);
> +}
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index a3997ed580..91f0ac32ff 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -4,6 +4,7 @@ dir = meson.current_source_dir()
>  gen = [
>    decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
>    decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
> +  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
>  ]
>
>  riscv_ss = ss.source_set()
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 30b1b68341..eaf5a72c81 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -116,6 +116,14 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
>      return true;
>  }
>
> +#define MATERIALISE_EXT_PREDICATE(ext)  \
> +    static bool has_ ## ext ## _p(DisasContext *ctx)    \
> +    { \
> +        return ctx->cfg_ptr->ext_ ## ext ; \
> +    }
> +
> +MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> +
>  #ifdef TARGET_RISCV32
>  #define get_xl(ctx)    MXL_RV32
>  #elif defined(CONFIG_USER_ONLY)
> @@ -854,9 +862,12 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> +#include "insn_trans/trans_xventanacondops.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
>  #include "decode-insn16.c.inc"
> +/* Include decoders for factored-out extensions */
> +#include "decode-XVentanaCondOps.c.inc"
>
>  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>  {
> @@ -869,6 +880,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>          bool (*decode_func)(DisasContext *, uint32_t);
>      } decoders[] = {
>          { always_true_p,  decode_insn32 },
> +        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
>      };
>
>      /* Check for compressed insn */
> --
> 2.33.1
>
>

