Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB82DC777
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:00:37 +0100 (CET)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcyS-0004Cj-HK
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpcwI-0002jR-Og
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:58:22 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpcwC-0005Ps-M4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:58:20 -0500
Received: by mail-lf1-x132.google.com with SMTP id m25so51414804lfc.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BAg5ajEmy6nDCNKoopxLWQprgfoWo+G6KyleFWf9dh0=;
 b=p/+z677ddYah1yBw3aIWnlVKJYLhcPm2tjGaAcpAnJKLFb1DUqPaIcOOelKez9u9bs
 9+rUApbhs2tjYJEb3P1Xx341Kn+XyPVYrhd5uosOC7rFQKy/IOdqypr2QhfolyVFJqlP
 FmDxfH4p+BymOL7Jw7ATLDnVi7mFp5hfFQ3Jb9B+kcOnEqT11vPfEeuJQ8mGF8FnJ4K1
 3n2+YiS8p1Fk332Kj8VoMh+FAY1fv1J2jEzNNa3Z6mzIhN6CX6aSGpXmpv5PLoFQatjv
 Gubst1LmdyYoQ+dz9wl1Q2XAJd1pSdbYznv7nneJnKDrlJKWtOYCPAHnZrL1J4rc6NkX
 X97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BAg5ajEmy6nDCNKoopxLWQprgfoWo+G6KyleFWf9dh0=;
 b=MNxI73HcRH8dhB5kYgVFHRoSVQ0ULjT+cM+EBrYD6ZpWvRh7T6nSCeyWDJyLxl43zG
 c04/Tl06c+JBwC2yig4oGuycQJGjqnMoJ/mF1HYHPleCNxm3xpKpxBky59BWAcHFd0Av
 9oebefJ391Kxw0LUAnS1offF9YBU4e0t3uBIKDOdLwWQtiJvBJ58y1FcJXDb/Rozhw0G
 C34iPKefW0wfcu33qK8xQX3GEycwSX48LC5+chF4Z1zE4qqeaXmBDf2JxowRGxl+fmUF
 UMYNXELtHzWJEVaELid1C1cHI+rNeXT9YJW4m5Og7wP9V57U1iKwwW/a6K/NR4uXMbVg
 iudg==
X-Gm-Message-State: AOAM532Ztr9B6Twn58QHszj91k81zA+yq0nd9911Jw+eEKpwh8styUoJ
 pWTIbukjhvKT5+jfFs3ItZQMREtBZg2IR2OYGkBO6Q==
X-Google-Smtp-Source: ABdhPJxopA1WWFtp+2zt4EjZoEm8lSts8EfChADdI8h0bROBeahrBmPPjEmn4fhmX6XhHZlgCWFe/PqlpyxEMK5sko8=
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr13562378lfn.545.1608148691054; 
 Wed, 16 Dec 2020 11:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-5-wuhaotsh@google.com>
 <CAFEAcA_Nd0TNjiXkPXp7T29BYO2PnQLQUAFhEg+AR87B8YP+kA@mail.gmail.com>
In-Reply-To: <CAFEAcA_Nd0TNjiXkPXp7T29BYO2PnQLQUAFhEg+AR87B8YP+kA@mail.gmail.com>
Date: Wed, 16 Dec 2020 11:57:59 -0800
Message-ID: <CAGcCb10PXNFT+oxUi1OD=XcvdybOM2s5YHcjDSA+XARSXVNKmw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/misc: Add a PWM module for NPCM7XX
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007a766f05b69a4b1f"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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

--0000000000007a766f05b69a4b1f
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. We can add a patch in this patchset to fix this
issue.

