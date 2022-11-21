Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2B632457
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:52:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox7Cg-00065R-42; Mon, 21 Nov 2022 08:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox7Cc-0005yv-W1; Mon, 21 Nov 2022 08:51:15 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox7CQ-0002rk-6R; Mon, 21 Nov 2022 08:51:05 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id k84so13649481ybk.3;
 Mon, 21 Nov 2022 05:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tYSCdZr8jozkIo/OxQP/IKVsczdxUtO8OsrKUB/QLWs=;
 b=XTQaoedc8lvo28t6qC8Fhgp76z2BRR4zaDsP7jz9BDGugMT1SyGL8gx1Il+1s8NyZG
 Hn+upwdqQu5qiX0Asa6yGE1VbLn/QEVIPd3/aik4dQ9qwLAUQQEfuF/XW2B8w1l2emBd
 o0t9vLJaqNdgSFYQohjkwFt9sffHz7IxXGf7ndpJVhSCzM+TFkYqEkt+g8AkSPLoooUS
 5xr6Fq4//L4QMvO1sLfc31PCmPRTnr7NceZURKevuq/ztM2lXBJw5lrmAHSSTDWhry4T
 imXXeAzaNc5j7Arlq85ZRKinJVOmjWNJMQIwe+2HEkfT/S9MwVaI4K60+D1mvH4d/B1g
 +K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tYSCdZr8jozkIo/OxQP/IKVsczdxUtO8OsrKUB/QLWs=;
 b=0teYQswjbRATyAQ5xOq8PBFpw0F6qSgfRbW690jzMD4eVC4be/CWSswCORolQ5kbCA
 fXUjPziKc0keF4+Jpt1nnr00jA+7lN0dFM8V+mthslkRaTf6aiMc5wp1jJB85/5Xez68
 3T18Fay42n/Pb71R+ORK5wBtKQz7i04YEaRI6aunnhJoTGf/7zqDTKyNmZ0cW3v4wqDF
 uscgDghUG3ANFiqNaTLW3tZppd4qURg0TXbRRj/3hWZvJvjeEdcwHnAg3iRNVsGEhXsP
 eRJfQUYVE+Sw7ubBIHcTVZlqY/kEYx1mHD9SYOfHuVdgcLJxRfR6BYsk9nl+SFazagWD
 gOXw==
X-Gm-Message-State: ANoB5plEFbGD8Va1ZdD5OlsauZYedTBG0XYesPC0UIAjfaY1gOfZv9IQ
 /j1SLU5qWXuaOsesr5suivm8FZvZ9Vy4rZ75egtFFrTTAyM=
X-Google-Smtp-Source: AA0mqf7fP6cprYQQb1NnbKTBozsH7uCEv+Cwz54JpsZY8UIKLrHLTkKfP1F65voabsY3eAybSS+4rZ9SkknTkStf9YU=
X-Received: by 2002:a5b:4c3:0:b0:6dc:8f28:163c with SMTP id
 u3-20020a5b04c3000000b006dc8f28163cmr17234808ybp.505.1669038660686; Mon, 21
 Nov 2022 05:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20221110090444.550362-1-tkutergin@gmail.com>
 <CAFEAcA9yitrE0n1b4Q1_=VaZH-RF0bVPUSTihOKhOFCTidARXg@mail.gmail.com>
In-Reply-To: <CAFEAcA9yitrE0n1b4Q1_=VaZH-RF0bVPUSTihOKhOFCTidARXg@mail.gmail.com>
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Mon, 21 Nov 2022 16:50:49 +0300
Message-ID: <CACKEeRN5=fFgnWqZKtRpJ+R334NgF5khFDyj1xdaY2q0c9wq4A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007c969405edfb5875"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=tkutergin@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000007c969405edfb5875
Content-Type: text/plain; charset="UTF-8"

Thank you very much for your comments, I have tried to fix them.
Regarding L3 cache - cortex-a55 may have or not have it. CLIDR register
value shows that this specific instance (dumped from odroid c4) does not
have it.
But if you think that having L3 cache may be useful - it may be added too...

