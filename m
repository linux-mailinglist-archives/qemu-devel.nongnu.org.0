Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849C598936
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:48:49 +0200 (CEST)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOihM-0006l2-2w
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1oOicD-0003rZ-9Y
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:43:29 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1oOicB-0003fo-KB
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:43:28 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id mn10so1577623qvb.10
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=L0AIQ467awCCNOdWcssDWfB6NvRKipogMOQ4OTXg0Ew=;
 b=Bnom5CzWSctWvJILgYMbIk83h+nw57OTUaZlzXXA2/UTLKQXDay/d5O1d7P0UCsSeC
 O5Zv1lc80PPOYi77nah9lzr9DgF6mKqB5Y8TB6ixHroAHgZDTbQBQxb6a0UoNe2WMpFj
 ejE+uXqrUr+xMl5kB1QNeGxLP1eLhc3B82Y2LwgcRSO/8q4nWnpnppxW5MfPNO+0QPjG
 PiIotuvOByX1aFmFMzsB2EC6ROR8WSHHZT8sT8mhnpyn9B1C3m6+Due3inA7+Cm6va3X
 xlNm1LdrVEuAUBRp2nrShAFvltYizaJnz3w6xoykzP2QZvZT0fadXCvZJw1gd3QegYop
 k8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=L0AIQ467awCCNOdWcssDWfB6NvRKipogMOQ4OTXg0Ew=;
 b=11wjKV8/44H8qu2oxh5ra12fZ3K8GhsbBoBrCB7VaSiNg1FhLZZjNELrm92JxMW6oD
 PmHvri8Va/uIxN0EbGN5W4GJtAAjWVIR7BKYuUwUvV3kFHvcP4aqCQF3uA5wsJHhRCuq
 20SKzxSToXZi6MqpBVCBFkRsYEWPxsc8HhxAmNcBbqMkL9QDaG/ZwgrJ8L1iT9f6rfjL
 kqZxLT0SxIBbeoyWtHugl5Kxl+U+TXUWOzySBZhNDQ/1BSo3CY00uHCfv/1vz1xkXJq8
 Ys6Devf3Z/LDgo7QId8YSIWZFV0iD2U9h9UU6tRe91RAYlm0ncKPlCCIkOiHi2Uir0X0
 IHZA==
X-Gm-Message-State: ACgBeo1weFEjMyoGXGYDZ09GL01nhoSTeh8q20WBsAlcf8m/YbRI1Ogm
 YVqZ6ZSFKobC9DmHZvbhjbJEXlYHinLTssARc/9ngQ==
X-Google-Smtp-Source: AA6agR7z2pNRG0CFpsOSnb8pJNWNOYwRfOyaBEJanbcd/XppMAqklKWNrPxPtTP4PRprIibdB18/YUsfVrDnulVhcig=
X-Received: by 2002:a05:6214:20ed:b0:47e:aa41:1d89 with SMTP id
 13-20020a05621420ed00b0047eaa411d89mr3161466qvk.17.1660841003150; Thu, 18 Aug
 2022 09:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220815213458.733701-1-wuhaotsh@google.com>
 <CAFEAcA_nJzdtuMQtDQN6Fn1dHyTDFA4=qoYDUe1Bpjy8RiQpUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_nJzdtuMQtDQN6Fn1dHyTDFA4=qoYDUe1Bpjy8RiQpUQ@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 18 Aug 2022 09:43:10 -0700
Message-ID: <CAGcCb12Ek-2XH2Lb12udE2fFLAWgbuoWt+M922AeYG0OaRTHVg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add cortex-a35
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Joe Komlodi <komlodi@google.com>
Content-Type: multipart/alternative; boundary="00000000000005df7505e686ae04"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=wuhaotsh@google.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--00000000000005df7505e686ae04
Content-Type: text/plain; charset="UTF-8"

Hi,

This is used by a new series of Nuvoton SoC (NPCM8XX) which contains 4
Cortex A-35 cores.

I'll update the missing fields in a follow-up patch set.

On Thu, Aug 18, 2022 at 7:59 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 15 Aug 2022 at 22:35, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > Add cortex A35 core and enable it for virt board.
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Joe Komlodi <komlodi@google.com>
>
> > +static void aarch64_a35_initfn(Object *obj)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible = "arm,cortex-a35";
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > +
> > +    /* From B2.2 AArch64 identification registers. */
> > +    cpu->midr = 0x410fd042;
>
> The r1p0 TRM is out, so we might as well emulate that: 0x411FD040
>
> A few fields are missing:
>
>  cpu->isar.dbgdidr
>  cpu->isar.dbgdevid
>  cpu->isar.dbgdevid1
>  cpu->isar.reset_pmcr_el0
>  cpu->gic_pribits
>
> (these probably landed after you wrote these patch).
>
> Otherwise looks OK.
>
> Remind me, what did you want the Cortex-A35 in particular for ?
>
> thanks
> -- PMM
>

--00000000000005df7505e686ae04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>This is used by a new series of Nuv=
oton SoC (NPCM8XX) which contains 4 Cortex A-35 cores.</div><div><br></div>=
<div>I&#39;ll update the missing fields in a follow-up patch set.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Aug 18, 2022 at 7:59 AM Peter Maydell &lt;<a href=3D"mailto:peter.mayde=
ll@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Mon, 15 Aug 2022 at 22:35, Hao Wu=
 &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@goog=
le.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add cortex A35 core and enable it for virt board.<br>
&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Joe Komlodi &lt;<a href=3D"mailto:komlodi@google.com" tar=
get=3D"_blank">komlodi@google.com</a>&gt;<br>
<br>
&gt; +static void aarch64_a35_initfn(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;dtb_compatible =3D &quot;arm,cortex-a35&quot;;<=
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
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* From B2.2 AArch64 identification registers. */<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;midr =3D 0x410fd042;<br>
<br>
The r1p0 TRM is out, so we might as well emulate that: 0x411FD040<br>
<br>
A few fields are missing:<br>
<br>
=C2=A0cpu-&gt;isar.dbgdidr<br>
=C2=A0cpu-&gt;isar.dbgdevid<br>
=C2=A0cpu-&gt;isar.dbgdevid1<br>
=C2=A0cpu-&gt;isar.reset_pmcr_el0<br>
=C2=A0cpu-&gt;gic_pribits<br>
<br>
(these probably landed after you wrote these patch).<br>
<br>
Otherwise looks OK.<br>
<br>
Remind me, what did you want the Cortex-A35 in particular for ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000005df7505e686ae04--