On Wed, Dec 16, 2020 at 11:02 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 15 Dec 2020 at 00:13, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
> > identical PWM modules. Each module contains 4 PWM entries. Each PWM has
> > two outputs: frequency and duty_cycle. Both are computed using inputs
> > from software side.
> >
> > This module does not model detail pulse signals since it is expensive.
> > It also does not model interrupts and watchdogs that are dependant on
> > the detail models. The interfaces for these are left in the module so
> > that anyone in need for these functionalities can implement on their
> > own.
> >
> > The user can read the duty cycle and frequency using qom-get command.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
>
>
> > +static void npcm7xx_pwm_init(Object *obj)
> > +{
> > +    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
> > +    SysBusDevice *sbd = &s->parent;
>
> This isn't right. A device shouldn't be poking around
> in the 'parent' or 'parentobj' member of its struct --
> that is a QOM internal. If you want "this device, cast
> to a SysBusDevice", the way to write that is:
>    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
>
> (or you could pass 'obj'; same thing).
>
> Looking at the code currently in the tree it also is making this
> same mistake:
>
> $ git grep -- '->parent' hw/*/npcm*
> hw/arm/npcm7xx_boards.c:    MachineClass *mc = &nmc->parent;
> hw/mem/npcm7xx_mc.c:    sysbus_init_mmio(&s->parent, &s->mmio);
> hw/misc/npcm7xx_clk.c:    sysbus_init_mmio(&s->parent, &s->iomem);
> hw/misc/npcm7xx_gcr.c:    sysbus_init_mmio(&s->parent, &s->iomem);
> hw/misc/npcm7xx_rng.c:    sysbus_init_mmio(&s->parent, &s->iomem);
> hw/nvram/npcm7xx_otp.c:    SysBusDevice *sbd = &s->parent;
> hw/ssi/npcm7xx_fiu.c:    SysBusDevice *sbd = &s->parent;
> hw/timer/npcm7xx_timer.c:    SysBusDevice *sbd = &s->parent;
>
> These all should be using QOM cast macros. Would somebody
> who's working on these devices like to send a patch ?
>
> thanks
> -- PMM
>

--0000000000007a766f05b69a4b1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review. We can add a patch in this patchset=
 to fix this issue.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Dec 16, 2020 at 11:02 AM Peter Maydell &lt;<a hr=
ef=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 15 D=
ec 2020 at 00:13, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The PWM module is part of NPCM7XX module. Each NPCM7XX module has two<=
br>
&gt; identical PWM modules. Each module contains 4 PWM entries. Each PWM ha=
s<br>
&gt; two outputs: frequency and duty_cycle. Both are computed using inputs<=
br>
&gt; from software side.<br>
&gt;<br>
&gt; This module does not model detail pulse signals since it is expensive.=
<br>
&gt; It also does not model interrupts and watchdogs that are dependant on<=
br>
&gt; the detail models. The interfaces for these are left in the module so<=
br>
&gt; that anyone in need for these functionalities can implement on their<b=
r>
&gt; own.<br>
&gt;<br>
&gt; The user can read the duty cycle and frequency using qom-get command.<=
br>
&gt;<br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
<br>
<br>
&gt; +static void npcm7xx_pwm_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxPWMState *s =3D NPCM7XX_PWM(obj);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;parent;<br>
<br>
This isn&#39;t right. A device shouldn&#39;t be poking around<br>
in the &#39;parent&#39; or &#39;parentobj&#39; member of its struct --<br>
that is a QOM internal. If you want &quot;this device, cast<br>
to a SysBusDevice&quot;, the way to write that is:<br>
=C2=A0 =C2=A0SysBusDevice *sbd =3D SYS_BUS_DEVICE(s);<br>
<br>
(or you could pass &#39;obj&#39;; same thing).<br>
<br>
Looking at the code currently in the tree it also is making this<br>
same mistake:<br>
<br>
$ git grep -- &#39;-&gt;parent&#39; hw/*/npcm*<br>
hw/arm/npcm7xx_boards.c:=C2=A0 =C2=A0 MachineClass *mc =3D &amp;nmc-&gt;par=
ent;<br>
hw/mem/npcm7xx_mc.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &amp;=
s-&gt;mmio);<br>
hw/misc/npcm7xx_clk.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &am=
p;s-&gt;iomem);<br>
hw/misc/npcm7xx_gcr.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &am=
p;s-&gt;iomem);<br>
hw/misc/npcm7xx_rng.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &am=
p;s-&gt;iomem);<br>
hw/nvram/npcm7xx_otp.c:=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;paren=
t;<br>
hw/ssi/npcm7xx_fiu.c:=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;parent;=
<br>
hw/timer/npcm7xx_timer.c:=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;par=
ent;<br>
<br>
These all should be using QOM cast macros. Would somebody<br>
who&#39;s working on these devices like to send a patch ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000007a766f05b69a4b1f--

