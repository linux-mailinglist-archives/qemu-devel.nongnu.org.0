Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB45065C2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:26:31 +0200 (CEST)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiFq-0001OM-70
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngguz-00031s-RO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 02:00:53 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nggut-0005wH-4s
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 02:00:49 -0400
Received: by mail-ej1-x62f.google.com with SMTP id g18so30667394ejc.10
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 23:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y1CrMSLkK9ENCU5vY8axEq0ivUQVGLSq6YcLCmoBLB0=;
 b=hJ10ocR0UpQyHkTrOXwAg4I9BK7WIdOmnWCUAemaRKWLeZtpc459yHvB1m+A9Ebttx
 j55lqB7ASA29+QpnR0eRIDj1lYPJsU/BQgYeR1zLQ9xLXfNB8ZLUe36t2sIkamKCb4zU
 dDTTUxXxzFf8VmVpvOhAsLZWsTjxzusFxIY7lKw4HhzbNbMIuYNaoQWFCHEbwkqx8I1n
 cjMtYmbqU4OXALpQgkkLLCFts+svbnv1OtPkOKb7WNfDNY5f4amGOzw0vaOnlGktIpmO
 vqE6PYQYjlw/1qrdOfYy1zuWnuo8ctvfAh3uh8sIJMhDIpEfJR5k2sSmTGrI8fTfXecC
 Il0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y1CrMSLkK9ENCU5vY8axEq0ivUQVGLSq6YcLCmoBLB0=;
 b=XuYdgnnDu2JYZXIi7vmtk/h8HokdMrFRlnJue/T/0szgZ8BhLggOW8toVAFBrgzVjW
 VwQ1UkonHrT/xllGQwCAezfe/I7mfa4ihEQZ8H3cSF59JcoeDp4UbEg61j6unuUPeNOK
 +Di273a6DfQWcxN2VK1zw8PYzMnlFHDmgswW7I8zi0bS5vKM2wHvJ84FhWauZGYvOCg5
 WlAd0q7JOb0YdRJ164A+2f44ELT6+ykwio3IN61hXg2hVtwvFQedcaZGk4H6dPL44gQ9
 D3tVu78E1KMGWCLCV7it4CkV/CoO02jW12v1S1xAwH4Zg3IyBTmjvf7YPGF6/V4lka0N
 I/TA==
X-Gm-Message-State: AOAM531rTm7W/+tOqhCs+UUb3mfXfwsZM/qAArSb6ls5Qqh00fXB8M/U
 TY+KSXrV2ld8ag7WvbwZVeV2hl9Wp8plF3+FtNMN0w==
X-Google-Smtp-Source: ABdhPJyZnBhZFfS9u44iOJ8wt1YXMsxTAjkVYeH0sKjWcB0Atcy5wSGYjYG9UQleNLvCpEyPdYZsUv04VrDmTvuFReI=
X-Received: by 2002:a17:906:7111:b0:6e8:973a:1515 with SMTP id
 x17-20020a170906711100b006e8973a1515mr12207968ejj.308.1650348045207; Mon, 18
 Apr 2022 23:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220415093727.15323-1-frank.chang@sifive.com>
 <CAKmqyKP=kgiH05o_h1FS=acz_fsU9QkvAQ-yHa05knrnh9H-Jg@mail.gmail.com>
 <CAK9=C2UF4mR17a2---02==MaSZJLCS1Fnryd2yg_u45T9rm4mg@mail.gmail.com>
In-Reply-To: <CAK9=C2UF4mR17a2---02==MaSZJLCS1Fnryd2yg_u45T9rm4mg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 19 Apr 2022 14:00:34 +0800
Message-ID: <CAE_xrPiK6uigny61dFOFcUiNN8w3ohOba0Vo26NSyQjOb30PSg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
To: Anup Patel <apatel@ventanamicro.com>
Content-Type: multipart/alternative; boundary="000000000000fd9de205dcfb98f5"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fd9de205dcfb98f5
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 19, 2022 at 1:27 PM Anup Patel <apatel@ventanamicro.com> wrote:

> On Tue, Apr 19, 2022 at 10:52 AM Alistair Francis <alistair23@gmail.com>
> wrote:
> >
> > On Fri, Apr 15, 2022 at 7:37 PM <frank.chang@sifive.com> wrote:
> > >
> > > From: Frank Chang <frank.chang@sifive.com>
> > >
> > > Allow user to set core's marchid, mvendorid, mipid CSRs through
> > > -cpu command line option.
> > >
> > > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > > ---
> > >  target/riscv/cpu.c |  4 ++++
> > >  target/riscv/cpu.h |  4 ++++
> > >  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
> > >  3 files changed, 42 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index ddda4906ff..2eea0f9be7 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -786,6 +786,10 @@ static Property riscv_cpu_properties[] = {
> > >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> > >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> > >
> > > +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> > > +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, 0),
> > > +    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, 0),
> >
> > Should we have non-zero defaults here?
>
> To do that, we need mvendorid for QEMU RISC-V.
>
> The marchid and mipid can be based on the QEMU version number.
>
> Regards,
> Anup
>

