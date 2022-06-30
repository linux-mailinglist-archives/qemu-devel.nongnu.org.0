Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC956216C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 19:42:42 +0200 (CEST)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6yBc-0000fi-7y
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 13:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.makarov@auriga.com>)
 id 1o6pmH-0002fo-NJ
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:43:57 -0400
Received: from hq-ms.auriga.com ([82.97.202.32]:23807 helo=hq-ms.auriga.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.makarov@auriga.com>)
 id 1o6pmD-0007yo-48
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:43:55 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Thu, 30 Jun 2022 11:32:37 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e]) by
 hq-ms1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e%3]) with mapi id
 15.02.1118.007; Thu, 30 Jun 2022 11:32:37 +0300
From: "Makarov, Andrey" <andrey.makarov@auriga.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrey Makarov
 <ph.makarov@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] Align Raspberry Pi DMA interrupts with Linux DTS
Thread-Topic: [PATCH] Align Raspberry Pi DMA interrupts with Linux DTS
Thread-Index: AQHYiAPxehH+/wbpaEaSvYpjlkJ5UK1hSToAgAZc9k8=
Date: Thu, 30 Jun 2022 08:32:37 +0000
Message-ID: <8c35a284e1554778913dbdabc778ddeb@auriga.com>
References: <20220624195206.671993-1-andrey.makarov@auriga.com>,
 <CAFEAcA_xQd45CGsmU-_C4LcTP6M+5PfkgKOJuk2SSBVDbm7pyg@mail.gmail.com>
In-Reply-To: <CAFEAcA_xQd45CGsmU-_C4LcTP6M+5PfkgKOJuk2SSBVDbm7pyg@mail.gmail.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.99.99.35]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-26984.002
x-tm-as-result: No-10--27.764500-8.000000
x-tmase-matchedrid: Kx0w2sAofbunvGCyBToTI8G0UNgaZpYqGsvgUMYAn4XX1cRD6e4P5Oz9
 H+EUMUMlwvycN7BK7oOSA0EIvbxG69PbvfOdnfkyRynTwl9ZYh6rBTvV3OvRK0/SsvQIy/ty1Bo
 bc6t6akVZxWJAjB5QN0+U1a88xcWQxFvclpniOPNkGI+vgRTxMMaGUx2flwhRLX3qyf3ewG9NI/
 YG2D7IknkKt0+zZSEF+Dq5+AB/HWLEQS2ecfkpF/8xygBCGWz0lDt5PQMgj03Q8Q3V2m2BEGVUa
 20Jme2iCz3G0AFPm0YCoXQy5etGZsocsHMOi3OljC0YuomXIYeok0CD5UnL6ySb8v8wgv7yUvT+
 tdwmjxumIZKCfuONFu4ATLndji0u7Ma9GYskMp/knMSTG9lH+ABiOiJvgsY/KEB1DAQzrLjZTAE
 szxrPVCyaCzkh9ijGCe9ZIsMf1HiJL0uyuozT/dnpx3VdbxC5pPMmjQJmXyHfrYpxwT811udpDV
 IGQ5u0IvrftAIhWmLK24Lrk00g7ms0SgWtnXgnD31hKrmrVKnxKR2kbb+f15yka59saICoN4J9o
 zUlDtYhEeKMopCw/f++gjOGfzBm5UcZtwNsCrr+xOhjarOnHrJRBnLixjoqpfzLa08EuFBGdOmu
 vU/opKwA38iC7I3I2QMBg0kvvsRKjxl7Kwa2dNS04ty4w53P
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--27.764500-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-26984.002
x-tm-snts-smtp: 365383182EAAA545E0DA54CA23F0AD3FCAB849FC336FC26D2F08E77B88149E702000:8
Content-Type: multipart/alternative;
 boundary="_000_8c35a284e1554778913dbdabc778ddebaurigacom_"
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
X-Mailman-Approved-At: Thu, 30 Jun 2022 13:36:38 -0400
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

--_000_8c35a284e1554778913dbdabc778ddebaurigacom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Is there any hardware documentation that says whether QEMU or
> the DTB is correct? The device tree is at best a secondary source...


No. It should have been in the "BCM2835 ARM Peripherals" datasheet but the =
appropriate "ARM peripherals interrupt table" there is nearly empty.


> You can't connect multiple qemu_irq lines to one like this.
> If the hardware behaves this way then you need to create
> an OR gate, wire all the lines from the devices to the
> OR gate inputs, and wire the OR gate output to the destination.


Thank you for this correction, I will send another version of patch.


Andrey Makarov,

Team Lead


________________________________
From: Peter Maydell <peter.maydell@linaro.org>
Sent: Sunday, June 26, 2022 1:16:18 PM
To: Andrey Makarov
Cc: qemu-devel@nongnu.org; Makarov, Andrey
Subject: Re: [PATCH] Align Raspberry Pi DMA interrupts with Linux DTS

On Fri, 24 Jun 2022 at 21:54, Andrey Makarov <ph.makarov@gmail.com> wrote:
>
> All Raspberry Pi models 1-3 (based on bcm2835) have
> Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):
>
>     /* dma channel 11-14 share one irq */
>
> which mismatched the Qemu model.
> In this patch channels 0--10 and 11--14 are handled separately.

Is there any hardware documentation that says whether QEMU or
the DTB is correct? The device tree is at best a secondary source...

> Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
> ---
>  hw/arm/bcm2835_peripherals.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 48538c9360..3d808b0e31 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -322,13 +322,21 @@ static void bcm2835_peripherals_realize(DeviceState=
 *dev, Error **errp)
