Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190072EE7BB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:44:51 +0100 (CET)
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxd5N-0002Pd-Mj
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxd3v-0001in-Lp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:43:19 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxd3t-0006lj-Ja
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:43:19 -0500
Received: by mail-lf1-x12a.google.com with SMTP id x20so18027297lfe.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1JT21Ksn1nsFZ4DghxP3AoXJYW1SnYHBOVRlgQU7MUM=;
 b=Km/BQSKuzBOZTlgvydjgbBUwESiai4bRFItpsb5P+IntSnyZOVXE8epw97J1p2Or/l
 ybjToe+IoZL0eRt9YEBDDFbYw99aRnPOFnsOnX32KwQpoOjM+P1gdlG6rZMxYUD94jzW
 Kco5U3yuuPpz5Ky0fzEFkTFmGpHvUAdNnEvWzXgSJlj+xzz5V0cX8iEcJYkTqdL98zc3
 7xIwJUSW9jCfiD/6mW4Xhuw2NvuemLpq7Asr/ArQp2lWKSmKet1PJk8yQ1dT/SDZ7xpN
 +S4mgEBPgWzN/hP1CsB9DvUjOPw6rQPC07xMaCb/XXgbk+MaUx89OUnmM5tNveZneQNd
 CWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JT21Ksn1nsFZ4DghxP3AoXJYW1SnYHBOVRlgQU7MUM=;
 b=AQyWFgna1GJ9F7qWD7j8vg+wJJxEfMUav5E8cquvl6oM48/9qVKOhfXltJW+/I+hq4
 31A/XD0m38b3TLaUw8isRUQwlBv+GGyT37hHNZx//qbq4yOIJQpDkTkllaW3bEI89toV
 sOOjiinKEZtgRiuDGWnfpRNhM7211DeBqZIi4MRPQ1khkbtJUjoD4QB3iLx/r6201oCa
 8UyzNTKIjE0T34K9c+hzWWITUa3u7TshEQk9QLWhtsjDqoqn50+Uq1SeO1vqJC/brgRX
 bmP7TXrhDFb4M2XWYjyDFu3+TrbRORT7xAZkaNpLa9dhM6rFP5/NrnXtgpUu2bBrvBUc
 fgwg==
X-Gm-Message-State: AOAM532PNn5j62VY4qmhTwWsPJ4qDHegkjELZ9ok0f7sDMGUnyRbKrQd
 HjMlc17mkRc08ZXpLgVlBb4DjF2vgM6jIbu0k92sgg==
X-Google-Smtp-Source: ABdhPJxbpB/RpjdIFsK3ti7hL7kr7EQvwVDSedISrMiUYm4gf53gA4/lbU12QPzM6ND0LRhQ7MzW27tRsGwfbmcS3cI=
X-Received: by 2002:a05:651c:217:: with SMTP id
 y23mr175289ljn.247.1610055792309; 
 Thu, 07 Jan 2021 13:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-3-wuhaotsh@google.com>
 <CAFEAcA_jEYK_e7uoJCKn=+om8c6cCRW0Xt5TKi6mzto+zE44Fg@mail.gmail.com>
