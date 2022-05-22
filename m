Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABBC530207
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 11:12:35 +0200 (CEST)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nshda-0002Aa-Eg
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 05:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshZD-0000P8-G9; Sun, 22 May 2022 05:08:03 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:40734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshZB-0007SK-9M; Sun, 22 May 2022 05:08:03 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id p3so10230263qvi.7;
 Sun, 22 May 2022 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8oFgiB5Aj96kEvZ65+rLqzrtsm6Ywa9IubVbiv7Wn7Q=;
 b=COWPSB6S7Xzk/fG0oSks8xmgwvF4jONAHSPwNYkJzQcvIeZenr06hf2aVH6GQME+ND
 DmbBW3eGv8AyAZ+hk+p1RETU5qxtwJfcO/nIaFmsD3+kMOUNW9eHKUr/5geHs/kX2Goi
 CTDakR/cXLxbEl3se6WHZ8U3qWL0E0i8uw6nT1mT2SMWsy9bfjAhvEoCTcd/RcJ6HA51
 pBqH/Xvp9SwCfVXOwqAaatajCUs8q6+wG3hHWh9qMW6Q586rdUxaJTW4JWF0h1Z70IJd
 7ioO0Wu4lhx80rvwW422myPhuzPKxvfBpBWYyl/RQUV+CKCcGeYCobD9cMTqvvo6ZwFR
 DaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oFgiB5Aj96kEvZ65+rLqzrtsm6Ywa9IubVbiv7Wn7Q=;
 b=Ya6ZShu97wcVsKP6Q/fDYKVl1EJSKEqv7MPXxr7TKDQqG/fgeKL4YuBkeBa68/oQ62
 tdYT6UttILuYzp/LJtQSsTS9V+6zU2Jq6AJkuC5HYQj86KmP4gu9AKd1iR4C/JjfZ/3S
 +hAoVF3xO0rDLvjQ8ftqo+e/5xU7DHWUpngS8dD2R/BV9dDfMz/ZF+GHSQ41Od3QeDsC
 xPwO/7b02ht29t2YwnBSygudcQFkXfoPn4pclnwAnl7oL4FxE+Hw0p33vNUfaNWWpkNF
 9ggyvnizMj03sPaLZtElKBimaYigBd01KAh3CzltaSMF4s3BC2smosF2Js/gocHODfHQ
 rKPw==
X-Gm-Message-State: AOAM531Iqsc+3y2gu/iq0kXctllC5OiWGWoT2Y6gX10jH5lCplXbFTVJ
 GPGILBK6YtN34wpvtJtybr2o3yxece8eI/alak8=
X-Google-Smtp-Source: ABdhPJydexMj/fQ9bFUN8TdBHvGir3JIt0CX8iBQBSwuh8Gf4p0emXvwQ/gcbGTbQ5ZC9fxFog3evqreM/kQoNschmI=
X-Received: by 2002:a05:6214:2265:b0:45a:84e4:42c with SMTP id
 gs5-20020a056214226500b0045a84e4042cmr13644507qvb.109.1653210479878; Sun, 22
 May 2022 02:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220520174537.5827-1-shentey@gmail.com>
 <20220520174537.5827-3-shentey@gmail.com>
 <233ae2da-ca1c-ea11-8af5-3eb8f936dbba@ilande.co.uk>
In-Reply-To: <233ae2da-ca1c-ea11-8af5-3eb8f936dbba@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 22 May 2022 11:07:43 +0200
Message-ID: <CAG4p6K4yNa7g8o1kLKp81+cZYzh8WNETJuW4NKm_6X9ChtgEEQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rtc/mc146818rtc: QOM'ify io_base offset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="0000000000006468ce05df960f69"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=shentey@gmail.com; helo=mail-qv1-xf2e.google.com
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

--0000000000006468ce05df960f69
Content-Type: text/plain; charset="UTF-8"

