Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D296BA174
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 22:30:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcCD1-0007Ix-FC; Tue, 14 Mar 2023 17:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pcCCz-0007I3-06; Tue, 14 Mar 2023 17:29:25 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pcCCv-0007Uv-9k; Tue, 14 Mar 2023 17:29:23 -0400
Received: by mail-yb1-xb30.google.com with SMTP id cj14so6111960ybb.12;
 Tue, 14 Mar 2023 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678829360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UqpObZsKxcTcw/rTPmzZEjwDYKSA3t2Pke/8S5EfUk0=;
 b=owC9sgKkbXazrBPrQB+xDltQNLudqfDxIvmzXIclIVAcAkTNwip3XcMgMgjrTo8bmH
 gGTvmoJXtUzBb5ZYy6fTASKr79R0tL3g63uNbUWCQTvsbfskBiveUjW/urewYybdiIJC
 VZtxeEDDLZ2gJoYSCb2aBYdIqDbojuRvkMNr2Yva6NUm29eHBA8xWw7IbzRUilSM8iTf
 fbMW5h7oZelPU8+dmQsWq99JEgOwAFmetBw7BZpOoTwXCnCAwkzoWp+WkGs2aCHAhTbA
 5KvqfsOzKQqysPM1/JEdsazxsT/yJuJTFeazlaWB4PJ5wzQKVWS0+KrUIOTde71IQOex
 Pa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678829360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UqpObZsKxcTcw/rTPmzZEjwDYKSA3t2Pke/8S5EfUk0=;
 b=qwKHtfzykD4ugOk3Gv4kULqq2A5vVXc+4nTO+upoHRviyDtu/r78LfJW8WlmoQUKnH
 Fq5XsjQ7uWX6ixs+z1wsihkvxTllKdUfemfRGxgd/IPIkdFkEK7rAkDRuoHSNdtwwbQw
 uPcLJ171IlCpcK21dRj+bea94iiZ+j696nhKM498r8j4Iw5tZLouDVSh1xG+Fro1l8Au
 LEjw4cYNB/Lw78nSTCgCBi5mrfCVm8n8OalquGttHfN7XXfG3wrZSc8tLYzoYoTU2Q+t
 /tg3kWyGOyW6EB6CHdedjBek3M0mDDi2m313RzUG4CklGroPvLErA92o3cO0Ehv6Ne1/
 bzvg==
X-Gm-Message-State: AO0yUKWNUPPIbsfsrGd8qzj2RtbUuMeWjIOWkREvX8n/y9nZkiFS2AgH
 6+VXj80LtnjQjXxPN2zhZcrdchCpE5CfMbmo22gOm/4V
X-Google-Smtp-Source: AK7set9ZU4T54+IV11Vg9l04s1oMuq2LJtjMAaWy5lNw5/Gx8yO2R3BeedPwWIIMuwisEzR2lHGeiXREHTEXlRRtMbg=
X-Received: by 2002:a05:6902:2c5:b0:b45:5cbe:48b3 with SMTP id
 w5-20020a05690202c500b00b455cbe48b3mr2090841ybh.0.1678829359815; Tue, 14 Mar
 2023 14:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
 <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 14 Mar 2023 22:29:09 +0100
