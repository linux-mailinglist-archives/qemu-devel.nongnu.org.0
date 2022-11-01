Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D061B6147CB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 11:38:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opof0-000672-S8; Tue, 01 Nov 2022 06:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opoer-00064V-7h; Tue, 01 Nov 2022 06:38:13 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opoep-0000yE-Ag; Tue, 01 Nov 2022 06:38:12 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id 128so4403053vse.6;
 Tue, 01 Nov 2022 03:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1NpV/PD7OJXXInIh+PFTlNqLL0GXD0Akwp8+w+qk9g=;
 b=fpSX8+o1bwcU3ELWYCTQBpVUC+Did6dL9d1JmeB+2FEP2ofWDcsnAQcc31m7gT8SOZ
 ud0lcQ4CdPJVKx7E4RLaURIaQuO5SEX6JuoylvSEQKywXQX9wDDq9zf/gjbHApwMbMrY
 hcI3NZp0fDcPCQyN/QLYwGxf3gR1ZM147FFsUjXXSSlTlk73np9fGvoZvB9pc/JDuLGn
 YJgRVhMyDrNsjyaa9bb8/gky71f0Pgjau99zJAHf/v8Cyw2k/eHwkNtNU5kzV2vyZbkt
 54mLjAHfQhHZJgrrwLzCUyo8pXBKNgBzGdpx0SA3sqJdN/2fI3a+KGmRG+SqU93zmqsb
 ddCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z1NpV/PD7OJXXInIh+PFTlNqLL0GXD0Akwp8+w+qk9g=;
 b=bRiBeX7PuiMw3DN7ierOGNEryySxu55n7umOTIMOtdubrN52tEx8blP2yFQZV6O6wh
 6iokd7eU38BEegV1QEPzk8E+UPSkgEVT/kZ47S5AgLwm7rLIO+KIhIRsMjeoNk+H+LuF
 Z3nWPZ+ZB5OkD0q6DqXPJRjMrH4NUHCMWw813U1XrLU6cwZOHq9UyWnIWoHHAzbPmrTo
 WM7Y0fDuNczeanTa52SYon2kjTpIb6oRzN3LTASeKBPdh00KLAx5QPkhK6s8/QqnzpTY
 uv6oBVnf2wyjHC2IFV/WEDIAZ1SQR7TY4ymiD0NopOALmXJHGfTqDNHTkd02MbZ9Aiy/
 xDhg==
X-Gm-Message-State: ACrzQf1neNZiuIGP8S8kOBE87q6CmTxRZ8eqgsgLAruElbSn2CoEPAWR
 i0X+7A4SaKvs4aYCAOe4tnCMtLJw4uhnEd62uHQ=
X-Google-Smtp-Source: AMsMyM6vRtrHf2iMtXu3pnx9Mi6yk28jZAUGxaabWV+tQq7gSEaKgRAbootQVQU3UulFDFgYJvX/09BF1k90ONI1SPY=
X-Received: by 2002:a67:e91a:0:b0:3ad:1645:cf0 with SMTP id
 c26-20020a67e91a000000b003ad16450cf0mr187385vso.47.1667299088423; Tue, 01 Nov
 2022 03:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221031115402.91912-1-philmd@linaro.org>
 <20221031115402.91912-7-philmd@linaro.org>
 <3b1b2608-76c5-3376-2c15-792ccbf623dd@linaro.org>
 <a8b99460-ce81-1fea-764b-843c290f9810@linaro.org>