On Sat, May 21, 2022 at 11:24 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 20/05/2022 18:45, Bernhard Beschow wrote:
>
> > Exposing the io_base offset as a QOM property not only allows it to be
> > configurable but also to be displayed in HMP:
> >
> > Before:
> >
> > (qemu) info qtree
> >         ...
> >            dev: mc146818rtc, id ""
> >              gpio-out "" 1
> >              base_year = 0 (0x0)
> >              irq = 8 (0x8)
> >              lost_tick_policy = "discard"
> >
> > After:
> >
> >            dev: mc146818rtc, id ""
> >              gpio-out "" 1
> >              base_year = 0 (0x0)
> >              iobase = 112 (0x70)
> >              irq = 8 (0x8)
> >              lost_tick_policy = "discard"
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   hw/i386/microvm-dt.c         | 2 +-
> >   hw/rtc/mc146818rtc.c         | 7 ++++---
> >   include/hw/rtc/mc146818rtc.h | 2 +-
> >   3 files changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> > index a5db9e4e5a..39fe425b26 100644
> > --- a/hw/i386/microvm-dt.c
> > +++ b/hw/i386/microvm-dt.c
> > @@ -209,7 +209,7 @@ static void dt_add_isa_rtc(MicrovmMachineState *mms,
> ISADevice *dev)
> >   {
> >       const char compat[] = "motorola,mc146818";
> >       uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", NULL);
> > -    hwaddr base = RTC_ISA_BASE;
> > +    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", NULL);
>
> Same comment here re: &error_abort.
>

Ack.

>
> >       hwaddr size = 8;
> >       char *nodename;
> >
> > diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> > index f235c2ddbe..484f91b6f8 100644
> > --- a/hw/rtc/mc146818rtc.c
> > +++ b/hw/rtc/mc146818rtc.c
> > @@ -941,7 +941,7 @@ static void rtc_realizefn(DeviceState *dev, Error
> **errp)
> >       qemu_register_suspend_notifier(&s->suspend_notifier);
> >
> >       memory_region_init_io(&s->io, OBJECT(s), &cmos_ops, s, "rtc", 2);
> > -    isa_register_ioport(isadev, &s->io, RTC_ISA_BASE);
> > +    isa_register_ioport(isadev, &s->io, s->io_base);
> >
> >       /* register rtc 0x70 port for coalesced_pio */
> >       memory_region_set_flush_coalesced(&s->io);
> > @@ -950,7 +950,7 @@ static void rtc_realizefn(DeviceState *dev, Error
> **errp)
> >       memory_region_add_subregion(&s->io, 0, &s->coalesced_io);
> >       memory_region_add_coalescing(&s->coalesced_io, 0, 1);
> >
> > -    qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
> > +    qdev_set_legacy_instance_id(dev, s->io_base, 3);
> >
> >       object_property_add_tm(OBJECT(s), "date", rtc_get_date);
> >
> > @@ -983,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int
> base_year, qemu_irq intercept_irq)
> >
> >   static Property mc146818rtc_properties[] = {
> >       DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
> > +    DEFINE_PROP_UINT32("iobase", RTCState, io_base, 0x70),
>
> I think this should be RTC_ISA_BASE?
>
> >       DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
> >       DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
> >                                  lost_tick_policy,
> LOST_TICK_POLICY_DISCARD),
> > @@ -1028,7 +1029,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml
> *scope)
> >        * does, even though qemu only responds to the first two ports.
> >        */
> >       crs = aml_resource_template();
> > -    aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
> > +    aml_append(crs, aml_io(AML_DECODE16, s->io_base, s->io_base,
> >                              0x01, 0x08));
> >       aml_append(crs, aml_irq_no_flags(s->isairq));
> >
> > diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> > index 33d85753c0..1f7942a9f8 100644
> > --- a/include/hw/rtc/mc146818rtc.h
> > +++ b/include/hw/rtc/mc146818rtc.h
> > @@ -26,6 +26,7 @@ struct RTCState {
> >       uint8_t cmos_data[128];
> >       uint8_t cmos_index;
> >       uint8_t isairq;
> > +    uint32_t io_base;
> >       int32_t base_year;
> >       uint64_t base_rtc;
> >       uint64_t last_update;
> > @@ -49,7 +50,6 @@ struct RTCState {
> >   };
> >
> >   #define RTC_ISA_IRQ 8
> > -#define RTC_ISA_BASE 0x70
>
> ... and so you'll need to keep this.
>

My intention was indeed to remove it since it is now redundant. Keeping the
constant public has the risk of using it instead of the user-configurable
QOM property which could cause bugs.


> >   ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
> >                                qemu_irq intercept_irq);
>
> Otherwise:
>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
>
> ATB,
>
> Mark.
>

