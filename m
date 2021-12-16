Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB6476B0B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 08:24:35 +0100 (CET)
Received: from localhost ([::1]:33224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxl7y-0004mt-Ey
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 02:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxl4p-0003kb-1l; Thu, 16 Dec 2021 02:21:22 -0500
Received: from [2607:f8b0:4864:20::b36] (port=33720
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxl4k-0006rh-OL; Thu, 16 Dec 2021 02:21:18 -0500
Received: by mail-yb1-xb36.google.com with SMTP id d10so62305148ybn.0;
 Wed, 15 Dec 2021 23:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Dh5Crm266aQSyOAUnA6rnhNvPpKt3i62trG1VYUbqLA=;
 b=aF6T4cjp4g+oeBLGOqzYH/ytTE4bEi/vWI1iz+wd7RmYzOucyId6kF21TnYizslpf+
 NyUxR6FXQsjr4I7a0wMh2Ow/6B1KrvNNcxLF4I2Hjjq9ayUgpZv+uIY9bO5kFDXBN039
 JM5wKC5pVjSgOiGDvYuexFbCpijDYc0DD2EdVgnDorsUusmOhRhC1Jm8lgrw9JyxDxrz
 Mt2FDwDnDxZuj3tR4UiPqUXiZ0eS1+yy1/GapSRUWk9yns0ay26v/N/UAa5aW19MhRz6
 KZC1k+IA9iK3kg3wlnUP/9lBjc6p4roZTz3Lb5Z92njHXMHiLiStC2rFqUD4d7MAtrMy
 MNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Dh5Crm266aQSyOAUnA6rnhNvPpKt3i62trG1VYUbqLA=;
 b=pCuinlUrrLvuWzco8Iqi9OuxyK+P92mXeoLY+Srd9WFfb5+gADDy3fxN90dDB1QXTu
 6/or7eYLknkegkPHA4ZoOC+ljmmUUvv+3gPrtIMCFA0ra1ofWZlbFfH+e2muNIxPnMAa
 s0Kvy/k6dUy5O15MYdv+9nKFyzvAuAnC+M+e1mc+rQ4VIJfICABiwTcNQenxrjJkpmh2
 lNAc/FT6UnO0rVXrzTvvJLsNSxd6+E8fAG3g8R4FyxpcJouH+4n6cYOcCcV0xTU/tGGB
 o2xyTm7qrF0gSNIY8CPdtiI4MG/6M8SfqolM2KfZ3LOX/BFqBeKfrCVflJ7fxOW7j3Wy
 daMw==
X-Gm-Message-State: AOAM530De1JfDhazxYobEZiOsB8inym2JMSkbORyEdXN/6hGaMN5DwnG
 51vzKvvpx15vb5UuLT1QHCkuLX139BUmzBZEEA+iK9tw7Sc=
X-Google-Smtp-Source: ABdhPJyyLHjnc+eGnO4lypRo+S1Pzo5phA7RdRcVnmnWjCXqne2J6a00SvVkkPr/WgNbiuh7zTA5MKGvJX2o3vjFNtI=
X-Received: by 2002:a25:b285:: with SMTP id k5mr11661220ybj.132.1639639266689; 
 Wed, 15 Dec 2021 23:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20211216064820.61342-1-bslathi19@gmail.com>
 <20211216064820.61342-2-bslathi19@gmail.com>
In-Reply-To: <20211216064820.61342-2-bslathi19@gmail.com>
From: Byron Lathi <bslathi19@gmail.com>
Date: Thu, 16 Dec 2021 01:20:55 -0600
Message-ID: <CAJ_MG7qoMgm__sEw1KL1UwoXdAU67k097g-+sn_oBx=17sm9MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/arm: Implement Cortex-A5
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 Byron Lathi <bslathi19@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000d073305d33e4446"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bslathi19@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--0000000000000d073305d33e4446
Content-Type: text/plain; charset="UTF-8"

..and I've just realized that I left the processor id as C0F instead of C05
again.
I also removed the generic timer as I don't think the A5 has one.

On Thu, Dec 16, 2021 at 12:48 AM Byron Lathi <bslathi19@gmail.com> wrote:

> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 Init functions, using the appropriate values from the technical
> reference manual for the A5.
>
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  target/arm/cpu_tcg.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 13d0e9b195..2b54fb618b 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -304,6 +304,41 @@ static void cortex_a8_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>  }
>
> +static void cortex_a5_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a5";
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr = 0x410fc0f1;
> +    cpu->reset_fpsid = 0x41023051;
> +    cpu->isar.mvfr0 = 0x10110221;
> +    cpu->isar.mvfr1 = 0x11000011;
> +    cpu->ctr = 0x83338003;
> +    cpu->reset_sctlr = 0x00c50078;
> +    cpu->isar.id_pfr0 = 0x00001231;
> +    cpu->isar.id_pfr1 = 0x00000011;
> +    cpu->isar.id_dfr0 = 0x02010444;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00100103;
> +    cpu->isar.id_mmfr1 = 0x40000000;
> +    cpu->isar.id_mmfr2 = 0x01230000;
> +    cpu->isar.id_mmfr3 = 0x00102211;
> +    cpu->isar.id_isar0 = 0x00101111;
> +    cpu->isar.id_isar1 = 0x13112111;
> +    cpu->isar.id_isar2 = 0x21232041;
> +    cpu->isar.id_isar3 = 0x11112131;
> +    cpu->isar.id_isar4 = 0x00011142;
> +    cpu->isar.dbgdidr = 0x1203f001;
> +    cpu->clidr = 0x09200003;
> +    cpu->ccsidr[0] = 0x701fe00a;
> +    cpu->ccsidr[1] = 0x203fe00a;
> +}
> +
>  static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
>      /*
>       * power_control should be set to maximum latency. Again,
> @@ -1019,6 +1054,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>      { .name = "arm1136",     .initfn = arm1136_initfn },
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
> +    { .name = "cortex-a5",  .initfn = cortex_a5_initfn },
>      { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>      { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>      { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> --
> 2.30.2
>
>

--0000000000000d073305d33e4446
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>..and I&#39;ve just realized that I left the processo=
r id as C0F instead of C05 again.</div><div>I also removed the generic time=
r as I don&#39;t think the A5 has one.<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 12:=
48 AM Byron Lathi &lt;<a href=3D"mailto:bslathi19@gmail.com">bslathi19@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Add support for the Cortex-A5. These changes are based off of the A7 a=
nd<br>
A9 Init functions, using the appropriate values from the technical<br>
reference manual for the A5.<br>
<br>
Signed-off-by: Byron Lathi &lt;<a href=3D"mailto:bslathi19@gmail.com" targe=
t=3D"_blank">bslathi19@gmail.com</a>&gt;<br>
---<br>
=C2=A0target/arm/cpu_tcg.c | 36 ++++++++++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 36 insertions(+)<br>
<br>
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c<br>
index 13d0e9b195..2b54fb618b 100644<br>
--- a/target/arm/cpu_tcg.c<br>
+++ b/target/arm/cpu_tcg.c<br>
@@ -304,6 +304,41 @@ static void cortex_a8_initfn(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0define_arm_cp_regs(cpu, cortexa8_cp_reginfo);<br>
=C2=A0}<br>
<br>
+static void cortex_a5_initfn(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);<br>
+<br>
+=C2=A0 =C2=A0 cpu-&gt;dtb_compatible =3D &quot;arm,cortex-a5&quot;;<br>
+=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_V7);<br>
+=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_NEON);<br>
+=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_THUMB2EE);<br>
+=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_DUMMY_C15_REGS);<b=
r>
+=C2=A0 =C2=A0 set_feature(&amp;cpu-&gt;env, ARM_FEATURE_PMU);<br>
+=C2=A0 =C2=A0 cpu-&gt;midr =3D 0x410fc0f1;<br>
+=C2=A0 =C2=A0 cpu-&gt;reset_fpsid =3D 0x41023051;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.mvfr0 =3D 0x10110221;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.mvfr1 =3D 0x11000011;<br>
+=C2=A0 =C2=A0 cpu-&gt;ctr =3D 0x83338003;<br>
+=C2=A0 =C2=A0 cpu-&gt;reset_sctlr =3D 0x00c50078;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_pfr0 =3D 0x00001231;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_pfr1 =3D 0x00000011;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_dfr0 =3D 0x02010444;<br>
+=C2=A0 =C2=A0 cpu-&gt;id_afr0 =3D 0x00000000;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr0 =3D 0x00100103;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr1 =3D 0x40000000;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr2 =3D 0x01230000;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr3 =3D 0x00102211;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_isar0 =3D 0x00101111;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_isar1 =3D 0x13112111;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_isar2 =3D 0x21232041;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_isar3 =3D 0x11112131;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.id_isar4 =3D 0x00011142;<br>
+=C2=A0 =C2=A0 cpu-&gt;isar.dbgdidr =3D 0x1203f001;<br>
+=C2=A0 =C2=A0 cpu-&gt;clidr =3D 0x09200003;<br>
+=C2=A0 =C2=A0 cpu-&gt;ccsidr[0] =3D 0x701fe00a;<br>
+=C2=A0 =C2=A0 cpu-&gt;ccsidr[1] =3D 0x203fe00a;<br>
+}<br>
+<br>
=C2=A0static const ARMCPRegInfo cortexa9_cp_reginfo[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * power_control should be set to maximum latency. Agai=
n,<br>
@@ -1019,6 +1054,7 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;arm1136&quot;,=C2=A0 =C2=A0 =C2=A0.in=
itfn =3D arm1136_initfn },<br>
=C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;arm1176&quot;,=C2=A0 =C2=A0 =C2=A0.in=
itfn =3D arm1176_initfn },<br>
=C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;arm11mpcore&quot;, .initfn =3D arm11m=
pcore_initfn },<br>
+=C2=A0 =C2=A0 { .name =3D &quot;cortex-a5&quot;,=C2=A0 .initfn =3D cortex_=
a5_initfn },<br>
=C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;cortex-a7&quot;,=C2=A0 =C2=A0.initfn =
=3D cortex_a7_initfn },<br>
=C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;cortex-a8&quot;,=C2=A0 =C2=A0.initfn =
=3D cortex_a8_initfn },<br>
=C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;cortex-a9&quot;,=C2=A0 =C2=A0.initfn =
=3D cortex_a9_initfn },<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--0000000000000d073305d33e4446--

