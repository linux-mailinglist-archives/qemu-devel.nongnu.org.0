Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B6F541F7D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:30:55 +0200 (CEST)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyif0-0008B1-NH
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nyiV4-0004Wc-Di
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:20:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nyiV2-0007hp-7V
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:20:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id j7so16987935pjn.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQ0rPehSIl/PBwJNGYHoHle9Lo+SzJ5moSGb9M9dufo=;
 b=DpFXI5euaEwGKT4T7dZBrjjKMWP+lyGLtd2cU+dKpYJIMeP1SjhD7OW0w0dD8aQn+l
 IEgSv8asaHP7Y+WnoS8XGuKFaOLziNC98j9JqcGRbIqM2r319wmxWaobxJOqyS+htOil
 JLSRnstjcwVMOCUB0yB2rKN0pPC+xKCkp3DZSt0pNtdIfGqKO8svLml9CKe2Uq0WYviM
 09Z5gq1OgC89+J+d18dOkQWB12oWoBzZq4lVIy+/VUmtpam8WgoN5qJs0zaN3Hdo7GvT
 MpqtB8n5kE7hYCQbdlhNky+zpkN5UmFof7VykLMNJGL3w5wQdi7/3RNEPwDlmyotw6V2
 N3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQ0rPehSIl/PBwJNGYHoHle9Lo+SzJ5moSGb9M9dufo=;
 b=vlBffbseMU6FVG7xsi/IBCwCXzsJKM4LWTDczuClypGBbCyecxdX8eJ+KTDbH+6kcn
 U2FkRQ6uZ3FXeWfzfUDA5b3/bXXEf0xRES3EqO91OMd6unWUZTCRPLKDnQpYnFTzu7uJ
 vzfqia0/C8Smca5ycg6WaJ50vkQyNPRG/S0dFgjoQINGeEkrRJVWlVZYCwa/Q45ew+NC
 JOSKBx95XNntLaF+l8ZUoeyWU1SzdW44ktKhVQyUz9sTQTTAokVHnfQ0jN6Ua2stcTK5
 582AdT1eG0G2e2khIRrhZeC0FxsdFmYEaCRa8xBgEJeVFHU6dcBLWZ9qUKKQWnPn8TkR
 q1Iw==
X-Gm-Message-State: AOAM531x/qA2QvzBZJQR7qARu6PrSocWVScszzrPWebjz+QPEepeDN/U
 OeTz8VOBOi3Do9/je8EbrW1UNCQyI1Gol99yuKjcCA==
X-Google-Smtp-Source: ABdhPJx4mbFRMkbv6j2Voa8QnRFtem+nX4QW+2nzSDulHm+R/Sp3pq4Tmu01OMQ5SE3z4JTBtkFKIV9vRMBRkmRq4t4=
X-Received: by 2002:a17:903:187:b0:166:4360:a4fa with SMTP id
 z7-20020a170903018700b001664360a4famr29171754plg.87.1654644034722; Tue, 07
 Jun 2022 16:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220524203647.31435-1-daolu@rivosinc.com>
 <20220524203647.31435-2-daolu@rivosinc.com>
 <CAKh7v-Se705qE16UgV92UsrfhkcJCUtKByOt6Hs80MhV1Wh88w@mail.gmail.com>
 <CAKmqyKPHjHR0xsJq6-A3b28LZuRCWNT8UyMKqgmnST4mJF7fWA@mail.gmail.com>
In-Reply-To: <CAKmqyKPHjHR0xsJq6-A3b28LZuRCWNT8UyMKqgmnST4mJF7fWA@mail.gmail.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Tue, 7 Jun 2022 16:20:23 -0700
Message-ID: <CAKh7v-S4n=pP53Bzo1=4Jg6wSn3wSjQdxkpWLDa9368jOF0g8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: Add Zihintpause support
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

Thanks for the response. I don't think I can find any comments
on this patch though, could you help point me to them?

Thanks,
Dao

On Tue, Jun 7, 2022 at 4:04 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 8:59 AM Dao Lu <daolu@rivosinc.com> wrote:
> >
> > Ping
>
> The latest version of this patch on the mailing list has comments that
> need to be addressed
>
> Alistair
>
> >
> > On Tue, May 24, 2022 at 1:36 PM Dao Lu <daolu@rivosinc.com> wrote:
> > >
> > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > > ---
> > >  target/riscv/cpu.c                      |  2 ++
> > >  target/riscv/cpu.h                      |  1 +
> > >  target/riscv/insn32.decode              |  7 ++++++-
> > >  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
> > >  4 files changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index ccacdee215..183fb37fdf 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
> > >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > > +    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
> > >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> > >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> > >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > > @@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> > >       *    extensions by an underscore.
> > >       */
> > >      struct isa_ext_data isa_edata_arr[] = {
> > > +        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
> > >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> > >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> > >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index fe6c9a2c92..e466a04a59 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -394,6 +394,7 @@ struct RISCVCPUConfig {
> > >      bool ext_counters;
> > >      bool ext_ifencei;
> > >      bool ext_icsr;
> > > +    bool ext_zihintpause;
> > >      bool ext_svinval;
> > >      bool ext_svnapot;
> > >      bool ext_svpbmt;
> > > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > > index 4033565393..595fdcdad8 100644
> > > --- a/target/riscv/insn32.decode
> > > +++ b/target/riscv/insn32.decode
> > > @@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
> > >  sra      0100000 .....    ..... 101 ..... 0110011 @r
> > >  or       0000000 .....    ..... 110 ..... 0110011 @r
> > >  and      0000000 .....    ..... 111 ..... 0110011 @r
> > > -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> > > +
> > > +{
> > > +  pause  0000 0001   0000   00000 000 00000 0001111
> > > +  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
> > > +}
> > > +
> > >  fence_i  ---- ----   ----   ----- 001 ----- 0001111
> > >  csrrw    ............     ..... 001 ..... 1110011 @csr
> > >  csrrs    ............     ..... 010 ..... 1110011 @csr
> > > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> > > index f1342f30f8..ca75e05f4b 100644
> > > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > > @@ -796,6 +796,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
> > >      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
> > >  }
> > >
> > > +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> > > +{
> > > +    if (!ctx->cfg_ptr->ext_zihintpause) {
> > > +        return false;
> > > +    }
> > > +
> > > +    /*
> > > +     * PAUSE is a no-op in QEMU,
> > > +     * however we need to clear the reservation,
> > > +     * end the TB and return to main loop
> > > +     */
> > > +    tcg_gen_movi_tl(load_res, -1);
> > > +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> > > +    tcg_gen_exit_tb(NULL, 0);
> > > +    ctx->base.is_jmp = DISAS_NORETURN;
> > > +
> > > +    return true;
> > > +}
> > >
> > >  static bool trans_fence(DisasContext *ctx, arg_fence *a)
> > >  {
> > > --
> > > 2.30.1 (Apple Git-130)
> > >
> >