BR
Timofey

On Thu, Nov 17, 2022 at 6:54 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 10 Nov 2022 at 09:04, Timofey Kutergin <tkutergin@gmail.com>
> wrote:
> >
> >   cortex-a55 is one of newer armv8.2+ CPUs supporting native
> >   Privileged Access Never (PAN) feature.
>
> Hi; thanks for this patch. There are a few missing ID register
> values below, but otherwise it looks good.
>
> > Using this CPU
> >   provides access to this feature without using fictious "max"
>
> "fictitious"
>
> >   CPU.
> >
> > Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
> > ---
> >  hw/arm/virt.c      |  1 +
> >  target/arm/cpu64.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index b871350856..fc0c9baba6 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -201,6 +201,7 @@ static const char *valid_cpus[] = {
> >      ARM_CPU_TYPE_NAME("cortex-a15"),
> >      ARM_CPU_TYPE_NAME("cortex-a35"),
> >      ARM_CPU_TYPE_NAME("cortex-a53"),
> > +    ARM_CPU_TYPE_NAME("cortex-a55"),
> >      ARM_CPU_TYPE_NAME("cortex-a57"),
> >      ARM_CPU_TYPE_NAME("cortex-a72"),
> >      ARM_CPU_TYPE_NAME("cortex-a76"),
>
> There's a corresponding list of supported CPUs in
> docs/system/arm/virt.rst that also needs the new CPU type adding.
>
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 3d74f134f5..e1ade1b2a3 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -792,6 +792,60 @@ static void aarch64_a53_initfn(Object *obj)
> >      define_cortex_a72_a57_a53_cp_reginfo(cpu);
> >  }
> >
> > +static void aarch64_a55_initfn(Object *obj)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible = "arm,cortex-a55";
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>
> It's helpful for review to order the ID register values in
> the same layout they are in the TRM, in the "AArch64 registers
> by functional group" table, which is how we've ordered other
> new CPUs we've added recently (eg see the Neoverse N1 or
> the Cortex-A76).
>
> > +    cpu->midr = 0x411fd050;
>
> There's an r2p0 TRM out, so we might as well advertise
> ourselves as r2p0:  0x412FD050
>
> > +    cpu->revidr = 0x00000000;
> > +    cpu->reset_fpsid = 0x41034070;
> > +    cpu->isar.mvfr0 = 0x10110222;
> > +    cpu->isar.mvfr1 = 0x13211111;
> > +    cpu->isar.mvfr2 = 0x00000043;
> > +    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
> > +    cpu->reset_sctlr = 0x00c50838;
>
> Should be 0x30c50838 : bits [29:28] are RES1
>
> > +    cpu->isar.id_pfr0 = 0x10000131;
> > +    cpu->isar.id_pfr1 = 0x00011011;
>
> Forgotten id_pfr2: 0x00000011
>
> > +    cpu->isar.id_dfr0 = 0x04010088;
> > +    cpu->id_afr0 = 0x00000000;
> > +    cpu->isar.id_mmfr0 = 0x10201105;
> > +    cpu->isar.id_mmfr1 = 0x40000000;
> > +    cpu->isar.id_mmfr2 = 0x01260000;
> > +    cpu->isar.id_mmfr3 = 0x02122211;
>
> You've forgotten id_mmfr4 : 0x00021110
>
> > +    cpu->isar.id_isar0 = 0x02101110;
> > +    cpu->isar.id_isar1 = 0x13112111;
> > +    cpu->isar.id_isar2 = 0x21232042;
> > +    cpu->isar.id_isar3 = 0x01112131;
> > +    cpu->isar.id_isar4 = 0x00011142;
> > +    cpu->isar.id_isar5 = 0x01011121;
> > +    cpu->isar.id_isar6 = 0x00000010;
> > +    cpu->isar.id_aa64pfr0 = 0x10112222;
>
> You've missed out id_aa64pfr1 : should be 0x0000000000000010ull
>
> > +    cpu->isar.id_aa64dfr0 = 0x10305408;
> > +    cpu->isar.id_aa64isar0 = 0x10211120;
>
> You've missed out the DP field: this should be
> 0x0000100010211120ull
>
> > +    cpu->isar.id_aa64isar1 = 0x00100001;
> > +    cpu->isar.id_aa64mmfr0 = 0x00101122;
> > +    cpu->isar.id_aa64mmfr1 = 0x10212122;
> > +    cpu->isar.id_aa64mmfr2 = 0x00001011;
> > +    cpu->isar.dbgdidr = 0x3516d000;
> > +    cpu->clidr = 0x82000023;
> > +    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
> > +    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
> > +    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
>
> The A55 TRM says that it has an L3 cache, so I think we
> also need to fill in cpu->ccsidr[4] here (NB not [3], which
> is a reserved index since the L2 is not split I&D).
>
> > +    cpu->dcz_blocksize = 4; /* 64 bytes */
> > +    cpu->gic_num_lrs = 4;
> > +    cpu->gic_vpribits = 5;
> > +    cpu->gic_vprebits = 5;
>
> You need to set gic_pribits also.
>
> Missing reset_pmcr_el0: 0x41453000
>
> The impdef sysregs are different from A53/A57/A72 etc,
> so it's correct that we don't call
> define_cortex_a72_a57_a53_cp_reginfo(). We can add definitions
> of the impdef sysregs later if guest software runs into them
> I guess...
>
> thanks
> -- PMM
>

