Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476746810BA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:06:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUmZ-00052c-8d; Mon, 30 Jan 2023 09:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMUmW-0004y8-BD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:05:12 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMUmT-00076F-59
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:05:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q10so11165710wrm.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PgxtUkirHOSDeQ7nLzIG+x7GkRuVbmgNhbYidEWdeE=;
 b=cphNATrgDIKTRZNhUQWFXaT6Kw6Lz2HfEtGRxyPbkvKTJSS30MgYLEy3OUzS8Nv25U
 wUySjSgWpsmOe4V8xzoLBjcvtRmrfrvXt3vYajpJ8ea4jc7qmDAtaQN1sto2eTBmX3Yd
 YrwxiVdd0pHR7Jj6U11XUGRS6dlZSVCwmRRWu0qCFapYLOv9W6ltwGnX+BOBTJ2awEB+
 5GQI41cfjFBhmuryoxhi+e1vjwNLgtKpYfQsjI616ntKw+pActQ6nA7/45Fn3+W2aK4r
 l22a73dGCisFwOdAqfzJthvjZMVQTB70zgUPmThoLhcG9zQkJRukQB9P2EZVQnJNc1dr
 vV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PgxtUkirHOSDeQ7nLzIG+x7GkRuVbmgNhbYidEWdeE=;
 b=6v13uidxlWj8p0UMxt7mwFaEFjIw+mE1fahYlvXOwhtFbsXXHE4v8WDmKkRm6EKBm3
 Jz0BeG4iSpN7fIaZgY10ROpbX+Uu1Lc2RzjrsKhGUdrQdFgtIj09gWfgP2zOFbpuOcsd
 Sbv25DSjO95q+kzFFgPHX2uxLkvQWM1mPsxEbiTCWZn7I4B0b51jFNvKR0OKvc/LirY/
 MFYWdiXWtq+UMJFBvAHItPk5du6Ke4kY1KHuSvRHa/U3zs0IXe0/9fM8YC7BkjuoluW/
 2JRMfiUNA32WwzxyiscrDGnk4oEhrQuL1ouSC31ftVi15+8BdCUC5QDG1iGr5191a6wY
 3Xgw==
X-Gm-Message-State: AFqh2kpbOPtt4tKLnfqyZo0Fbogrk0SPF+xqxRawZE5x6ho508ueF+z2
 PVRPoXoGh+FMYEQldidtE8/+q+ZslFSwOlIkx3XR5w==
X-Google-Smtp-Source: AMrXdXtl4NZ7Upi++alUzuhwI+QAZ6YAAi2YOmV6XRoCoMsCE8Zo9EEDffMmYuLO8CJDPM+wqLvJgBj+wtixKB//+8k=
X-Received: by 2002:a5d:58c2:0:b0:2be:1672:7490 with SMTP id
 o2-20020a5d58c2000000b002be16727490mr1290226wrf.189.1675087504702; Mon, 30
 Jan 2023 06:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-2-christoph.muellner@vrull.eu>
 <CAKmqyKOXM2poHz5c1CbddvUBC-wQxQE3o_bm7bqrn+XTkqASrg@mail.gmail.com>
 <CAEg0e7jmWzOcTNOyKoBD19fsge_aCzfgizEg0WSto-a5SgzNeA@mail.gmail.com>
 <CAEg0e7jQM+bFHQ4ZxRUs+RHuiSJ4==TpEVcJvyFxDFcXGAqPrg@mail.gmail.com>
 <CAKmqyKM3UqLziLgZN+UiKYiQw_bGY3eP4U4vyOEgSztCP5Ja9w@mail.gmail.com>
