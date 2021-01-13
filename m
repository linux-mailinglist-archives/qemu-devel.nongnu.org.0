Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D461A2F4D01
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:23:21 +0100 (CET)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzh3Q-0000Mj-UB
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kzgrk-0007Ax-0K; Wed, 13 Jan 2021 09:11:16 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kzgrh-0005cp-JP; Wed, 13 Jan 2021 09:11:15 -0500
Received: by mail-ed1-x534.google.com with SMTP id b2so2060651edm.3;
 Wed, 13 Jan 2021 06:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j/tzQYxcL9oPXA73zHHNehn2z9Rge6a9/KFC8AG2a48=;
 b=p+LdzPCwrMO54FN2vizwydvYz8ZgMxrW79QbxiLQoiPNjuPMAwU+q5V6sseXnj7ZME
 LnN6xPX3H+FlpyGiSWVTZoNTM59znEkyua6Q5eO4/a4Xv1G17tQRC7XdBNjEVd7kT0CL
 WiJwSsVmd7BXkzWTYfVbU6PiOHBmx1ZDS4iYy0VagxHP5MBdNc0UNRFv3Su70n5np4/q
 /ciNs8deNDbEDcOyxqInPBjyAxby7MY/kzub2UFTUmrOGVbGmUn53v6nePM5UvWMvVFb
 iKcwh/33lBemxf4MdApj9qnIKq1cm8IZyHl9+gQ0BndyJNYQdCE6XJEYkQTXJB0x3e+5
 XHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j/tzQYxcL9oPXA73zHHNehn2z9Rge6a9/KFC8AG2a48=;
 b=pEH7lrKMP8bNrIr+WRw54LDjCAX+GZ8mbm8o91Z1pDRlq0vxIviy+vjruirHVoew8F
 UuIbsDjs1DpEHdBhDtP2gHLDgkkv+HFoFw2jYWyNliwdx59Ve/ul6M/QMat4QrJP0b3F
 8okAec8x8HOfSUFQwOfhn6ABYjQCnBBGaXVQ3r2yVuYgwSi6Ete5+Xfb+lvj1dDnICK8
 YdHuF+76bo4kLLljWEIbws/j7MDQqJ9SpS8kT0s4xuXs+QO6EFbQcGbLDXewzG0Y2B6v
 KJsO9g33o1/gJ3UNDn2zxgLcSFr6FA67SnZeemFed1NenYxQkg7WaL+CTbNOp2vXwe0K
 Xi8g==
X-Gm-Message-State: AOAM533QvZQUebJmO9ym7q0x6aHLT/wcF1ymkynwW+pXSXxWPblElFzh
 lQ3eHRXERHwE6KnNRXrlMuKhar0SEJdMc7uWb3o=
X-Google-Smtp-Source: ABdhPJxefOr3y01tjacVEapXUFFzLegCIKT5+Yx420gpEeSwztIhvx2aZpk7u84pTcxC7s8Dl32UbeZG43Y//kBQmp4=
X-Received: by 2002:a05:6402:1714:: with SMTP id
 y20mr1925629edu.2.1610547070906; 
 Wed, 13 Jan 2021 06:11:10 -0800 (PST)
MIME-Version: 1.0
References: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
 <CAFEAcA9-EP7s-gNCsXf_59eOfo+hvTX_EwJjg02dHt0eyWOk9A@mail.gmail.com>
 <15fc51bf-1473-2808-583e-c58eb1620577@greensocs.com>
In-Reply-To: <15fc51bf-1473-2808-583e-c58eb1620577@greensocs.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 13 Jan 2021 15:11:01 +0100
Message-ID: <CAJy5ezruHnVHbDFLzeMpj7=1=gSjExEE9H_3j6eVpr3-Pa0UVQ@mail.gmail.com>
Subject: Re: [PATCH] Initialize Zynq7000 UART clocks on reset
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: multipart/alternative; boundary="0000000000000e376905b8c8b6cc"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Peter <michael.peter@hensoldt-cyber.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000e376905b8c8b6cc
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Jan 2021, 11:19 Damien Hedde, <damien.hedde@greensocs.com> wrote:

>
> This is ok but I'm afraid we may end up doing this kind of thing in a
> lot of devices. So maybe we should consider changing the behavior of
> device_is_in_reset() so that it returns false in the reset-exit case.
> What do you think ? (I've a patch for this, which make this one useless)
>

Thanks Damien,

IMO, a central fix for this would be better, I agree with you.

Thanks,
Edgar



> But this patch does not harm so, anyway:
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>
> On 1/7/21 9:00 PM, Peter Maydell wrote:
> > Alistair/Edgar/Damien -- could I get a review from one of you
> > for this Xilinx clock-gen related patch, please?
> >
> > thanks
> > -- PMM
> >
> > On Tue, 24 Nov 2020 at 18:54, Michael Peter
> > <michael.peter@hensoldt-cyber.de> wrote:
> >>
> >> Pass an additional argument to zynq_slcr_compute_clocks that indicates
> whether an reset-exit condition
> >> applies. If called from zynq_slcr_reset_exit, external clocks are
> assumed to be active, even if the
> >> device state indicates a reset state.
> >>
> >> Signed-off-by: Michael Peter <michael.peter@hensoldt-cyber.de>
> >> ---
> >>  hw/misc/zynq_slcr.c | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> >> index a2b28019e3..073122b934 100644
> >> --- a/hw/misc/zynq_slcr.c
> >> +++ b/hw/misc/zynq_slcr.c
> >> @@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(const
> uint64_t periods[],
> >>   * But do not propagate them further. Connected clocks
> >>   * will not receive any updates (See zynq_slcr_compute_clocks())
> >>   */
> >> -static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
> >> +static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool
> ignore_reset)
> >>  {
> >>      uint64_t ps_clk = clock_get(s->ps_clk);
> >>
> >>      /* consider outputs clocks are disabled while in reset */
> >> -    if (device_is_in_reset(DEVICE(s))) {
> >> +    if (!ignore_reset && device_is_in_reset(DEVICE(s))) {
> >>          ps_clk = 0;
> >>      }
> >>
> >> @@ -305,7 +305,7 @@ static void
> zynq_slcr_propagate_clocks(ZynqSLCRState *s)
> >>  static void zynq_slcr_ps_clk_callback(void *opaque)
> >>  {
> >>      ZynqSLCRState *s = (ZynqSLCRState *) opaque;
> >> -    zynq_slcr_compute_clocks(s);
> >> +    zynq_slcr_compute_clocks(s, false);
> >>      zynq_slcr_propagate_clocks(s);
> >>  }
> >>
> >> @@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)
> >>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
> >>
> >>      /* will disable all output clocks */
> >> -    zynq_slcr_compute_clocks(s);
> >> +    zynq_slcr_compute_clocks(s, false);
> >>      zynq_slcr_propagate_clocks(s);
> >>  }
> >>
> >> @@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)
> >>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
> >>
> >>      /* will compute output clocks according to ps_clk and registers */
> >> -    zynq_slcr_compute_clocks(s);
> >> +    zynq_slcr_compute_clocks(s, true);
> >>      zynq_slcr_propagate_clocks(s);
> >>  }
> >>
> >> @@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwaddr
> offset,
> >>      case R_ARM_PLL_CTRL:
> >>      case R_DDR_PLL_CTRL:
> >>      case R_UART_CLK_CTRL:
> >> -        zynq_slcr_compute_clocks(s);
> >> +        zynq_slcr_compute_clocks(s, false);
> >>          zynq_slcr_propagate_clocks(s);
> >>          break;
> >>      }
> >> --
> >> 2.17.1
> >
>

--0000000000000e376905b8c8b6cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 13 Jan 2021, 11:19 Damien Hedde, &lt;<a href=
=3D"mailto:damien.hedde@greensocs.com">damien.hedde@greensocs.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
This is ok but I&#39;m afraid we may end up doing this kind of thing in a<b=
r>
lot of devices. So maybe we should consider changing the behavior of<br>
device_is_in_reset() so that it returns false in the reset-exit case.<br>
What do you think ? (I&#39;ve a patch for this, which make this one useless=
)<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thanks Damien,=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">IM=
O, a central fix for this would be better, I agree with you.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">=
Edgar</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
But this patch does not harm so, anyway:<br>
Reviewed-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com"=
 target=3D"_blank" rel=3D"noreferrer">damien.hedde@greensocs.com</a>&gt;<br=
