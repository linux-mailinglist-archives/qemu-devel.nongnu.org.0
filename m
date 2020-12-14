Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD82D9E2A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:50:46 +0100 (CET)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korzh-00073X-D6
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koryE-0006Rz-1O
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:49:14 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koryC-0006AG-06
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:49:13 -0500
Received: by mail-lf1-x144.google.com with SMTP id a9so32322243lfh.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+EQrl+gkKCuJ/kCP8jGocGj5VkI/HZ5P7oyiFCzLReo=;
 b=UvswvQMjComVRsNhR3Jcg+jRLzQXgN9mynSoGoMUe85kOEGv0UqI/ge/Wi/N/ga0Dg
 ny4qZ+WEovqiaVO+1sCt6rifeIrjlO9Rnp+0JaV5BhttFGR8NwAv0HmrDtH2HlhsDMwp
 HvXVa5REyiCb+wB+SDy9CveiZ0giwYjhkIR1nBuqUtblpZZWqReiJYG/Or5i+jamGxDf
 CU4uz3VP2/FNCMxtlhzywqdMhEmtC1M7h5tdjtxLNc0P30e8OfxJFGIGMWZ4ZnwAkfPz
 lq8s21ZBSNYk8RE0qp2Ju9bNO+4psUf2pJO/4S0JLE5YOemDUK9ATZTMKqaLzm6ravZJ
 Wjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+EQrl+gkKCuJ/kCP8jGocGj5VkI/HZ5P7oyiFCzLReo=;
 b=caO/ukNUtFg2SCiS9US0VP1ltL7+OxJHYjcALrmpnuK5BvIq2ZcL28yK/DutlOG+d1
 qgPTzZMACMY/OD+v8cDKWEQ3wdw+5AXtkHeCPZwPNQt+V9kLPjLbUoodOKiutpSFxDuH
 5oX8uRbCavRtVzleNLO+XNR3IXYmQ/hZA0jIDNUUMqOmuNfe2DY5gx7RdxTAavnNFF4m
 Z/ZzkBBjxozQWkcODE3A3vLxWurjeoQDJloMi4Dsk3nPW8dadl2Yzi9qd1QvT3E0aa2D
 G9uJRhdyW5zQGVUJZueJP+6n4BipH0AcLm3lWDwzj2KmPdJVYANH4GQrS93BegKr4xVy
 ukCg==
X-Gm-Message-State: AOAM532e0ZQAtn+vSzrhAFG/YROWORM+kbvXctOyH/q9qXI/aHIMHc1c
 izpM6oLz1LbOmmj5zS8Q3Wyudag9xmaaemK+7GwwIw==
X-Google-Smtp-Source: ABdhPJyqMBKWis0ZCPtq0NAs9FgoLS8PmLOLG1pphUOMzZYQjMXjJxsObD7qWiwKjPti8OiDfbLpARWLyNTUyWwMSPI=
X-Received: by 2002:a2e:8745:: with SMTP id q5mr10583543ljj.77.1607968148040; 
 Mon, 14 Dec 2020 09:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20201211222223.2252172-1-wuhaotsh@google.com>
 <20201211222223.2252172-4-wuhaotsh@google.com>
 <2d6eca6e-1690-8411-51c2-c0e7f8e8d677@amsat.org>
In-Reply-To: <2d6eca6e-1690-8411-51c2-c0e7f8e8d677@amsat.org>
Date: Mon, 14 Dec 2020 09:48:56 -0800
Message-ID: <CAGcCb11CdDmLrndTTij6wMBNC1p7Y0VCowL+Y11oyg6+YS29Bg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/adc: Add an ADC module for NPCM7XX
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000469f1305b67042ca"
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x144.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, minyard@acm.org,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--000000000000469f1305b67042ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your comment! We'll incorporate them into our next patch version=
.

We plan to let the user use QOM get/set QMP commands to control ADC/PWM
values, similar to hw/misc/tmp105.c. The user can set a voltage value as
input using QOM-set, and the QEMU guest can read the converted value
through this module. Similar for PWM, the user can read the duty-cycle and
frequency using QOM-get. The user can also run a third-party simulator and
alter these values during execution. Our test code also shows how to deal
with these values.

If you have a better suggestion, please let us know.