In-Reply-To: <CAKmqyKM3UqLziLgZN+UiKYiQw_bGY3eP4U4vyOEgSztCP5Ja9w@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 30 Jan 2023 15:04:52 +0100
Message-ID: <CAEg0e7jjzpDv-iNC1bY98hbzUE=vjd0ES+jkYEXB83BxsUcyrg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] RISC-V: Adding XTheadCmo ISA extension
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Jan 29, 2023 at 11:40 PM Alistair Francis <alistair23@gmail.com> wr=
ote:
>
> On Wed, Jan 25, 2023 at 5:51 AM Christoph M=C3=BCllner
> <christoph.muellner@vrull.eu> wrote:
> >
> >
> >
> > On Tue, Jan 24, 2023 at 6:31 PM Christoph M=C3=BCllner <christoph.muell=
ner@vrull.eu> wrote:
> >>
> >>
> >>
> >> On Mon, Jan 23, 2023 at 11:50 PM Alistair Francis <alistair23@gmail.co=
m> wrote:
> >>>
> >>> On Sat, Dec 24, 2022 at 4:09 AM Christoph Muellner
> >>> <christoph.muellner@vrull.eu> wrote:
> >>> >
> >>> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >>> >
> >>> > This patch adds support for the XTheadCmo ISA extension.
> >>> > To avoid interfering with standard extensions, decoder and translat=
ion
> >>> > are in its own xthead* specific files.
> >>> > Future patches should be able to easily add additional T-Head exten=
sion.
> >>> >
> >>> > The implementation does not have much functionality (besides accept=
ing
> >>> > the instructions and not qualifying them as illegal instructions if
> >>> > the hart executes in the required privilege level for the instructi=
on),
> >>> > as QEMU does not model CPU caches and instructions are documented
> >>> > to not raise any exceptions.
> >>> >
> >>> > Changes in v2:
> >>> > - Add ISA_EXT_DATA_ENTRY()
> >>> > - Explicit test for PRV_U
> >>> > - Encapsule access to env-priv in inline function
> >>> > - Use single decoder for XThead extensions
> >>> >
> >>> > Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> >>> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >>> > ---
> >>> >  target/riscv/cpu.c                         |  2 +
> >>> >  target/riscv/cpu.h                         |  1 +
> >>> >  target/riscv/insn_trans/trans_xthead.c.inc | 89 ++++++++++++++++++=
++++
> >>> >  target/riscv/meson.build                   |  1 +
> >>> >  target/riscv/translate.c                   | 15 +++-
> >>> >  target/riscv/xthead.decode                 | 38 +++++++++
> >>> >  6 files changed, 143 insertions(+), 3 deletions(-)
> >>> >  create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
> >>> >  create mode 100644 target/riscv/xthead.decode
> >>> >
> >>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >>> > index 6fe176e483..a90b82c5c5 100644
> >>> > --- a/target/riscv/cpu.c
> >>> > +++ b/target/riscv/cpu.c
> >>> > @@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[=
] =3D {
> >>> >      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svi=
nval),
> >>> >      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svn=
apot),
> >>> >      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpb=
mt),
> >>> > +    ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_x=
theadcmo),
> >>> >      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0,=
 ext_XVentanaCondOps),
