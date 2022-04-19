Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC65063E1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 07:29:11 +0200 (CEST)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggQI-0005I6-88
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 01:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nggOc-0004TI-PY
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:27:27 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nggOa-00012O-CN
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:27:26 -0400
Received: by mail-lj1-x234.google.com with SMTP id y11so1592046ljh.5
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jqj1li+MsgmP3jKWAJ5hYiJHXYZPIfDTeD+YqdQSoyE=;
 b=dqtBG6AV4L9QvFYwToI7W7en3zpip5XFVlFvlgrBSIDEPOEUpJReAx007RLDPQyjyy
 vVY16u6FViCfHEFix0vPK8LRxcSg2RR+qRXXHhZ1zahHOSn8t+wOkYWtBljCSlgtB5Nv
 dE7FW1v5zmrDtSS4vefmk3Zbt+ZK7a0kfnnamNNSP5SR/6V5bamqLz0hmozahToHZwpX
 sNQDgNWrw/QrzQG6YkvjKbR/QdIlZbXxksXpTyAEarNouh7e0Du27EYl9OuQdT2IyNwr
 +/pBD/RJFp4FjOHWKf/wNcwiV8RbB618br1aqV0yXkg1nZfKP1RXFPysXBHXsi2mK4S7
 GmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jqj1li+MsgmP3jKWAJ5hYiJHXYZPIfDTeD+YqdQSoyE=;
 b=y4VMu62VG1b/yW8E7DRF36sno2KmuadJUtJWoY8sNq7DmZBb/BGl3UTcBKxX3mExMT
 ggYfd0kBvbcyCtYUOaGrbdl9Q38ckHqHOdTNjQNgb98NPXTszn5TcWEM4JGuKmpO1wwN
 lGHChMaFlDYkXtVE1gHNHQrWdUlPQ+9DCm9Ieca9keP4fLqbqQ8zaZ7/Zce2gD2v/ASH
 BJchLOoW5lfF+j4sC8GAJ9pkAZi55ToSDrSREcfnbEcvQlRbPXgMDF/SDbG6JaOSMndJ
 FOWnY9uOitbIUHHra/BSGYbnBC3AzZPioTIabTgKCeYWXWxEFDqU8RMJbgb1XOyK6GYb
 /Xgw==
X-Gm-Message-State: AOAM533GizyMELFXpLmSsmbM+3rzPX0fY1e9amNzxNNjA8zm89+dXEKL
 F54Kfil/3VBZ9xYBgRF4RR3jucKsnQQ5F3rCV8+EbQ==
X-Google-Smtp-Source: ABdhPJwhHHb3GCpmY+rioiLoGzPH3su2OYBKr1cS5YBxemEeUXe0jR/cnFSBmGfvKzwn585v6Nhyi1fikGpZfIjd8m4=
X-Received: by 2002:a05:651c:1784:b0:24b:ce8:528a with SMTP id
 bn4-20020a05651c178400b0024b0ce8528amr9249431ljb.364.1650346041346; Mon, 18
 Apr 2022 22:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220415093727.15323-1-frank.chang@sifive.com>
 <CAKmqyKP=kgiH05o_h1FS=acz_fsU9QkvAQ-yHa05knrnh9H-Jg@mail.gmail.com>
In-Reply-To: <CAKmqyKP=kgiH05o_h1FS=acz_fsU9QkvAQ-yHa05knrnh9H-Jg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Apr 2022 10:57:09 +0530
Message-ID: <CAK9=C2UF4mR17a2---02==MaSZJLCS1Fnryd2yg_u45T9rm4mg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=apatel@ventanamicro.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 10:52 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Apr 15, 2022 at 7:37 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Allow user to set core's marchid, mvendorid, mipid CSRs through
> > -cpu command line option.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  target/riscv/cpu.c |  4 ++++
> >  target/riscv/cpu.h |  4 ++++
> >  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
> >  3 files changed, 42 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ddda4906ff..2eea0f9be7 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -786,6 +786,10 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> >
> > +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> > +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, 0),
> > +    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, 0),
>
> Should we have non-zero defaults here?

To do that, we need mvendorid for QEMU RISC-V.

The marchid and mipid can be based on the QEMU version number.

Regards,
Anup

>
> Alistair
>
> > +
> >      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index c069fe85fa..3ab92deb4b 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -370,6 +370,10 @@ struct RISCVCPUConfig {
> >      bool ext_zve32f;
> >      bool ext_zve64f;
> >
> > +    uint32_t mvendorid;
> > +    uint64_t marchid;
> > +    uint64_t mipid;
> > +
> >      /* Vendor-specific custom extensions */
> >      bool ext_XVentanaCondOps;
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 341c2e6f23..9a02038adb 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -603,6 +603,36 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
> > +                                     target_ulong *val)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    *val = cpu->cfg.mvendorid;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_marchid(CPURISCVState *env, int csrno,
> > +                                   target_ulong *val)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    *val = cpu->cfg.marchid;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_mipid(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    *val = cpu->cfg.mipid;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException read_mhartid(CPURISCVState *env, int csrno,
> >                                     target_ulong *val)
> >  {
> > @@ -3098,10 +3128,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> >
> >      /* Machine Information Registers */
> > -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> > -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> > -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> > -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> > +    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> > +    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
> > +    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
> > +    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
> >
> >      /* Machine Trap Setup */
> >      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
> > --
> > 2.35.1
> >
> >
>