In-Reply-To: <CAFEAcA_jEYK_e7uoJCKn=+om8c6cCRW0Xt5TKi6mzto+zE44Fg@mail.gmail.com>
Date: Thu, 7 Jan 2021 13:43:01 -0800
Message-ID: <CAGcCb12=joJd4GDgLu249HfN6FrzJ-a+OQz=a5c0t4Upd_W+eA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000924a2905b8565325"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.382,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--000000000000924a2905b8565325
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 12:51 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > This patch makes NPCM7XX Timer to use a the timer clock generated by the
> > CLK module instead of the magic number TIMER_REF_HZ.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  hw/arm/npcm7xx.c                 |  5 +++++
> >  hw/timer/npcm7xx_timer.c         | 25 ++++++++++++++-----------
> >  include/hw/misc/npcm7xx_clk.h    |  6 ------
> >  include/hw/timer/npcm7xx_timer.h |  1 +
> >  4 files changed, 20 insertions(+), 17 deletions(-)
>
> > @@ -130,7 +130,7 @@ static int64_t
> npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
> >  {
> >      int64_t ns = count;
> >
> > -    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
> > +    ns *= clock_get_ns(t->ctrl->clock);
> >      ns *= npcm7xx_tcsr_prescaler(t->tcsr);
>
> I'm afraid that since you wrote and sent this we've updated the
> clock API (in commits 554d523785ef868 and de6a65f11d7e5a2a93f),
> so clock_get_ns() doesn't exist any more. Instead there is
> a new function clock_ticks_to_ns().
>
> The idea of the new function is that clocks don't necessarily
> have a period which is a whole number of nanoseconds, so
> doing arithmetic on the return value from clock_get_ns()
> introduces rounding errors, especially in the case of
> "multiply clock_get_ns() by a tick count to get a duration".
> (The worst case for this is "clock frequency >1GHz", at which
> point the rounding means that clock_get_ns() returns 0...)
>
> There is as yet no function for "convert duration to
> tick count", so code like:
>    count = ns / clock_get_ns(t->ctrl->clock);
>
> should probably for the moment call clock_ticks_to_ns()
> passing a tick count of 1. But I plan to write a patchset
> soon which will avoid the need to do that.
>
> Strictly speaking, even "call clock_ticks_to_ns() and
> then multiply by the prescaler value" can introduce
> rounding error; to deal with that I think you'd need to
> either have an internal Clock object whose period you
> adjusted as the prescalar value was updated by the guest,
> or else do arithmetic with the return value of clock_get()
> (which is in units of 2^-32 ns); I'm not sure either is
> worth it.
>
In this particular case, rounding error is less of a concern since the
clock should be ~25MHz (in the old implementation it was a fixed value.)

Since the prescaler is always an integer, a possible alternative might be
ns = clock_ticks_to_ns(t->ctrl->clock, count *
npcm7xx_tcsr_prescaler(t->tcsr))

and for code to convert ns to count can go
count = ns / clock_ticks_to_ns(t->ctrl->clock,
npcm7xx_tcsr_prescaler(t->tcsr))
or use the new API you proposed.

We'll also need to apply similar changes to other places in the patchset
(ADC and/or PWM) that need to compute clock value.

>
> thanks
> -- PMM
>

--000000000000924a2905b8565325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 12:51 PM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Thu, 17 Dec 2020 at 00:45, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@googl=
e.com" target=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch makes NPCM7XX Timer to use a the timer clock generated by t=
he<br>
&gt; CLK module instead of the magic number TIMER_REF_HZ.<br>
&gt;<br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt;=C2=A0 hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 +=
+++++++++++++-----------<br>
&gt;=C2=A0 include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 |=C2=A0 6 ------<br>
&gt;=C2=A0 include/hw/timer/npcm7xx_timer.h |=C2=A0 1 +<br>
&gt;=C2=A0 4 files changed, 20 insertions(+), 17 deletions(-)<br>
<br>
&gt; @@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTi=
mer *t, uint32_t count)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int64_t ns =3D count;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 ns *=3D NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;<=
br>
&gt; +=C2=A0 =C2=A0 ns *=3D clock_get_ns(t-&gt;ctrl-&gt;clock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ns *=3D npcm7xx_tcsr_prescaler(t-&gt;tcsr);<br>
<br>
I&#39;m afraid that since you wrote and sent this we&#39;ve updated the<br>
clock API (in commits 554d523785ef868 and de6a65f11d7e5a2a93f),<br>
so clock_get_ns() doesn&#39;t exist any more. Instead there is<br>
a new function clock_ticks_to_ns().<br>
<br>
The idea of the new function is that clocks don&#39;t necessarily<br>
have a period which is a whole number of nanoseconds, so<br>
doing arithmetic on the return value from clock_get_ns()<br>
introduces rounding errors, especially in the case of<br>
&quot;multiply clock_get_ns() by a tick count to get a duration&quot;.<br>
(The worst case for this is &quot;clock frequency &gt;1GHz&quot;, at which<=
br>
point the rounding means that clock_get_ns() returns 0...)<br>
<br>
There is as yet no function for &quot;convert duration to<br>
tick count&quot;, so code like:<br>
=C2=A0 =C2=A0count =3D ns / clock_get_ns(t-&gt;ctrl-&gt;clock);<br>
<br>
should probably for the moment call clock_ticks_to_ns()<br>
passing a tick count of 1. But I plan to write a patchset<br>
soon which will avoid the need to do that.<br>
<br>
Strictly speaking, even &quot;call clock_ticks_to_ns() and<br>
then multiply by the prescaler value&quot; can introduce<br>
rounding error; to deal with that I think you&#39;d need to<br>
either have an internal Clock object whose period you<br>
adjusted as the prescalar value was updated by the guest,<br>
or else do arithmetic with the return value of clock_get()<br>
(which is in units of 2^-32 ns); I&#39;m not sure either is<br>
worth it.<br></blockquote><div>In this particular case, rounding error is l=
ess of a concern since the clock should be ~25MHz (in the old implementatio=
n it was a fixed value.)</div><div><br></div><div>Since the prescaler is al=
ways an integer, a possible alternative might be</div><div>ns =3D clock_tic=
ks_to_ns(t-&gt;ctrl-&gt;clock, count * npcm7xx_tcsr_prescaler(t-&gt;tcsr))<=
/div><div><br></div><div>and for code to convert ns to count can go</div><d=
iv>count =3D ns / clock_ticks_to_ns(t-&gt;ctrl-&gt;clock, npcm7xx_tcsr_pres=
caler(t-&gt;tcsr))<br></div><div>or use the new API you proposed.</div><div=
><br></div><div>We&#39;ll also need to apply similar changes to other place=
s in the patchset (ADC and/or PWM) that need=C2=A0to compute clock value.</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000924a2905b8565325--