--0000000000006468ce05df960f69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, May 21, 2022 at 11:24 AM Mark Cave-Ayland &lt;<a href=3D"mai=
lto:mark.cave-ayland@ilande.co.uk">mark.cave-ayland@ilande.co.uk</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 20/05/20=
22 18:45, Bernhard Beschow wrote:<br>
<br>
&gt; Exposing the io_base offset as a QOM property not only allows it to be=
<br>
&gt; configurable but also to be displayed in HMP:<br>
&gt; <br>
&gt; Before:<br>
&gt; <br>
&gt; (qemu) info qtree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev: mc146818rtc, id &quot;&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-out &quot;&quot; =
1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_year =3D 0 (0x0)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D 8 (0x8)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lost_tick_policy =3D &=
quot;discard&quot;<br>
&gt; <br>
&gt; After:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev: mc146818rtc, id &quot;&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-out &quot;&quot; =
1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_year =3D 0 (0x0)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iobase =3D 112 (0x70)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D 8 (0x8)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lost_tick_policy =3D &=
quot;discard&quot;<br>
&gt; <br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/i386/microvm-dt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
&gt;=C2=A0 =C2=A0hw/rtc/mc146818rtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 =
++++---<br>
&gt;=C2=A0 =C2=A0include/hw/rtc/mc146818rtc.h | 2 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 6 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c<br>
&gt; index a5db9e4e5a..39fe425b26 100644<br>
&gt; --- a/hw/i386/microvm-dt.c<br>
&gt; +++ b/hw/i386/microvm-dt.c<br>
&gt; @@ -209,7 +209,7 @@ static void dt_add_isa_rtc(MicrovmMachineState *mm=
s, ISADevice *dev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char compat[] =3D &quot;motorola,mc146=
818&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t irq =3D object_property_get_uint(OB=
JECT(dev), &quot;irq&quot;, NULL);<br>
&gt; -=C2=A0 =C2=A0 hwaddr base =3D RTC_ISA_BASE;<br>
&gt; +=C2=A0 =C2=A0 hwaddr base =3D object_property_get_int(OBJECT(dev), &q=
uot;iobase&quot;, NULL);<br>
<br>
Same comment here re: &amp;error_abort.<br></blockquote><div><br></div><div=
>Ack. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr size =3D 8;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *nodename;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c<br>
&gt; index f235c2ddbe..484f91b6f8 100644<br>
&gt; --- a/hw/rtc/mc146818rtc.c<br>
&gt; +++ b/hw/rtc/mc146818rtc.c<br>
&gt; @@ -941,7 +941,7 @@ static void rtc_realizefn(DeviceState *dev, Error =
**errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_register_suspend_notifier(&amp;s-&gt;su=
spend_notifier);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;io, OBJECT(=
s), &amp;cmos_ops, s, &quot;rtc&quot;, 2);<br>
&gt; -=C2=A0 =C2=A0 isa_register_ioport(isadev, &amp;s-&gt;io, RTC_ISA_BASE=
);<br>
&gt; +=C2=A0 =C2=A0 isa_register_ioport(isadev, &amp;s-&gt;io, s-&gt;io_bas=
e);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* register rtc 0x70 port for coalesced_pio =
*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_set_flush_coalesced(&amp;s-&gt=
;io);<br>
&gt; @@ -950,7 +950,7 @@ static void rtc_realizefn(DeviceState *dev, Error =
**errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(&amp;s-&gt;io, 0=
, &amp;s-&gt;coalesced_io);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_add_coalescing(&amp;s-&gt;coal=
esced_io, 0, 1);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);<br>
&gt; +=C2=A0 =C2=A0 qdev_set_legacy_instance_id(dev, s-&gt;io_base, 3);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_add_tm(OBJECT(s), &quot;date=
&quot;, rtc_get_date);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -983,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base=
_year, qemu_irq intercept_irq)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static Property mc146818rtc_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_INT32(&quot;base_year&quot;, RTC=
State, base_year, 1980),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;iobase&quot;, RTCState, io_bas=
e, 0x70),<br>
<br>
I think this should be RTC_ISA_BASE?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT8(&quot;irq&quot;, RTCState,=
 isairq, RTC_ISA_IRQ),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_LOSTTICKPOLICY(&quot;lost_tick_p=
olicy&quot;, RTCState,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lost_tick_policy, LOST_TIC=
K_POLICY_DISCARD),<br>
&gt; @@ -1028,7 +1029,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml=
 *scope)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * does, even though qemu only responds to t=
he first two ports.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0crs =3D aml_resource_template();<br>
&gt; -=C2=A0 =C2=A0 aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_=
ISA_BASE,<br>
&gt; +=C2=A0 =C2=A0 aml_append(crs, aml_io(AML_DECODE16, s-&gt;io_base, s-&=
gt;io_base,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01, 0x08));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aml_append(crs, aml_irq_no_flags(s-&gt;isair=
q));<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc=
.h<br>
&gt; index 33d85753c0..1f7942a9f8 100644<br>
&gt; --- a/include/hw/rtc/mc146818rtc.h<br>
&gt; +++ b/include/hw/rtc/mc146818rtc.h<br>
&gt; @@ -26,6 +26,7 @@ struct RTCState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t cmos_data[128];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t cmos_index;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t isairq;<br>
&gt; +=C2=A0 =C2=A0 uint32_t io_base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t base_year;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t base_rtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t last_update;<br>
&gt; @@ -49,7 +50,6 @@ struct RTCState {<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define RTC_ISA_IRQ 8<br>
&gt; -#define RTC_ISA_BASE 0x70<br>
<br>
... and so you&#39;ll need to keep this.<br></blockquote><div><br></div><di=
v><div>My intention was indeed  to remove it since it is now redundant.=20
Keeping the constant public has the risk of using it instead of the user-co=
nfigurable QOM property which could cause bugs.<br></div>=C2=A0<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq intercept_irq);<br>
<br>
Otherwise:<br>
<br>
Reviewed-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande=
.co.uk" target=3D"_blank">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--0000000000006468ce05df960f69--