>      memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
>
> -    for (n =3D 0; n <=3D 12; n++) {
> +    for (n =3D 0; n <=3D 10; n++) {
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
>                             qdev_get_gpio_in_named(DEVICE(&s->ic),
>                                                    BCM2835_IC_GPU_IRQ,
>                                                    INTERRUPT_DMA0 + n));
>      }
>
> +    /* According to DTS, dma channels 11-14 share one irq */
> +    for (n =3D 11; n <=3D 14; n++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
> +                           qdev_get_gpio_in_named(DEVICE(&s->ic),
> +                                                  BCM2835_IC_GPU_IRQ,
> +                                                  INTERRUPT_DMA0 + 11));

You can't connect multiple qemu_irq lines to one like this.
If the hardware behaves this way then you need to create
an OR gate, wire all the lines from the devices to the
OR gate inputs, and wire the OR gate output to the destination.

thanks
-- PMM

--_000_8c35a284e1554778913dbdabc778ddebaurigacom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p><font size=3D"2"><span style=3D"font-size:10pt">&gt; Is there any hardwa=
re documentation that says whether QEMU or<br>
&gt; the DTB is correct? The device tree is at best a secondary source...</=
span></font><br>
</p>
<p><br>
</p>
<p>No. It should have been in the &quot;BCM2835 ARM Peripherals&quot; datas=
heet but the appropriate &quot;ARM peripherals interrupt table&quot; there =
is nearly empty.<br>
</p>
<p><br>
</p>
<p>&gt;<font size=3D"2"><span style=3D"font-size:10pt"> You can't connect m=
ultiple qemu_irq lines to one like this.<br>
&gt; If the hardware behaves this way then you need to create<br>
&gt; an OR gate, wire all the lines from the devices to the<br>
&gt; OR gate inputs, and wire the OR gate output to the destination.</span>=
</font></p>
<p><br>
</p>
<p>Thank you for this correction, I will send another version of patch.</p>
<p><br>
</p>
<div id=3D"x_Signature">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,&quot;EmojiFont&quo=
t;,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,=
&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p></p>
<div>
<p style=3D"margin:0px"><b style=3D"font-size:12pt"><font size=3D"2" face=
=3D"Verdana">Andrey Makarov,</font></b><br>
</p>
<p style=3D"margin:0px"><b style=3D"font-size:12pt"><font size=3D"2" face=
=3D"Verdana">Team Lead</font></b></p>
</div>
<b></b><font face=3D"Verdana"></font><font size=3D"2"></font><br>
<p></p>
</div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Peter Maydell &lt;p=
eter.maydell@linaro.org&gt;<br>
<b>Sent:</b> Sunday, June 26, 2022 1:16:18 PM<br>
<b>To:</b> Andrey Makarov<br>
<b>Cc:</b> qemu-devel@nongnu.org; Makarov, Andrey<br>
<b>Subject:</b> Re: [PATCH] Align Raspberry Pi DMA interrupts with Linux DT=
S</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Fri, 24 Jun 2022 at 21:54, Andrey Makarov &lt;p=
h.makarov@gmail.com&gt; wrote:<br>
&gt;<br>
&gt; All Raspberry Pi models 1-3 (based on bcm2835) have<br>
&gt; Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi &#43;25):<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; /* dma channel 11-14 share one irq */<br>
&gt;<br>
&gt; which mismatched the Qemu model.<br>
&gt; In this patch channels 0--10 and 11--14 are handled separately.<br>
<br>
Is there any hardware documentation that says whether QEMU or<br>
the DTB is correct? The device tree is at best a secondary source...<br>
<br>
&gt; Signed-off-by: Andrey Makarov &lt;andrey.makarov@auriga.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; hw/arm/bcm2835_peripherals.c | 10 &#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;-<br>
&gt;&nbsp; 1 file changed, 9 insertions(&#43;), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals=
.c<br>
&gt; index 48538c9360..3d808b0e31 100644<br>
&gt; --- a/hw/arm/bcm2835_peripherals.c<br>
&gt; &#43;&#43;&#43; b/hw/arm/bcm2835_peripherals.c<br>
&gt; @@ -322,13 &#43;322,21 @@ static void bcm2835_peripherals_realize(Devi=
ceState *dev, Error **errp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_add_subregion(&amp;s-&gt;p=
eri_mr, DMA15_OFFSET,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;=
s-&gt;dma), 1));<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp; for (n =3D 0; n &lt;=3D 12; n&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; for (n =3D 0; n &lt;=3D 10; n&#43;&#43;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_i=
rq(SYS_BUS_DEVICE(&amp;s-&gt;dma), n,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; qdev_get_gpio_in_named(DEVICE(&amp;s-&gt;ic),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; BCM2835_IC_GPU_IRQ,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; INTERRUPT_DMA0 &#43; n));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; /* According to DTS, dma channels 11-14 share =
one irq */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; for (n =3D 11; n &lt;=3D 14; n&#43;&#43;) {<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_irq(SYS=
_BUS_DEVICE(&amp;s-&gt;dma), n,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; qdev_get_gpio_in_named(DEVICE(&amp;s-&gt;ic),<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; BCM2835_IC_GPU_IRQ,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; INTERRUPT_DMA0 &#43; 11));<br>
<br>
You can't connect multiple qemu_irq lines to one like this.<br>
If the hardware behaves this way then you need to create<br>
an OR gate, wire all the lines from the devices to the<br>
OR gate inputs, and wire the OR gate output to the destination.<br>
<br>
thanks<br>
-- PMM<br>
</div>
</span></font>
</body>
</html>

--_000_8c35a284e1554778913dbdabc778ddebaurigacom_--

