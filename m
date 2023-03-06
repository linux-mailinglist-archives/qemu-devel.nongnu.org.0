Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D06AB5C8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 05:55:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ2r3-0004bJ-7O; Sun, 05 Mar 2023 23:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pZ2r0-0004au-RH
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 23:53:42 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pZ2qy-0006cv-PK
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 23:53:42 -0500
Received: by mail-ua1-x92c.google.com with SMTP id d12so5571453uak.10
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 20:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678078419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0nPRC0shx1JLuDSdKvd8itpNYkZiopFbrWNWv30XNA=;
 b=nNX8ZjoUXdKxgQk0+yjrM9ZVlCl1LI+uZt+dt44GUNaxpH0h1gFBuqhl2a/v4YlMs0
 kg82jw+fesswtwjb3mWbaLM7DBGW2y4Xy8BEOMnB7al3deFEZNOTTTmFsl77tHCxqPXf
 PyuQMsjE1+x9eB9Sfp6ifSMcFoXRoeKK3VObA1UqwkPFRWirINzasIjZ+XK99PG2P7XJ
 hwg575MpI/NzoNWhOA0SX1OT4aWF02PAW+Zth0JaDYUC/FS8BLQ9Yet3O4rwXZlqCvDv
 kHPzoYbcIJODZe+388o1c4GuWGjpO/lF5pMW6JtzrfbKLj+YJHj2P0HOn0+QrhDDz923
 SFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678078419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0nPRC0shx1JLuDSdKvd8itpNYkZiopFbrWNWv30XNA=;
 b=hWof0rUm+i9LRn1a81i20CzxeRpT8+CurL9iHdYHKQDCeu0o9xuVSWfo54syNRpqOB
 VuxolBdgBHbKUW5wBdlqkWfD8432Kla0dmsQGgIgKP9tN3to+/X38hvgMSXteCmJkvIf
 SWRS3yvWr+ZjzyL15Nos0aubqc7eXhMJQIAzhDySTy0V6gPGKYLdr1XGL4BOGtlKMhj0
 ZiYNpdkCK6Zig4M0z4KEZshAOaceVC2QtCIXl+sT82pl/faznjwy0jZm5r6pgBjpm+lL
 pNTWF0dTqKGOg+lp7tJa0ejb5A/2LJb0SeQvGGPbRQVskkf4I21uqEFvgIupz7olNLwY
 bjBA==
X-Gm-Message-State: AO0yUKUllRJpCXki5cp10UJaRTO4IXw31cMTRfsCtpnNUs2iwoz6CUTZ
 uFXLou9O78XZp9nQzDKjCj8O2z5/n/BFJdg+mwA=
X-Google-Smtp-Source: AK7set86bZP4DG8Orsi6KGIcTC2R163k8Ls8r1udy6TM5w+2wzzhp9rqXapBO+GIXzNOhAsRC6IuM0lUkwJ3tvSroEA=
X-Received: by 2002:ab0:5b84:0:b0:68b:8b67:8209 with SMTP id
 y4-20020ab05b84000000b0068b8b678209mr6240376uae.2.1678078419287; Sun, 05 Mar
 2023 20:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20230207143944.1883400-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20230207143944.1883400-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Mar 2023 14:53:12 +1000
Message-ID: <CAKmqyKNRSFDxhw0jJ=DZcpWCJoziAJP4dnVA7csm2=JU7fHtDQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] target/riscv: add Zicond as an experimental
 extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@sifive.com>, 
 Christoph Muellner <christoph.muellner@vrull.eu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 8, 2023 at 12:40=E2=80=AFAM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> This implements the Zicond (conditional integer operations) extension,
> as of version 1.0-draft-20230120 as an experimental extension in QEMU
> ("x-zicond").
>
> The Zicond extension acts as a building block for branchless sequences
> including conditional-{arithmetic,logic,select,move}.  Refer to the
> specification for usage scenarios and application guidance.
>
> The following instructions constitute Zicond:
>   - czero.eqz rd, rs1, rs2  =3D>  rd =3D (rs2 =3D=3D 0) ? 0 : rs1
>   - czero.nez rd, rs1, rs2  =3D>  rd =3D (rs2 !=3D 0) ? 0 : rs1
>
> See
>   https://github.com/riscv/riscv-zicond/releases/download/v1.0-draft-2023=
0120/riscv-zicond_1.0-draft-20230120.pdf
> for the (current version of the) Zicond specification and usage details.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Sorry about this.

It looks like while I was out a different patch implementing this
extension was applied. I think this patch just fell through the cracks
as it was sent before I left and before Palmer took over.

The second patch is still useful though, if you rebase it on the
current master and resend it I can apply it.

Alistair

> ---
>
> Changes in v3:
> - don't add this to MAINTAINERS, as it is an official extension
>
> Changes in v2:
> - gates availability of the instructions through a REQUIRE_ZICOND
>   macro (these were previously always enabled)
>
>  target/riscv/cpu.c                           |  4 ++
>  target/riscv/cpu.h                           |  1 +
>  target/riscv/insn32.decode                   |  4 ++
>  target/riscv/insn_trans/trans_rvzicond.c.inc | 54 ++++++++++++++++++++
>  target/riscv/translate.c                     |  1 +
>  5 files changed, 64 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 14a7027095..98177d8328 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -73,6 +73,7 @@ struct isa_ext_data {
>  static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>      ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei)=
,
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihin=
tpause),
> @@ -1097,6 +1098,9 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>      DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>
> +    /* Zicond 1.0-draft-20230120 */
> +    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bcf0826753..aaf3acb753 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -446,6 +446,7 @@ struct RISCVCPUConfig {
>      bool ext_zkt;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_zicond;
>      bool ext_zihintpause;
>      bool ext_smstateen;
>      bool ext_sstc;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index b7e7613ea2..ca812c2f7a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r=
2
>  # *** RV32 Zksed Standard Extension ***
>  sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
>  sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
> +
> +# *** Zicond Standard Extension ***
> +czero_eqz   0000111 ..... ..... 101 ..... 0110011 @r
> +czero_nez   0000111 ..... ..... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/=
insn_trans/trans_rvzicond.c.inc
> new file mode 100644
> index 0000000000..20e9694a2c
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
> @@ -0,0 +1,54 @@
> +/*
> + * RISC-V translation routines for the XVentanaCondOps extension.
> + *
> + * Copyright (c) 2022 VRULL GmbH.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZICOND(ctx) do {                 \
> +    if (!ctx->cfg_ptr->ext_zicond) {             \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
> +/* Emits "$rd =3D ($rs2 <cond> $zero) ? $zero : $rs1" */
> +static inline void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond co=
nd)
> +{
> +    TCGv zero =3D tcg_constant_tl(0);
> +    tcg_gen_movcond_tl(cond, dest, src2, zero, zero, src1);
> +}
> +
> +static inline void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    gen_czero(dest, src1, src2, TCG_COND_EQ);
> +}
> +
> +static inline void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)
> +{
> +    gen_czero(dest, src1, src2, TCG_COND_NE);
> +}
> +
> +static bool trans_czero_eqz(DisasContext *ctx, arg_r *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    return gen_logic(ctx, a, gen_czero_eqz);
> +}
> +
> +static bool trans_czero_nez(DisasContext *ctx, arg_r *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    return gen_logic(ctx, a, gen_czero_nez);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 01cc30a365..93850938ae 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1076,6 +1076,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzawrs.c.inc"
> +#include "insn_trans/trans_rvzicond.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> --
> 2.34.1
>
>

