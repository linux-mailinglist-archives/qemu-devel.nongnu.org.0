Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28E52E992
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:04:26 +0200 (CEST)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrzUf-0006j2-97
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nrzQl-0005CD-Eu
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:00:24 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:44925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nrzQX-0003IB-RA
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:00:19 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f18e6ff0f6so9715608fac.11
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vs3++WtH18GKrwuwc8mzWvZ5D1n21lilUyyQG42j/z0=;
 b=VrudwDIZbOOpfDwCOBUBWyEhqMo2IszYSLT8je/AdyWAKPgQKWvb61g3h4xdo9KCRp
 H7zdtWrqENM/JYoJ0WArB74CExA3OUzk9fNKobpjMzfcR4uLx5PmVlijck5hJrco8CAZ
 0vdE96mam6iH76M8hTQrmv9LFyrBCSgGujLdfhA/mPqXwmf1RtnsWGh1NyfGrIOelwUT
 letqpY2YzLTcBKJjH5QnFnW3giR/ojq7dXAZpGUteKDW4Ik1zJZbVD1wdbso0gxmOykZ
 KNHM9EA6ZfSplQpHlUWZeTIoH8cdKnk/y3iV4LI6XDbYERHZQe1qH2u9HDsJSAq1aMO2
 FQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vs3++WtH18GKrwuwc8mzWvZ5D1n21lilUyyQG42j/z0=;
 b=3+htU4tfY0JViXe6niSQJvBcE0K/M+ROhi7bofEi5CeS70rFsOS4M/Ol/pslqgTtDh
 O8qADt5eJTO97GEPMdPbmpqjuIWUqQYgKeYDe1wmcMegbVWCAw+ks4D8OCBCyMuu/dcv
 0e7D3xC+Kljc5yRb+hfDcsYzgDMzJBHGsJqsq8dlkl50A78wWjmUCwI4jhoVZCobVr8T
 7mozC8virpMZReUYoGEyS4ERUe9HzytGgwpAXvpMJOK62Tki9qI3IDVrjP4pFhaLQSz+
 jOqb97NHsXEvLWW7Ewt9pVAOdrgKBBCx+dFuDPIWG/sQspQSenoTicfguIrmmrmw3RNt
 wRVw==
X-Gm-Message-State: AOAM530WQO6K6zd0kwye6YZPJ2EKjkBNzUapMdjLPNmwPybv+qwxDsp0
 9jogCSEL65CvY287JwkYtE9kTl69cwLHsiVMKXc=
X-Google-Smtp-Source: ABdhPJxM6xQ6A6WshUp3dPR6IK967APFt3hoWRrdWs9vdY06QjrYHwViO6Q0S7Q1HxyTp5EdljRofWStkjyaNcPAprc=
X-Received: by 2002:a05:6870:538e:b0:e6:7957:31ab with SMTP id
 h14-20020a056870538e00b000e6795731abmr5459766oan.89.1653040798697; Fri, 20
 May 2022 02:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220520083911.401134-1-itaru.kitayama@fujitsu.com>
 <CAFEAcA9q-JePE-9sMvo3jeu7s8r93xHDAfP36DqU069y3Fp3-w@mail.gmail.com>
In-Reply-To: <CAFEAcA9q-JePE-9sMvo3jeu7s8r93xHDAfP36DqU069y3Fp3-w@mail.gmail.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 20 May 2022 18:59:47 +0900
Message-ID: <CANW9uyt989bOPXYhzQmOq6xbw_Lvp390YJ1i_9_hno72ZphkXg@mail.gmail.com>
Subject: Re: [PATCH] Add A64FX CPU support to the sbsa-ref board.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@fujitsu.com>,
 Leif Lindholm <leif@nuviainc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009b0de905df6e8d00"
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009b0de905df6e8d00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Doesn=E2=80=99t =E2=80=98max=E2=80=99 support being there mean we are suppo=
sed to support various
types of CPUs on the SBSA board?

On Fri, May 20, 2022 at 18:00 Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 20 May 2022 at 09:46, Itaru Kitayama <itaru.kitayama@gmail.com>
> wrote:
> >
> > In target/arm/cpu64.c, CPU init function for A64FX is there, add this
> > CPU to the sbsa-ref board.
>
> (cc'ing the sbsa-ref maintainers)
>
> This isn't an objection, but I would like to know what the
> sbsa-ref maintainers' view is on what CPUs the board type
> is supposed to handle. Is this like the virt board, where we
> add basically any CPU type that might possibly work? Or is
> it more like a piece of 'real' hardware, where there are only
> one or two CPU types that that hardware might have shipped with,
> and the firmware/software stack might not be built to cope with
> anything more ?
>
> If we can answer the general question, then specific
> patches like this one will be easy to review.
>
> > Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> > ---
> >  hw/arm/sbsa-ref.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index 4bb444684f..a7d27b2e55 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -146,6 +146,7 @@ static const char * const valid_cpus[] =3D {
> >      ARM_CPU_TYPE_NAME("cortex-a57"),
> >      ARM_CPU_TYPE_NAME("cortex-a72"),
> >      ARM_CPU_TYPE_NAME("cortex-a76"),
> > +    ARM_CPU_TYPE_NAME("a64fx"),
> >      ARM_CPU_TYPE_NAME("neoverse-n1"),
> >      ARM_CPU_TYPE_NAME("max"),
> >  };
> > --
> > 2.25.1
>
> thanks
> -- PMM
>

--0000000000009b0de905df6e8d00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Doesn=E2=80=99t =E2=80=98max=E2=80=99 support being there=
 mean we are supposed to support various types of CPUs on the SBSA board?</=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, May 20, 2022 at 18:00 Peter Maydell &lt;<a href=3D"mailto:peter.=
maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Fri, 20 May 2022 at 09:46, Itaru Kitayama &lt;<=
a href=3D"mailto:itaru.kitayama@gmail.com" target=3D"_blank">itaru.kitayama=
@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; In target/arm/cpu64.c, CPU init function for A64FX is there, add this<=
br>
&gt; CPU to the sbsa-ref board.<br>
<br>
(cc&#39;ing the sbsa-ref maintainers)<br>
<br>
This isn&#39;t an objection, but I would like to know what the<br>
sbsa-ref maintainers&#39; view is on what CPUs the board type<br>
is supposed to handle. Is this like the virt board, where we<br>
add basically any CPU type that might possibly work? Or is<br>
it more like a piece of &#39;real&#39; hardware, where there are only<br>
one or two CPU types that that hardware might have shipped with,<br>
and the firmware/software stack might not be built to cope with<br>
anything more ?<br>
<br>
If we can answer the general question, then specific<br>
patches like this one will be easy to review.<br>
<br>
&gt; Signed-off-by: Itaru Kitayama &lt;<a href=3D"mailto:itaru.kitayama@fuj=
itsu.com" target=3D"_blank">itaru.kitayama@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/sbsa-ref.c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c<br>
&gt; index 4bb444684f..a7d27b2e55 100644<br>
&gt; --- a/hw/arm/sbsa-ref.c<br>
&gt; +++ b/hw/arm/sbsa-ref.c<br>
&gt; @@ -146,6 +146,7 @@ static const char * const valid_cpus[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a57&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a72&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;cortex-a76&quot;),<br>
&gt; +=C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;a64fx&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;neoverse-n1&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARM_CPU_TYPE_NAME(&quot;max&quot;),<br>
&gt;=C2=A0 };<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000009b0de905df6e8d00--