>
<br>
On 1/7/21 9:00 PM, Peter Maydell wrote:<br>
&gt; Alistair/Edgar/Damien -- could I get a review from one of you<br>
&gt; for this Xilinx clock-gen related patch, please?<br>
&gt; <br>
&gt; thanks<br>
&gt; -- PMM<br>
&gt; <br>
&gt; On Tue, 24 Nov 2020 at 18:54, Michael Peter<br>
&gt; &lt;<a href=3D"mailto:michael.peter@hensoldt-cyber.de" target=3D"_blan=
k" rel=3D"noreferrer">michael.peter@hensoldt-cyber.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Pass an additional argument to zynq_slcr_compute_clocks that indic=
ates whether an reset-exit condition<br>
&gt;&gt; applies. If called from zynq_slcr_reset_exit, external clocks are =
assumed to be active, even if the<br>
&gt;&gt; device state indicates a reset state.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Michael Peter &lt;<a href=3D"mailto:michael.peter@h=
ensoldt-cyber.de" target=3D"_blank" rel=3D"noreferrer">michael.peter@hensol=
dt-cyber.de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 hw/misc/zynq_slcr.c | 12 ++++++------<br>
&gt;&gt;=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c<br>
&gt;&gt; index a2b28019e3..073122b934 100644<br>
&gt;&gt; --- a/hw/misc/zynq_slcr.c<br>
&gt;&gt; +++ b/hw/misc/zynq_slcr.c<br>
&gt;&gt; @@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(cons=
t uint64_t periods[],<br>
&gt;&gt;=C2=A0 =C2=A0* But do not propagate them further. Connected clocks<=
br>
&gt;&gt;=C2=A0 =C2=A0* will not receive any updates (See zynq_slcr_compute_=
clocks())<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt; -static void zynq_slcr_compute_clocks(ZynqSLCRState *s)<br>
&gt;&gt; +static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool ignor=
e_reset)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t ps_clk =3D clock_get(s-&gt;ps_clk);<b=
r>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* consider outputs clocks are disabled while =
in reset */<br>
&gt;&gt; -=C2=A0 =C2=A0 if (device_is_in_reset(DEVICE(s))) {<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!ignore_reset &amp;&amp; device_is_in_reset(DEV=
ICE(s))) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ps_clk =3D 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; @@ -305,7 +305,7 @@ static void zynq_slcr_propagate_clocks(ZynqSLC=
RState *s)<br>
&gt;&gt;=C2=A0 static void zynq_slcr_ps_clk_callback(void *opaque)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ZynqSLCRState *s =3D (ZynqSLCRState *) opaque;=
<br>
&gt;&gt; -=C2=A0 =C2=A0 zynq_slcr_compute_clocks(s);<br>
&gt;&gt; +=C2=A0 =C2=A0 zynq_slcr_compute_clocks(s, false);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 zynq_slcr_propagate_clocks(s);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; @@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ZynqSLCRState *s =3D ZYNQ_SLCR(obj);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* will disable all output clocks */<br>
&gt;&gt; -=C2=A0 =C2=A0 zynq_slcr_compute_clocks(s);<br>
&gt;&gt; +=C2=A0 =C2=A0 zynq_slcr_compute_clocks(s, false);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 zynq_slcr_propagate_clocks(s);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; @@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ZynqSLCRState *s =3D ZYNQ_SLCR(obj);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* will compute output clocks according to ps_=
clk and registers */<br>
&gt;&gt; -=C2=A0 =C2=A0 zynq_slcr_compute_clocks(s);<br>
&gt;&gt; +=C2=A0 =C2=A0 zynq_slcr_compute_clocks(s, true);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 zynq_slcr_propagate_clocks(s);<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; @@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwad=
dr offset,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case R_ARM_PLL_CTRL:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case R_DDR_PLL_CTRL:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 case R_UART_CLK_CTRL:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 zynq_slcr_compute_clocks(s);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 zynq_slcr_compute_clocks(s, false);<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zynq_slcr_propagate_clocks(s);<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div></div>

--0000000000000e376905b8c8b6cc--