In-Reply-To: <a8b99460-ce81-1fea-764b-843c290f9810@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 1 Nov 2022 11:37:52 +0100
Message-ID: <CAG4p6K4o3R+70EsTy7gsRmoaXZYzugQaCpRzeF2-EsAvEhLzGA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] hw/ppc/e500: Add Freescale eSDHC to e500plat
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e65c4c05ec665196"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e65c4c05ec665196
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 4:19 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> On 31/10/22 16:12, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 31/10/22 12:54, Philippe Mathieu-Daud=C3=A9 wrote:
> >> From: Bernhard Beschow <shentey@gmail.com>
> >>
> >> Adds missing functionality to e500plat machine which increases the
> >> chance of given "real" firmware images to access SD cards.
> >>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> Message-Id: <20221018210146.193159-8-shentey@gmail.com>
> >> [PMD: Simplify using create_unimplemented_device("esdhc")]
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >>   docs/system/ppc/ppce500.rst | 12 ++++++++++
> >>   hw/ppc/Kconfig              |  2 ++
> >>   hw/ppc/e500.c               | 48 +++++++++++++++++++++++++++++++++++=
+-
> >>   hw/ppc/e500.h               |  1 +
> >>   hw/ppc/e500plat.c           |  1 +
> >>   5 files changed, 63 insertions(+), 1 deletion(-)
> >
> >> @@ -992,6 +1018,26 @@ void ppce500_init(MachineState *machine)
> >>       i2c =3D (I2CBus *)qdev_get_child_bus(dev, "i2c");
> >>       i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
> >> +    /* eSDHC */
> >> +    if (pmc->has_esdhc) {
> >> +        uint64_t sdhci_regsize;
> >> +
> >> +        dev =3D qdev_new(TYPE_SYSBUS_SDHCI);
> >> +        /*
> >> +         * Compatible with:
> >> +         * - SD Host Controller Specification Version 2.0 Part A2
> >> +         */
> >> +        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
> >> +        s =3D SYS_BUS_DEVICE(dev);
> >> +        sysbus_realize_and_unref(s, &error_fatal);
> >> +        sysbus_mmio_map(s, 0, pmc->ccsrbar_base +
> >> MPC85XX_ESDHC_REGS_OFFSET);
> >> +        sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev,
> >> MPC85XX_ESDHC_IRQ));
> >> +        sdhci_regsize =3D memory_region_size(sysbus_mmio_get_region(s=
,
> >> 0));
> >> +        create_unimplemented_device("esdhc",
> >> +                                    pmc->ccsrbar_base
> >> +                                    + MPC85XX_ESDHC_REGS_OFFSET +
> >> sdhci_regsize,
> >> +                                    MPC85XX_ESDHC_REGS_SIZE -
> >> sdhci_regsize);
> >> +    }
> >
> > Since the UNIMP device has lower priority, we can simplify as:
> >
> > if (pmc->has_esdhc) {
> >      create_unimplemented_device("esdhc",
> >                                  pmc->ccsrbar_base
> >                                  + MPC85XX_ESDHC_REGS_OFFSET,
> >                                  MPC85XX_ESDHC_REGS_SIZE);
> >
> >      dev =3D qdev_new(TYPE_SYSBUS_SDHCI);
> >      /*
> >       * Compatible with:
> >       * - SD Host Controller Specification Version 2.0 Part A2
> >       */
> >      qdev_prop_set_uint8(dev, "sd-spec-version", 2);
> >      s =3D SYS_BUS_DEVICE(dev);
> >      sysbus_realize_and_unref(s, &error_fatal);
> >      sysbus_mmio_map(s, 0, pmc->ccsrbar_base +
> MPC85XX_ESDHC_REGS_OFFSET);
>
  memory_region_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,
                              sysbus_mmio_get_region(s, 0));

seems to be equivalent, works as well and mimics other devices, e.g. i2c.
So perhaps use that?

>
> So the SDHCI is mapped inside the CCSR block. Better would be to map it
> into ccsr_addr_space.
>

Doesn't the above code map it into ccsr_addr_space?

>
> I presume the CCSR is the device responsible of endian swapping, but TBH
> I have no clue about this board.
>
>

--000000000000e65c4c05ec665196
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 31, 2022 at 4:19 PM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 31/10/22 16:12, Philippe Mathieu-Daud=C3=A9=
 wrote:<br>
