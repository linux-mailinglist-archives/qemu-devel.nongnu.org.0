Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BE6773CE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 02:33:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJlhw-00067R-5u; Sun, 22 Jan 2023 20:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJlhu-00067I-K8
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:33:10 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJlhr-0001fX-PJ
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:33:10 -0500
Received: by mail-ej1-x632.google.com with SMTP id v6so26861685ejg.6
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 17:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUNnVhWMmJnVFJu+MmM5KhWs/KfbLUWUGDM3uefpGi8=;
 b=WbwEriNUBr2PYVDddxNepco38P/QlQu89idpdRa0Z5J7YfWknYtWqGWTm31GERqEmL
 pzP8IRMiKCcGqxOVAO5jVm/VzIOj3tdqAHc+K2kdQrNmKdM+NwNqVUBuQuGVaprWDnui
 i15Knq78TtQ+neESvHh1UHAfPmoOz31HzoXfZJh/SJeOon3PSH4sBtbeMDgOb3w66MFD
 It4sSo5J3Cy7wYUeaFbR6JIiSok1g+5lr85JlFdE+9I/C8sYCDn+IycQsSR3cH4WOwzA
 QEaSFPN8JnCIxBehzQ0DR+Dwrfe560WNpDced99UnNt8PX/ZZGJHMtiUtkWRgk3vpEsH
 3RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUNnVhWMmJnVFJu+MmM5KhWs/KfbLUWUGDM3uefpGi8=;
 b=zyDlERynhsZ6WSWMNzNE+d6/cjNYj1HxFTY/VSJWlAhQdE2a7rJddgkwGRuQGQOxrL
 HGGiwe8ssFBj3W4oFK18xvyi8/noAWWKeA7vSeEfZmqUVV68y4xwWJvnDtAwI2emOPhW
 P2QtoFStrsZCL9Pevm8JeMcszNYdmBdNXdc4GGERWAbyh+0AzbD+XuOS+FlmfGAe1ptW
 WImGRvNR65wHevM/z5c6s4Ffh28QqzRay3IZfYdNSGqESwQoKMFEfcdPxQAQc1fLYhax
 vRpGhPt270ZBKgX17FZ/B/MjE0FHpPsqtatnPQHJrpRsW+U2OM4Q9tFBLBPP8qmbu/dB
 Jgxg==
X-Gm-Message-State: AFqh2kpo6YBPdPhXQXsmyNVHRgJerpVWE+cZcLRGpSz0W01oS1nLCO2w
 vD0b5HGurhMCX+FGPJZ5GAe0VSwR7hbMdPIffczIEw==
X-Google-Smtp-Source: AMrXdXu68eZ7sK4HH184iKlxWFfhoT5RTrEN2YEk5sQTVpipKusSZUy38m4mqf0lzNYGrVjycmAjFUQ0hNLtkx2RwO8=
X-Received: by 2002:a17:906:9bf2:b0:871:ac60:a3cc with SMTP id
 de50-20020a1709069bf200b00871ac60a3ccmr2130891ejc.568.1674437585102; Sun, 22
 Jan 2023 17:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
 <CAKmqyKPeH54jj1kV6EHmeeU8yQ0B3b0r7nDPXf-qAjD6dnXSWQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPeH54jj1kV6EHmeeU8yQ0B3b0r7nDPXf-qAjD6dnXSWQ@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Jan 2023 02:32:54 +0100
Message-ID: <CAAeLtUChUs8wW4kptzGUnPjEWZQQipzgjkph5vGeNwf0dYsvOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: add Zicond as an experimental
 extension
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@sifive.com>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 23 Jan 2023 at 02:28, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Sat, Jan 21, 2023 at 12:36 PM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > This implements the Zicond (conditional integer operations) extension,
> > as of version 1.0-draft-20230120 as an experimental extension in QEMU
> > ("x-zicond").
> >
> > The Zicond extension acts as a building block for branchless sequences
> > including conditional-{arithmetic,logic,select,move}.  Refer to the
> > specification for usage scenarios and application guidance.
> >
> > The following instructions constitute Zicond:
> >   - czero.eqz rd, rs1, rs2  =3D>  rd =3D (rs2 =3D=3D 0) ? 0 : rs1
> >   - czero.nez rd, rs1, rs2  =3D>  rd =3D (rs2 !=3D 0) ? 0 : rs1
> >
> > See
> >   https://github.com/riscv/riscv-zicond/releases/download/v1.0-draft-20=
230120/riscv-zicond_1.0-draft-20230120.pdf
> > for the (current version of the) Zicond specification and usage details=
.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > ---
> >
> > Changes in v2:
> > - gates availability of the instructions through a REQUIRE_ZICOND
> >   macro (these were previously always enabled)
> >
> >  MAINTAINERS                                  |  7 +++
> >  target/riscv/cpu.c                           |  4 ++
> >  target/riscv/cpu.h                           |  1 +
> >  target/riscv/insn32.decode                   |  4 ++
> >  target/riscv/insn_trans/trans_rvzicond.c.inc | 54 ++++++++++++++++++++
> >  target/riscv/translate.c                     |  1 +
> >  6 files changed, 71 insertions(+)
> >  create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 08ad1e5341..ca914c42fa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -295,6 +295,13 @@ F: include/hw/riscv/
> >  F: linux-user/host/riscv32/
> >  F: linux-user/host/riscv64/
> >
> > +RISC-V Zicond extension
> > +M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > +M: Christoph Muellner <christoph.muellner@vrull.eu>
> > +L: qemu-riscv@nongnu.org
> > +S: Supported
> > +F: target/riscv/insn_trans/trans_zicond.c.inc
>
> I don't think we need a maintainers entry for official extensions,
> that seems like it's going to get out of hand very quickly.


