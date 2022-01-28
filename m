Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627BE49EF24
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 01:09:48 +0100 (CET)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDEpn-0001aR-7S
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 19:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nDEoc-0000EN-Qm; Thu, 27 Jan 2022 19:08:34 -0500
Received: from [2a00:1450:4864:20::52e] (port=38696
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nDEoa-00071W-Th; Thu, 27 Jan 2022 19:08:34 -0500
Received: by mail-ed1-x52e.google.com with SMTP id j23so6242461edp.5;
 Thu, 27 Jan 2022 16:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3rNTEJ7+GburITZ9I7rVXcYjyBHJl3VLpq5RpaH8oQ=;
 b=T5gix9+mac5W6+IhEjXgyM3jnlykLh9q+ErQ2tZRibOMEWdlEqf7aPpITXMxccUpH7
 Qr5HYue4KUZlPt5rgk5TAQFnz1wYp8wegqMKYD+VP9f1XdeAEhxXNxf1YpFZ+ef5/wj4
 gQ5l0W22AGg9uLVMKuQa8hk7x08+Qp2S/r2BliMtAOsbxNZLpf92AqvbOZCQFicsz5Gk
 W4wCUZRn8kBD4OkcXg6g6KpuT/IY9PaaG3jDchyjPNxSkWinNBlbyIgEZ0yUmlUbcmRu
 5lDXWFzBZuxgv/17YPbA9o9ZEZLd/AyiEY2DcyZIvPAj+1LM5wIq8H9JRbuOX1ShboxR
 llvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3rNTEJ7+GburITZ9I7rVXcYjyBHJl3VLpq5RpaH8oQ=;
 b=3rybfaeTxz/n1+mXbDtHq+LSp8jk3MfjXRtK5EKy1LrJG+BAPGPQimB+mPsaNL1Q6P
 3j7EN/IzCS8e3ebjGErs/c4toBlUulxlV55/ek2nc/4Km2SKBdCyrjp6lNGyUUHPuKYL
 4qDb2jFgRU7lBGGZG9acVeXtC5kzon/Kd8rhw5+X3mf4zaP2J8l+juW7vVsWvgKAKP0Z
 A9DzXsrCfESLKYlV5W0FujwRVs2WB/lbGSDmYrhEQJmrcDRfOuuZQwCb6m98PK8vg/Qs
 ZXC0DCeFUH1Q2jtRbcb4yjCygtjWe3fegx/gY6dFkNU72z2Qh352zCTT5EyGLxpvuZJ9
 WmHw==
X-Gm-Message-State: AOAM532ZmKJNIE9e4b+cHbnGj20K9z+EfKr8uBB7ZT7SCs87C9K55ck7
 Ea0tTNH62hmuBALUtparrZrj4BqXJd8lXPblAwQ=
X-Google-Smtp-Source: ABdhPJwr5RJbWTJ2gYXSs3Wpo3x0BYPwtkAiLUPeBgwxmR+wKrIlwMh7s45pJSdMd2DquVE6zpIH9wkDq01Rhk0CfGY=
X-Received: by 2002:aa7:c6c8:: with SMTP id b8mr5832914eds.392.1643328510567; 
 Thu, 27 Jan 2022 16:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20220117131953.3936137-1-peter.maydell@linaro.org>
 <CAFEAcA8mXXg5tm=sD2_TS0vgSgG3M_yp1YWdjHtbCGZHKgv0kQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8mXXg5tm=sD2_TS0vgSgG3M_yp1YWdjHtbCGZHKgv0kQ@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 28 Jan 2022 01:08:19 +0100
Message-ID: <CAJy5ezr74hTmWR_=Fj1ypWkz_f4XvL2VN75V6JjGv5b7BB6pSw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use correct entrypoint for SVC taken from Hyp
 to Hyp
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001f2c0405d6993c5e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001f2c0405d6993c5e
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 6:14 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Ping for code review? This is a nice short easy one :-)
>

Looks good comparing with the Pseudocode. I tried reading the chapters
about these exceptions but couldn't find a clear description :-)

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



