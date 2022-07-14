Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FA574AFB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:43:13 +0200 (CEST)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBwJN-0002zo-4O
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.makarov@auriga.com>)
 id 1oBwGH-0001LX-02
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:40:01 -0400
Received: from hq-ms.auriga.com ([82.97.202.32]:42061 helo=hq-ms.auriga.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.makarov@auriga.com>)
 id 1oBwGC-0003LB-JB
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:39:59 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Thu, 14 Jul 2022 13:33:24 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e]) by
 hq-ms1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e%3]) with mapi id
 15.02.1118.007; Thu, 14 Jul 2022 13:33:23 +0300
From: "Makarov, Andrey" <andrey.makarov@auriga.com>
To: =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, "Andrey
 Makarov" <ph.makarov@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] Align Raspberry Pi DMA interrupts with Linux DTS
Thread-Topic: [PATCH v2] Align Raspberry Pi DMA interrupts with Linux DTS
Thread-Index: AQHYldx5hY7Jitw1OkuzcaxtTI7hIK17JBSAgAJ74JI=
Date: Thu, 14 Jul 2022 10:33:23 +0000
Message-ID: <332065c3ddc8430dab010c51d5532b42@auriga.com>
References: <20220712104500.143538-1-andrey.makarov@auriga.com>,
 <0a39c59d-05a0-e792-3ad8-f3a148df1a6f@amsat.org>
In-Reply-To: <0a39c59d-05a0-e792-3ad8-f3a148df1a6f@amsat.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [37.204.56.188]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-27014.002
x-tm-as-result: No-10--28.345300-8.000000
x-tmase-matchedrid: 0+daXaNUWRWnvGCyBToTI8G0UNgaZpYqGsvgUMYAn4UWzPTbxO7R+tIS
 YzBUt2RaXVsEWVqYqaivJcrLMYkA70UuXkWTSi/R30kDaWZBE1RU4sxFq6igEUqa6TyhyXvP8LT
 LO3Tg0+vAlOfe8T5MfPLlvc8IX9b4Vd0YPTyDIup+njGZQKtC70+crEA4+nhZcJquQxzIpMAMj+
 7aixseRiavtNrR+/mj+bKorgB1pKIrJ58LuZWFYf8xygBCGWz0bG5kq/x3d5jWeQtrcncLfTw/V
 fkjVS61bqm1oygU5OZAB+NZtz6PsZrFf6cTuZsvSXIxnjwYrBRvQ1w4VLB58iGbzft4i3vND/1+
 fhTAwV5HeQQDmUpegC+8nlUa9l8AW/LVFLmRDI2zRPQ8T4oe5WCHSksKltZjQaizph4jN8MKezg
 PQdcKnod2b/kA4zInI2xNLY3S/HGuQJJrm28HTRFbgtHjUWLytNPXK3NCnaQDBQ+XBh4YJSLm4/
 WzmuzLCz3G0AFPm0ZNQHk6Ahy1lzl8kSL3NFxDPKN38CLPK0Fr2qJoNIuCjToUdFbHYUawjdx5F
 dhImgMi+t+0AiFaYvL3NxFKQpq1HYnnQdbx7N4APmNKDWsW0DexY0PszFIe6Mw4RnkAvRLT0PpH
 DbMis4cKE714ek4cK/VPzqYiD+ZgNUdcYnHhOyyEakGwrofuujjYN2zf/SqbKItl61J/yVF8tpI
 BUO3K05To8mUsSeKD2eCD558MvR86ZLwGwbjWcs7swePL6ovtMQfQSTViU42sQs6mJm/e
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--28.345300-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-27014.002
x-tm-snts-smtp: 45EFD193C238C430E8EFBB60FF11755C22FDFECC37A45F459F71D1F7973D00702000:8
Content-Type: multipart/alternative;
 boundary="_000_332065c3ddc8430dab010c51d5532b42aurigacom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=82.97.202.32;
 envelope-from=andrey.makarov@auriga.com; helo=hq-ms.auriga.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--_000_332065c3ddc8430dab010c51d5532b42aurigacom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Phil,


Agreed, for v3 I selected naming with "orgated" instead of "shared" because=
 there is already IRQ line #15 that is called shared which seems like a com=