I'll drop on v3 =E2=80=94 or feel free to edit it out when merging.
I put this in, as Zicond is unratified and I put it in as a commitment
to handle this until ratified.

Cheers,
Philipp.

>
> > +
> >  RISC-V XVentanaCondOps extension
> >  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >  L: qemu-riscv@nongnu.org
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index cc75ca7667..f214b03e95 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -73,6 +73,7 @@ struct isa_ext_data {
> >  static const struct isa_ext_data isa_edata_arr[] =3D {
> >      ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
> >      ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
> > +    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
> >      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
> >      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifence=
i),
> >      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zih=
intpause),
> > @@ -1080,6 +1081,9 @@ static Property riscv_cpu_extensions[] =3D {
> >      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> >      DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> >
> > +    /* Zicond 1.0-draft-20230120 */
> > +    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> > +
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index f5609b62a2..4b6ff800d3 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -446,6 +446,7 @@ struct RISCVCPUConfig {
> >      bool ext_zkt;
> >      bool ext_ifencei;
> >      bool ext_icsr;
> > +    bool ext_zicond;
> >      bool ext_zihintpause;
> >      bool ext_smstateen;
> >      bool ext_sstc;
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index b7e7613ea2..ca812c2f7a 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 =
@r2
> >  # *** RV32 Zksed Standard Extension ***
> >  sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
> >  sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
> > +
> > +# *** Zicond Standard Extension ***
> > +czero_eqz   0000111 ..... ..... 101 ..... 0110011 @r
> > +czero_nez   0000111 ..... ..... 111 ..... 0110011 @r
> > diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/risc=
v/insn_trans/trans_rvzicond.c.inc
> > new file mode 100644
> > index 0000000000..20e9694a2c
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
> > @@ -0,0 +1,54 @@
> > +/*
> > + * RISC-V translation routines for the XVentanaCondOps extension.
> > + *
> > + * Copyright (c) 2022 VRULL GmbH.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITH=
OUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License a=
long with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#define REQUIRE_ZICOND(ctx) do {                 \
> > +    if (!ctx->cfg_ptr->ext_zicond) {             \
> > +        return false;                            \
> > +    }                                            \
> > +} while (0)
> > +
> > +/* Emits "$rd =3D ($rs2 <cond> $zero) ? $zero : $rs1" */
> > +static inline void gen_czero(TCGv dest, TCGv src1, TCGv src2, TCGCond =
cond)
> > +{
> > +    TCGv zero =3D tcg_constant_tl(0);
> > +    tcg_gen_movcond_tl(cond, dest, src2, zero, zero, src1);
> > +}
> > +
> > +static inline void gen_czero_eqz(TCGv dest, TCGv src1, TCGv src2)
> > +{
> > +    gen_czero(dest, src1, src2, TCG_COND_EQ);
> > +}
> > +
> > +static inline void gen_czero_nez(TCGv dest, TCGv src1, TCGv src2)
> > +{
> > +    gen_czero(dest, src1, src2, TCG_COND_NE);
> > +}
> > +
> > +static bool trans_czero_eqz(DisasContext *ctx, arg_r *a)
> > +{
> > +    REQUIRE_ZICOND(ctx);
> > +
> > +    return gen_logic(ctx, a, gen_czero_eqz);
> > +}
> > +
> > +static bool trans_czero_nez(DisasContext *ctx, arg_r *a)
> > +{
> > +    REQUIRE_ZICOND(ctx);
> > +
> > +    return gen_logic(ctx, a, gen_czero_nez);
> > +}
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index df38db7553..1468748835 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1061,6 +1061,7 @@ static uint32_t opcode_at(DisasContextBase *dcbas=
e, target_ulong pc)
> >  #include "insn_trans/trans_rvv.c.inc"
> >  #include "insn_trans/trans_rvb.c.inc"
> >  #include "insn_trans/trans_rvzawrs.c.inc"
> > +#include "insn_trans/trans_rvzicond.c.inc"
> >  #include "insn_trans/trans_rvzfh.c.inc"
> >  #include "insn_trans/trans_rvk.c.inc"
> >  #include "insn_trans/trans_privileged.c.inc"
> > --
> > 2.34.1
> >
> >