&gt; On 31/10/22 12:54, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; From: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" ta=
rget=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Adds missing functionality to e500plat machine which increases the=
<br>
&gt;&gt; chance of given &quot;real&quot; firmware images to access SD card=
s.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmai=
l.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt; Message-Id: &lt;<a href=3D"mailto:20221018210146.193159-8-shentey@=
gmail.com" target=3D"_blank">20221018210146.193159-8-shentey@gmail.com</a>&=
gt;<br>
&gt;&gt; [PMD: Simplify using create_unimplemented_device(&quot;esdhc&quot;=
)]<br>
&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 docs/system/ppc/ppce500.rst | 12 ++++++++++<br>
&gt;&gt; =C2=A0 hw/ppc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++<br>
&gt;&gt; =C2=A0 hw/ppc/e500.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 48 ++++++++++++++++++++++++++++++=
++++++-<br>
&gt;&gt; =C2=A0 hw/ppc/e500.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; =C2=A0 hw/ppc/e500plat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; =C2=A0 5 files changed, 63 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt;&gt; @@ -992,6 +1018,26 @@ void ppce500_init(MachineState *machine)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c =3D (I2CBus *)qdev_get_child_bu=
s(dev, &quot;i2c&quot;);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_slave_create_simple(i2c, &quot;=
ds1338&quot;, RTC_REGS_OFFSET);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /* eSDHC */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (pmc-&gt;has_esdhc) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t sdhci_regsize=
;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev =3D qdev_new(TYPE_=
SYSBUS_SDHCI);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Compatible wit=
h:<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * - SD Host Cont=
roller Specification Version 2.0 Part A2<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qdev_prop_set_uint8(de=
v, &quot;sd-spec-version&quot;, 2);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s =3D SYS_BUS_DEVICE(d=
ev);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysbus_realize_and_unr=
ef(s, &amp;error_fatal);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysbus_mmio_map(s, 0, =
pmc-&gt;ccsrbar_base + <br>
&gt;&gt; MPC85XX_ESDHC_REGS_OFFSET);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysbus_connect_irq(s, =
0, qdev_get_gpio_in(mpicdev, <br>
&gt;&gt; MPC85XX_ESDHC_IRQ));<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdhci_regsize =3D memo=
ry_region_size(sysbus_mmio_get_region(s, <br>
&gt;&gt; 0));<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 create_unimplemented_d=
evice(&quot;esdhc&quot;,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm=
c-&gt;ccsrbar_base<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + =
MPC85XX_ESDHC_REGS_OFFSET + <br>
&gt;&gt; sdhci_regsize,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MP=
C85XX_ESDHC_REGS_SIZE - <br>
&gt;&gt; sdhci_regsize);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt; <br>
&gt; Since the UNIMP device has lower priority, we can simplify as:<br>
&gt; <br>
&gt; if (pmc-&gt;has_esdhc) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 create_unimplemented_device(&quot;esdhc&quot;=
,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmc-&gt;ccsrbar_base<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + MPC85XX_ESDHC_REGS_OFFSE=
T,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MPC85XX_ESDHC_REGS_SIZE);<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 dev =3D qdev_new(TYPE_SYSBUS_SDHCI);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 * Compatible with:<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 * - SD Host Controller Specification Ve=
rsion 2.0 Part A2<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 qdev_prop_set_uint8(dev, &quot;sd-spec-versio=
n&quot;, 2);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 s =3D SYS_BUS_DEVICE(dev);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 sysbus_realize_and_unref(s, &amp;error_fatal)=
;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 sysbus_mmio_map(s, 0, pmc-&gt;ccsrbar_base + =
MPC85XX_ESDHC_REGS_OFFSET);<br></blockquote><div><div><div>=C2=A0 memory_re=
gion_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_get_region(s, 0));<br></div><div><br><=
/div><div>seems to be equivalent, works as well and mimics other devices, e=
.g. i2c. So perhaps use that?</div></div></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
So the SDHCI is mapped inside the CCSR block. Better would be to map it <br=
>
into ccsr_addr_space.<br></blockquote><div><br></div><div>Doesn&#39;t the a=
bove code map it into ccsr_addr_space?<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
I presume the CCSR is the device responsible of endian swapping, but TBH<br=
>
I have no clue about this board.<br>
<br>
</blockquote></div></div>

--000000000000e65c4c05ec665196--