pletely different thing and it's "not used" according to DTS (arch/arm/boot=
/dts/bcm2835-common.dtsi):


                        interrupts =3D <1 16>,
                                     <1 17>,
                                     <1 18>,
                                     <1 19>,
                                     <1 20>,
                                     <1 21>,
                                     <1 22>,
                                     <1 23>,
                                     <1 24>,
                                     <1 25>,
                                     <1 26>,

                                     /* dma channel 11-14 share one irq */
                                     <1 27>,
                                     <1 27>,
                                     <1 27>,
                                     <1 27>,
                                     /* unused shared irq for all channels =
*/
                                     <1 28>;


> So before we could trigger IRQ #12, and now it is unbound?


Yeah, well, DMA IRQ #12 is bound to the same line as #11, but DMA IRQ #15 a=
ka IC IRQ # INTERRUPT_DMA0+12=3D16+12=3D28 is not bound anymore indeed (the=
 last one in the list above). Previously channels 0--12 were bound linearly=
 and it was unclear what  this hard-coded "12" is. (This 12 is never mentio=
ned anywhere besides Qemu.) So actually 3 DMA IRQ #13-15 were unbound befor=
e.


I omitted this last DMA IRQ #15 (IC IRQ #28) =97 it clearly has some specia=
l status in the spec, e.g. it has a different block of DMA address, but it'=
s not described otherwise. I assumed that "unused" means off.


Best regards,

Andrey Makarov

Software Team Lead

Auriga LLC


________________________________
From: Philippe Mathieu-Daud=E9 <philippe.mathieu.daude@gmail.com> on behalf=
 of Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Sent: Wednesday, July 13, 2022 1:45:13 AM
To: Andrey Makarov; qemu-devel@nongnu.org
Cc: Makarov, Andrey
Subject: Re: [PATCH v2] Align Raspberry Pi DMA interrupts with Linux DTS

Hi Andrey,

On 12/7/22 12:45, Andrey Makarov wrote:
> There is nothing in the specs on DMA engine interrupt lines: it should ha=
ve
> been in the "BCM2835 ARM Peripherals" datasheet but the appropriate
> "ARM peripherals interrupt table" (p.113) is nearly empty.
>
> All Raspberry Pi models 1-3 (based on bcm2835) have
> Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):
>
>      /* dma channel 11-14 share one irq */
>
> This information is repeated in the driver code
> (drivers/dma/bcm2835-dma.c +1344):
>
>      /*
>       * in case of channel >=3D 11
>       * use the 11th interrupt and that is shared
>       */
>
> In this patch channels 0--10 and 11--14 are handled separately.
>
> In version v2:
>
> 1) an OR-gate is added according to review
> 2) a simple qtest is added for testing DMA & its interrupts
>
> Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
> ---
>   hw/arm/bcm2835_peripherals.c         |  21 +++++-
>   include/hw/arm/bcm2835_peripherals.h |   2 +
>   tests/qtest/bcm2835-dma-test.c       | 106 +++++++++++++++++++++++++++
>   tests/qtest/meson.build              |   3 +-
>   4 files changed, 130 insertions(+), 2 deletions(-)
>   create mode 100644 tests/qtest/bcm2835-dma-test.c
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 48538c9360..5a9c472b5a 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -101,6 +101,11 @@ static void bcm2835_peripherals_init(Object *obj)
>       /* DMA Channels */
>       object_initialize_child(obj, "dma", &s->dma, TYPE_BCM2835_DMA);
>
> +    object_initialize_child(obj, "dma-11-14-irq-orgate",

Maybe name "shared-dma-irq-orgate"?

> +                            &s->dma_11_14_irq_orgate, TYPE_OR_IRQ);

Similarly 'shared_dma' or 'orgated-dma'? But not _11_14_.

> +    object_property_set_int(OBJECT(&s->dma_11_14_irq_orgate), "num-lines=
", 4,

Instead of using a magic number:

#define BCM2835_SHARED_DMA_COUNT 4

> +                            &error_abort);
> +
>       object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
>                                      OBJECT(&s->gpu_bus_mr));
>
> @@ -322,13 +327,27 @@ static void bcm2835_peripherals_realize(DeviceState=
 *dev, Error **errp)