> >>> >  };
> >>> >
> >>> > @@ -1060,6 +1061,7 @@ static Property riscv_cpu_extensions[] =3D {
> >>> >      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
> >>> >
> >>> >      /* Vendor-specific custom extensions */
> >>> > +    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, fal=
se),
> >>> >      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentana=
CondOps, false),
> >>> >
> >>> >      /* These are experimental so mark with 'x-' */
> >>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >>> > index 443d15a47c..ad1c19f870 100644
> >>> > --- a/target/riscv/cpu.h
> >>> > +++ b/target/riscv/cpu.h
> >>> > @@ -465,6 +465,7 @@ struct RISCVCPUConfig {
> >>> >      uint64_t mimpid;
> >>> >
> >>> >      /* Vendor-specific custom extensions */
> >>> > +    bool ext_xtheadcmo;
> >>> >      bool ext_XVentanaCondOps;
> >>> >
> >>> >      uint8_t pmu_num;
> >>> > diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/ri=
scv/insn_trans/trans_xthead.c.inc
> >>> > new file mode 100644
> >>> > index 0000000000..00e75c7dca
> >>> > --- /dev/null
> >>> > +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> >>> > @@ -0,0 +1,89 @@
> >>> > +/*
> >>> > + * RISC-V translation routines for the T-Head vendor extensions (x=
thead*).
> >>> > + *
> >>> > + * Copyright (c) 2022 VRULL GmbH.
> >>> > + *
> >>> > + * This program is free software; you can redistribute it and/or m=
odify it
> >>> > + * under the terms and conditions of the GNU General Public Licens=
e,
> >>> > + * version 2 or later, as published by the Free Software Foundatio=
n.
> >>> > + *
> >>> > + * This program is distributed in the hope it will be useful, but =
WITHOUT
> >>> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABIL=
ITY or
> >>> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public L=
icense for
> >>> > + * more details.
> >>> > + *
> >>> > + * You should have received a copy of the GNU General Public Licen=
se along with
> >>> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> >>> > + */
> >>> > +
> >>> > +#define REQUIRE_XTHEADCMO(ctx) do {              \
> >>> > +    if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
> >>> > +        return false;                            \
> >>> > +    }                                            \
> >>> > +} while (0)
> >>> > +
> >>> > +/* XTheadCmo */
> >>> > +
> >>> > +static inline int priv_level(DisasContext *ctx)
> >>> > +{
> >>> > +#ifdef CONFIG_USER_ONLY
> >>> > +    return PRV_U;
> >>> > +#else
> >>> > +     /* Priv level equals mem_idx -- see cpu_mmu_index. */
> >>> > +    return ctx->mem_idx;
> >>>
> >>> This should be ANDed with TB_FLAGS_PRIV_MMU_MASK as sometimes this ca=
n
> >>> include hypervisor priv access information
> >>
> >>
> >> Ok.
> >>
> >>>
> >>>
> >>> > +#endif
> >>> > +}
> >>> > +
> >>> > +#define REQUIRE_PRIV_MHSU(ctx)                                  \
> >>> > +do {                                                            \
> >>> > +    int priv =3D priv_level(ctx);                                 =
\
> >>> > +    if (!(priv =3D=3D PRV_M ||                                    =
  \
> >>> > +          priv =3D=3D PRV_H ||                                    =
  \
> >>>
> >>> PRV_H isn't used
> >>>
> >>> > +          priv =3D=3D PRV_S ||                                    =
  \
> >>> > +          priv =3D=3D PRV_U)) {                                   =
  \
> >>> > +        return false;                                           \
> >>>
> >>> When would this not be the case?
> >>
> >>
> >> Ok, I will make this a macro that expands to nothing (and a comment).
> >>
> >>>
> >>>
> >>> > +    }                                                           \
> >>> > +} while (0)
> >>> > +
> >>> > +#define REQUIRE_PRIV_MHS(ctx)                                   \
> >>> > +do {                                                            \
> >>> > +    int priv =3D priv_level(ctx);                                 =
\
> >>> > +    if (!(priv =3D=3D PRV_M ||                                    =
  \
> >>> > +          priv =3D=3D PRV_H ||                                    =
  \
> >>>
> >>> Also not used
> >>
> >>
> >> Ok, I will remove the PRV_H.
> >>
> >>>
> >>>
> >>> > +          priv =3D=3D PRV_S)) {                                   =
  \
> >>> > +        return false;                                           \
> >>> > +    }                                                           \
> >>> > +} while (0)
> >>> > +
> >>> > +#define NOP_PRIVCHECK(insn, extcheck, privcheck)                \
> >>> > +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn * a) \
> >>> > +{                                                               \
> >>> > +    (void) a;                                                   \
> >>> > +    extcheck(ctx);                                              \
> >>> > +    privcheck(ctx);                                             \
> >>> > +    return true;                                                \
> >>> > +}
> >>> > +
> >>> > +NOP_PRIVCHECK(th_dcache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS=
)
> >>> > +NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
> >>> > +NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU=
)
> >>> > +NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
> >>> > +NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS=
)
> >>> > +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS=
)
> >>> > +
> >>> > +NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS=
)
> >>> > +NOP_PRIVCHECK(th_icache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> >>> > +NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
> >>> > +
> >>> > +NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS=
)
> >>> > +NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MH=
S)
> >>> > +NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS=
)
> >>> > diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> >>> > index ba25164d74..5dee37a242 100644
> >>> > --- a/target/riscv/meson.build
> >>> > +++ b/target/riscv/meson.build
> >>> > @@ -2,6 +2,7 @@
> >>> >  gen =3D [
> >>> >    decodetree.process('insn16.decode', extra_args: ['--static-decod=
e=3Ddecode_insn16', '--insnwidth=3D16']),
> >>> >    decodetree.process('insn32.decode', extra_args: '--static-decode=
=3Ddecode_insn32'),
> >>> > +  decodetree.process('xthead.decode', extra_args: '--static-decode=
=3Ddecode_xthead'),
> >>> >    decodetree.process('XVentanaCondOps.decode', extra_args: '--stat=
ic-decode=3Ddecode_XVentanaCodeOps'),
> >>> >  ]
> >>> >
> >>> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> >>> > index db123da5ec..14d9116975 100644
> >>> > --- a/target/riscv/translate.c
> >>> > +++ b/target/riscv/translate.c
> >>> > @@ -125,13 +125,18 @@ static bool always_true_p(DisasContext *ctx  =
__attribute__((__unused__)))
> >>> >      return true;
> >>> >  }
> >>> >
> >>> > +static bool has_xthead_p(DisasContext *ctx  __attribute__((__unuse=
d__)))
> >>> > +{
> >>> > +    return ctx->cfg_ptr->ext_xtheadcmo;
> >>> > +}
> >>> > +
> >>> >  #define MATERIALISE_EXT_PREDICATE(ext)  \
> >>> >      static bool has_ ## ext ## _p(DisasContext *ctx)    \
> >>> >      { \
> >>> >          return ctx->cfg_ptr->ext_ ## ext ; \
> >>> >      }
> >>> >
> >>> > -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> >>> > +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
> >>>
> >>> Do we need this change?
> >>
> >>
> >> It is indeed a drive-by cleanup, that is not necessary.
> >> In v1 we were using this macro, therefore it made sense back then.
> >> Will be dropped.
> >>
> >>>
> >>>
> >>> >
> >>> >  #ifdef TARGET_RISCV32
> >>> >  #define get_xl(ctx)    MXL_RV32
> >>> > @@ -732,6 +737,10 @@ static int ex_rvc_shiftri(DisasContext *ctx, i=
nt imm)
> >>> >  /* Include the auto-generated decoder for 32 bit insn */
> >>> >  #include "decode-insn32.c.inc"
> >>> >
> >>> > +/* Include decoders for factored-out extensions */
> >>> > +#include "decode-xthead.c.inc"
> >>> > +#include "decode-XVentanaCondOps.c.inc"
> >>> > +
> >>> >  static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
> >>> >                               void (*func)(TCGv, TCGv, target_long)=
)
> >>> >  {
> >>> > @@ -1033,12 +1042,11 @@ static uint32_t opcode_at(DisasContextBase =
*dcbase, target_ulong pc)
> >>> >  #include "insn_trans/trans_rvk.c.inc"
> >>> >  #include "insn_trans/trans_privileged.c.inc"
> >>> >  #include "insn_trans/trans_svinval.c.inc"
> >>> > +#include "insn_trans/trans_xthead.c.inc"
> >>> >  #include "insn_trans/trans_xventanacondops.c.inc"
> >>> >
> >>> >  /* Include the auto-generated decoder for 16 bit insn */
> >>> >  #include "decode-insn16.c.inc"
> >>> > -/* Include decoders for factored-out extensions */
> >>> > -#include "decode-XVentanaCondOps.c.inc"
> >>>
> >>> Can we not leave these at the bottom?
> >>
> >>
> >> Ok.
> >
> >
> > I got reminded again, why this is like it is:
> > The decoder code needs to be included before the translation functions,
> > because the translation functions use types that are defined in the gen=
erated decoder code.
> > And I wanted to keep all vendor extensions together.
>
> Ah ok, why not keep each extension together instead, like this:
>
> #include "decode-xthead.c.inc"
> #include "insn_trans/trans_xthead.c.inc"
>
> #include "decode-XVentanaCondOps.c.inc"

In v3 I had the decode included below decode-insn32.c.inc.
And the trans_xthead.c.inc was at the end of the trans* includes.
For v4 I will move the decode down to the inclusion of trans_xthead.c.inc.

v4 will be sent out, once we have addressed the review comments from Richar=
d.

Thanks,
Christoph



>
>
> Alistair