On Sun, Dec 13, 2020 at 3:47 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 12/11/20 11:22 PM, Hao Wu via wrote:
> > The ADC is part of NPCM7XX Module. Its behavior is controled by the
> > ADC_CON register. It converts one of the eight analog inputs into a
> > digital input and stores it in the ADC_DATA register when enabled.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  docs/system/arm/nuvoton.rst    |   2 +-
> >  hw/adc/meson.build             |   1 +
> >  hw/adc/npcm7xx_adc.c           | 318 ++++++++++++++++++++++++++
> >  hw/arm/npcm7xx.c               |  24 +-
> >  include/hw/adc/npcm7xx_adc.h   |  72 ++++++
> >  include/hw/arm/npcm7xx.h       |   2 +
> >  tests/qtest/meson.build        |   3 +-
> >  tests/qtest/npcm7xx_adc-test.c | 400 +++++++++++++++++++++++++++++++++
> >  8 files changed, 819 insertions(+), 3 deletions(-)
> >  create mode 100644 hw/adc/npcm7xx_adc.c
> >  create mode 100644 include/hw/adc/npcm7xx_adc.h
> >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
> ...
>
> > +static void npcm7xx_adc_init(Object *obj)
> > +{
> > +    NPCM7xxADCState *s =3D NPCM7XX_ADC(obj);
> > +    SysBusDevice *sbd =3D &s->parent;
> > +    int i;
> > +
> > +    sysbus_init_irq(sbd, &s->irq);
> > +
> > +    timer_init_ns(&s->conv_timer, QEMU_CLOCK_VIRTUAL,
> > +            npcm7xx_adc_convert_done, s);
> > +    timer_init_ns(&s->reset_timer, QEMU_CLOCK_VIRTUAL,
> > +            npcm7xx_adc_reset_done, s);
> > +    memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
> > +                          TYPE_NPCM7XX_ADC, 4 * KiB);
> > +    sysbus_init_mmio(sbd, &s->iomem);
> > +    s->clock =3D qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> > +
> > +    for (i =3D 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
> > +        object_property_add_uint32_ptr(obj, "adci[*]",
> > +                &s->adci[i], OBJ_PROP_FLAG_WRITE);
>
> How do you use this, any example?
>
> FWIW I'm experimenting with other ADC to use the "audio/audio.h"
> API (which is not voice/audio specific, but generic DSP), then
> I can pass any QEMU source and consume it using AUD_read() to fill
> the ADC buffer (device sram or in main ram).
>
> But I'm doing that alone during my free time, so don't expect it
> any time soon :(
>
> > +    }
> > +    object_property_add_uint32_ptr(obj, "vref",
> > +            &s->vref, OBJ_PROP_FLAG_WRITE);
> > +    npcm7xx_adc_calibrate(s);
> > +}
>

--000000000000469f1305b67042ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your comment! We&#39;ll incorporate them into o=
ur next patch version.<div><br></div><div>We plan to let the user use QOM g=
et/set QMP commands to control ADC/PWM values, similar to hw/misc/tmp105.c.=
 The user can set a voltage value as input using QOM-set, and the QEMU gues=
t can read the converted value through this module. Similar for PWM, the us=
er can read the duty-cycle and frequency using QOM-get. The user can also r=
un a third-party simulator and alter these values during execution. Our tes=
t code also shows how to deal with these values.</div><div><br></div><div>I=
f you have a better suggestion, please let us know.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 13, 20=
20 at 3:47 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat=
.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 12/11/20 11:22 PM, Hao Wu via wro=
te:<br>
&gt; The ADC is part of NPCM7XX Module. Its behavior is controled by the<br=
>
&gt; ADC_CON register. It converts one of the eight analog inputs into a<br=
>
&gt; digital input and stores it in the ADC_DATA register when enabled.<br>
&gt; <br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
18 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 24 +-<br>
&gt;=C2=A0 include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0|=C2=A0 72 ++++++<br>
&gt;=C2=A0 include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 tests/qtest/npcm7xx_adc-test.c | 400 +++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 8 files changed, 819 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/adc/npcm7xx_adc.c<br>
&gt;=C2=A0 create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
&gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
...<br>
<br>
&gt; +static void npcm7xx_adc_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxADCState *s =3D NPCM7XX_ADC(obj);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;parent;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 timer_init_ns(&amp;s-&gt;conv_timer, QEMU_CLOCK_VIRTUAL=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_convert_done, s=
);<br>
&gt; +=C2=A0 =C2=A0 timer_init_ns(&amp;s-&gt;reset_timer, QEMU_CLOCK_VIRTUA=
L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_reset_done, s);=
<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;npcm7=
xx_adc_ops, s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_NPCM7XX_ADC, 4 * KiB);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(s), &quot;clo=
ck&quot;, NULL, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_ADC_NUM_INPUTS; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_uint32_ptr(obj, &quot=
;adci[*]&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;ad=
ci[i], OBJ_PROP_FLAG_WRITE);<br>
<br>
How do you use this, any example?<br>
<br>
FWIW I&#39;m experimenting with other ADC to use the &quot;audio/audio.h&qu=
ot;<br>
API (which is not voice/audio specific, but generic DSP), then<br>
I can pass any QEMU source and consume it using AUD_read() to fill<br>
the ADC buffer (device sram or in main ram).<br>
<br>
But I&#39;m doing that alone during my free time, so don&#39;t expect it<br=
>
any time soon :(<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 object_property_add_uint32_ptr(obj, &quot;vref&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;vref, OBJ_PROP_F=
LAG_WRITE);<br>
&gt; +=C2=A0 =C2=A0 npcm7xx_adc_calibrate(s);<br>
&gt; +}<br>
</blockquote></div>

--000000000000469f1305b67042ca--