>       memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
>                   sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
>
> -    for (n =3D 0; n <=3D 12; n++) {
> +    for (n =3D 0; n <=3D 10; n++) {

So before we could trigger IRQ #12, and now it is unbound?

Also:

#define BCM2835_DMA_CHANNELS 10

>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
>                              qdev_get_gpio_in_named(DEVICE(&s->ic),
>                                                     BCM2835_IC_GPU_IRQ,
>                                                     INTERRUPT_DMA0 + n));
>       }
>
> +    /* According to DTS, dma channels 11-14 share one irq */
> +    if (!qdev_realize(DEVICE(&s->dma_11_14_irq_orgate), NULL, errp)) {
> +        return;
> +    }
> +    for (n =3D 11; n <=3D 14; n++) {

Logic simplified if you use the [0 .. BCM2835_SHARED_DMA_COUNT-1] range:

   for (n =3D 0; n < BCM2835_SHARED_DMA_COUNT; n++) {

> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,

     BCM2835_DMA_CHANNELS + 1 + n,

> +                           qdev_get_gpio_in(DEVICE(&s->dma_11_14_irq_org=
ate),
> +                                            n - 11));

     n)

> +    }
> +    qdev_connect_gpio_out(DEVICE(&s->dma_11_14_irq_orgate), 0,
> +                          qdev_get_gpio_in_named(DEVICE(&s->ic),
> +                                                 BCM2835_IC_GPU_IRQ,
> +                                                 INTERRUPT_DMA0 + 11));
> +
>       /* THERMAL */
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
>           return;
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm283=
5_peripherals.h
> index d864879421..79e2f2771a 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -17,6 +17,7 @@
>   #include "hw/char/bcm2835_aux.h"
>   #include "hw/display/bcm2835_fb.h"
>   #include "hw/dma/bcm2835_dma.h"
> +#include "hw/or-irq.h"
>   #include "hw/intc/bcm2835_ic.h"
>   #include "hw/misc/bcm2835_property.h"
>   #include "hw/misc/bcm2835_rng.h"
> @@ -55,6 +56,7 @@ struct BCM2835PeripheralState {
>       BCM2835AuxState aux;
>       BCM2835FBState fb;
>       BCM2835DMAState dma;
> +    qemu_or_irq dma_11_14_irq_orgate;
>       BCM2835ICState ic;
>       BCM2835PropertyState property;
>       BCM2835RngState rng;

Regards,

Phil.

--_000_332065c3ddc8430dab010c51d5532b42aurigacom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<meta content=3D"text/html; charset=3DUTF-8">
<div dir=3D"ltr">Hi Phil,
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; co=
lor: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, &quot;Emoji=
Font&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, Noto=
ColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSy=
mbols;">
<p><br>
</p>
<p>Agreed, for v3 I selected naming with &quot;orgated&quot; instead of &qu=
ot;shared&quot; because there is already IRQ line #15 that is called shared=
 which seems like a completely different thing and it's &quot;not used&quot=
; according to DTS (<span>arch/arm/boot/dts/bcm2835-common.dtsi</span>):<br=
>
</p>
<p><br>
</p>
<p></p>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interr=
upts =3D &lt;1 16&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 17=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 18=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 19=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 20=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 21=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 22=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 23=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 24=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 25=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 26=
&gt;,<br>
</div>
<p></p>
<p></p>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
dma channel 11-14 share one irq */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 27=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 27=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 27=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 27=
&gt;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* unuse=
d shared irq for all channels */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;1 28=
&gt;;<br>
</div>
<p></p>
<p><br>
</p>
<p>&gt; <font size=3D"2"><span style=3D"font-size:10pt">So before we could =
trigger IRQ #12, and now it is unbound?</span></font><br>
</p>
<p><br>
</p>
<p>Yeah, well, DMA IRQ #12 is bound to the same line as #11, but DMA IRQ #1=
5 aka IC IRQ # INTERRUPT_DMA0&#43;12=3D16&#43;12=3D28 is not bound anymore =
indeed (the last one in the list above). Previously channels 0--12 were bou=
nd linearly and it was unclear what&nbsp; this hard-coded
 &quot;12&quot; is. (This 12 is never mentioned anywhere besides Qemu.)&nbs=
p;<span>So actually 3 DMA IRQ #13-15 were unbound before.
</span></p>
<p><br>
</p>
<p>I omitted this last DMA IRQ #15 (IC IRQ #28) =97 it clearly has some spe=
cial status in the spec, e.g. it has a different block of DMA address, but =
it's not described otherwise. I assumed that &quot;unused&quot; means off.<=
br>
</p>
<p><br>
</p>
<p></p>
<div>
<p><span>Best regards</span><span>,</span></p>
<p><strong>Andrey Makarov </strong></p>
<p>Software Team Lead</p>
Auriga LLC</div>
<br>
<p></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Philippe Mathieu-Da=
ud=E9 &lt;philippe.mathieu.daude@gmail.com&gt; on behalf of Philippe Mathie=
u-Daud=E9 &lt;f4bug@amsat.org&gt;<br>
<b>Sent:</b> Wednesday, July 13, 2022 1:45:13 AM<br>
<b>To:</b> Andrey Makarov; qemu-devel@nongnu.org<br>
<b>Cc:</b> Makarov, Andrey<br>
<b>Subject:</b> Re: [PATCH v2] Align Raspberry Pi DMA interrupts with Linux=
 DTS</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText">Hi Andrey,<br>
<br>
On 12/7/22 12:45, Andrey Makarov wrote:<br>
&gt; There is nothing in the specs on DMA engine interrupt lines: it should=
 have<br>
&gt; been in the &quot;BCM2835 ARM Peripherals&quot; datasheet but the appr=
opriate<br>
&gt; &quot;ARM peripherals interrupt table&quot; (p.113) is nearly empty.<b=
r>
&gt; <br>
&gt; All Raspberry Pi models 1-3 (based on bcm2835) have<br>
&gt; Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi &#43;25):<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* dma channel 11-14 share one irq */<br=
>
&gt; <br>
&gt; This information is repeated in the driver code<br>
&gt; (drivers/dma/bcm2835-dma.c &#43;1344):<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * in case of channel &gt;=3D 11<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * use the 11th interrupt and that =
is shared<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; <br>
&gt; In this patch channels 0--10 and 11--14 are handled separately.<br>
&gt; <br>
&gt; In version v2:<br>
&gt; <br>
&gt; 1) an OR-gate is added according to review<br>
&gt; 2) a simple qtest is added for testing DMA &amp; its interrupts<br>
&gt; <br>
&gt; Signed-off-by: Andrey Makarov &lt;andrey.makarov@auriga.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; hw/arm/bcm2835_peripherals.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; |&nbsp; 21 &#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp;&nbsp; include/hw/arm/bcm2835_peripherals.h |&nbsp;&nbsp; 2 &#43;=
<br>
&gt;&nbsp;&nbsp; tests/qtest/bcm2835-dma-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 106 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
<br>
&gt;&nbsp;&nbsp; tests/qtest/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 &#43;-<br>
&gt;&nbsp;&nbsp; 4 files changed, 130 insertions(&#43;), 2 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 tests/qtest/bcm2835-dma-test.c<br>
&gt; <br>
&gt; diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals=
.c<br>
&gt; index 48538c9360..5a9c472b5a 100644<br>
&gt; --- a/hw/arm/bcm2835_peripherals.c<br>
&gt; &#43;&#43;&#43; b/hw/arm/bcm2835_peripherals.c<br>
&gt; @@ -101,6 &#43;101,11 @@ static void bcm2835_peripherals_init(Object *=
obj)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* DMA Channels */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_initialize_child(obj, &quot=
;dma&quot;, &amp;s-&gt;dma, TYPE_BCM2835_DMA);<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; object_initialize_child(obj, &quot;dma-11-14-i=
rq-orgate&quot;,<br>
<br>
Maybe name &quot;shared-dma-irq-orgate&quot;?<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &amp;s-&gt;dma_11_14_irq_orgate, TYPE_OR_IRQ);<br>
<br>
Similarly 'shared_dma' or 'orgated-dma'? But not _11_14_.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; object_property_set_int(OBJECT(&amp;s-&gt;dma_=
11_14_irq_orgate), &quot;num-lines&quot;, 4,<br>
<br>
Instead of using a magic number:<br>
<br>
#define BCM2835_SHARED_DMA_COUNT 4<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &amp;error_abort);<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_property_add_const_link(OBJ=
ECT(&amp;s-&gt;dma), &quot;dma-mr&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; OBJECT(&amp;s-&gt;gpu_bus_mr));<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -322,13 &#43;327,27 @@ static void bcm2835_peripherals_realize(Devi=
ceState *dev, Error **errp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_add_subregion(&amp;s=
-&gt;peri_mr, DMA15_OFFSET,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_mmio_get_region(SYS_BUS_DEVICE=
(&amp;s-&gt;dma), 1));<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp; for (n =3D 0; n &lt;=3D 12; n&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; for (n =3D 0; n &lt;=3D 10; n&#43;&#43;) {<br>
<br>
So before we could trigger IRQ #12, and now it is unbound?<br>
<br>
Also:<br>
<br>
#define BCM2835_DMA_CHANNELS 10<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_con=
nect_irq(SYS_BUS_DEVICE(&amp;s-&gt;dma), n,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; qdev_get_gpio_in_named(DEVICE(&amp;s-&gt;ic),<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; BCM2835_IC_GPU_IRQ,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; INTERRUPT_DMA0 &#43; n));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; /* According to DTS, dma channels 11-14 share =
one irq */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; if (!qdev_realize(DEVICE(&amp;s-&gt;dma_11_14_=
irq_orgate), NULL, errp)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; for (n =3D 11; n &lt;=3D 14; n&#43;&#43;) {<br=
>
<br>
Logic simplified if you use the [0 .. BCM2835_SHARED_DMA_COUNT-1] range:<br=
>
<br>
&nbsp;&nbsp; for (n =3D 0; n &lt; BCM2835_SHARED_DMA_COUNT; n&#43;&#43;) {<=
br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_irq(SYS=
_BUS_DEVICE(&amp;s-&gt;dma), n,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; BCM2835_DMA_CHANNELS &#43; 1 &#43; n,<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; qdev_get_gpio_in(DEVICE(&amp;s-&gt;dma_11_14_irq_orgate),<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n - 11));<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; n)<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; qdev_connect_gpio_out(DEVICE(&amp;s-&gt;dma_11=
_14_irq_orgate), 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; qdev_get_gpio_in_named(DEVICE(&amp;s-&gt;ic),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; B=
CM2835_IC_GPU_IRQ,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I=
NTERRUPT_DMA0 &#43; 11));<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* THERMAL */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!sysbus_realize(SYS_BUS_DEVICE=
(&amp;s-&gt;thermal), errp)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br=
>
&gt; diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm=
2835_peripherals.h<br>
&gt; index d864879421..79e2f2771a 100644<br>
&gt; --- a/include/hw/arm/bcm2835_peripherals.h<br>
&gt; &#43;&#43;&#43; b/include/hw/arm/bcm2835_peripherals.h<br>
&gt; @@ -17,6 &#43;17,7 @@<br>
&gt;&nbsp;&nbsp; #include &quot;hw/char/bcm2835_aux.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;hw/display/bcm2835_fb.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;hw/dma/bcm2835_dma.h&quot;<br>
&gt; &#43;#include &quot;hw/or-irq.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;hw/intc/bcm2835_ic.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;hw/misc/bcm2835_property.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;hw/misc/bcm2835_rng.h&quot;<br>
&gt; @@ -55,6 &#43;56,7 @@ struct BCM2835PeripheralState {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BCM2835AuxState aux;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BCM2835FBState fb;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BCM2835DMAState dma;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; qemu_or_irq dma_11_14_irq_orgate;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BCM2835ICState ic;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BCM2835PropertyState property;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BCM2835RngState rng;<br>
<br>
Regards,<br>
<br>
Phil.<br>
</div>
</span></font></div>
</body>
</html>

--_000_332065c3ddc8430dab010c51d5532b42aurigacom_--