--0000000000007c969405edfb5875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you very much for your comments, I have tried to fix=
 them.<div>Regarding L3 cache - cortex-a55 may have or not have it. CLIDR r=
egister value shows that this specific instance (dumped from odroid c4) doe=
s not have it.</div><div>But if you think that having L3 cache may be usefu=
l - it may be added too...<br><br>BR</div><div>Timofey</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 17,=
 2022 at 6:54 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.o=
rg">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Thu, 10 Nov 2022 at 09:04, Timofey Kutergin =
&lt;<a href=3D"mailto:tkutergin@gmail.com" target=3D"_blank">tkutergin@gmai=
l.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0cortex-a55 is one of newer armv8.2+ CPUs supporting native=
<br>
&gt;=C2=A0 =C2=A0Privileged Access Never (PAN) feature.<br>
<br>
Hi; thanks for this patch. There are a few missing ID register<br>
values below, but otherwise it looks good.<br>
<br>
&gt; Using this CPU<br>
&gt;=C2=A0 =C2=A0provides access to this feature without using fictious &qu=
ot;max&quot;<br>
<br>
&quot;fictitious&quot;<br>
<br>
&gt;=C2=A0 =C2=A0CPU.<br>
&gt;<br>
&gt; Signed-off-by: Timofey Kutergin &lt;<a href=3D"mailto:tkutergin@gmail.=
com" target=3D"_blank">tkutergin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/virt.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 target/arm/cpu64.c | 55 ++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 56 insertions(+)<br>
&gt;<br>
&gt; diff --git a/hw/arm/virt.c b/hw/arm/virt.c<br>
&gt; index b871350856..fc0c9baba6 100644<br>
&gt; --- a/hw/arm/virt.c<br>
&gt; +++ b/hw/arm/virt.c<br>
&gt; @@ -201,6 +201,7 @@ static const char *valid_cpus[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a15&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a35&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a53&quot;),<br>
&gt; +=C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a55&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a57&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a72&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a76&quot;),<br>
<br>
There&#39;s a corresponding list of supported CPUs in<br>
docs/system/arm/virt.rst that also needs the new CPU type adding.<br>
<br>
&gt; diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c<br>
&gt; index 3d74f134f5..e1ade1b2a3 100644<br>
&gt; --- a/target/arm/cpu64.c<br>
&gt; +++ b/target/arm/cpu64.c<br>
&gt; @@ -792,6 +792,60 @@ static void aarch64_a53_initfn(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 define_cortex_a72_a57_a53_cp_reginfo(cpu);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void aarch64_a55_initfn(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;dtb_compatible =3D &quot;arm,cortex-a55&quot;;<=
br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_V8);<br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_NEON);<br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_GENERIC_TIMER=
);<br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_AARCH64);<br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_CBAR_RO);<br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_EL2);<br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_EL3);<br>
&gt; +=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_PMU);<br>
<br>
It&#39;s helpful for review to order the ID register values in<br>
the same layout they are in the TRM, in the &quot;AArch64 registers<br>
by functional group&quot; table, which is how we&#39;ve ordered other<br>
new CPUs we&#39;ve added recently (eg see the Neoverse N1 or<br>
the Cortex-A76).<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;midr =3D 0x411fd050;<br>
<br>
There&#39;s an r2p0 TRM out, so we might as well advertise<br>
ourselves as r2p0:=C2=A0 0x412FD050<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;revidr =3D 0x00000000;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;reset_fpsid =3D 0x41034070;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.mvfr0 =3D 0x10110222;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.mvfr1 =3D 0x13211111;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.mvfr2 =3D 0x00000043;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;ctr =3D 0x84448004; /* L1Ip =3D VIPT */<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;reset_sctlr =3D 0x00c50838;<br>
<br>
Should be 0x30c50838 : bits [29:28] are RES1<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_pfr0 =3D 0x10000131;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_pfr1 =3D 0x00011011;<br>
<br>
Forgotten id_pfr2: 0x00000011<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_dfr0 =3D 0x04010088;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;id_afr0 =3D 0x00000000;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr0 =3D 0x10201105;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr1 =3D 0x40000000;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr2 =3D 0x01260000;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr3 =3D 0x02122211;<br>
<br>
You&#39;ve forgotten id_mmfr4 : 0x00021110<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_isar0 =3D 0x02101110;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_isar1 =3D 0x13112111;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_isar2 =3D 0x21232042;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_isar3 =3D 0x01112131;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_isar4 =3D 0x00011142;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_isar5 =3D 0x01011121;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_isar6 =3D 0x00000010;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_aa64pfr0 =3D 0x10112222;<br>
<br>
You&#39;ve missed out id_aa64pfr1 : should be 0x0000000000000010ull<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_aa64dfr0 =3D 0x10305408;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_aa64isar0 =3D 0x10211120;<br>
<br>
You&#39;ve missed out the DP field: this should be<br>
0x0000100010211120ull<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_aa64isar1 =3D 0x00100001;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_aa64mmfr0 =3D 0x00101122;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_aa64mmfr1 =3D 0x10212122;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_aa64mmfr2 =3D 0x00001011;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.dbgdidr =3D 0x3516d000;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;clidr =3D 0x82000023;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;ccsidr[0] =3D 0x700fe01a; /* 32KB L1 dcache */<=
br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;ccsidr[1] =3D 0x200fe01a; /* 32KB L1 icache */<=
br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;ccsidr[2] =3D 0x703fe07a; /* 512KB L2 cache */<=
br>
<br>
The A55 TRM says that it has an L3 cache, so I think we<br>
also need to fill in cpu-&gt;ccsidr[4] here (NB not [3], which<br>
is a reserved index since the L2 is not split I&amp;D).<br>
<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;dcz_blocksize =3D 4; /* 64 bytes */<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;gic_num_lrs =3D 4;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;gic_vpribits =3D 5;<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;gic_vprebits =3D 5;<br>
<br>
You need to set gic_pribits also.<br>
<br>
Missing reset_pmcr_el0: 0x41453000<br>
<br>
The impdef sysregs are different from A53/A57/A72 etc,<br>
so it&#39;s correct that we don&#39;t call<br>
define_cortex_a72_a57_a53_cp_reginfo(). We can add definitions<br>
of the impdef sysregs later if guest software runs into them<br>
I guess...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000007c969405edfb5875--