>
> thanks
> -- PMM
>
> On Mon, 17 Jan 2022 at 13:19, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > The exception caused by an SVC instruction may be taken to AArch32
> > Hyp mode for two reasons:
> >  * HCR.TGE indicates that exceptions from EL0 should trap to EL2
> >  * we were already in Hyp mode
> >
> > The entrypoint in the vector table to be used differs in these two
> > cases: for an exception routed to Hyp mode from EL0, we enter at the
> > common 0x14 "hyp trap" entrypoint.  For SVC from Hyp mode to Hyp
> > mode, we enter at the 0x08 (svc/hvc trap) entrypoint.
> > In the v8A Arm ARM pseudocode this is done in AArch32.TakeSVCException.
> >
> > QEMU incorrectly routed both of these exceptions to the 0x14
> > entrypoint.  Correct the entrypoint for SVC from Hyp to Hyp by making
> > use of the existing logic which handles "normal entrypoint for
> > Hyp-to-Hyp, otherwise 0x14" for traps like UNDEF and data/prefetch
> > aborts (reproduced here since it's outside the visible context
> > in the diff for this commit):
> >
> >     if (arm_current_el(env) != 2 && addr < 0x14) {
> >         addr = 0x14;
> >     }
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/helper.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index cfca0f5ba6d..a898e400f6c 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -9655,7 +9655,7 @@ static void
> arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
> >       * separately here.
> >       *
> >       * The vector table entry used is always the 0x14 Hyp mode entry
> point,
> > -     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
> > +     * unless this is an UNDEF/SVC/HVC/abort taken from Hyp to Hyp.
> >       * The offset applied to the preferred return address is always zero
> >       * (see DDI0487C.a section G1.12.3).
> >       * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ
> values.
> > @@ -9669,7 +9669,7 @@ static void
> arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
> >          addr = 0x04;
> >          break;
> >      case EXCP_SWI:
> > -        addr = 0x14;
> > +        addr = 0x08;
> >          break;
> >      case EXCP_BKPT:
> >          /* Fall through to prefetch abort.  */
> > --
> > 2.25.1
> >
>
>

--0000000000001f2c0405d6993c5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 6:14 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Ping for code review? This is a nice short easy one :-)<br></blockquo=
te><div><br></div><div>Looks good comparing with the Pseudocode. I tried re=
ading the chapters about these exceptions but couldn&#39;t find a clear des=
cription :-)<br></div><div><br></div><div>Reviewed-by: Edgar E. Iglesias &l=
t;<a href=3D"mailto:edgar.iglesias@xilinx.com">edgar.iglesias@xilinx.com</a=
>&gt;</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
On Mon, 17 Jan 2022 at 13:19, Peter Maydell &lt;<a href=3D"mailto:peter.may=
dell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<=
br>
&gt;<br>
&gt; The exception caused by an SVC instruction may be taken to AArch32<br>
&gt; Hyp mode for two reasons:<br>
&gt;=C2=A0 * HCR.TGE indicates that exceptions from EL0 should trap to EL2<=
br>
&gt;=C2=A0 * we were already in Hyp mode<br>
&gt;<br>
&gt; The entrypoint in the vector table to be used differs in these two<br>
&gt; cases: for an exception routed to Hyp mode from EL0, we enter at the<b=
r>
&gt; common 0x14 &quot;hyp trap&quot; entrypoint.=C2=A0 For SVC from Hyp mo=
de to Hyp<br>
&gt; mode, we enter at the 0x08 (svc/hvc trap) entrypoint.<br>
&gt; In the v8A Arm ARM pseudocode this is done in AArch32.TakeSVCException=
.<br>
&gt;<br>
&gt; QEMU incorrectly routed both of these exceptions to the 0x14<br>
&gt; entrypoint.=C2=A0 Correct the entrypoint for SVC from Hyp to Hyp by ma=
king<br>
&gt; use of the existing logic which handles &quot;normal entrypoint for<br=
>
&gt; Hyp-to-Hyp, otherwise 0x14&quot; for traps like UNDEF and data/prefetc=
h<br>
&gt; aborts (reproduced here since it&#39;s outside the visible context<br>
&gt; in the diff for this commit):<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (arm_current_el(env) !=3D 2 &amp;&amp; addr &lt;=
 0x14) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D 0x14;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/arm/helper.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/arm/helper.c b/target/arm/helper.c<br>
&gt; index cfca0f5ba6d..a898e400f6c 100644<br>
&gt; --- a/target/arm/helper.c<br>
&gt; +++ b/target/arm/helper.c<br>
&gt; @@ -9655,7 +9655,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPU=
State *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* separately here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* The vector table entry used is always the =
0x14 Hyp mode entry point,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* unless this is an UNDEF/HVC/abort taken from Hy=
p to Hyp.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* unless this is an UNDEF/SVC/HVC/abort taken fro=
m Hyp to Hyp.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* The offset applied to the preferred return=
 address is always zero<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* (see DDI0487C.a section G1.12.3).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* PSTATE A/I/F masks are set based only on t=
he SCR.EA/IRQ/FIQ values.<br>
&gt; @@ -9669,7 +9669,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPU=
State *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D 0x04;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case EXCP_SWI:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D 0x14;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D 0x08;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case EXCP_BKPT:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fall through to prefetch abort.=
=C2=A0 */<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
<br>
</blockquote></div></div>

--0000000000001f2c0405d6993c5e--