Message-ID: <CAPan3WrmaZUXKD4O88zQF--m0_-rQeOOuCp8giLJf4ONYdfogw@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a16d1905f6e2eb29"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000a16d1905f6e2eb29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 3:42=E2=80=AFPM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> This patch adds WDT to Allwinner-H3 and Orangepi-PC.
> WDT is added as an overlay to the Timer module memory area.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
>  docs/system/arm/orangepi.rst  | 1 +
>  hw/arm/Kconfig                | 1 +
>  hw/arm/allwinner-h3.c         | 8 ++++++++
>  include/hw/arm/allwinner-h3.h | 5 ++++-
>  4 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index e5973600a1..9afa54213b 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -26,6 +26,7 @@ The Orange Pi PC machine supports the following devices=
:
>   * System Control module
>   * Security Identifier device
>   * TWI (I2C)
> + * Watchdog timer
>
>  Limitations
>  """""""""""
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index ec15248536..7d916f5450 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -337,6 +337,7 @@ config ALLWINNER_H3
>      select ALLWINNER_A10_PIT
>      select ALLWINNER_SUN8I_EMAC
>      select ALLWINNER_I2C
> +    select ALLWINNER_WDT
>      select SERIAL
>      select ARM_TIMER
>      select ARM_GIC
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 69d0ad6f50..f05afddf7e 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -49,6 +49,7 @@ const hwaddr allwinner_h3_memmap[] =3D {
>      [AW_H3_DEV_OHCI3]      =3D 0x01c1d400,
>      [AW_H3_DEV_CCU]        =3D 0x01c20000,
>      [AW_H3_DEV_PIT]        =3D 0x01c20c00,
> +    [AW_H3_DEV_WDT]        =3D 0x01c20ca0,
>      [AW_H3_DEV_UART0]      =3D 0x01c28000,
>      [AW_H3_DEV_UART1]      =3D 0x01c28400,
>      [AW_H3_DEV_UART2]      =3D 0x01c28800,
> @@ -234,6 +235,8 @@ static void allwinner_h3_init(Object *obj)
>      object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
>      object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
>      object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
> +
> +    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN6I);
>  }
>
>  static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -453,6 +456,11 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
>                         qdev_get_gpio_in(DEVICE(&s->gic),
> AW_H3_GIC_SPI_R_TWI));
>
> +    /* WDT */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0,
> +                            s->memmap[AW_H3_DEV_WDT], 1);
> +
>      /* Unimplemented devices */
>      for (i =3D 0; i < ARRAY_SIZE(unimplemented); i++) {
>          create_unimplemented_device(unimplemented[i].device_name,
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.=
h
> index 59e0f822d2..f15d6d7cc7 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -48,6 +48,7 @@
>  #include "hw/net/allwinner-sun8i-emac.h"
>  #include "hw/rtc/allwinner-rtc.h"
>  #include "hw/i2c/allwinner-i2c.h"
> +#include "hw/watchdog/allwinner-wdt.h"
>  #include "target/arm/cpu.h"
>  #include "sysemu/block-backend.h"
>
> @@ -96,7 +97,8 @@ enum {
>      AW_H3_DEV_RTC,
>      AW_H3_DEV_CPUCFG,
>      AW_H3_DEV_R_TWI,
> -    AW_H3_DEV_SDRAM
> +    AW_H3_DEV_SDRAM,
> +    AW_H3_DEV_WDT
>  };
>
>  /** Total number of CPU cores in the H3 SoC */
> @@ -141,6 +143,7 @@ struct AwH3State {
>      AWI2CState r_twi;
>      AwSun8iEmacState emac;
>      AwRtcState rtc;
> +    AwWdtState wdt;
>      GICState gic;
>      MemoryRegion sram_a1;
>      MemoryRegion sram_a2;
> --
> 2.30.2
>
>

--=20
Niek Linnenbank

--000000000000a16d1905f6e2eb29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 11, 2023 at 3:42=E2=80=AF=
PM Strahinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gmail.com">s=
trahinjapjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">This patch adds WDT to Allwinner-H3 and Orangepi=
-PC.<br>
WDT is added as an overlay to the Timer module memory area.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br></=
blockquote><div><br></div><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"=
mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/system/arm/orangepi.rst=C2=A0 | 1 +<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 1 +<br>
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 ++++++++<b=
r>
=C2=A0include/hw/arm/allwinner-h3.h | 5 ++++-<br>
=C2=A04 files changed, 14 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst<br=
>
index e5973600a1..9afa54213b 100644<br>
--- a/docs/system/arm/orangepi.rst<br>
+++ b/docs/system/arm/orangepi.rst<br>
@@ -26,6 +26,7 @@ The Orange Pi PC machine supports the following devices:<=
br>
=C2=A0 * System Control module<br>
=C2=A0 * Security Identifier device<br>
=C2=A0 * TWI (I2C)<br>
+ * Watchdog timer<br>
<br>
=C2=A0Limitations<br>
=C2=A0&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;<br=
>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index ec15248536..7d916f5450 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -337,6 +337,7 @@ config ALLWINNER_H3<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_PIT<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_SUN8I_EMAC<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_I2C<br>
+=C2=A0 =C2=A0 select ALLWINNER_WDT<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
=C2=A0 =C2=A0 =C2=A0select ARM_TIMER<br>
=C2=A0 =C2=A0 =C2=A0select ARM_GIC<br>
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
index 69d0ad6f50..f05afddf7e 100644<br>
--- a/hw/arm/allwinner-h3.c<br>
+++ b/hw/arm/allwinner-h3.c<br>
@@ -49,6 +49,7 @@ const hwaddr allwinner_h3_memmap[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_OHCI3]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c1d400,<b=
r>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_CCU]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c200=
00,<br>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_PIT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c20c=
00,<br>
+=C2=A0 =C2=A0 [AW_H3_DEV_WDT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x01c20ca0,<b=
r>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_UART0]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28000,<b=
r>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_UART1]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28400,<b=
r>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_UART2]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28800,<b=
r>
@@ -234,6 +235,8 @@ static void allwinner_h3_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;twi1&quot;,=C2=A0 &a=
mp;s-&gt;i2c1,=C2=A0 TYPE_AW_I2C_SUN6I);<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;twi2&quot;,=C2=A0 &a=
mp;s-&gt;i2c2,=C2=A0 TYPE_AW_I2C_SUN6I);<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;r_twi&quot;, &amp;s-=
&gt;r_twi, TYPE_AW_I2C_SUN6I);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;wdt&quot;, &amp;s-&gt;wdt=
, TYPE_AW_WDT_SUN6I);<br>
=C2=A0}<br>
<br>
=C2=A0static void allwinner_h3_realize(DeviceState *dev, Error **errp)<br>
@@ -453,6 +456,11 @@ static void allwinner_h3_realize(DeviceState *dev, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;r_twi), 0,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic), AW_H3_GIC_SPI_R_TWI));<=
br>
<br>
+=C2=A0 =C2=A0 /* WDT */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;wdt), &amp;error_fa=
tal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&amp;s-&gt;wdt), 0,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memmap[AW_H3_DEV_WDT], 1);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Unimplemented devices */<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(unimplemented); i++) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(unimplemented=
[i].device_name,<br>
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h<=
br>
index 59e0f822d2..f15d6d7cc7 100644<br>
--- a/include/hw/arm/allwinner-h3.h<br>
+++ b/include/hw/arm/allwinner-h3.h<br>
@@ -48,6 +48,7 @@<br>
=C2=A0#include &quot;hw/net/allwinner-sun8i-emac.h&quot;<br>
=C2=A0#include &quot;hw/rtc/allwinner-rtc.h&quot;<br>
=C2=A0#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
+#include &quot;hw/watchdog/allwinner-wdt.h&quot;<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
<br>
@@ -96,7 +97,8 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_RTC,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_CPUCFG,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_R_TWI,<br>
-=C2=A0 =C2=A0 AW_H3_DEV_SDRAM<br>
+=C2=A0 =C2=A0 AW_H3_DEV_SDRAM,<br>
+=C2=A0 =C2=A0 AW_H3_DEV_WDT<br>
=C2=A0};<br>
<br>
=C2=A0/** Total number of CPU cores in the H3 SoC */<br>
@@ -141,6 +143,7 @@ struct AwH3State {<br>
=C2=A0 =C2=A0 =C2=A0AWI2CState r_twi;<br>
=C2=A0 =C2=A0 =C2=A0AwSun8iEmacState emac;<br>
=C2=A0 =C2=A0 =C2=A0AwRtcState rtc;<br>
+=C2=A0 =C2=A0 AwWdtState wdt;<br>
=C2=A0 =C2=A0 =C2=A0GICState gic;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a1;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a2;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--000000000000a16d1905f6e2eb29--