The original intention for this patch is to allow users to define
their own $mvendorid, $marchid, and $mipid through the command line
when they initiate QEMU.

If we want to provide the default values for QEMU RISC-V CPU,
just like what Anup said.
We need to define our own mvendorid, which should be a JEDEC manufacturer
ID.
(Perhaps it's fine to just give some random legal JEDEC manufacturer ID
as I don't think we would really want to spend the money on that.)

For $marchid and $mipid,
I agree that it could base on QEMU's version from the QEMU_FULL_VERSION
macro.
(and $marchid should have MSB set to 1 for open-source projects.)

Regards,
Frank Chang


>
> >
> > Alistair
> >
> > > +
> > >      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> > >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> > >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index c069fe85fa..3ab92deb4b 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -370,6 +370,10 @@ struct RISCVCPUConfig {
> > >      bool ext_zve32f;
> > >      bool ext_zve64f;
> > >
> > > +    uint32_t mvendorid;
> > > +    uint64_t marchid;
> > > +    uint64_t mipid;
> > > +
> > >      /* Vendor-specific custom extensions */
> > >      bool ext_XVentanaCondOps;
> > >
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index 341c2e6f23..9a02038adb 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -603,6 +603,36 @@ static RISCVException write_ignore(CPURISCVState
> *env, int csrno,
> > >      return RISCV_EXCP_NONE;
> > >  }
> > >
> > > +static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
> > > +                                     target_ulong *val)
> > > +{
> > > +    CPUState *cs = env_cpu(env);
> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > +
> > > +    *val = cpu->cfg.mvendorid;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException read_marchid(CPURISCVState *env, int csrno,
> > > +                                   target_ulong *val)
> > > +{
> > > +    CPUState *cs = env_cpu(env);
> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > +
> > > +    *val = cpu->cfg.marchid;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException read_mipid(CPURISCVState *env, int csrno,
> > > +                                 target_ulong *val)
> > > +{
> > > +    CPUState *cs = env_cpu(env);
> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > +
> > > +    *val = cpu->cfg.mipid;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > >  static RISCVException read_mhartid(CPURISCVState *env, int csrno,
> > >                                     target_ulong *val)
> > >  {
> > > @@ -3098,10 +3128,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
> {
> > >      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> > >
> > >      /* Machine Information Registers */
> > > -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> > > -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> > > -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> > > -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> > > +    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> > > +    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
> > > +    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
> > > +    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
> > >
> > >      /* Machine Trap Setup */
> > >      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,
>  write_mstatus, NULL,
> > > --
> > > 2.35.1
> > >
> > >
> >
>

--000000000000fd9de205dcfb98f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Apr 19, 2022 at 1:27 PM Anup Pate=
l &lt;<a href=3D"mailto:apatel@ventanamicro.com">apatel@ventanamicro.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Apr 19, 2022 at 10:52 AM Alistair Francis &=
lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gma=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Apr 15, 2022 at 7:37 PM &lt;<a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" t=
arget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Allow user to set core&#39;s marchid, mvendorid, mipid CSRs throu=
gh<br>
&gt; &gt; -cpu command line option.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.com" ta=
rget=3D"_blank">jim.shu@sifive.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 target/riscv/cpu.c |=C2=A0 4 ++++<br>
&gt; &gt;=C2=A0 target/riscv/cpu.h |=C2=A0 4 ++++<br>
&gt; &gt;=C2=A0 target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++-=
---<br>
&gt; &gt;=C2=A0 3 files changed, 42 insertions(+), 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; &gt; index ddda4906ff..2eea0f9be7 100644<br>
&gt; &gt; --- a/target/riscv/cpu.c<br>
&gt; &gt; +++ b/target/riscv/cpu.c<br>
&gt; &gt; @@ -786,6 +786,10 @@ static Property riscv_cpu_properties[] =3D {=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;vlen&quot;, RISCVCPU=
, cfg.vlen, 128),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;elen&quot;, RISCVCPU=
, cfg.elen, 64),<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;mvendorid&quot;, RISCVCPU=
, cfg.mvendorid, 0),<br>
&gt; &gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;marchid&quot;, RISCVCPU, =
cfg.marchid, 0),<br>
&gt; &gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT64(&quot;mipid&quot;, RISCVCPU, cf=
g.mipid, 0),<br>
&gt;<br>
&gt; Should we have non-zero defaults here?<br>
<br>
To do that, we need mvendorid for QEMU RISC-V.<br>
<br>
The marchid and mipid can be based on the QEMU version number.<br>
<br>
Regards,<br>
Anup<br></blockquote><div><br></div><div>The original intention for this pa=
tch is to allow users to define</div><div>their own $mvendorid, $marchid, a=
nd $mipid through the command line</div><div>when they initiate QEMU.</div>=
<div><br></div><div>If we want to provide the default values for QEMU RISC-=
V CPU,</div><div>just like what Anup said.</div><div>We need to define our =
own mvendorid, which should be a JEDEC manufacturer ID.</div><div>(Perhaps =
it&#39;s fine to just give some random legal JEDEC manufacturer ID</div><di=
v>as I don&#39;t think we would really want to spend the money on that.)</d=
iv><div><br></div><div>For $marchid and $mipid,</div><div>I agree that it c=
ould=C2=A0base on QEMU&#39;s version from the QEMU_FULL_VERSION macro.</div=
><div>(and $marchid should have MSB set to 1 for open-source projects.)</di=
v><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Alistair<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svinval&quot;, RISCVCP=
U, cfg.ext_svinval, false),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svnapot&quot;, RISCVCP=
U, cfg.ext_svnapot, false),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;svpbmt&quot;, RISCVCPU=
, cfg.ext_svpbmt, false),<br>
&gt; &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; &gt; index c069fe85fa..3ab92deb4b 100644<br>
&gt; &gt; --- a/target/riscv/cpu.h<br>
&gt; &gt; +++ b/target/riscv/cpu.h<br>
&gt; &gt; @@ -370,6 +370,10 @@ struct RISCVCPUConfig {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zve32f;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool ext_zve64f;<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t mvendorid;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint64_t marchid;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint64_t mipid;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Vendor-specific custom extensions */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool ext_XVentanaCondOps;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; &gt; index 341c2e6f23..9a02038adb 100644<br>
&gt; &gt; --- a/target/riscv/csr.c<br>
&gt; &gt; +++ b/target/riscv/csr.c<br>
&gt; &gt; @@ -603,6 +603,36 @@ static RISCVException write_ignore(CPURISCVS=
tate *env, int csrno,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +static RISCVException read_mvendorid(CPURISCVState *env, int csr=
no,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=
_ulong *val)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 *val =3D cpu-&gt;cfg.mvendorid;<br>
&gt; &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static RISCVException read_marchid(CPURISCVState *env, int csrno=
,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong =
*val)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 *val =3D cpu-&gt;cfg.marchid;<br>
&gt; &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static RISCVException read_mipid(CPURISCVState *env, int csrno,<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<b=
r>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; &gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 *val =3D cpu-&gt;cfg.mipid;<br>
&gt; &gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static RISCVException read_mhartid(CPURISCVState *env, int =
csrno,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ul=
ong *val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; @@ -3098,10 +3128,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SI=
ZE] =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MINSTRETH] =3D { &quot;minstreth&quot;, =
any32, read_instreth },<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Information Registers */<br>
&gt; &gt; -=C2=A0 =C2=A0 [CSR_MVENDORID] =3D { &quot;mvendorid&quot;, any,=
=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt; &gt; -=C2=A0 =C2=A0 [CSR_MARCHID]=C2=A0 =C2=A0=3D { &quot;marchid&quot=
;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt; &gt; -=C2=A0 =C2=A0 [CSR_MIMPID]=C2=A0 =C2=A0 =3D { &quot;mimpid&quot;=
,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_zero=C2=A0 =C2=A0 },<br>
&gt; &gt; -=C2=A0 =C2=A0 [CSR_MHARTID]=C2=A0 =C2=A0=3D { &quot;mhartid&quot=
;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_mhartid },<br>
&gt; &gt; +=C2=A0 =C2=A0 [CSR_MVENDORID] =3D { &quot;mvendorid&quot;, any,=
=C2=A0 =C2=A0read_mvendorid },<br>
&gt; &gt; +=C2=A0 =C2=A0 [CSR_MARCHID]=C2=A0 =C2=A0=3D { &quot;marchid&quot=
;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_marchid=C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 [CSR_MIMPID]=C2=A0 =C2=A0 =3D { &quot;mimpid&quot;=
,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mipid=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 [CSR_MHARTID]=C2=A0 =C2=A0=3D { &quot;mhartid&quot=
;,=C2=A0 =C2=A0any,=C2=A0 =C2=A0read_mhartid=C2=A0 =C2=A0},<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Machine Trap Setup */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 [CSR_MSTATUS]=C2=A0 =C2=A0 =C2=A0=3D { &quot;=
mstatus&quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mstatus,=C2=A0 =C2=A0 =C2=
=A0write_mstatus, NULL,<br>
&gt; &gt; --<br>
&gt; &gt; 2.35.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000fd9de205dcfb98f5--

